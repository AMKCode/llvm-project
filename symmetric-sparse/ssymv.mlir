// SSYMV (triangle-only + mirrored updates) in MLIR.
// y = A * x, where A is symmetric sparse CSR.
// We iterate only (i <= j) and mirror the contribution when i < j.

// CSR encoding for A
#CSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : compressed),
  posWidth = 32,
  crdWidth = 32
}>

// --- Kernel: triangle-only SSYMV over sparse A
func.func @ssymv_tri(%A: tensor<3x3xf64, #CSR>,
                        %x: tensor<3xf64>) -> memref<3xf64> {
    %c0f64 = arith.constant 0.0 : f64
    %c0    = arith.constant 0   : index
    %c1    = arith.constant 1   : index
    %c3    = arith.constant 3   : index

    // Read elements of x directly from the tensor; no explicit to_memref needed.

    // Allocate y (memref) and zero-initialize.
    %ym = memref.alloc() : memref<3xf64>
    scf.for %i = %c0 to %c3 step %c1 {
        memref.store %c0f64, %ym[%i] : memref<3xf64>
    }

    // Iterate nonzeros of A and only use the upper triangle (i <= j).
    // For each nonzero a at (i,j):
    //   if i < j:
    //      y[i] += a * x[j]
    //      y[j] += a * x[i]
    //   else (i == j):
    //      y[i] += a * x[i]
    "sparse_tensor.foreach"(%A) ({^bb0(%i: index, %j: index, %a: f64):
    %is_le = arith.cmpi sle, %i, %j : index
    scf.if %is_le {
        %is_lt = arith.cmpi slt, %i, %j : index
        scf.if %is_lt {
            // y[i] += a * x[j]
            %xj = tensor.extract %x[%j] : tensor<3xf64>
            %t0 = arith.mulf %a, %xj : f64
            %yi = memref.load %ym[%i] : memref<3xf64>
            %yi2 = arith.addf %yi, %t0 : f64
            memref.store %yi2, %ym[%i] : memref<3xf64>

            // y[j] += a * x[i]
            %xi = tensor.extract %x[%i] : tensor<3xf64>
            %t1 = arith.mulf %a, %xi : f64
            %yj = memref.load %ym[%j] : memref<3xf64>
            %yj2 = arith.addf %yj, %t1 : f64
            memref.store %yj2, %ym[%j] : memref<3xf64>
        } else {
            // Diagonal: i == j  → y[i] += a * x[i]
            %xi = tensor.extract %x[%i] : tensor<3xf64>
            %t  = arith.mulf %a, %xi : f64
            %yi = memref.load %ym[%i] : memref<3xf64>
            %yi2 = arith.addf %yi, %t : f64
            memref.store %yi2, %ym[%i] : memref<3xf64>
        }
    }
        "sparse_tensor.yield"() : () -> ()
    }) : (tensor<3x3xf64, #CSR>) -> ()

    // Return the result buffer directly.
    return %ym : memref<3xf64>
}

// --- Tiny driver: build symmetric A, x; call kernel; print y.
func.func @main() {
    // A =
    // [ [1, 2, 0],
    //   [2, 3, 4],
    //   [0, 4, 5] ]
    %Ad = arith.constant dense<[[1.0, 2.0, 0.0],
                                [2.0, 3.0, 4.0],
                                [0.0, 4.0, 5.0]]> : tensor<3x3xf64>

    // Convert dense → sparse CSR
    %A  = sparse_tensor.convert %Ad
            : tensor<3x3xf64> to tensor<3x3xf64, #CSR>

    // x = [10, 20, 30]
    %x  = arith.constant dense<[10.0, 20.0, 30.0]> : tensor<3xf64>

    %y  = call @ssymv_tri(%A, %x)
        : (tensor<3x3xf64, #CSR>, tensor<3xf64>) -> memref<3xf64>

    // Print dense result y via memref.load + vector.print (no bufferization/sparse runtime).
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %y0 = memref.load %y[%c0] : memref<3xf64>
    %y1 = memref.load %y[%c1] : memref<3xf64>
    %y2 = memref.load %y[%c2] : memref<3xf64>
    vector.print %y0 : f64
    vector.print %y1 : f64
    vector.print %y2 : f64
    return
}
