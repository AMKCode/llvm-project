// COO encoding for A
#COO = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

func.func @sparse_mv(%A: tensor<3x3xf32, #COO>,
                     %x: tensor<3xf32>,
                     %y: tensor<3xf32>) -> tensor<3xf32> {
  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j) -> (i,j)>,
                     affine_map<(i,j) -> (j)>,
                     affine_map<(i,j) -> (i)>],
    iterator_types = ["parallel", "reduction"]
  } ins(%A, %x: tensor<3x3xf32, #COO>, tensor<3xf32>) outs(%y: tensor<3xf32>) {
    ^bb0(%a: f32, %x_val: f32, %y_val: f32):
      %mul = arith.mulf %a, %x_val : f32
      %add = arith.addf %mul, %y_val : f32
      linalg.yield %add : f32
  } -> tensor<3xf32>
  return %result : tensor<3xf32>
}

func.func @main() {
  // Create a simple 3x3 symmetric matrix:
  // [2.0, 1.0, 0.0]
  // [1.0, 3.0, 2.0]
  // [0.0, 2.0, 4.0]
  
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  
  // Create a dense 3x3 symmetric matrix:
  // [2.0, 1.0, 0.0]
  // [1.0, 3.0, 2.0]
  // [0.0, 2.0, 4.0]
  %A_dense = arith.constant dense<[
    [2.0, 1.0, 0.0],
    [1.0, 3.0, 2.0],
    [0.0, 2.0, 4.0]
  ]> : tensor<3x3xf32>
  
  // Convert dense matrix to COO sparse format
  %A = sparse_tensor.convert %A_dense : tensor<3x3xf32> to tensor<3x3xf32, #COO>
  
  // Create input vector x = [1.0, 2.0, 3.0]
  %x = arith.constant dense<[1.0, 2.0, 3.0]> : tensor<3xf32>
  
  // Create output vector y initialized to zero
  %y = arith.constant dense<[0.0, 0.0, 0.0]> : tensor<3xf32>
  
  // Perform sparse matrix-vector multiplication
  %result = func.call @sparse_mv(%A, %x, %y) : (tensor<3x3xf32, #COO>, tensor<3xf32>, tensor<3xf32>) -> tensor<3xf32>
  
  // Print the result
  %v0 = tensor.extract %result[%c0] : tensor<3xf32>
  %v1 = tensor.extract %result[%c1] : tensor<3xf32>
  %v2 = tensor.extract %result[%c2] : tensor<3xf32>
  
  vector.print %v0 : f32
  vector.print %v1 : f32
  vector.print %v2 : f32
  
  return
}
