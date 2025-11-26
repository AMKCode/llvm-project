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
