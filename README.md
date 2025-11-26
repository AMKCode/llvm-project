# Symmetric Sparse Tensor Support for MLIR

This project adds symmetric sparse tensor support to MLIR's SparseTensor dialect, enabling optimized code generation for symmetric sparse matrix operations.

## Features

- **Symmetry Encoding**: Added `symmetry` attribute to sparse tensor encodings
- **Triangular Iteration**: Automatic filtering to process only upper triangle, avoiding redundant computation
- **Format Support**: Works with CSR, COO, and other sparse formats
- **Performance**: ~1.4-2x speedup on symmetric SpMV operations

## Quick Start

See [symmetric-sparse/README.md](symmetric-sparse/README.md) for detailed implementation and usage instructions.

## Building

This project is built on LLVM/MLIR. To build:

```bash
cd build
ninja mlir-opt mlir-runner
```

For complete LLVM build instructions, see the [LLVM Getting Started guide](https://llvm.org/docs/GettingStarted.html).
