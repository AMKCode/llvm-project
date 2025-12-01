#!/bin/bash

# Script to compile and run ssymm_csr.mlir with symmetric sparse tensor
# Expected output: A * I = A
# [2.0, 1.0, 0.0]
# [1.0, 3.0, 2.0]
# [0.0, 2.0, 4.0]

set -e  # Exit on error

# Get the project root directory (parent of symmetric-sparse)
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Step 1: Optimizing MLIR with sparsifier..."
${PROJECT_ROOT}/build/bin/mlir-opt ssymm_csr.mlir \
  -sparse-reinterpret-map \
  --sparsifier="enable-runtime-library=true" \
  -o ssymm_csr_opt.mlir

echo "Step 2: Running optimized MLIR..."
${PROJECT_ROOT}/build/bin/mlir-runner ssymm_csr_opt.mlir \
  -e main \
  -entry-point-result=void \
  -shared-libs=${PROJECT_ROOT}/build/lib/libmlir_c_runner_utils.dylib,${PROJECT_ROOT}/build/lib/libmlir_runner_utils.dylib

echo "Done!"
