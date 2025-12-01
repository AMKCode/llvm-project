// SSYMM with COO (Coordinate) format for symmetric sparse matrix A
// C = A * B where A is symmetric sparse (COO), B and C are dense

#COO_SYM = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

func.func @ssymm_coo(%A: tensor<3x3xf32, #COO_SYM>,
                     %B: tensor<3x3xf32>,
                     %C: tensor<3x3xf32>) -> tensor<3x3xf32> {
  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j,k) -> (i,j)>,  // A[i,j]
                     affine_map<(i,j,k) -> (j,k)>,  // B[j,k]
                     affine_map<(i,j,k) -> (i,k)>], // C[i,k]
    iterator_types = ["parallel", "reduction", "parallel"]
  } ins(%A, %B: tensor<3x3xf32, #COO_SYM>, tensor<3x3xf32>)
    outs(%C: tensor<3x3xf32>) {
    ^bb0(%a: f32, %b: f32, %c: f32):
      %mul = arith.mulf %a, %b : f32
      %add = arith.addf %mul, %c : f32
      linalg.yield %add : f32
  } -> tensor<3x3xf32>
  return %result : tensor<3x3xf32>
}

func.func @main() {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index

  // Symmetric matrix A:
  // [2.0, 1.0, 0.0]
  // [1.0, 3.0, 2.0]
  // [0.0, 2.0, 4.0]
  %A_dense = arith.constant dense<[
    [2.0, 1.0, 0.0],
    [1.0, 3.0, 2.0],
    [0.0, 2.0, 4.0]
  ]> : tensor<3x3xf32>

  %A = sparse_tensor.convert %A_dense : tensor<3x3xf32> to tensor<3x3xf32, #COO_SYM>

  // Dense matrix B (identity for verification):
  %B = arith.constant dense<[
    [1.0, 0.0, 0.0],
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0]
  ]> : tensor<3x3xf32>

  // Initialize C to zero
  %C = arith.constant dense<[
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0]
  ]> : tensor<3x3xf32>

  // Perform SSYMM: C = A * B = A * I = A
  %result = func.call @ssymm_coo(%A, %B, %C) :
    (tensor<3x3xf32, #COO_SYM>, tensor<3x3xf32>, tensor<3x3xf32>) -> tensor<3x3xf32>

  // Expected result (A * I = A):
  // [2.0, 1.0, 0.0]
  // [1.0, 3.0, 2.0]
  // [0.0, 2.0, 4.0]

  %r00 = tensor.extract %result[%c0, %c0] : tensor<3x3xf32>
  %r01 = tensor.extract %result[%c0, %c1] : tensor<3x3xf32>
  %r02 = tensor.extract %result[%c0, %c2] : tensor<3x3xf32>
  %r10 = tensor.extract %result[%c1, %c0] : tensor<3x3xf32>
  %r11 = tensor.extract %result[%c1, %c1] : tensor<3x3xf32>
  %r12 = tensor.extract %result[%c1, %c2] : tensor<3x3xf32>
  %r20 = tensor.extract %result[%c2, %c0] : tensor<3x3xf32>
  %r21 = tensor.extract %result[%c2, %c1] : tensor<3x3xf32>
  %r22 = tensor.extract %result[%c2, %c2] : tensor<3x3xf32>

  vector.print %r00 : f32
  vector.print %r01 : f32
  vector.print %r02 : f32
  vector.print %r10 : f32
  vector.print %r11 : f32
  vector.print %r12 : f32
  vector.print %r20 : f32
  vector.print %r21 : f32
  vector.print %r22 : f32

  return
}
