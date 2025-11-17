// CSR encoding for A
#CSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

func.func @sparse_mv(%A: tensor<?x?xf32, #CSR>,  // Compressed Sparse Row
                     %x: tensor<?xf32>,
                     %y: tensor<?xf32>) -> tensor<?xf32> {
  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j) -> (i,j)>,  // A
                     affine_map<(i,j) -> (j)>,      // x
                     affine_map<(i,j) -> (i)>],     // y
    iterator_types = ["parallel", "reduction"]
  } ins(%A, %x: tensor<?x?xf32, #CSR>, tensor<?xf32>) outs(%y: tensor<?xf32>) {
    ^bb0(%a: f32, %x_val: f32, %y_val: f32):
      %mul = arith.mulf %a, %x_val : f32
      %add = arith.addf %mul, %y_val : f32
      linalg.yield %add : f32
  } -> tensor<?xf32>
  return %result : tensor<?xf32>
}