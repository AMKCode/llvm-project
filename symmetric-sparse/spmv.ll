; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_3x3xf64 = private constant [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 0.000000e+00, double 2.000000e+00], [3 x double] [double 0.000000e+00, double 3.000000e+00, double 0.000000e+00], [3 x double] [double 0.000000e+00, double 4.000000e+00, double 5.000000e+00]], align 64
@__constant_3xf64_0 = private constant [3 x double] [double 1.000000e+01, double 2.000000e+01, double 3.000000e+01], align 64
@__constant_3xf64 = private constant [3 x double] zeroinitializer, align 64

declare ptr @malloc(i64)

declare void @printNewline()

declare void @printF64(double)

declare void @endLexInsert(ptr)

define private void @lexInsertF64(ptr %0, ptr %1, ptr %2, i64 %3, i64 %4, i64 %5, ptr %6, ptr %7, i64 %8) {
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %1, 0
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, ptr %2, 1
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 %3, 2
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 %4, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, i64 %5, 4, 0
  %15 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, ptr %15, align 8
  %16 = insertvalue { ptr, ptr, i64 } poison, ptr %6, 0
  %17 = insertvalue { ptr, ptr, i64 } %16, ptr %7, 1
  %18 = insertvalue { ptr, ptr, i64 } %17, i64 %8, 2
  %19 = alloca { ptr, ptr, i64 }, i64 1, align 8
  store { ptr, ptr, i64 } %18, ptr %19, align 8
  call void @_mlir_ciface_lexInsertF64(ptr %0, ptr %15, ptr %19)
  ret void
}

declare void @_mlir_ciface_lexInsertF64(ptr, ptr, ptr)

define private ptr @newSparseTensor(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, ptr %10, ptr %11, i64 %12, i64 %13, i64 %14, ptr %15, ptr %16, i64 %17, i64 %18, i64 %19, ptr %20, ptr %21, i64 %22, i64 %23, i64 %24, i32 %25, i32 %26, i32 %27, i32 %28, ptr %29) {
  %31 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %0, 0
  %32 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %31, ptr %1, 1
  %33 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, i64 %2, 2
  %34 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %33, i64 %3, 3, 0
  %35 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %34, i64 %4, 4, 0
  %36 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %35, ptr %36, align 8
  %37 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %5, 0
  %38 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %37, ptr %6, 1
  %39 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %38, i64 %7, 2
  %40 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %39, i64 %8, 3, 0
  %41 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %40, i64 %9, 4, 0
  %42 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %41, ptr %42, align 8
  %43 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %10, 0
  %44 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %43, ptr %11, 1
  %45 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %44, i64 %12, 2
  %46 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %45, i64 %13, 3, 0
  %47 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %46, i64 %14, 4, 0
  %48 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %47, ptr %48, align 8
  %49 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %15, 0
  %50 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %49, ptr %16, 1
  %51 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %50, i64 %17, 2
  %52 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %51, i64 %18, 3, 0
  %53 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %52, i64 %19, 4, 0
  %54 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %53, ptr %54, align 8
  %55 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %20, 0
  %56 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %55, ptr %21, 1
  %57 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %56, i64 %22, 2
  %58 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %57, i64 %23, 3, 0
  %59 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %58, i64 %24, 4, 0
  %60 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %59, ptr %60, align 8
  %61 = call ptr @_mlir_ciface_newSparseTensor(ptr %36, ptr %42, ptr %48, ptr %54, ptr %60, i32 %25, i32 %26, i32 %27, i32 %28, ptr %29)
  ret ptr %61
}

declare ptr @_mlir_ciface_newSparseTensor(ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, ptr)

