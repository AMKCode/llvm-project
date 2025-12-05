#!/bin/bash

# Script to compile and run quadratic_form.mlir with distributive assignment grouping
# Expected output: 78.0

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Step 1: Optimizing MLIR with sparsifier..."
${PROJECT_ROOT}/build/bin/mlir-opt quadratic_form.mlir \
  -sparse-reinterpret-map \
  --sparsifier="enable-runtime-library=true" \
  -o quadratic_form_opt.mlir

echo "Step 2: Running optimized MLIR..."
time ${PROJECT_ROOT}/build/bin/mlir-runner quadratic_form_opt.mlir \
  -e main \
  -entry-point-result=void \
  -shared-libs=${PROJECT_ROOT}/build/lib/libmlir_c_runner_utils.so,${PROJECT_ROOT}/build/lib/libmlir_runner_utils.so

echo "Done!"
