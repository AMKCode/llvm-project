// SpMV: y = A * x
// A is sparse CSR; x and y are dense.

// CSR encoding: 2D with both levels compressed, row-major order.
#CSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : compressed),
  posWidth = 32,
  crdWidth = 32
}>

#DENSE1D = #sparse_tensor.encoding<{
  map = (d0) -> (d0 : dense),
  posWidth = 32,
  crdWidth = 32
}>

// Core kernel: linalg.matvec taking a sparse A.
func.func @spmv(%A: tensor<3x3xf64, #CSR>,
                %x: tensor<3xf64>) -> tensor<3xf64> {
  %zero = arith.constant 0.0 : f64
  %y0   = tensor.empty() : tensor<3xf64>
  %y    = linalg.fill ins(%zero : f64) outs(%y0 : tensor<3xf64>) -> tensor<3xf64>
  %r    = linalg.matvec
            ins(%A, %x : tensor<3x3xf64, #CSR>, tensor<3xf64>)
            outs(%y   : tensor<3xf64>) -> tensor<3xf64>
  return %r : tensor<3xf64>
}

// Tiny driver that builds A and x, calls @spmv, and prints y.
// We define A as dense literal first and convert to sparse (#CSR).
func.func @main() {
  // A = [[1,0,2],
  //      [0,3,0],
  //      [0,4,5]]
  %Ad = arith.constant dense<[[1.0, 0.0, 2.0],
                              [0.0, 3.0, 0.0],
                              [0.0, 4.0, 5.0]]> : tensor<3x3xf64>

  %A  = sparse_tensor.convert %Ad
        : tensor<3x3xf64> to tensor<3x3xf64, #CSR>

  // x = [10, 20, 30]
  %x = arith.constant dense<[10.0, 20.0, 30.0]> : tensor<3xf64>

  %y = call @spmv(%A, %x) : (tensor<3x3xf64, #CSR>, tensor<3xf64>) -> tensor<3xf64>
  %ys = sparse_tensor.convert %y
         : tensor<3xf64> to tensor<3xf64, #DENSE1D>
  // Print the dense result y.
  sparse_tensor.print %ys : tensor<3xf64, #DENSE1D>
  return
}
