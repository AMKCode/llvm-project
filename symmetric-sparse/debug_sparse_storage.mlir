// Debug: Check what gets stored in symmetric sparse tensor

#CSR_SYM = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

func.func @main() {
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

  // Convert back to dense to see what's stored
  %A_back = sparse_tensor.convert %A : tensor<3x3xf32, #CSR_SYM> to tensor<3x3xf32>

  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index

  // Print what's actually stored
  %r00 = tensor.extract %A_back[%c0, %c0] : tensor<3x3xf32>
  %r01 = tensor.extract %A_back[%c0, %c1] : tensor<3x3xf32>
  %r02 = tensor.extract %A_back[%c0, %c2] : tensor<3x3xf32>
  %r10 = tensor.extract %A_back[%c1, %c0] : tensor<3x3xf32>
  %r11 = tensor.extract %A_back[%c1, %c1] : tensor<3x3xf32>
  %r12 = tensor.extract %A_back[%c1, %c2] : tensor<3x3xf32>
  %r20 = tensor.extract %A_back[%c2, %c0] : tensor<3x3xf32>
  %r21 = tensor.extract %A_back[%c2, %c1] : tensor<3x3xf32>
  %r22 = tensor.extract %A_back[%c2, %c2] : tensor<3x3xf32>

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
