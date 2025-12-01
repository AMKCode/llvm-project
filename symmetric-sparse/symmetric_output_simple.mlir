// Simpler test: dense to symmetric sparse conversion
// This tests output restriction to canonical triangle

#CSR_SYM = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>

// Copy operation: C[i,j] = A[i,j] where C is symmetric output
func.func @copy_to_symmetric(%A: tensor<3x3xf32>) -> tensor<3x3xf32, #CSR_SYM> {
  %C_init = tensor.empty() : tensor<3x3xf32, #CSR_SYM>

  %result = linalg.generic {
    indexing_maps = [affine_map<(i,j) -> (i,j)>,  // A[i,j] - dense input
                     affine_map<(i,j) -> (i,j)>],  // C[i,j] - symmetric output!
    iterator_types = ["parallel", "parallel"]
  } ins(%A: tensor<3x3xf32>)
    outs(%C_init: tensor<3x3xf32, #CSR_SYM>) {
    ^bb0(%a: f32, %c: f32):
      linalg.yield %a : f32
  } -> tensor<3x3xf32, #CSR_SYM>

  return %result : tensor<3x3xf32, #CSR_SYM>
}
