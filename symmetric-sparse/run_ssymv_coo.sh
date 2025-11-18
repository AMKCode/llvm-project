#!/bin/bash

# Script to compile and run spmv_coo.mlir with symmetric sparse tensor
# Expected output: 4, 13, 16

set -e  # Exit on error

echo "Step 1: Optimizing MLIR with sparsifier..."
mlir-opt ssymv_coo.mlir \
  -sparse-reinterpret-map \
  --sparsifier="enable-runtime-library=true" \
  -o ssymv_coo_opt.mlir

echo "Step 2: Running optimized MLIR..."
mlir-runner ssymv_coo_opt.mlir \
  -e main \
  -entry-point-result=void \
  -shared-libs=/home/amk/school/cmu/15745/llvm-project/build/lib/libmlir_c_runner_utils.so,/home/amk/school/cmu/15745/llvm-project/build/lib/libmlir_runner_utils.so

echo "Done!"
