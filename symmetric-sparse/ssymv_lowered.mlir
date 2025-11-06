module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @printNewline()
  llvm.func @printF64(f64)
  llvm.mlir.global private constant @__constant_3x3xf64(dense<[[1.000000e+00, 2.000000e+00, 0.000000e+00], [2.000000e+00, 3.000000e+00, 4.000000e+00], [0.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<3x3xf64>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x array<3 x f64>>
  llvm.mlir.global private constant @__constant_3xf64(dense<[1.000000e+01, 2.000000e+01, 3.000000e+01]> : tensor<3xf64>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x f64>
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
  llvm.func @ssymv_tri(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %5 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %6 = llvm.getelementptr %0[3] : (!llvm.ptr) -> !llvm.ptr, f64
    %7 = llvm.ptrtoint %6 : !llvm.ptr to i64
    %8 = llvm.call @malloc(%7) : (i64) -> !llvm.ptr
    %9 = llvm.insertvalue %8, %5[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %8, %9[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %3, %10[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %1, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.insertvalue %2, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%3 : i64)
  ^bb1(%14: i64):  // 2 preds: ^bb0, ^bb2
    %15 = llvm.icmp "slt" %14, %1 : i64
    llvm.cond_br %15, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %16 = llvm.getelementptr inbounds|nuw %8[%14] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %16 : f64, !llvm.ptr
    %17 = llvm.add %14, %2 : i64
    llvm.br ^bb1(%17 : i64)
  ^bb3:  // pred: ^bb1
    %18 = llvm.call @sparseValuesF64(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.call @sparsePositions32(%arg0, %3) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.call @sparseCoordinates32(%arg0, %3) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %21 = llvm.call @sparsePositions32(%arg0, %2) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %22 = llvm.call @sparseCoordinates32(%arg0, %2) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %23 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.load %23 : !llvm.ptr -> i32
    %25 = llvm.zext %24 : i32 to i64
    %26 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.getelementptr inbounds|nuw %26[1] : (!llvm.ptr) -> !llvm.ptr, i32
    %28 = llvm.load %27 : !llvm.ptr -> i32
    %29 = llvm.zext %28 : i32 to i64
    llvm.br ^bb4(%25 : i64)
  ^bb4(%30: i64):  // 2 preds: ^bb3, ^bb13
    %31 = llvm.icmp "slt" %30, %29 : i64
    llvm.cond_br %31, ^bb5, ^bb14
  ^bb5:  // pred: ^bb4
    %32 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = llvm.getelementptr inbounds|nuw %32[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 : !llvm.ptr -> i32
    %35 = llvm.zext %34 : i32 to i64
    %36 = llvm.extractvalue %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.getelementptr inbounds|nuw %36[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %38 = llvm.load %37 : !llvm.ptr -> i32
    %39 = llvm.zext %38 : i32 to i64
    %40 = llvm.add %30, %2 : i64
    %41 = llvm.extractvalue %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %42 = llvm.getelementptr inbounds|nuw %41[%40] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %43 = llvm.load %42 : !llvm.ptr -> i32
    %44 = llvm.zext %43 : i32 to i64
    llvm.br ^bb6(%39 : i64)
  ^bb6(%45: i64):  // 2 preds: ^bb5, ^bb12
    %46 = llvm.icmp "slt" %45, %44 : i64
    llvm.cond_br %46, ^bb7, ^bb13
  ^bb7:  // pred: ^bb6
    %47 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %48 = llvm.getelementptr inbounds|nuw %47[%45] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %49 = llvm.load %48 : !llvm.ptr -> i32
    %50 = llvm.zext %49 : i32 to i64
    %51 = llvm.extractvalue %18[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %52 = llvm.getelementptr inbounds|nuw %51[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %53 = llvm.load %52 : !llvm.ptr -> f64
    %54 = llvm.icmp "sle" %35, %50 : i64
    llvm.cond_br %54, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    %55 = llvm.icmp "slt" %35, %50 : i64
    llvm.cond_br %55, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %56 = llvm.getelementptr inbounds|nuw %arg2[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %57 = llvm.load %56 : !llvm.ptr -> f64
    %58 = llvm.fmul %53, %57 : f64
    %59 = llvm.getelementptr inbounds|nuw %8[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %60 = llvm.load %59 : !llvm.ptr -> f64
    %61 = llvm.fadd %60, %58 : f64
    %62 = llvm.getelementptr inbounds|nuw %8[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %61, %62 : f64, !llvm.ptr
    %63 = llvm.getelementptr inbounds|nuw %arg2[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %64 = llvm.load %63 : !llvm.ptr -> f64
    %65 = llvm.fmul %53, %64 : f64
    %66 = llvm.getelementptr inbounds|nuw %8[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %67 = llvm.load %66 : !llvm.ptr -> f64
    %68 = llvm.fadd %67, %65 : f64
    %69 = llvm.getelementptr inbounds|nuw %8[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %68, %69 : f64, !llvm.ptr
    llvm.br ^bb11
  ^bb10:  // pred: ^bb8
    %70 = llvm.getelementptr inbounds|nuw %arg2[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %71 = llvm.load %70 : !llvm.ptr -> f64
    %72 = llvm.fmul %53, %71 : f64
    %73 = llvm.getelementptr inbounds|nuw %8[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %74 = llvm.load %73 : !llvm.ptr -> f64
    %75 = llvm.fadd %74, %72 : f64
    %76 = llvm.getelementptr inbounds|nuw %8[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %75, %76 : f64, !llvm.ptr
    llvm.br ^bb11
  ^bb11:  // 2 preds: ^bb9, ^bb10
    llvm.br ^bb12
  ^bb12:  // 2 preds: ^bb7, ^bb11
    %77 = llvm.add %45, %2 : i64
    llvm.br ^bb6(%77 : i64)
  ^bb13:  // pred: ^bb6
    %78 = llvm.add %30, %2 : i64
    llvm.br ^bb4(%78 : i64)
  ^bb14:  // pred: ^bb4
    llvm.return %13 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @main() {
    %0 = llvm.mlir.addressof @__constant_3x3xf64 : !llvm.ptr
    %1 = llvm.mlir.constant(3735928559 : index) : i64
    %2 = llvm.mlir.addressof @__constant_3xf64 : !llvm.ptr
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.mlir.constant(1 : i32) : i32
    %6 = llvm.mlir.constant(2 : i32) : i32
    %7 = llvm.mlir.constant(262144 : i64) : i64
    %8 = llvm.mlir.constant(3 : index) : i64
    %9 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %10 = llvm.mlir.constant(2 : index) : i64
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x f64>
    %14 = llvm.inttoptr %1 : i64 to !llvm.ptr
    %15 = llvm.getelementptr %0[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f64>>
    %16 = llvm.alloca %10 x i64 : (i64) -> !llvm.ptr
    llvm.store %7, %16 : i64, !llvm.ptr
    %17 = llvm.getelementptr inbounds|nuw %16[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %7, %17 : i64, !llvm.ptr
    %18 = llvm.alloca %10 x i64 : (i64) -> !llvm.ptr
    llvm.store %8, %18 : i64, !llvm.ptr
    %19 = llvm.getelementptr inbounds|nuw %18[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %8, %19 : i64, !llvm.ptr
    %20 = llvm.alloca %10 x i64 : (i64) -> !llvm.ptr
    llvm.store %12, %20 : i64, !llvm.ptr
    %21 = llvm.getelementptr inbounds|nuw %20[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %11, %21 : i64, !llvm.ptr
    %22 = llvm.call @newSparseTensor(%18, %18, %12, %10, %11, %18, %18, %12, %10, %11, %16, %16, %12, %10, %11, %20, %20, %12, %10, %11, %20, %20, %12, %10, %11, %6, %6, %5, %4, %3) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %23 = llvm.alloca %10 x i64 : (i64) -> !llvm.ptr
    %24 = llvm.alloca %11 x f64 : (i64) -> !llvm.ptr
    llvm.br ^bb1(%12 : i64)
  ^bb1(%25: i64):  // 2 preds: ^bb0, ^bb7
    %26 = llvm.icmp "slt" %25, %8 : i64
    llvm.cond_br %26, ^bb2, ^bb8
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%12 : i64)
  ^bb3(%27: i64):  // 2 preds: ^bb2, ^bb6
    %28 = llvm.icmp "slt" %27, %8 : i64
    llvm.cond_br %28, ^bb4, ^bb7
  ^bb4:  // pred: ^bb3
    %29 = llvm.mul %25, %8 overflow<nsw, nuw> : i64
    %30 = llvm.add %29, %27 overflow<nsw, nuw> : i64
    %31 = llvm.getelementptr inbounds|nuw %15[%30] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %32 = llvm.load %31 : !llvm.ptr -> f64
    %33 = llvm.fcmp "une" %32, %9 : f64
    llvm.cond_br %33, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    llvm.store %25, %23 : i64, !llvm.ptr
    %34 = llvm.getelementptr inbounds|nuw %23[1] : (!llvm.ptr) -> !llvm.ptr, i64
    llvm.store %27, %34 : i64, !llvm.ptr
    llvm.store %32, %24 : f64, !llvm.ptr
    llvm.call @lexInsertF64(%22, %23, %23, %12, %10, %11, %24, %24, %12) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb6
  ^bb6:  // 2 preds: ^bb4, ^bb5
    %35 = llvm.add %27, %11 : i64
    llvm.br ^bb3(%35 : i64)
  ^bb7:  // pred: ^bb3
    %36 = llvm.add %25, %11 : i64
    llvm.br ^bb1(%36 : i64)
  ^bb8:  // pred: ^bb1
    llvm.call @endLexInsert(%22) : (!llvm.ptr) -> ()
    %37 = llvm.call @ssymv_tri(%22, %14, %13, %12, %8, %11) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %38 = llvm.extractvalue %37[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = llvm.load %38 : !llvm.ptr -> f64
    %40 = llvm.extractvalue %37[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.getelementptr inbounds|nuw %40[1] : (!llvm.ptr) -> !llvm.ptr, f64
    %42 = llvm.load %41 : !llvm.ptr -> f64
    %43 = llvm.extractvalue %37[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %44 = llvm.getelementptr inbounds|nuw %43[2] : (!llvm.ptr) -> !llvm.ptr, f64
    %45 = llvm.load %44 : !llvm.ptr -> f64
    llvm.call @printF64(%39) : (f64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF64(%42) : (f64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF64(%45) : (f64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
}

