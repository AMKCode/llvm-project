# Symmetric Sparse Tensor Support for MLIR

This implementation adds symmetric sparse tensor support to MLIR's SparseTensor dialect, based on optimizations from the [SySTeC paper](https://arxiv.org/abs/2406.09266).

## Files Modified

### MLIR Dialect Implementation
1. `mlir/include/mlir/Dialect/SparseTensor/IR/SparseTensorAttrDefs.td` - Added symmetry encoding attribute
2. `mlir/lib/Dialect/SparseTensor/IR/SparseTensorDialect.cpp` - Symmetry parsing/printing
3. `mlir/lib/Dialect/SparseTensor/Transforms/Sparsification.cpp` - Symmetric tensor optimizations
4. `mlir/lib/Dialect/SparseTensor/Transforms/SparseTensorRewriting.cpp` - Canonical triangle storage

### To Start
1. Build MLIR tools:
   ```bash
   cd build
   ninja mlir-opt mlir-runner
   cd ..
   ```

2. Library paths in run scripts automatically point to `../build/lib/`
   - On macOS: uses `.dylib` extension
   - On Linux: change to `.so` extension

### Run Tests
```bash
cd symmetric-sparse

# Symmetric Sparse Matrix-Vector Multiplication (SpMV)
./run_ssymv_csr.sh    # Expected output: 4, 13, 16
./run_ssymv_coo.sh    # Expected output: 4, 13, 16

# Quadratic Form (x^T A x)
./run_quadratic_form.sh    # Expected output: 78

# Symmetric Sparse Matrix-Matrix Multiplication (SpMM)
./run_ssymm_csr.sh    # Output: upper triangle of result matrix
./run_ssymm_coo.sh    # Output: upper triangle of result matrix
```

## References

- Mohoney et al., "SySTeC: A Compiler for Exploiting Structured Sparsity," https://arxiv.org/abs/2406.09266
- MLIR SparseTensor Dialect: https://mlir.llvm.org/docs/Dialects/SparseTensorOps/
