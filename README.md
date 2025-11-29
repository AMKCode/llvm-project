# Symmetric Sparse Tensor Support for MLIR

This project adds symmetric sparse tensor support to MLIR's SparseTensor dialect, enabling optimized code generation for symmetric sparse matrix operations.

## Features

- **Symmetry Encoding**: Added `symmetry` attribute to sparse tensor encodings
- **Triangular Iteration (Canonical Reads)**: Automatic filtering to process only upper triangle (col >= row), reducing iteration space by ~2x
- **Format Support**: Works with CSR, COO, and other sparse formats

## Implementation Status

✅ **Implemented:**
- Symmetry field in SparseTensorEncodingAttr ([SparseTensorAttrDefs.td](mlir/include/mlir/Dialect/SparseTensor/IR/SparseTensorAttrDefs.td))
- Triangular iteration filtering ([Sparsification.cpp](mlir/lib/Dialect/SparseTensor/Transforms/Sparsification.cpp#L1430-1450))
- Test cases for CSR and COO formats

⚠️ **Partial/Future Work:**
- **Read/write elimination (dual updates)** - Adding `y[j] += A[i,j] * x[i]` for symmetric contributions
  - Requires refactoring reduction handling to allow dual stores without breaking yield semantics
  - Would provide correct results when combined with triangular storage
- **Diagonal splitting** - Separating diagonal and off-diagonal elements into separate loop nests
  - Would require pattern matching before sparsification to create two `linalg.generic` operations
  - Could improve performance by avoiding branch divergence
- **Triangular storage** - Storing only upper triangle in sparse format
  - Current implementation assumes full matrix is stored
  - Would require changes to sparse tensor conversion and storage

## Quick Start

See [symmetric-sparse/README.md](symmetric-sparse/README.md) for detailed implementation and usage instructions.

## Building

This project is built on LLVM/MLIR. To build:

```bash
cd build
ninja mlir-opt mlir-runner
```

For complete LLVM build instructions, see the [LLVM Getting Started guide](https://llvm.org/docs/GettingStarted.html).
