// CSR encoding for A
#CSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

func.func @sparse_mv(%A: tensor<3x3xf32, #CSR>,  // Compressed Sparse Row
                     %x: tensor<3xf32>,
                     %y: tensor<3xf32>) -> tensor<3xf32> {
  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j) -> (i,j)>,  // A
                     affine_map<(i,j) -> (j)>,      // x
                     affine_map<(i,j) -> (i)>],     // y
    iterator_types = ["parallel", "reduction"]
  } ins(%A, %x: tensor<3x3xf32, #CSR>, tensor<3xf32>) outs(%y: tensor<3xf32>) {
    ^bb0(%a: f32, %x_val: f32, %y_val: f32):
      %mul = arith.mulf %a, %x_val : f32
      %add = arith.addf %mul, %y_val : f32
      linalg.yield %add : f32
  } -> tensor<3xf32>
  return %result : tensor<3xf32>
}

func.func @main() {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  
  %A_dense = arith.constant dense<[
    [2.0, 1.0, 0.0],
    [1.0, 3.0, 2.0],
    [0.0, 2.0, 4.0]
  ]> : tensor<3x3xf32>
  
  // Convert dense matrix to CSR sparse format
  %A = sparse_tensor.convert %A_dense : tensor<3x3xf32> to tensor<3x3xf32, #CSR>
  
  %x = arith.constant dense<[1.0, 2.0, 3.0]> : tensor<3xf32>
  
  %y = arith.constant dense<[0.0, 0.0, 0.0]> : tensor<3xf32>
  
  %result = func.call @sparse_mv(%A, %x, %y) : (tensor<3x3xf32, #CSR>, tensor<3xf32>, tensor<3xf32>) -> tensor<3xf32>
  
  %v0 = tensor.extract %result[%c0] : tensor<3xf32>
  %v1 = tensor.extract %result[%c1] : tensor<3xf32>
  %v2 = tensor.extract %result[%c2] : tensor<3xf32>
  
  vector.print %v0 : f32
  vector.print %v1 : f32
  vector.print %v2 : f32
  
  return
}