define private { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparseCoordinates32(ptr %0, i64 %1) {
  %3 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  call void @_mlir_ciface_sparseCoordinates32(ptr %3, ptr %0, i64 %1)
  %4 = load { ptr, ptr, i64, [1 x i64], [1 x i64] }, ptr %3, align 8
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %4
}

declare void @_mlir_ciface_sparseCoordinates32(ptr, ptr, i64)

define private { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparsePositions32(ptr %0, i64 %1) {
  %3 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  call void @_mlir_ciface_sparsePositions32(ptr %3, ptr %0, i64 %1)
  %4 = load { ptr, ptr, i64, [1 x i64], [1 x i64] }, ptr %3, align 8
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %4
}

declare void @_mlir_ciface_sparsePositions32(ptr, ptr, i64)

define private { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparseValuesF64(ptr %0) {
  %2 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  call void @_mlir_ciface_sparseValuesF64(ptr %2, ptr %0)
  %3 = load { ptr, ptr, i64, [1 x i64], [1 x i64] }, ptr %2, align 8
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %3
}

declare void @_mlir_ciface_sparseValuesF64(ptr, ptr)

define { ptr, ptr, i64, [1 x i64], [1 x i64] } @spmv(ptr %0, ptr %1, ptr %2, i64 %3, i64 %4, i64 %5) {
  %7 = call ptr @malloc(i64 88)
  %8 = ptrtoint ptr %7 to i64
  %9 = add i64 %8, 63
  %10 = urem i64 %9, 64
  %11 = sub i64 %9, %10
  %12 = inttoptr i64 %11 to ptr
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %7, 0
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, ptr %12, 1
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, i64 0, 2
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 3, 3, 0
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, i64 1, 4, 0
  call void @llvm.memcpy.p0.p0.i64(ptr %12, ptr @__constant_3xf64, i64 24, i1 false)
  %18 = call { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparseValuesF64(ptr %0)
  %19 = call { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparsePositions32(ptr %0, i64 0)
  %20 = call { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparseCoordinates32(ptr %0, i64 0)
  %21 = call { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparsePositions32(ptr %0, i64 1)
  %22 = call { ptr, ptr, i64, [1 x i64], [1 x i64] } @sparseCoordinates32(ptr %0, i64 1)
  %23 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %19, 1
  %24 = load i32, ptr %23, align 4
  %25 = zext i32 %24 to i64
  %26 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %19, 1
  %27 = getelementptr inbounds nuw i32, ptr %26, i32 1
  %28 = load i32, ptr %27, align 4
  %29 = zext i32 %28 to i64
  br label %30

30:                                               ; preds = %66, %6
  %31 = phi i64 [ %68, %66 ], [ %25, %6 ]
  %32 = icmp slt i64 %31, %29
  br i1 %32, label %33, label %69

33:                                               ; preds = %30
  %34 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %20, 1
  %35 = getelementptr inbounds nuw i32, ptr %34, i64 %31
  %36 = load i32, ptr %35, align 4
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds nuw double, ptr %12, i64 %37
  %39 = load double, ptr %38, align 8
  %40 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %21, 1
  %41 = getelementptr inbounds nuw i32, ptr %40, i64 %31
  %42 = load i32, ptr %41, align 4
  %43 = zext i32 %42 to i64
  %44 = add i64 %31, 1
  %45 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %21, 1
  %46 = getelementptr inbounds nuw i32, ptr %45, i64 %44
  %47 = load i32, ptr %46, align 4
  %48 = zext i32 %47 to i64
  br label %49

49:                                               ; preds = %53, %33
  %50 = phi i64 [ %65, %53 ], [ %43, %33 ]
  %51 = phi double [ %64, %53 ], [ %39, %33 ]
  %52 = icmp slt i64 %50, %48
  br i1 %52, label %53, label %66

53:                                               ; preds = %49
  %54 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %22, 1
  %55 = getelementptr inbounds nuw i32, ptr %54, i64 %50
  %56 = load i32, ptr %55, align 4
  %57 = zext i32 %56 to i64
  %58 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %18, 1
  %59 = getelementptr inbounds nuw double, ptr %58, i64 %50
  %60 = load double, ptr %59, align 8
  %61 = getelementptr inbounds nuw double, ptr %2, i64 %57
  %62 = load double, ptr %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %51, %63
  %65 = add i64 %50, 1
  br label %49

66:                                               ; preds = %49
  %67 = getelementptr inbounds nuw double, ptr %12, i64 %37
  store double %51, ptr %67, align 8
  %68 = add i64 %31, 1
  br label %30

69:                                               ; preds = %30
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %17
}

define void @main() {
  %1 = alloca i64, i64 2, align 8
  store i64 262144, ptr %1, align 4
  %2 = getelementptr inbounds nuw i64, ptr %1, i32 1
  store i64 262144, ptr %2, align 4
  %3 = alloca i64, i64 2, align 8
  store i64 3, ptr %3, align 4
  %4 = getelementptr inbounds nuw i64, ptr %3, i32 1
  store i64 3, ptr %4, align 4
  %5 = alloca i64, i64 2, align 8
  store i64 0, ptr %5, align 4
  %6 = getelementptr inbounds nuw i64, ptr %5, i32 1
  store i64 1, ptr %6, align 4
  %7 = call ptr @newSparseTensor(ptr %3, ptr %3, i64 0, i64 2, i64 1, ptr %3, ptr %3, i64 0, i64 2, i64 1, ptr %1, ptr %1, i64 0, i64 2, i64 1, ptr %5, ptr %5, i64 0, i64 2, i64 1, ptr %5, ptr %5, i64 0, i64 2, i64 1, i32 2, i32 2, i32 1, i32 0, ptr null)
  %8 = alloca i64, i64 2, align 8
  %9 = alloca double, i64 1, align 8
  br label %10

10:                                               ; preds = %27, %0
  %11 = phi i64 [ %28, %27 ], [ 0, %0 ]
  %12 = icmp slt i64 %11, 3
  br i1 %12, label %13, label %29

13:                                               ; preds = %10
  br label %14

14:                                               ; preds = %25, %13
  %15 = phi i64 [ %26, %25 ], [ 0, %13 ]
  %16 = icmp slt i64 %15, 3
  br i1 %16, label %17, label %27

17:                                               ; preds = %14
  %18 = mul nuw nsw i64 %11, 3
  %19 = add nuw nsw i64 %18, %15
  %20 = getelementptr inbounds nuw double, ptr @__constant_3x3xf64, i64 %19
  %21 = load double, ptr %20, align 8
  %22 = fcmp une double %21, 0.000000e+00
  br i1 %22, label %23, label %25

23:                                               ; preds = %17
  store i64 %11, ptr %8, align 4
  %24 = getelementptr inbounds nuw i64, ptr %8, i32 1
  store i64 %15, ptr %24, align 4
  store double %21, ptr %9, align 8
  call void @lexInsertF64(ptr %7, ptr %8, ptr %8, i64 0, i64 2, i64 1, ptr %9, ptr %9, i64 0)
  br label %25

25:                                               ; preds = %23, %17
  %26 = add i64 %15, 1
  br label %14

27:                                               ; preds = %14
  %28 = add i64 %11, 1
  br label %10

29:                                               ; preds = %10
  call void @endLexInsert(ptr %7)
  %30 = call { ptr, ptr, i64, [1 x i64], [1 x i64] } @spmv(ptr %7, ptr inttoptr (i64 3735928559 to ptr), ptr @__constant_3xf64_0, i64 0, i64 3, i64 1)
  %31 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %30, 1
  %32 = load double, ptr %31, align 8
  %33 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %30, 1
  %34 = getelementptr inbounds nuw double, ptr %33, i32 1
  %35 = load double, ptr %34, align 8
  %36 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %30, 1
  %37 = getelementptr inbounds nuw double, ptr %36, i32 2
  %38 = load double, ptr %37, align 8
  call void @printF64(double %32)
  call void @printNewline()
  call void @printF64(double %35)
  call void @printNewline()
  call void @printF64(double %38)
  call void @printNewline()
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
