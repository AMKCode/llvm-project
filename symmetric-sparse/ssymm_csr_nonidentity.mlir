// SSYMM with non-identity matrix: C = A * B
// Where A is symmetric sparse, B is dense (not identity)
// This better demonstrates the symmetric optimizations

#CSR_SYM = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

func.func @ssymm(%A: tensor<3x3xf32, #CSR_SYM>,
                 %B: tensor<3x3xf32>,
                 %C: tensor<3x3xf32>) -> tensor<3x3xf32> {
  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j,k) -> (i,j)>,  // A[i,j]
                     affine_map<(i,j,k) -> (j,k)>,  // B[j,k]
                     affine_map<(i,j,k) -> (i,k)>], // C[i,k]
    iterator_types = ["parallel", "reduction", "parallel"]
  } ins(%A, %B: tensor<3x3xf32, #CSR_SYM>, tensor<3x3xf32>)
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

  %A = sparse_tensor.convert %A_dense : tensor<3x3xf32> to tensor<3x3xf32, #CSR_SYM>

  // Dense matrix B (not identity):
  // [1.0, 2.0, 0.0]
  // [0.0, 1.0, 3.0]
  // [1.0, 0.0, 1.0]
  %B = arith.constant dense<[
    [1.0, 2.0, 0.0],
    [0.0, 1.0, 3.0],
    [1.0, 0.0, 1.0]
  ]> : tensor<3x3xf32>

  // Initialize C to zero
  %C = arith.constant dense<[
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0]
  ]> : tensor<3x3xf32>

  // Perform SSYMM: C = A * B
  // Manual calculation:
  // C[0,0] = 2*1 + 1*0 + 0*1 = 2
  // C[0,1] = 2*2 + 1*1 + 0*0 = 5
  // C[0,2] = 2*0 + 1*3 + 0*1 = 3
  // C[1,0] = 1*1 + 3*0 + 2*1 = 3
  // C[1,1] = 1*2 + 3*1 + 2*0 = 5
  // C[1,2] = 1*0 + 3*3 + 2*1 = 11
  // C[2,0] = 0*1 + 2*0 + 4*1 = 4
  // C[2,1] = 0*2 + 2*1 + 4*0 = 2
  // C[2,2] = 0*0 + 2*3 + 4*1 = 10

  %result = func.call @ssymm(%A, %B, %C) :
    (tensor<3x3xf32, #CSR_SYM>, tensor<3x3xf32>, tensor<3x3xf32>) -> tensor<3x3xf32>

  // Expected result:
  // [2.0,  5.0,  3.0]
  // [3.0,  5.0, 11.0]
  // [4.0,  2.0, 10.0]

  // Print result
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
