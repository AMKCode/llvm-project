module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @printNewline()
  llvm.func @printF32(f32)
  llvm.mlir.global private constant @__constant_3x3xf32_1(dense<[[2.000000e+00, 1.000000e+00, 0.000000e+00], [1.000000e+00, 3.000000e+00, 2.000000e+00], [0.000000e+00, 2.000000e+00, 4.000000e+00]]> : tensor<3x3xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x array<3 x f32>>
  llvm.mlir.global private constant @__constant_3x3xf32_0(dense<[[1.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 1.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<3x3xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x array<3 x f32>>
  llvm.mlir.global private constant @__constant_3x3xf32(dense<0.000000e+00> : tensor<3x3xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x array<3 x f32>>
  llvm.func @endLexInsert(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func private @lexInsertF32(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64) attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg1, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg2, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg4, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %5, %7 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %8 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64)>
    %9 = llvm.insertvalue %arg6, %8[0] : !llvm.struct<(ptr, ptr, i64)> 
    %10 = llvm.insertvalue %arg7, %9[1] : !llvm.struct<(ptr, ptr, i64)> 
    %11 = llvm.insertvalue %arg8, %10[2] : !llvm.struct<(ptr, ptr, i64)> 
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.alloca %12 x !llvm.struct<(ptr, ptr, i64)> : (i64) -> !llvm.ptr
    llvm.store %11, %13 : !llvm.struct<(ptr, ptr, i64)>, !llvm.ptr
    llvm.call @_mlir_ciface_lexInsertF32(%arg0, %7, %13) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @_mlir_ciface_lexInsertF32(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @newSparseTensor(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: !llvm.ptr) -> !llvm.ptr attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg4, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %5, %7 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %8 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %9 = llvm.insertvalue %arg5, %8[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg6, %9[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg7, %10[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg8, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.insertvalue %arg9, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.alloca %14 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %13, %15 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %16 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %17 = llvm.insertvalue %arg10, %16[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %arg11, %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.insertvalue %arg12, %18[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.insertvalue %arg13, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %arg14, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.alloca %22 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %21, %23 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %24 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %25 = llvm.insertvalue %arg15, %24[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.insertvalue %arg16, %25[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %arg17, %26[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %arg18, %27[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %arg19, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.mlir.constant(1 : index) : i64
    %31 = llvm.alloca %30 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %29, %31 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %32 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %33 = llvm.insertvalue %arg20, %32[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.insertvalue %arg21, %33[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %arg22, %34[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %arg23, %35[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %arg24, %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.alloca %38 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %37, %39 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %40 = llvm.call @_mlir_ciface_newSparseTensor(%7, %15, %23, %31, %39, %arg25, %arg26, %arg27, %arg28, %arg29) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    llvm.return %40 : !llvm.ptr
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
  llvm.func private @sparseValuesF32(%arg0: !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparseValuesF32(%1, %arg0) : (!llvm.ptr, !llvm.ptr) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparseValuesF32(!llvm.ptr, !llvm.ptr) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func @ssymm(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg8, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg9, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg10, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg11, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg13, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg12, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg14, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg1, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg2, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg3, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg4, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg6, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg5, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg7, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.call @sparsePositions32(%arg0, %16) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %21 = llvm.call @sparseCoordinates32(%arg0, %16) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.br ^bb1(%17 : i64)
  ^bb1(%22: i64):  // 2 preds: ^bb0, ^bb10
    %23 = llvm.icmp "slt" %22, %18 : i64
    llvm.cond_br %23, ^bb2, ^bb11
  ^bb2:  // pred: ^bb1
    %24 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.getelementptr inbounds|nuw %24[%22] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %26 = llvm.load %25 : !llvm.ptr -> i32
    %27 = llvm.zext %26 : i32 to i64
    %28 = llvm.add %22, %16 : i64
    %29 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.getelementptr inbounds|nuw %29[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %31 = llvm.load %30 : !llvm.ptr -> i32
    %32 = llvm.zext %31 : i32 to i64
    llvm.br ^bb3(%27 : i64)
  ^bb3(%33: i64):  // 2 preds: ^bb2, ^bb9
    %34 = llvm.icmp "slt" %33, %32 : i64
    llvm.cond_br %34, ^bb4, ^bb10
  ^bb4:  // pred: ^bb3
    %35 = llvm.extractvalue %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.getelementptr inbounds|nuw %35[%33] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %37 = llvm.load %36 : !llvm.ptr -> i32
    %38 = llvm.zext %37 : i32 to i64
    %39 = llvm.icmp "sge" %38, %22 : i64
    llvm.cond_br %39, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %40 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.getelementptr inbounds|nuw %40[%33] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    llvm.br ^bb6(%17 : i64)
  ^bb6(%43: i64):  // 2 preds: ^bb5, ^bb7
    %44 = llvm.icmp "slt" %43, %18 : i64
    llvm.cond_br %44, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %45 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.mlir.constant(3 : index) : i64
    %47 = llvm.mul %38, %46 overflow<nsw, nuw> : i64
    %48 = llvm.add %47, %43 overflow<nsw, nuw> : i64
    %49 = llvm.getelementptr inbounds|nuw %45[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.fmul %42, %50 : f32
    %52 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mul %22, %53 overflow<nsw, nuw> : i64
    %55 = llvm.add %54, %43 overflow<nsw, nuw> : i64
    %56 = llvm.getelementptr inbounds|nuw %52[%55] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %57 = llvm.load %56 : !llvm.ptr -> f32
    %58 = llvm.fadd %51, %57 : f32
    %59 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %60 = llvm.mlir.constant(3 : index) : i64
    %61 = llvm.mul %22, %60 overflow<nsw, nuw> : i64
    %62 = llvm.add %61, %43 overflow<nsw, nuw> : i64
    %63 = llvm.getelementptr inbounds|nuw %59[%62] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %58, %63 : f32, !llvm.ptr
    %64 = llvm.add %43, %16 : i64
    llvm.br ^bb6(%64 : i64)
  ^bb8:  // pred: ^bb6
    llvm.br ^bb9
  ^bb9:  // 2 preds: ^bb4, ^bb8
    %65 = llvm.add %33, %16 : i64
    llvm.br ^bb3(%65 : i64)
  ^bb10:  // pred: ^bb3
    %66 = llvm.add %22, %16 : i64
    llvm.br ^bb1(%66 : i64)
  ^bb11:  // pred: ^bb1
    llvm.return %7 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
  llvm.func @main() {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.mlir.constant(2 : i32) : i32
    %3 = llvm.mlir.constant(262144 : i64) : i64
    %4 = llvm.mlir.constant(65536 : i64) : i64
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.mlir.constant(3 : index) : i64
    %9 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %10 = llvm.mlir.constant(3 : index) : i64
    %11 = llvm.mlir.constant(3 : index) : i64
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.mlir.constant(9 : index) : i64
    %14 = llvm.mlir.zero : !llvm.ptr
    %15 = llvm.getelementptr %14[%13] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %16 = llvm.ptrtoint %15 : !llvm.ptr to i64
    %17 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr
    %18 = llvm.getelementptr %17[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f32>>
    %19 = llvm.mlir.constant(3735928559 : index) : i64
    %20 = llvm.inttoptr %19 : i64 to !llvm.ptr
    %21 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %22 = llvm.insertvalue %20, %21[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %18, %22[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %10, %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %11, %26[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %11, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %12, %28[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.mlir.constant(3 : index) : i64
    %31 = llvm.mlir.constant(3 : index) : i64
    %32 = llvm.mlir.constant(1 : index) : i64
    %33 = llvm.mlir.constant(9 : index) : i64
    %34 = llvm.mlir.zero : !llvm.ptr
    %35 = llvm.getelementptr %34[%33] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %36 = llvm.ptrtoint %35 : !llvm.ptr to i64
    %37 = llvm.mlir.addressof @__constant_3x3xf32_0 : !llvm.ptr
    %38 = llvm.getelementptr %37[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f32>>
    %39 = llvm.mlir.constant(3735928559 : index) : i64
    %40 = llvm.inttoptr %39 : i64 to !llvm.ptr
    %41 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %42 = llvm.insertvalue %40, %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.insertvalue %38, %42[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = llvm.insertvalue %44, %43[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %30, %45[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %31, %46[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %31, %47[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %32, %48[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.mlir.constant(3 : index) : i64
    %51 = llvm.mlir.constant(3 : index) : i64
    %52 = llvm.mlir.constant(1 : index) : i64
    %53 = llvm.mlir.constant(9 : index) : i64
    %54 = llvm.mlir.zero : !llvm.ptr
    %55 = llvm.getelementptr %54[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %56 = llvm.ptrtoint %55 : !llvm.ptr to i64
    %57 = llvm.mlir.addressof @__constant_3x3xf32_1 : !llvm.ptr
    %58 = llvm.getelementptr %57[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f32>>
    %59 = llvm.mlir.constant(3735928559 : index) : i64
    %60 = llvm.inttoptr %59 : i64 to !llvm.ptr
    %61 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %62 = llvm.insertvalue %60, %61[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.insertvalue %58, %62[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.mlir.constant(0 : index) : i64
    %65 = llvm.insertvalue %64, %63[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %50, %65[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.insertvalue %51, %66[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.insertvalue %51, %67[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.insertvalue %52, %68[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.mlir.constant(2 : index) : i64
    %71 = llvm.mlir.constant(1 : index) : i64
    %72 = llvm.alloca %70 x i64 : (i64) -> !llvm.ptr
    %73 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %74 = llvm.insertvalue %72, %73[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %75 = llvm.insertvalue %72, %74[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %76 = llvm.mlir.constant(0 : index) : i64
    %77 = llvm.insertvalue %76, %75[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %78 = llvm.insertvalue %70, %77[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %79 = llvm.insertvalue %71, %78[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %80 = llvm.extractvalue %79[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %81 = llvm.getelementptr inbounds|nuw %80[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %4, %81 : i64, !llvm.ptr
    %82 = llvm.extractvalue %79[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.getelementptr inbounds|nuw %82[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %83 : i64, !llvm.ptr
    %84 = llvm.mlir.constant(2 : index) : i64
    %85 = llvm.mlir.constant(1 : index) : i64
    %86 = llvm.alloca %84 x i64 : (i64) -> !llvm.ptr
    %87 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %88 = llvm.insertvalue %86, %87[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %89 = llvm.insertvalue %86, %88[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %90 = llvm.mlir.constant(0 : index) : i64
    %91 = llvm.insertvalue %90, %89[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %92 = llvm.insertvalue %84, %91[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %93 = llvm.insertvalue %85, %92[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %94 = llvm.extractvalue %93[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %95 = llvm.getelementptr inbounds|nuw %94[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %8, %95 : i64, !llvm.ptr
    %96 = llvm.extractvalue %93[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %97 = llvm.getelementptr inbounds|nuw %96[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %8, %97 : i64, !llvm.ptr
    %98 = llvm.mlir.constant(2 : index) : i64
    %99 = llvm.mlir.constant(1 : index) : i64
    %100 = llvm.alloca %98 x i64 : (i64) -> !llvm.ptr
    %101 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %102 = llvm.insertvalue %100, %101[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %103 = llvm.insertvalue %100, %102[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %104 = llvm.mlir.constant(0 : index) : i64
    %105 = llvm.insertvalue %104, %103[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %106 = llvm.insertvalue %98, %105[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %107 = llvm.insertvalue %99, %106[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %108 = llvm.extractvalue %107[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %109 = llvm.getelementptr inbounds|nuw %108[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %7, %109 : i64, !llvm.ptr
    %110 = llvm.extractvalue %107[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %111 = llvm.getelementptr inbounds|nuw %110[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %6, %111 : i64, !llvm.ptr
    %112 = llvm.extractvalue %93[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %113 = llvm.extractvalue %93[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %114 = llvm.extractvalue %93[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %115 = llvm.extractvalue %93[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %116 = llvm.extractvalue %93[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %117 = llvm.extractvalue %93[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %118 = llvm.extractvalue %93[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %119 = llvm.extractvalue %93[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %120 = llvm.extractvalue %93[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %121 = llvm.extractvalue %93[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %122 = llvm.extractvalue %79[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %123 = llvm.extractvalue %79[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %124 = llvm.extractvalue %79[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %125 = llvm.extractvalue %79[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %126 = llvm.extractvalue %79[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %127 = llvm.extractvalue %107[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %128 = llvm.extractvalue %107[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %129 = llvm.extractvalue %107[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %130 = llvm.extractvalue %107[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %131 = llvm.extractvalue %107[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %132 = llvm.extractvalue %107[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %133 = llvm.extractvalue %107[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %134 = llvm.extractvalue %107[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %135 = llvm.extractvalue %107[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %136 = llvm.extractvalue %107[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %137 = llvm.call @newSparseTensor(%112, %113, %114, %115, %116, %117, %118, %119, %120, %121, %122, %123, %124, %125, %126, %127, %128, %129, %130, %131, %132, %133, %134, %135, %136, %2, %2, %2, %1, %0) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %138 = llvm.mlir.constant(2 : index) : i64
    %139 = llvm.mlir.constant(1 : index) : i64
    %140 = llvm.alloca %138 x i64 : (i64) -> !llvm.ptr
    %141 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %142 = llvm.insertvalue %140, %141[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %143 = llvm.insertvalue %140, %142[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %144 = llvm.mlir.constant(0 : index) : i64
    %145 = llvm.insertvalue %144, %143[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %146 = llvm.insertvalue %138, %145[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %147 = llvm.insertvalue %139, %146[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %148 = llvm.mlir.constant(1 : index) : i64
    %149 = llvm.alloca %148 x f32 : (i64) -> !llvm.ptr
    %150 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64)>
    %151 = llvm.insertvalue %149, %150[0] : !llvm.struct<(ptr, ptr, i64)> 
    %152 = llvm.insertvalue %149, %151[1] : !llvm.struct<(ptr, ptr, i64)> 
    %153 = llvm.mlir.constant(0 : index) : i64
    %154 = llvm.insertvalue %153, %152[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.br ^bb1(%7 : i64)
  ^bb1(%155: i64):  // 2 preds: ^bb0, ^bb9
    %156 = llvm.icmp "slt" %155, %8 : i64
    llvm.cond_br %156, ^bb2, ^bb10
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%7 : i64)
  ^bb3(%157: i64):  // 2 preds: ^bb2, ^bb8
    %158 = llvm.icmp "slt" %157, %8 : i64
    llvm.cond_br %158, ^bb4, ^bb9
  ^bb4:  // pred: ^bb3
    %159 = llvm.extractvalue %69[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %160 = llvm.mlir.constant(3 : index) : i64
    %161 = llvm.mul %155, %160 overflow<nsw, nuw> : i64
    %162 = llvm.add %161, %157 overflow<nsw, nuw> : i64
    %163 = llvm.getelementptr inbounds|nuw %159[%162] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %164 = llvm.load %163 : !llvm.ptr -> f32
    %165 = llvm.icmp "ule" %155, %157 : i64
    llvm.cond_br %165, ^bb5, ^bb8
  ^bb5:  // pred: ^bb4
    %166 = llvm.fcmp "une" %164, %9 : f32
    llvm.cond_br %166, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %167 = llvm.extractvalue %147[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %168 = llvm.getelementptr inbounds|nuw %167[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %155, %168 : i64, !llvm.ptr
    %169 = llvm.extractvalue %147[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %170 = llvm.getelementptr inbounds|nuw %169[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %157, %170 : i64, !llvm.ptr
    %171 = llvm.extractvalue %154[1] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.store %164, %171 : f32, !llvm.ptr
    %172 = llvm.extractvalue %147[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %173 = llvm.extractvalue %147[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %174 = llvm.extractvalue %147[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.extractvalue %147[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %176 = llvm.extractvalue %147[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %177 = llvm.extractvalue %154[0] : !llvm.struct<(ptr, ptr, i64)> 
    %178 = llvm.extractvalue %154[1] : !llvm.struct<(ptr, ptr, i64)> 
    %179 = llvm.extractvalue %154[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.call @lexInsertF32(%137, %172, %173, %174, %175, %176, %177, %178, %179) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb7
  ^bb7:  // 2 preds: ^bb5, ^bb6
    llvm.br ^bb8
  ^bb8:  // 2 preds: ^bb4, ^bb7
    %180 = llvm.add %157, %6 : i64
    llvm.br ^bb3(%180 : i64)
  ^bb9:  // pred: ^bb3
    %181 = llvm.add %155, %6 : i64
    llvm.br ^bb1(%181 : i64)
  ^bb10:  // pred: ^bb1
    llvm.call @endLexInsert(%137) : (!llvm.ptr) -> ()
    %182 = llvm.mlir.constant(3 : index) : i64
    %183 = llvm.mlir.constant(3 : index) : i64
    %184 = llvm.mlir.constant(1 : index) : i64
    %185 = llvm.mlir.constant(9 : index) : i64
    %186 = llvm.mlir.zero : !llvm.ptr
    %187 = llvm.getelementptr %186[%185] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %188 = llvm.ptrtoint %187 : !llvm.ptr to i64
    %189 = llvm.mlir.constant(64 : index) : i64
    %190 = llvm.add %188, %189 : i64
    %191 = llvm.call @malloc(%190) : (i64) -> !llvm.ptr
    %192 = llvm.ptrtoint %191 : !llvm.ptr to i64
    %193 = llvm.mlir.constant(1 : index) : i64
    %194 = llvm.sub %189, %193 : i64
    %195 = llvm.add %192, %194 : i64
    %196 = llvm.urem %195, %189 : i64
    %197 = llvm.sub %195, %196 : i64
    %198 = llvm.inttoptr %197 : i64 to !llvm.ptr
    %199 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %200 = llvm.insertvalue %191, %199[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %201 = llvm.insertvalue %198, %200[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %202 = llvm.mlir.constant(0 : index) : i64
    %203 = llvm.insertvalue %202, %201[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %204 = llvm.insertvalue %182, %203[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %205 = llvm.insertvalue %183, %204[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %206 = llvm.insertvalue %183, %205[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %207 = llvm.insertvalue %184, %206[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %208 = llvm.mlir.constant(1 : index) : i64
    %209 = llvm.extractvalue %29[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %210 = llvm.mul %208, %209 : i64
    %211 = llvm.extractvalue %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %212 = llvm.mul %210, %211 : i64
    %213 = llvm.mlir.zero : !llvm.ptr
    %214 = llvm.getelementptr %213[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %215 = llvm.ptrtoint %214 : !llvm.ptr to i64
    %216 = llvm.mul %212, %215 : i64
    %217 = llvm.extractvalue %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %218 = llvm.extractvalue %29[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %219 = llvm.getelementptr %217[%218] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %220 = llvm.extractvalue %207[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %221 = llvm.extractvalue %207[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %222 = llvm.getelementptr %220[%221] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    "llvm.intr.memcpy"(%222, %219, %216) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %223 = llvm.extractvalue %49[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %224 = llvm.extractvalue %49[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %225 = llvm.extractvalue %49[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %226 = llvm.extractvalue %49[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %227 = llvm.extractvalue %49[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %228 = llvm.extractvalue %49[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %229 = llvm.extractvalue %49[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %230 = llvm.extractvalue %207[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %231 = llvm.extractvalue %207[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %232 = llvm.extractvalue %207[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %233 = llvm.extractvalue %207[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %234 = llvm.extractvalue %207[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %235 = llvm.extractvalue %207[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %236 = llvm.extractvalue %207[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %237 = llvm.call @ssymm(%137, %223, %224, %225, %226, %227, %228, %229, %230, %231, %232, %233, %234, %235, %236) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %238 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %239 = llvm.mlir.constant(3 : index) : i64
    %240 = llvm.mul %7, %239 overflow<nsw, nuw> : i64
    %241 = llvm.add %240, %7 overflow<nsw, nuw> : i64
    %242 = llvm.getelementptr inbounds|nuw %238[%241] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %243 = llvm.load %242 : !llvm.ptr -> f32
    %244 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %245 = llvm.mlir.constant(3 : index) : i64
    %246 = llvm.mul %7, %245 overflow<nsw, nuw> : i64
    %247 = llvm.add %246, %6 overflow<nsw, nuw> : i64
    %248 = llvm.getelementptr inbounds|nuw %244[%247] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %249 = llvm.load %248 : !llvm.ptr -> f32
    %250 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %251 = llvm.mlir.constant(3 : index) : i64
    %252 = llvm.mul %7, %251 overflow<nsw, nuw> : i64
    %253 = llvm.add %252, %5 overflow<nsw, nuw> : i64
    %254 = llvm.getelementptr inbounds|nuw %250[%253] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %255 = llvm.load %254 : !llvm.ptr -> f32
    %256 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %257 = llvm.mlir.constant(3 : index) : i64
    %258 = llvm.mul %6, %257 overflow<nsw, nuw> : i64
    %259 = llvm.add %258, %7 overflow<nsw, nuw> : i64
    %260 = llvm.getelementptr inbounds|nuw %256[%259] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %261 = llvm.load %260 : !llvm.ptr -> f32
    %262 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %263 = llvm.mlir.constant(3 : index) : i64
    %264 = llvm.mul %6, %263 overflow<nsw, nuw> : i64
    %265 = llvm.add %264, %6 overflow<nsw, nuw> : i64
    %266 = llvm.getelementptr inbounds|nuw %262[%265] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %267 = llvm.load %266 : !llvm.ptr -> f32
    %268 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %269 = llvm.mlir.constant(3 : index) : i64
    %270 = llvm.mul %6, %269 overflow<nsw, nuw> : i64
    %271 = llvm.add %270, %5 overflow<nsw, nuw> : i64
    %272 = llvm.getelementptr inbounds|nuw %268[%271] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %273 = llvm.load %272 : !llvm.ptr -> f32
    %274 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %275 = llvm.mlir.constant(3 : index) : i64
    %276 = llvm.mul %5, %275 overflow<nsw, nuw> : i64
    %277 = llvm.add %276, %7 overflow<nsw, nuw> : i64
    %278 = llvm.getelementptr inbounds|nuw %274[%277] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %279 = llvm.load %278 : !llvm.ptr -> f32
    %280 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %281 = llvm.mlir.constant(3 : index) : i64
    %282 = llvm.mul %5, %281 overflow<nsw, nuw> : i64
    %283 = llvm.add %282, %6 overflow<nsw, nuw> : i64
    %284 = llvm.getelementptr inbounds|nuw %280[%283] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %285 = llvm.load %284 : !llvm.ptr -> f32
    %286 = llvm.extractvalue %237[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %287 = llvm.mlir.constant(3 : index) : i64
    %288 = llvm.mul %5, %287 overflow<nsw, nuw> : i64
    %289 = llvm.add %288, %5 overflow<nsw, nuw> : i64
    %290 = llvm.getelementptr inbounds|nuw %286[%289] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %291 = llvm.load %290 : !llvm.ptr -> f32
    llvm.call @printF32(%243) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%249) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%255) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%261) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%267) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%273) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%279) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%285) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%291) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
}

