# How to Compile and Run symmetry_access_example.cpp

## Important Note

The `symmetry_access_example.cpp` file is currently a **reference implementation** showing how to use the symmetry field API. It contains example functions but not a complete standalone program with a `main()` function.

## Option 1: Test the API Through MLIR Operations (Recommended)

The symmetry field is already accessible and working! You can test it using the provided `.mlir` test files:

```bash
cd /home/amk/school/cmu/15745/llvm-project/build

# Run the symmetry access tests
bin/mlir-opt ../symmetric-sparse/test_symmetry_access.mlir
bin/mlir-opt ../symmetric-sparse/test_symmetry.mlir

# Verify with FileCheck
bin/mlir-opt ../symmetric-sparse/test_symmetry_access.mlir | \
  bin/FileCheck ../symmetric-sparse/test_symmetry_access.mlir
```

## Option 2: Create a Standalone Tool

To create a runnable tool that uses these examples, create a file with a `main()` function:

### Step 1: Create a tool file

Create `mlir/tools/symmetry-tool/symmetry-tool.cpp`:

```cpp
#include "mlir/Dialect/SparseTensor/IR/SparseTensor.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/raw_ostream.h"

using namespace mlir;
using namespace mlir::sparse_tensor;

// Include your example functions here
// (copy from symmetry_access_example.cpp)

int main(int argc, char **argv) {
    llvm::InitLLVM y(argc, argv);
    
    // Initialize MLIR
    MLIRContext context;
    context.loadDialect<sparse_tensor::SparseTensorDialect>();
    
    llvm::outs() << "Testing Symmetry Field Access\n";
    llvm::outs() << "============================\n\n";
    
    // Run your example usage
    exampleUsage(&context);
    
    return 0;
}
```

### Step 2: Create CMakeLists.txt

Create `mlir/tools/symmetry-tool/CMakeLists.txt`:

```cmake
add_mlir_tool(symmetry-tool
  symmetry-tool.cpp

  DEPENDS
  MLIRSparseTensorDialectIncGen
  )

target_link_libraries(symmetry-tool PRIVATE
  MLIRIR
  MLIRSparseTensorDialect
  MLIRSupport
  )
```

### Step 3: Register the tool

Add to `mlir/tools/CMakeLists.txt`:

```cmake
add_subdirectory(symmetry-tool)
```

### Step 4: Build and run

```bash
cd /home/amk/school/cmu/15745/llvm-project/build
ninja symmetry-tool
bin/symmetry-tool
```

## Option 3: Quick Standalone Compilation (Advanced)

If you want to compile it standalone without integrating into the build system:

```bash
cd /home/amk/school/cmu/15745/llvm-project/symmetric-sparse

# This requires manually specifying all include paths and libraries
clang++ -std=c++17 \
  -I../build/include \
  -I../mlir/include \
  -I../llvm/include \
  -L../build/lib \
  symmetry_access_example.cpp \
  -lMLIRSparseTensorDialect \
  -lMLIRIR \
  -lMLIRSupport \
  -lLLVMSupport \
  -o symmetry-tool
```

**Note**: This approach is complex because you need to link against many MLIR/LLVM libraries.

## Option 4: Use the API in Existing MLIR Code

The best approach is to use these patterns in existing MLIR transformations or passes. For example:

### In a Pass or Transformation:

```cpp
// In any MLIR pass or transformation
void someTransformation(RankedTensorType tensorType) {
    auto encoding = tensorType.getEncoding()
        .dyn_cast_or_null<SparseTensorEncodingAttr>();
    
    if (!encoding)
        return;
    
    // Access symmetry field
    if (auto symmetry = encoding.getSymmetry()) {
        llvm::outs() << "Tensor has symmetry!\n";
        
        // Process symmetry groups
        for (auto group : symmetry.getValue()) {
            auto dims = group.cast<ArrayAttr>();
            // ... use the symmetry information
        }
    }
}
```

## Recommended Approach

**For testing the symmetry field**, use the provided `.mlir` test files:

```bash
cd /home/amk/school/cmu/15745/llvm-project/build

# Test 1: Basic functionality
bin/mlir-opt ../symmetric-sparse/test_symmetry.mlir

# Test 2: Field access through operations
bin/mlir-opt ../symmetric-sparse/test_symmetry_access.mlir

# Test 3: Round-trip parsing
bin/mlir-opt ../symmetric-sparse/test_symmetry.mlir | bin/mlir-opt

# Test 4: Validate with FileCheck
bin/mlir-opt ../symmetric-sparse/test_symmetry.mlir | \
  bin/mlir-opt | \
  bin/FileCheck ../symmetric-sparse/test_symmetry.mlir
```

These tests prove that:
- ✅ The symmetry field can be parsed
- ✅ The symmetry field is stored correctly
- ✅ `getSymmetry()` accessor works
- ✅ The symmetry field is preserved through transformations
- ✅ The symmetry field can be printed

## What's Already Working

The symmetry field is **fully functional** in the MLIR infrastructure:

1. **Parser**: Reads `symmetry = [[0, 1]]` from MLIR text
2. **Storage**: Stored in `SparseTensorEncodingAttr`
3. **Accessor**: Retrieved via `encoding.getSymmetry()`
4. **Printer**: Outputs symmetry in MLIR text format
5. **Preservation**: All factory methods preserve symmetry
6. **Type System**: Different symmetries create distinct types

You can use it in any MLIR code that works with sparse tensors!
