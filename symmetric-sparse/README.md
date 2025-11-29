# Symmetric Sparse Tensor Support for MLIR

This implementation adds symmetric sparse tensor support to MLIR's SparseTensor dialect.

## Files Modified

### MLIR Dialect Implementation
1. `mlir/include/mlir/Dialect/SparseTensor/IR/SparseTensorAttrDefs.td` - Added symmetry encoding
2. `mlir/lib/Dialect/SparseTensor/IR/SparseTensorDialect.cpp` - Symmetry parsing/printing
3. `mlir/lib/Dialect/SparseTensor/Transforms/Sparsification.cpp` - Triangular iteration

### Test Files
4. `symmetric-sparse/ssymv_csr.mlir` - Symmetric SpMV with CSR format
5. `symmetric-sparse/ssymv_coo.mlir` - Symmetric SpMV with COO format
6. `symmetric-sparse/run_ssymv_csr.sh` - Run script for CSR test
7. `symmetric-sparse/run_ssymv_coo.sh` - Run script for COO test

## Running the Tests

### Prerequisites
1. Build MLIR tools:
   ```bash
   cd build
   ninja mlir-opt mlir-runner
   cd ..
   ```

2. Update library paths in run scripts:
   - Edit `run_ssymv_csr.sh` and `run_ssymv_coo.sh`
   - Change line 18 to point to your build directory
   - On macOS: use `.dylib` extension instead of `.so`

### Run Tests
```bash
cd symmetric-sparse
./run_ssymv_csr.sh    # Expected output: 4, 13, 16
./run_ssymv_coo.sh    # Expected output: 4, 13, 16
```

## Implementation Details

### 1. Symmetry Encoding
Added `symmetry` attribute to sparse tensor encoding:
```mlir
#CSR_SYM = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  symmetry = [[0, 1]]
}>
```

### 2. Triangular Iteration
The sparsification pass detects symmetric tensors and filters loops to only process upper triangle entries (col >= row), avoiding redundant computation.

### Test Matrix
```
[2.0, 1.0, 0.0]
[1.0, 3.0, 2.0]
[0.0, 2.0, 4.0]
```

Input vector: `[1.0, 2.0, 3.0]`

Expected result: `[4.0, 13.0, 16.0]`

**Current Output:** `[4.0, 12.0, 12.0]` (triangular iteration only, missing dual updates)

## What's Implemented vs. SySTeC Paper

Based on the [SySTeC paper](https://arxiv.org/abs/2406.09266), there are two key optimizations for symmetric sparse tensors:

### ✅ Implemented: Canonical Reads (Section 3.1)
- **Triangular Iteration**: Filter to only access upper triangle (col >= row)
- **Benefit**: Reduces iteration space and memory accesses by ~2x
- **Code**: [Sparsification.cpp lines 1430-1450](../mlir/lib/Dialect/SparseTensor/Transforms/Sparsification.cpp#L1361-L1377)

### ❌ Not Implemented: Read/Write Elimination (Section 3.1, Figure 2)
- **Dual Updates**: For off-diagonal A[i,j], perform both:
  - `y[i] += A[i,j] * x[j]` (normal update)
  - `y[j] += A[i,j] * x[i]` (symmetric contribution)
- **Challenge**: Conflicts with MLIR's reduction yield semantics
- **Required Changes**: Refactor how reductions and control flow interact in sparsification pass

### Future Work from Paper:
- **Diagonal Splitting** (Section 4.2.9): Separate loop nests for diagonal vs off-diagonal
- **Simplicial Lookup Tables** (Section 4.2.5): Optimize constant factors for higher-order tensors
- **Triangular Storage**: Store only upper triangle in sparse format

## Performance Analysis

With triangular iteration only:
- ✅ Reduces memory bandwidth (fewer reads from sparse matrix)
- ✅ Reduces iteration overhead (smaller loop bounds)
- ❌ Results are incorrect without dual updates
- ❌ Only works correctly when full matrix is stored (not just upper triangle)

The current implementation provides the **infrastructure** for symmetric sparse tensors in MLIR and demonstrates **triangular iteration**, which is the first step toward the full SySTeC optimizations.
