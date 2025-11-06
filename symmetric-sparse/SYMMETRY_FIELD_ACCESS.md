# Accessing the Symmetry Field

This document demonstrates how to access the `symmetry` field in `SparseTensorEncodingAttr`.

## Overview

The symmetry field has been added to `SparseTensorEncodingAttr` and can be:
1. **Parsed** from MLIR text format
2. **Stored** in the attribute
3. **Accessed** via the `getSymmetry()` method
4. **Preserved** through transformations
5. **Printed** back to text format

## C++ API Access

### Getting the Symmetry Field

```cpp
// Given a SparseTensorEncodingAttr
auto encoding = ...; // some SparseTensorEncodingAttr

// Access the symmetry field via getSymmetry()
mlir::ArrayAttr symmetry = encoding.getSymmetry();

// Check if symmetry is present
if (symmetry) {
    // Symmetry is defined
    // symmetry is an ArrayAttr containing arrays of dimension indices
    for (auto group : symmetry.getValue()) {
        // Each group is an array representing symmetric dimensions
        // e.g., [[0, 1]] means dimensions 0 and 1 are symmetric
    }
} else {
    // No symmetry specified (null)
}
```

### Creating Encodings with Symmetry

```cpp
// Using the factory method
auto withSym = encoding.withSymmetry(symmetryArrayAttr);

// Creating from scratch
auto newEncoding = SparseTensorEncodingAttr::get(
    context,
    dimToLvl,
    lvlToDim,
    posWidth,
    crdWidth,
    explicitVal,
    implicitVal,
    dimSlices,
    symmetry  // ArrayAttr for symmetry
);
```

### Removing Symmetry

```cpp
// Remove symmetry from an encoding
auto withoutSym = encoding.withoutSymmetry();
```

## MLIR Text Format

### Basic Symmetry (2D symmetric tensor)
```mlir
#sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  symmetry = [[0, 1]]
}>
```
This declares that dimensions 0 and 1 are symmetric.

### Multiple Symmetry Groups (4D tensor)
```mlir
#sparse_tensor.encoding<{
  map = (d0, d1, d2, d3) -> (d0 : dense, d1 : dense, d2 : compressed, d3 : compressed),
  symmetry = [[0, 1], [2, 3]]
}>
```
This declares two symmetry groups:
- Dimensions 0 and 1 are symmetric
- Dimensions 2 and 3 are symmetric

### No Symmetry
```mlir
#sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed)
}>
```
When symmetry is omitted, `getSymmetry()` returns null.

## Test Files

### `test_symmetry.mlir`
Demonstrates basic parsing and printing of the symmetry field:
- Symmetric CSR format
- Symmetric COO format
- Multiple symmetry groups
- No symmetry
- Symmetric DCSR format
- Symmetry with other attributes (posWidth, crdWidth)

### `test_symmetry_access.mlir`
Demonstrates that the symmetry field is accessible in operations:
- `sparse_tensor.reinterpret_map` preserves symmetry
- `sparse_tensor.convert` preserves symmetry
- Different symmetry values create distinct types
- Symmetry can be queried and verified

## Running the Tests

```bash
cd /home/amk/school/cmu/15745/llvm-project/build

# Test basic functionality
bin/mlir-opt ../symmetric-sparse/test_symmetry.mlir | bin/mlir-opt | \
  bin/FileCheck ../symmetric-sparse/test_symmetry.mlir

# Test symmetry field access
bin/mlir-opt ../symmetric-sparse/test_symmetry_access.mlir | \
  bin/FileCheck ../symmetric-sparse/test_symmetry_access.mlir
```

## Example Usage in Operations

### In Verifiers
```cpp
LogicalResult verify(SparseTensorEncodingAttr encoding) {
    if (auto symmetry = encoding.getSymmetry()) {
        // Verify symmetry constraints
        for (auto group : symmetry.getValue()) {
            auto dimIndices = group.cast<ArrayAttr>();
            // Check that symmetric dimensions have same size, etc.
        }
    }
    return success();
}
```

### In Transformations
```cpp
SparseTensorEncodingAttr transformEncoding(SparseTensorEncodingAttr encoding) {
    // Preserve symmetry when changing other attributes
    return encoding.withDimToLvl(newDimToLvl);
    // This automatically preserves the symmetry field via getSymmetry()
}
```

### In Pattern Matching
```cpp
if (auto encoding = tensorType.getEncoding().dyn_cast<SparseTensorEncodingAttr>()) {
    if (auto symmetry = encoding.getSymmetry()) {
        // Handle symmetric sparse tensors specially
        // Access individual symmetry groups
        for (auto group : symmetry.getValue()) {
            // Process each symmetry group
        }
    }
}
```

## Key Points

1. **Accessor Method**: Use `getSymmetry()` to retrieve the symmetry field
2. **Return Type**: Returns `mlir::ArrayAttr` (can be null)
3. **Immutability**: Use factory methods like `withSymmetry()` to create new encodings
4. **Preservation**: All factory methods (`withDimToLvl`, `withBitWidths`, etc.) automatically preserve symmetry
5. **Optional**: Symmetry is optional; when not specified, `getSymmetry()` returns null
6. **Type Distinction**: Different symmetry values create different encoding types

## Implementation Files

- **Definition**: `mlir/include/mlir/Dialect/SparseTensor/IR/SparseTensorAttrDefs.td`
- **Implementation**: `mlir/lib/Dialect/SparseTensor/IR/SparseTensorDialect.cpp`
- **Generated Code**: `build/tools/mlir/include/mlir/Dialect/SparseTensor/IR/SparseTensorAttrDefs.h.inc`

The symmetry field is fully integrated into the MLIR infrastructure and can be accessed like any other attribute field.
