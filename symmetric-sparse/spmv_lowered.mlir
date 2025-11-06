module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.mlir.global private constant @vector_print_str_3(dense<[45, 45, 45, 45, 10, 0]> : tensor<6xi8>) {addr_space = 0 : i32} : !llvm.array<6 x i8>
  llvm.func @printComma()
  llvm.func @printF64(f64)
  llvm.mlir.global private constant @vector_print_str_2(dense<[118, 97, 108, 117, 101, 115, 32, 58, 32, 0]> : tensor<10xi8>) {addr_space = 0 : i32} : !llvm.array<10 x i8>
  llvm.mlir.global private constant @vector_print_str_1(dense<[108, 118, 108, 32, 61, 32, 0]> : tensor<7xi8>) {addr_space = 0 : i32} : !llvm.array<7 x i8>
  llvm.func @printClose()
  llvm.func @printOpen()
  llvm.mlir.global private constant @vector_print_str_0(dense<[100, 105, 109, 32, 61, 32, 0]> : tensor<7xi8>) {addr_space = 0 : i32} : !llvm.array<7 x i8>
  llvm.func @printNewline()
  llvm.func @printU64(i64)
  llvm.func @printString(!llvm.ptr)
  llvm.mlir.global private constant @vector_print_str(dense<[45, 45, 45, 45, 32, 83, 112, 97, 114, 115, 101, 32, 84, 101, 110, 115, 111, 114, 32, 45, 45, 45, 45, 10, 110, 115, 101, 32, 61, 32, 0]> : tensor<31xi8>) {addr_space = 0 : i32} : !llvm.array<31 x i8>
  llvm.mlir.global private constant @__constant_3x3xf64(dense<[[1.000000e+00, 0.000000e+00, 2.000000e+00], [0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<3x3xf64>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x array<3 x f64>>
  llvm.mlir.global private constant @__constant_3xf64_0(dense<[1.000000e+01, 2.000000e+01, 3.000000e+01]> : tensor<3xf64>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x f64>
  llvm.mlir.global private constant @__constant_3xf64(dense<0.000000e+00> : tensor<3xf64>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x f64>
  llvm.func @endLexInsert(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func private @lexInsertF64(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64) attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64)>
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %3 = llvm.insertvalue %arg1, %2[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg2, %3[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg3, %4[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.insertvalue %arg5, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.alloca %1 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %7, %8 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %9 = llvm.insertvalue %arg6, %0[0] : !llvm.struct<(ptr, ptr, i64)> 
    %10 = llvm.insertvalue %arg7, %9[1] : !llvm.struct<(ptr, ptr, i64)> 
    %11 = llvm.insertvalue %arg8, %10[2] : !llvm.struct<(ptr, ptr, i64)> 
    %12 = llvm.alloca %1 x !llvm.struct<(ptr, ptr, i64)> : (i64) -> !llvm.ptr
    llvm.store %11, %12 : !llvm.struct<(ptr, ptr, i64)>, !llvm.ptr
    llvm.call @_mlir_ciface_lexInsertF64(%arg0, %8, %12) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @_mlir_ciface_lexInsertF64(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @newSparseTensor(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: !llvm.ptr) -> !llvm.ptr attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %2 = llvm.insertvalue %arg0, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg1, %2[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg2, %3[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg3, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %6, %7 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %8 = llvm.insertvalue %arg5, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg6, %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg7, %9[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg8, %10[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg9, %11[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %12, %13 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %14 = llvm.insertvalue %arg10, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.insertvalue %arg11, %14[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.insertvalue %arg12, %15[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.insertvalue %arg13, %16[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %arg14, %17[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %18, %19 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %20 = llvm.insertvalue %arg15, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %arg16, %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.insertvalue %arg17, %21[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.insertvalue %arg18, %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.insertvalue %arg19, %23[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %24, %25 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %26 = llvm.insertvalue %arg20, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %arg21, %26[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %arg22, %27[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %arg23, %28[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.insertvalue %arg24, %29[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %31 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %30, %31 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %32 = llvm.call @_mlir_ciface_newSparseTensor(%7, %13, %19, %25, %31, %arg25, %arg26, %arg27, %arg28, %arg29) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    llvm.return %32 : !llvm.ptr
  }
  llvm.func @_mlir_ciface_newSparseTensor(!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparseCoordinates32(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparseCoordinates32(%1, %arg0, %arg1) : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparseCoordinates32(!llvm.ptr, !llvm.ptr, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparsePositions32(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparsePositions32(%1, %arg0, %arg1) : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparsePositions32(!llvm.ptr, !llvm.ptr, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparseValuesF64(%arg0: !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparseValuesF64(%1, %arg0) : (!llvm.ptr, !llvm.ptr) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparseValuesF64(!llvm.ptr, !llvm.ptr) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func @spmv(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> {
    %0 = llvm.mlir.constant(64 : index) : i64
    %1 = llvm.mlir.addressof @__constant_3xf64 : !llvm.ptr
    %2 = llvm.mlir.zero : !llvm.ptr
    %3 = llvm.mlir.constant(3 : index) : i64
    %4 = llvm.mlir.constant(0 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %7 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x f64>
    %8 = llvm.getelementptr %2[3] : (!llvm.ptr) -> !llvm.ptr, f64
    %9 = llvm.ptrtoint %8 : !llvm.ptr to i64
    %10 = llvm.add %9, %0 : i64
    %11 = llvm.call @malloc(%10) : (i64) -> !llvm.ptr
    %12 = llvm.ptrtoint %11 : !llvm.ptr to i64
    %13 = llvm.sub %0, %5 : i64
    %14 = llvm.add %12, %13 : i64
    %15 = llvm.urem %14, %0 : i64
    %16 = llvm.sub %14, %15 : i64
    %17 = llvm.inttoptr %16 : i64 to !llvm.ptr
    %18 = llvm.insertvalue %11, %6[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.insertvalue %17, %18[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.insertvalue %4, %19[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %3, %20[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.insertvalue %5, %21[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.mul %5, %3 : i64
    %24 = llvm.getelementptr %2[1] : (!llvm.ptr) -> !llvm.ptr, f64
    %25 = llvm.ptrtoint %24 : !llvm.ptr to i64
    %26 = llvm.mul %23, %25 : i64
    "llvm.intr.memcpy"(%17, %7, %26) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %27 = llvm.call @sparseValuesF64(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %28 = llvm.call @sparsePositions32(%arg0, %4) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %29 = llvm.call @sparseCoordinates32(%arg0, %4) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %30 = llvm.call @sparsePositions32(%arg0, %5) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %31 = llvm.call @sparseCoordinates32(%arg0, %5) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %32 = llvm.extractvalue %28[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = llvm.load %32 : !llvm.ptr -> i32
    %34 = llvm.zext %33 : i32 to i64
    %35 = llvm.extractvalue %28[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.getelementptr inbounds|nuw %35[1] : (!llvm.ptr) -> !llvm.ptr, i32
    %37 = llvm.load %36 : !llvm.ptr -> i32
    %38 = llvm.zext %37 : i32 to i64
    llvm.br ^bb1(%34 : i64)
  ^bb1(%39: i64):  // 2 preds: ^bb0, ^bb5
    %40 = llvm.icmp "slt" %39, %38 : i64
    llvm.cond_br %40, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %41 = llvm.extractvalue %29[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %42 = llvm.getelementptr inbounds|nuw %41[%39] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %43 = llvm.load %42 : !llvm.ptr -> i32
    %44 = llvm.zext %43 : i32 to i64
    %45 = llvm.getelementptr inbounds|nuw %17[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %46 = llvm.load %45 : !llvm.ptr -> f64
    %47 = llvm.extractvalue %30[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %48 = llvm.getelementptr inbounds|nuw %47[%39] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %49 = llvm.load %48 : !llvm.ptr -> i32
    %50 = llvm.zext %49 : i32 to i64
    %51 = llvm.add %39, %5 : i64
    %52 = llvm.extractvalue %30[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %53 = llvm.getelementptr inbounds|nuw %52[%51] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %54 = llvm.load %53 : !llvm.ptr -> i32
    %55 = llvm.zext %54 : i32 to i64
    llvm.br ^bb3(%50, %46 : i64, f64)
  ^bb3(%56: i64, %57: f64):  // 2 preds: ^bb2, ^bb4
    %58 = llvm.icmp "slt" %56, %55 : i64
    llvm.cond_br %58, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %59 = llvm.extractvalue %31[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %60 = llvm.getelementptr inbounds|nuw %59[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %61 = llvm.load %60 : !llvm.ptr -> i32
    %62 = llvm.zext %61 : i32 to i64
    %63 = llvm.extractvalue %27[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.getelementptr inbounds|nuw %63[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %65 = llvm.load %64 : !llvm.ptr -> f64
    %66 = llvm.getelementptr inbounds|nuw %arg2[%62] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %67 = llvm.load %66 : !llvm.ptr -> f64
    %68 = llvm.fmul %65, %67 : f64
    %69 = llvm.fadd %57, %68 : f64
    %70 = llvm.add %56, %5 : i64
    llvm.br ^bb3(%70, %69 : i64, f64)
  ^bb5:  // pred: ^bb3
    %71 = llvm.getelementptr inbounds|nuw %17[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %57, %71 : f64, !llvm.ptr
    %72 = llvm.add %39, %5 : i64
    llvm.br ^bb1(%72 : i64)
  ^bb6:  // pred: ^bb1
    llvm.return %22 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @main() {
    %0 = llvm.mlir.constant(2 : index) : i64
    %1 = llvm.mlir.addressof @__constant_3x3xf64 : !llvm.ptr
    %2 = llvm.mlir.constant(3735928559 : index) : i64
    %3 = llvm.mlir.addressof @__constant_3xf64_0 : !llvm.ptr
    %4 = llvm.mlir.addressof @vector_print_str_3 : !llvm.ptr
    %5 = llvm.mlir.addressof @vector_print_str_2 : !llvm.ptr
    %6 = llvm.mlir.addressof @vector_print_str_1 : !llvm.ptr
    %7 = llvm.mlir.addressof @vector_print_str_0 : !llvm.ptr
    %8 = llvm.mlir.addressof @vector_print_str : !llvm.ptr
    %9 = llvm.mlir.constant(65536 : i64) : i64
    %10 = llvm.mlir.zero : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) : i32
    %12 = llvm.mlir.constant(1 : i32) : i32
    %13 = llvm.mlir.constant(2 : i32) : i32
    %14 = llvm.mlir.constant(262144 : i64) : i64
    %15 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x f64>
    %20 = llvm.inttoptr %2 : i64 to !llvm.ptr
    %21 = llvm.getelementptr %1[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f64>>
    %22 = llvm.alloca %0 x i64 : (i64) -> !llvm.ptr
    llvm.store %14, %22 : i64, !llvm.ptr
    %23 = llvm.getelementptr inbounds|nuw %22[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %14, %23 : i64, !llvm.ptr
    %24 = llvm.alloca %0 x i64 : (i64) -> !llvm.ptr
    llvm.store %18, %24 : i64, !llvm.ptr
    %25 = llvm.getelementptr inbounds|nuw %24[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %18, %25 : i64, !llvm.ptr
    %26 = llvm.alloca %0 x i64 : (i64) -> !llvm.ptr
    llvm.store %17, %26 : i64, !llvm.ptr
    %27 = llvm.getelementptr inbounds|nuw %26[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %16, %27 : i64, !llvm.ptr
    %28 = llvm.call @newSparseTensor(%24, %24, %17, %0, %16, %24, %24, %17, %0, %16, %22, %22, %17, %0, %16, %26, %26, %17, %0, %16, %26, %26, %17, %0, %16, %13, %13, %12, %11, %10) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %29 = llvm.alloca %0 x i64 : (i64) -> !llvm.ptr
    %30 = llvm.alloca %16 x f64 : (i64) -> !llvm.ptr
    llvm.br ^bb1(%17 : i64)
  ^bb1(%31: i64):  // 2 preds: ^bb0, ^bb7
    %32 = llvm.icmp "slt" %31, %18 : i64
    llvm.cond_br %32, ^bb2, ^bb8
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%17 : i64)
  ^bb3(%33: i64):  // 2 preds: ^bb2, ^bb6
    %34 = llvm.icmp "slt" %33, %18 : i64
    llvm.cond_br %34, ^bb4, ^bb7
  ^bb4:  // pred: ^bb3
    %35 = llvm.mul %31, %18 overflow<nsw, nuw> : i64
    %36 = llvm.add %35, %33 overflow<nsw, nuw> : i64
    %37 = llvm.getelementptr inbounds|nuw %21[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %38 = llvm.load %37 : !llvm.ptr -> f64
    %39 = llvm.fcmp "une" %38, %15 : f64
    llvm.cond_br %39, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    llvm.store %31, %29 : i64, !llvm.ptr
    %40 = llvm.getelementptr inbounds|nuw %29[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %33, %40 : i64, !llvm.ptr
    llvm.store %38, %30 : f64, !llvm.ptr
    llvm.call @lexInsertF64(%28, %29, %29, %17, %0, %16, %30, %30, %17) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb6
  ^bb6:  // 2 preds: ^bb4, ^bb5
    %41 = llvm.add %33, %16 : i64
    llvm.br ^bb3(%41 : i64)
  ^bb7:  // pred: ^bb3
    %42 = llvm.add %31, %16 : i64
    llvm.br ^bb1(%42 : i64)
  ^bb8:  // pred: ^bb1
    llvm.call @endLexInsert(%28) : (!llvm.ptr) -> ()
    %43 = llvm.call @spmv(%28, %20, %19, %17, %18, %16) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %44 = llvm.alloca %16 x i64 : (i64) -> !llvm.ptr
    llvm.store %9, %44 : i64, !llvm.ptr
    %45 = llvm.alloca %16 x i64 : (i64) -> !llvm.ptr
    llvm.store %18, %45 : i64, !llvm.ptr
    %46 = llvm.alloca %16 x i64 : (i64) -> !llvm.ptr
    llvm.store %17, %46 : i64, !llvm.ptr
    %47 = llvm.call @newSparseTensor(%45, %45, %17, %16, %16, %45, %45, %17, %16, %16, %44, %44, %17, %16, %16, %46, %46, %17, %16, %16, %46, %46, %17, %16, %16, %13, %13, %12, %11, %10) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %48 = llvm.alloca %16 x i64 : (i64) -> !llvm.ptr
    %49 = llvm.alloca %16 x f64 : (i64) -> !llvm.ptr
    llvm.br ^bb9(%17 : i64)
  ^bb9(%50: i64):  // 2 preds: ^bb8, ^bb12
    %51 = llvm.icmp "slt" %50, %18 : i64
    llvm.cond_br %51, ^bb10, ^bb13
  ^bb10:  // pred: ^bb9
    %52 = llvm.extractvalue %43[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %53 = llvm.getelementptr inbounds|nuw %52[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %54 = llvm.load %53 : !llvm.ptr -> f64
    %55 = llvm.fcmp "une" %54, %15 : f64
    llvm.cond_br %55, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    llvm.store %50, %48 : i64, !llvm.ptr
    llvm.store %54, %49 : f64, !llvm.ptr
    llvm.call @lexInsertF64(%47, %48, %48, %17, %16, %16, %49, %49, %17) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb12
  ^bb12:  // 2 preds: ^bb10, ^bb11
    %56 = llvm.add %50, %16 : i64
    llvm.br ^bb9(%56 : i64)
  ^bb13:  // pred: ^bb9
    llvm.call @endLexInsert(%47) : (!llvm.ptr) -> ()
    %57 = llvm.call @sparseValuesF64(%47) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %58 = llvm.extractvalue %57[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @printString(%8) : (!llvm.ptr) -> ()
    llvm.call @printU64(%58) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printString(%7) : (!llvm.ptr) -> ()
    llvm.call @printOpen() : () -> ()
    llvm.call @printU64(%18) : (i64) -> ()
    llvm.call @printClose() : () -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printString(%6) : (!llvm.ptr) -> ()
    llvm.call @printOpen() : () -> ()
    llvm.call @printU64(%18) : (i64) -> ()
    llvm.call @printClose() : () -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printString(%5) : (!llvm.ptr) -> ()
    %59 = llvm.call @sparseValuesF64(%47) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.call @printOpen() : () -> ()
    %60 = llvm.extractvalue %59[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb14(%17 : i64)
  ^bb14(%61: i64):  // 2 preds: ^bb13, ^bb17
    %62 = llvm.icmp "slt" %61, %60 : i64
    llvm.cond_br %62, ^bb15, ^bb18
  ^bb15:  // pred: ^bb14
    %63 = llvm.extractvalue %59[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.getelementptr inbounds|nuw %63[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %65 = llvm.load %64 : !llvm.ptr -> f64
    llvm.call @printF64(%65) : (f64) -> ()
    %66 = llvm.add %61, %16 : i64
    %67 = llvm.icmp "ne" %66, %60 : i64
    llvm.cond_br %67, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    llvm.call @printComma() : () -> ()
    llvm.br ^bb17
  ^bb17:  // 2 preds: ^bb15, ^bb16
    %68 = llvm.add %61, %16 : i64
    llvm.br ^bb14(%68 : i64)
  ^bb18:  // pred: ^bb14
    llvm.call @printClose() : () -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printString(%4) : (!llvm.ptr) -> ()
    llvm.return
  }
}

