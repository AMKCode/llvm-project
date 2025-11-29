// Test for Restrict Output to Canonical Triangle (Section 4.2.2)
// C[i,j] = A[i,j] + B[i,j] where A and B are symmetric, so C is also symmetric

#CSR_SYM = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

// Element-wise addition of two symmetric matrices
// Output C should also be symmetric
func.func @symmetric_add(%A: tensor<3x3xf32, #CSR_SYM>,
                         %B: tensor<3x3xf32, #CSR_SYM>) -> tensor<3x3xf32, #CSR_SYM> {
  %C_init = tensor.empty() : tensor<3x3xf32, #CSR_SYM>

  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j) -> (i,j)>,  // A[i,j]
                     affine_map<(i,j) -> (i,j)>,   // B[i,j]
                     affine_map<(i,j) -> (i,j)>],  // C[i,j] - symmetric output!
    iterator_types = ["parallel", "parallel"]
  } ins(%A, %B: tensor<3x3xf32, #CSR_SYM>, tensor<3x3xf32, #CSR_SYM>)
    outs(%C_init: tensor<3x3xf32, #CSR_SYM>) {
    ^bb0(%a: f32, %b: f32, %c: f32):
      %sum = arith.addf %a, %b : f32
      linalg.yield %sum : f32
  } -> tensor<3x3xf32, #CSR_SYM>

  return %result : tensor<3x3xf32, #CSR_SYM>
}

func.func @main() {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index

  // Symmetric matrix A:
  // [1.0, 2.0, 0.0]
  // [2.0, 3.0, 4.0]
  // [0.0, 4.0, 5.0]
  %A_dense = arith.constant dense<[
    [1.0, 2.0, 0.0],
    [2.0, 3.0, 4.0],
    [0.0, 4.0, 5.0]
  ]> : tensor<3x3xf32>

  // Symmetric matrix B:
  // [10.0, 20.0, 0.0]
  // [20.0, 30.0, 40.0]
  // [0.0, 40.0, 50.0]
  %B_dense = arith.constant dense<[
    [10.0, 20.0, 0.0],
    [20.0, 30.0, 40.0],
    [0.0, 40.0, 50.0]
  ]> : tensor<3x3xf32>

  %A = sparse_tensor.convert %A_dense : tensor<3x3xf32> to tensor<3x3xf32, #CSR_SYM>
  %B = sparse_tensor.convert %B_dense : tensor<3x3xf32> to tensor<3x3xf32, #CSR_SYM>

  // Expected result C = A + B (symmetric):
  // [11.0, 22.0, 0.0]
  // [22.0, 33.0, 44.0]
  // [0.0, 44.0, 55.0]
  //
  // With canonical triangle optimization:
  // Only compute upper triangle: (0,0), (0,1), (1,1), (1,2), (2,2)
  // Then replicate to lower triangle in post-processing

  %C = func.call @symmetric_add(%A, %B) : (tensor<3x3xf32, #CSR_SYM>, tensor<3x3xf32, #CSR_SYM>) -> tensor<3x3xf32, #CSR_SYM>

  // Convert back to dense for printing
  %C_dense = sparse_tensor.convert %C : tensor<3x3xf32, #CSR_SYM> to tensor<3x3xf32>

  // Print result
  %v00 = tensor.extract %C_dense[%c0, %c0] : tensor<3x3xf32>
  %v01 = tensor.extract %C_dense[%c0, %c1] : tensor<3x3xf32>
  %v02 = tensor.extract %C_dense[%c0, %c2] : tensor<3x3xf32>
  %v10 = tensor.extract %C_dense[%c1, %c0] : tensor<3x3xf32>
  %v11 = tensor.extract %C_dense[%c1, %c1] : tensor<3x3xf32>
  %v12 = tensor.extract %C_dense[%c1, %c2] : tensor<3x3xf32>
  %v20 = tensor.extract %C_dense[%c2, %c0] : tensor<3x3xf32>
  %v21 = tensor.extract %C_dense[%c2, %c1] : tensor<3x3xf32>
  %v22 = tensor.extract %C_dense[%c2, %c2] : tensor<3x3xf32>

  vector.print %v00 : f32
  vector.print %v01 : f32
  vector.print %v02 : f32
  vector.print %v10 : f32
  vector.print %v11 : f32
  vector.print %v12 : f32
  vector.print %v20 : f32
  vector.print %v21 : f32
  vector.print %v22 : f32

  return
}
