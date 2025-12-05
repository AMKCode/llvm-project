#!/bin/bash

# Script to compile and run ssymv_coo.mlir with symmetric sparse tensor
# Expected output: 4, 13, 16

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Step 1: Optimizing MLIR with sparsifier..."
${PROJECT_ROOT}/build/bin/mlir-opt ssymv_coo.mlir \
  -sparse-reinterpret-map \
  --sparsifier="enable-runtime-library=true" \
  -o ssymv_coo_opt.mlir

echo "Step 2: Running optimized MLIR..."
time ${PROJECT_ROOT}/build/bin/mlir-runner ssymv_coo_opt.mlir \
  -e main \
  -entry-point-result=void \
  -shared-libs=${PROJECT_ROOT}/build/lib/libmlir_c_runner_utils.so,${PROJECT_ROOT}/build/lib/libmlir_runner_utils.so

echo "Done!"
