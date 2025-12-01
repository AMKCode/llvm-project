module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @printNewline()
  llvm.func @printF32(f32)
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[2.000000e+00, 1.000000e+00, 0.000000e+00], [1.000000e+00, 3.000000e+00, 2.000000e+00], [0.000000e+00, 2.000000e+00, 4.000000e+00]]> : tensor<3x3xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x array<3 x f32>>
  llvm.mlir.global private constant @__constant_3xf32_0(dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x f32>
  llvm.mlir.global private constant @__constant_3xf32(dense<0.000000e+00> : tensor<3xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<3 x f32>
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
  llvm.func @sparse_mv(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64, %arg10: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg1, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg2, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg4, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %7 = llvm.insertvalue %arg6, %6[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %arg7, %7[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg8, %8[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg9, %9[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg10, %10[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.mlir.constant(0 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %16 = llvm.call @sparsePositions32(%arg0, %12) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %17 = llvm.call @sparseCoordinates32(%arg0, %12) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.br ^bb1(%13 : i64)
  ^bb1(%18: i64):  // 2 preds: ^bb0, ^bb10
    %19 = llvm.icmp "slt" %18, %14 : i64
    llvm.cond_br %19, ^bb2, ^bb11
  ^bb2:  // pred: ^bb1
    %20 = llvm.extractvalue %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.getelementptr inbounds|nuw %20[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %22 = llvm.load %21 : !llvm.ptr -> f32
    %23 = llvm.extractvalue %16[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.getelementptr inbounds|nuw %23[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 : !llvm.ptr -> i32
    %26 = llvm.zext %25 : i32 to i64
    %27 = llvm.add %18, %12 : i64
    %28 = llvm.extractvalue %16[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.getelementptr inbounds|nuw %28[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %30 = llvm.load %29 : !llvm.ptr -> i32
    %31 = llvm.zext %30 : i32 to i64
    llvm.br ^bb3(%26, %22 : i64, f32)
  ^bb3(%32: i64, %33: f32):  // 2 preds: ^bb2, ^bb9
    %34 = llvm.icmp "slt" %32, %31 : i64
    llvm.cond_br %34, ^bb4, ^bb10
  ^bb4:  // pred: ^bb3
    %35 = llvm.extractvalue %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.getelementptr inbounds|nuw %35[%32] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %37 = llvm.load %36 : !llvm.ptr -> i32
    %38 = llvm.zext %37 : i32 to i64
    %39 = llvm.icmp "sge" %38, %18 : i64
    llvm.cond_br %39, ^bb5, ^bb7(%33 : f32)
  ^bb5:  // pred: ^bb4
    %40 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.getelementptr inbounds|nuw %40[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    %43 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %44 = llvm.getelementptr inbounds|nuw %43[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %45 = llvm.load %44 : !llvm.ptr -> f32
    %46 = llvm.fmul %42, %45 : f32
    %47 = llvm.fadd %46, %33 : f32
    %48 = llvm.icmp "ne" %18, %38 : i64
    llvm.cond_br %48, ^bb6, ^bb7(%47 : f32)
  ^bb6:  // pred: ^bb5
    %49 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.getelementptr inbounds|nuw %49[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %51 = llvm.load %50 : !llvm.ptr -> f32
    %52 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %53 = llvm.getelementptr inbounds|nuw %52[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %54 = llvm.load %53 : !llvm.ptr -> f32
    %55 = llvm.fmul %51, %54 : f32
    %56 = llvm.extractvalue %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %57 = llvm.getelementptr inbounds|nuw %56[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = llvm.fadd %58, %55 : f32
    %60 = llvm.extractvalue %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %61 = llvm.getelementptr inbounds|nuw %60[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %59, %61 : f32, !llvm.ptr
    llvm.br ^bb7(%47 : f32)
  ^bb7(%62: f32):  // 3 preds: ^bb4, ^bb5, ^bb6
    llvm.br ^bb8
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9
  ^bb9:  // pred: ^bb8
    %63 = llvm.add %32, %12 : i64
    llvm.br ^bb3(%63, %62 : i64, f32)
  ^bb10:  // pred: ^bb3
    %64 = llvm.extractvalue %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.getelementptr inbounds|nuw %64[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %33, %65 : f32, !llvm.ptr
    %66 = llvm.add %18, %12 : i64
    llvm.br ^bb1(%66 : i64)
  ^bb11:  // pred: ^bb1
    llvm.return %11 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
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
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.mlir.zero : !llvm.ptr
    %13 = llvm.getelementptr %12[%10] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %14 = llvm.ptrtoint %13 : !llvm.ptr to i64
    %15 = llvm.mlir.addressof @__constant_3xf32 : !llvm.ptr
    %16 = llvm.getelementptr %15[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x f32>
    %17 = llvm.mlir.constant(3735928559 : index) : i64
    %18 = llvm.inttoptr %17 : i64 to !llvm.ptr
    %19 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.insertvalue %18, %19[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %16, %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.mlir.constant(0 : index) : i64
    %23 = llvm.insertvalue %22, %21[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.insertvalue %10, %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.insertvalue %11, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.mlir.constant(3 : index) : i64
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.mlir.zero : !llvm.ptr
    %29 = llvm.getelementptr %28[%26] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %30 = llvm.ptrtoint %29 : !llvm.ptr to i64
    %31 = llvm.mlir.addressof @__constant_3xf32_0 : !llvm.ptr
    %32 = llvm.getelementptr %31[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x f32>
    %33 = llvm.mlir.constant(3735928559 : index) : i64
    %34 = llvm.inttoptr %33 : i64 to !llvm.ptr
    %35 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %36 = llvm.insertvalue %34, %35[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %32, %36[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.mlir.constant(0 : index) : i64
    %39 = llvm.insertvalue %38, %37[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.insertvalue %26, %39[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.insertvalue %27, %40[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %42 = llvm.mlir.constant(3 : index) : i64
    %43 = llvm.mlir.constant(3 : index) : i64
    %44 = llvm.mlir.constant(1 : index) : i64
    %45 = llvm.mlir.constant(9 : index) : i64
    %46 = llvm.mlir.zero : !llvm.ptr
    %47 = llvm.getelementptr %46[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %48 = llvm.ptrtoint %47 : !llvm.ptr to i64
    %49 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr
    %50 = llvm.getelementptr %49[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f32>>
    %51 = llvm.mlir.constant(3735928559 : index) : i64
    %52 = llvm.inttoptr %51 : i64 to !llvm.ptr
    %53 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %54 = llvm.insertvalue %52, %53[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %50, %54[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.mlir.constant(0 : index) : i64
    %57 = llvm.insertvalue %56, %55[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %58 = llvm.insertvalue %42, %57[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %59 = llvm.insertvalue %43, %58[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %60 = llvm.insertvalue %43, %59[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %61 = llvm.insertvalue %44, %60[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.mlir.constant(2 : index) : i64
    %63 = llvm.mlir.constant(1 : index) : i64
    %64 = llvm.alloca %62 x i64 : (i64) -> !llvm.ptr
    %65 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %66 = llvm.insertvalue %64, %65[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.insertvalue %64, %66[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %68 = llvm.mlir.constant(0 : index) : i64
    %69 = llvm.insertvalue %68, %67[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %70 = llvm.insertvalue %62, %69[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %71 = llvm.insertvalue %63, %70[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %72 = llvm.extractvalue %71[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %73 = llvm.getelementptr inbounds|nuw %72[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %4, %73 : i64, !llvm.ptr
    %74 = llvm.extractvalue %71[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %75 = llvm.getelementptr inbounds|nuw %74[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %75 : i64, !llvm.ptr
    %76 = llvm.mlir.constant(2 : index) : i64
    %77 = llvm.mlir.constant(1 : index) : i64
    %78 = llvm.alloca %76 x i64 : (i64) -> !llvm.ptr
    %79 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %80 = llvm.insertvalue %78, %79[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %81 = llvm.insertvalue %78, %80[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %82 = llvm.mlir.constant(0 : index) : i64
    %83 = llvm.insertvalue %82, %81[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %84 = llvm.insertvalue %76, %83[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %85 = llvm.insertvalue %77, %84[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.extractvalue %85[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %87 = llvm.getelementptr inbounds|nuw %86[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %8, %87 : i64, !llvm.ptr
    %88 = llvm.extractvalue %85[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %89 = llvm.getelementptr inbounds|nuw %88[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %8, %89 : i64, !llvm.ptr
    %90 = llvm.mlir.constant(2 : index) : i64
    %91 = llvm.mlir.constant(1 : index) : i64
    %92 = llvm.alloca %90 x i64 : (i64) -> !llvm.ptr
    %93 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %94 = llvm.insertvalue %92, %93[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %95 = llvm.insertvalue %92, %94[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %96 = llvm.mlir.constant(0 : index) : i64
    %97 = llvm.insertvalue %96, %95[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %98 = llvm.insertvalue %90, %97[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %99 = llvm.insertvalue %91, %98[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %100 = llvm.extractvalue %99[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %101 = llvm.getelementptr inbounds|nuw %100[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %7, %101 : i64, !llvm.ptr
    %102 = llvm.extractvalue %99[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %103 = llvm.getelementptr inbounds|nuw %102[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %6, %103 : i64, !llvm.ptr
    %104 = llvm.extractvalue %85[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %105 = llvm.extractvalue %85[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %106 = llvm.extractvalue %85[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %107 = llvm.extractvalue %85[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %108 = llvm.extractvalue %85[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %109 = llvm.extractvalue %85[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %110 = llvm.extractvalue %85[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %111 = llvm.extractvalue %85[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %112 = llvm.extractvalue %85[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %113 = llvm.extractvalue %85[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %114 = llvm.extractvalue %71[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %115 = llvm.extractvalue %71[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %116 = llvm.extractvalue %71[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %117 = llvm.extractvalue %71[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %118 = llvm.extractvalue %71[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %119 = llvm.extractvalue %99[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %120 = llvm.extractvalue %99[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %121 = llvm.extractvalue %99[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %122 = llvm.extractvalue %99[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %123 = llvm.extractvalue %99[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %124 = llvm.extractvalue %99[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %125 = llvm.extractvalue %99[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %126 = llvm.extractvalue %99[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %127 = llvm.extractvalue %99[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %128 = llvm.extractvalue %99[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %129 = llvm.call @newSparseTensor(%104, %105, %106, %107, %108, %109, %110, %111, %112, %113, %114, %115, %116, %117, %118, %119, %120, %121, %122, %123, %124, %125, %126, %127, %128, %2, %2, %2, %1, %0) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %130 = llvm.mlir.constant(2 : index) : i64
    %131 = llvm.mlir.constant(1 : index) : i64
    %132 = llvm.alloca %130 x i64 : (i64) -> !llvm.ptr
    %133 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %134 = llvm.insertvalue %132, %133[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %135 = llvm.insertvalue %132, %134[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %136 = llvm.mlir.constant(0 : index) : i64
    %137 = llvm.insertvalue %136, %135[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %138 = llvm.insertvalue %130, %137[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %139 = llvm.insertvalue %131, %138[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %140 = llvm.mlir.constant(1 : index) : i64
    %141 = llvm.alloca %140 x f32 : (i64) -> !llvm.ptr
    %142 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64)>
    %143 = llvm.insertvalue %141, %142[0] : !llvm.struct<(ptr, ptr, i64)> 
    %144 = llvm.insertvalue %141, %143[1] : !llvm.struct<(ptr, ptr, i64)> 
    %145 = llvm.mlir.constant(0 : index) : i64
    %146 = llvm.insertvalue %145, %144[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.br ^bb1(%7 : i64)
  ^bb1(%147: i64):  // 2 preds: ^bb0, ^bb9
    %148 = llvm.icmp "slt" %147, %8 : i64
    llvm.cond_br %148, ^bb2, ^bb10
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%7 : i64)
  ^bb3(%149: i64):  // 2 preds: ^bb2, ^bb8
    %150 = llvm.icmp "slt" %149, %8 : i64
    llvm.cond_br %150, ^bb4, ^bb9
  ^bb4:  // pred: ^bb3
    %151 = llvm.extractvalue %61[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %152 = llvm.mlir.constant(3 : index) : i64
    %153 = llvm.mul %147, %152 overflow<nsw, nuw> : i64
    %154 = llvm.add %153, %149 overflow<nsw, nuw> : i64
    %155 = llvm.getelementptr inbounds|nuw %151[%154] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %156 = llvm.load %155 : !llvm.ptr -> f32
    %157 = llvm.icmp "ule" %147, %149 : i64
    llvm.cond_br %157, ^bb5, ^bb8
  ^bb5:  // pred: ^bb4
    %158 = llvm.fcmp "une" %156, %9 : f32
    llvm.cond_br %158, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %159 = llvm.extractvalue %139[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %160 = llvm.getelementptr inbounds|nuw %159[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %147, %160 : i64, !llvm.ptr
    %161 = llvm.extractvalue %139[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %162 = llvm.getelementptr inbounds|nuw %161[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %149, %162 : i64, !llvm.ptr
    %163 = llvm.extractvalue %146[1] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.store %156, %163 : f32, !llvm.ptr
    %164 = llvm.extractvalue %139[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %165 = llvm.extractvalue %139[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %166 = llvm.extractvalue %139[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %167 = llvm.extractvalue %139[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %168 = llvm.extractvalue %139[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %169 = llvm.extractvalue %146[0] : !llvm.struct<(ptr, ptr, i64)> 
    %170 = llvm.extractvalue %146[1] : !llvm.struct<(ptr, ptr, i64)> 
    %171 = llvm.extractvalue %146[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.call @lexInsertF32(%129, %164, %165, %166, %167, %168, %169, %170, %171) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb7
  ^bb7:  // 2 preds: ^bb5, ^bb6
    llvm.br ^bb8
  ^bb8:  // 2 preds: ^bb4, ^bb7
    %172 = llvm.add %149, %6 : i64
    llvm.br ^bb3(%172 : i64)
  ^bb9:  // pred: ^bb3
    %173 = llvm.add %147, %6 : i64
    llvm.br ^bb1(%173 : i64)
  ^bb10:  // pred: ^bb1
    llvm.call @endLexInsert(%129) : (!llvm.ptr) -> ()
    %174 = llvm.mlir.constant(3 : index) : i64
    %175 = llvm.mlir.constant(1 : index) : i64
    %176 = llvm.mlir.zero : !llvm.ptr
    %177 = llvm.getelementptr %176[%174] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %178 = llvm.ptrtoint %177 : !llvm.ptr to i64
    %179 = llvm.mlir.constant(64 : index) : i64
    %180 = llvm.add %178, %179 : i64
    %181 = llvm.call @malloc(%180) : (i64) -> !llvm.ptr
    %182 = llvm.ptrtoint %181 : !llvm.ptr to i64
    %183 = llvm.mlir.constant(1 : index) : i64
    %184 = llvm.sub %179, %183 : i64
    %185 = llvm.add %182, %184 : i64
    %186 = llvm.urem %185, %179 : i64
    %187 = llvm.sub %185, %186 : i64
    %188 = llvm.inttoptr %187 : i64 to !llvm.ptr
    %189 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %190 = llvm.insertvalue %181, %189[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %191 = llvm.insertvalue %188, %190[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %192 = llvm.mlir.constant(0 : index) : i64
    %193 = llvm.insertvalue %192, %191[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %194 = llvm.insertvalue %174, %193[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %195 = llvm.insertvalue %175, %194[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %196 = llvm.mlir.constant(1 : index) : i64
    %197 = llvm.extractvalue %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %198 = llvm.mul %196, %197 : i64
    %199 = llvm.mlir.zero : !llvm.ptr
    %200 = llvm.getelementptr %199[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %201 = llvm.ptrtoint %200 : !llvm.ptr to i64
    %202 = llvm.mul %198, %201 : i64
    %203 = llvm.extractvalue %25[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %204 = llvm.extractvalue %25[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %205 = llvm.getelementptr %203[%204] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %206 = llvm.extractvalue %195[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %207 = llvm.extractvalue %195[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %208 = llvm.getelementptr %206[%207] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    "llvm.intr.memcpy"(%208, %205, %202) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %209 = llvm.extractvalue %41[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %210 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %211 = llvm.extractvalue %41[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %212 = llvm.extractvalue %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %213 = llvm.extractvalue %41[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %214 = llvm.extractvalue %195[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %215 = llvm.extractvalue %195[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %216 = llvm.extractvalue %195[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %217 = llvm.extractvalue %195[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %218 = llvm.extractvalue %195[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %219 = llvm.call @sparse_mv(%129, %209, %210, %211, %212, %213, %214, %215, %216, %217, %218) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %220 = llvm.extractvalue %219[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %221 = llvm.getelementptr inbounds|nuw %220[%7] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %222 = llvm.load %221 : !llvm.ptr -> f32
    %223 = llvm.extractvalue %219[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %224 = llvm.getelementptr inbounds|nuw %223[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %225 = llvm.load %224 : !llvm.ptr -> f32
    %226 = llvm.extractvalue %219[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %227 = llvm.getelementptr inbounds|nuw %226[%5] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %228 = llvm.load %227 : !llvm.ptr -> f32
    llvm.call @printF32(%222) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%225) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.call @printF32(%228) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
}

