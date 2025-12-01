// Test for Distributive Assignment Grouping (Section 4.2.7)
// Computes x^T A x for symmetric matrix A

// CSR encoding for A
#CSR_SYM = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

// Quadratic form: scalar = sum_ij x[i] * A[i,j] * x[j]
// For symmetric A, this should compute:
//   - Diagonal: x[i] * A[i,i] * x[i]
//   - Off-diagonal: 2 * x[i] * A[i,j] * x[j]  (factor of 2!)
func.func @quadratic_form(%A: tensor<3x3xf32, #CSR_SYM>,
                          %x: tensor<3xf32>) -> tensor<f32> {
  %init = tensor.empty() : tensor<f32>
  %c0 = arith.constant 0.0 : f32
  %init_filled = linalg.fill ins(%c0 : f32) outs(%init : tensor<f32>) -> tensor<f32>

  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j) -> (i,j)>,  // A[i,j]
                     affine_map<(i,j) -> (i)>,      // x[i]
                     affine_map<(i,j) -> (j)>,      // x[j]
                     affine_map<(i,j) -> ()>],      // scalar output (invisible symmetry!)
    iterator_types = ["reduction", "reduction"]
  } ins(%A, %x, %x: tensor<3x3xf32, #CSR_SYM>, tensor<3xf32>, tensor<3xf32>)
    outs(%init_filled: tensor<f32>) {
    ^bb0(%a: f32, %xi: f32, %xj: f32, %acc: f32):
      %mul1 = arith.mulf %xi, %a : f32
      %mul2 = arith.mulf %mul1, %xj : f32
      %add = arith.addf %acc, %mul2 : f32
      linalg.yield %add : f32
  } -> tensor<f32>

  return %result : tensor<f32>
}

func.func @main() {
  %c0 = arith.constant 0 : index

  // Symmetric matrix:
  // [2.0, 1.0, 0.0]
  // [1.0, 3.0, 2.0]
  // [0.0, 2.0, 4.0]
  %A_dense = arith.constant dense<[
    [2.0, 1.0, 0.0],
    [1.0, 3.0, 2.0],
    [0.0, 2.0, 4.0]
  ]> : tensor<3x3xf32>

  %A = sparse_tensor.convert %A_dense : tensor<3x3xf32> to tensor<3x3xf32, #CSR_SYM>

  // Vector x = [1.0, 2.0, 3.0]
  %x = arith.constant dense<[1.0, 2.0, 3.0]> : tensor<3xf32>

  // Compute x^T A x
  // Expected: 1*2*1 + 1*1*2 + 2*1*1 + 2*3*2 + 2*2*3 + 3*2*2 + 3*4*3
  //         = 2 + 2 + 2 + 12 + 12 + 12 + 36 = 78
  // But with triangular iteration only (no distributive grouping):
  //   Only upper triangle: (0,0), (0,1), (1,1), (1,2), (2,2)
  //   = 1*2*1 + 1*1*2 + 2*3*2 + 2*2*3 + 3*4*3
  //   = 2 + 2 + 12 + 12 + 36 = 64 (INCORRECT - missing off-diagonal contributions!)
  //
  // With Distributive Assignment Grouping:
  //   Diagonal: (0,0): 1*2*1 = 2
  //             (1,1): 2*3*2 = 12
  //             (2,2): 3*4*3 = 36
  //   Off-diagonal with factor 2:
  //             (0,1): 2 * 1*1*2 = 4
  //             (1,2): 2 * 2*2*3 = 24
  //   Total: 2 + 12 + 36 + 4 + 24 = 78 (CORRECT!)

  %result = func.call @quadratic_form(%A, %x) : (tensor<3x3xf32, #CSR_SYM>, tensor<3xf32>) -> tensor<f32>

  %value = tensor.extract %result[] : tensor<f32>
  vector.print %value : f32

  return
}
