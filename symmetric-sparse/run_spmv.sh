#!/bin/bash

# Complete MLIR pipeline for SpMV with sparse tensor support
# This script compiles and runs spmv.mlir with all necessary passes

BUILD_DIR="/home/amk/school/cmu/15745/llvm-project/build"
MLIR_OPT="${BUILD_DIR}/bin/mlir-opt"
MLIR_RUNNER="${BUILD_DIR}/bin/mlir-runner"

# Runtime libraries needed for execution
RUNNER_UTILS="${BUILD_DIR}/lib/libmlir_runner_utils.so"
C_RUNNER_UTILS="${BUILD_DIR}/lib/libmlir_c_runner_utils.so"

# Step 1: Apply all lowering passes
echo "==> Lowering MLIR with sparsifier and buffer passes..."
${MLIR_OPT} spmv.mlir \
  --linalg-generalize-named-ops \
  --sparsifier \
  --sparse-tensor-conversion \
  --one-shot-bufferize="bufferize-function-boundaries" \
  --convert-linalg-to-loops \
  --convert-scf-to-cf \
  --convert-math-to-llvm \
  --convert-func-to-llvm \
  --convert-arith-to-llvm \
  --reconcile-unrealized-casts \
  -o spmv_lowered.mlir

if [ $? -ne 0 ]; then
    echo "ERROR: mlir-opt failed"
    exit 1
fi

# Step 2: Execute with mlir-runner
echo "==> Running with mlir-runner..."
${MLIR_RUNNER} spmv_lowered.mlir \
  -e main \
  -entry-point-result=void \
  -shared-libs=${RUNNER_UTILS} \
  -shared-libs=${C_RUNNER_UTILS}

echo "==> Done!"
