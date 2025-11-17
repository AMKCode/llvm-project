// RUN: mlir-opt %s | mlir-opt | FileCheck %s

// Test basic symmetry attribute parsing and printing

// CHECK-DAG: #[[SYMMETRIC_CSR:.*]] = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), symmetry = {{\[\[}}0, 1]] }>
// CHECK-DAG: #[[SYMMETRIC_COO:.*]] = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), symmetry = {{\[\[}}0, 1]] }>
// CHECK-DAG: #[[MULTI_SYMMETRY:.*]] = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : dense, d2 : compressed, d3 : compressed), symmetry = {{\[\[}}0, 1], [2, 3]] }>
// CHECK-DAG: #[[NO_SYMMETRY:.*]] = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
// CHECK-DAG: #[[SYMMETRIC_DCSR:.*]] = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), symmetry = {{\[\[}}0, 1]] }>
// CHECK-DAG: #[[SYMMETRIC_WITH_WIDTH:.*]] = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32, symmetry = {{\[\[}}0, 1]] }>

// CHECK-LABEL: @test_symmetric_csr
// CHECK-SAME: tensor<100x100xf64, #[[SYMMETRIC_CSR]]>
func.func @test_symmetric_csr(%arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  symmetry = [[0, 1]]
}>>) -> tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  symmetry = [[0, 1]]
}>> {
  return %arg0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    symmetry = [[0, 1]]
  }>>
}

// CHECK-LABEL: @test_symmetric_coo
// CHECK-SAME: tensor<100x100xf64, #[[SYMMETRIC_COO]]>
func.func @test_symmetric_coo(%arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton),
  symmetry = [[0, 1]]
}>>) -> tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton),
  symmetry = [[0, 1]]
}>> {
  return %arg0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton),
    symmetry = [[0, 1]]
  }>>
}

// CHECK-LABEL: @test_multiple_symmetry_groups
// CHECK-SAME: tensor<10x10x10x10xf64, #[[MULTI_SYMMETRY]]>
func.func @test_multiple_symmetry_groups(%arg0: tensor<10x10x10x10xf64, #sparse_tensor.encoding<{
  map = (d0, d1, d2, d3) -> (d0 : dense, d1 : dense, d2 : compressed, d3 : compressed),
  symmetry = [[0, 1], [2, 3]]
}>>) -> tensor<10x10x10x10xf64, #sparse_tensor.encoding<{
  map = (d0, d1, d2, d3) -> (d0 : dense, d1 : dense, d2 : compressed, d3 : compressed),
  symmetry = [[0, 1], [2, 3]]
}>> {
  return %arg0 : tensor<10x10x10x10xf64, #sparse_tensor.encoding<{
    map = (d0, d1, d2, d3) -> (d0 : dense, d1 : dense, d2 : compressed, d3 : compressed),
    symmetry = [[0, 1], [2, 3]]
  }>>
}

// CHECK-LABEL: @test_no_symmetry
// CHECK-SAME: tensor<100x100xf64, #[[NO_SYMMETRY]]>
func.func @test_no_symmetry(%arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed)
}>>) -> tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed)
}>> {
  return %arg0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed)
  }>>
}

// CHECK-LABEL: @test_symmetric_dcsr
// CHECK-SAME: tensor<100x100xf64, #[[SYMMETRIC_DCSR]]>
func.func @test_symmetric_dcsr(%arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : compressed),
  symmetry = [[0, 1]]
}>>) -> tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : compressed),
  symmetry = [[0, 1]]
}>> {
  return %arg0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : compressed, d1 : compressed),
    symmetry = [[0, 1]]
  }>>
}

// CHECK-LABEL: @test_symmetric_with_other_attributes
// CHECK-SAME: tensor<100x100xf64, #[[SYMMETRIC_WITH_WIDTH]]>
func.func @test_symmetric_with_other_attributes(%arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>>) -> tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  posWidth = 32,
  crdWidth = 32,
  symmetry = [[0, 1]]
}>> {
  return %arg0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    posWidth = 32,
    crdWidth = 32,
    symmetry = [[0, 1]]
  }>>
}

// Test accessing symmetry through reinterpret_map (demonstrates field is accessible)
// CHECK-LABEL: @test_access_symmetry_via_reinterpret
// CHECK: sparse_tensor.reinterpret_map
func.func @test_access_symmetry_via_reinterpret(%arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  symmetry = [[0, 1]]
}>>) -> tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d1 : dense, d0 : compressed),
  symmetry = [[0, 1]]
}>> {
  %0 = sparse_tensor.reinterpret_map %arg0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    symmetry = [[0, 1]]
  }>>
  to tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d1 : dense, d0 : compressed),
    symmetry = [[0, 1]]
  }>>
  return %0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d1 : dense, d0 : compressed),
    symmetry = [[0, 1]]
  }>>
}

// Test that encoding with symmetry can be converted
// CHECK-LABEL: @test_convert_with_symmetry
// CHECK: sparse_tensor.convert
func.func @test_convert_with_symmetry(%arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  symmetry = [[0, 1]]
}>>) -> tensor<100x100xf64, #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : compressed),
  symmetry = [[0, 1]]
}>> {
  %0 = sparse_tensor.convert %arg0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    symmetry = [[0, 1]]
  }>>
  to tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : compressed, d1 : compressed),
    symmetry = [[0, 1]]
  }>>
  return %0 : tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : compressed, d1 : compressed),
    symmetry = [[0, 1]]
  }>>
}

// Test that different symmetry values create different encodings
// CHECK-LABEL: @test_different_symmetries
func.func @test_different_symmetries(
  %arg0: tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    symmetry = [[0, 1]]
  }>>,
  %arg1: tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    symmetry = [[1, 0]]
  }>>
) -> (
  tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    symmetry = [[0, 1]]
  }>>,
  tensor<100x100xf64, #sparse_tensor.encoding<{
    map = (d0, d1) -> (d0 : dense, d1 : compressed),
    symmetry = [[1, 0]]
  }>>
) {
  return %arg0, %arg1 : 
    tensor<100x100xf64, #sparse_tensor.encoding<{
      map = (d0, d1) -> (d0 : dense, d1 : compressed),
      symmetry = [[0, 1]]
    }>>,
    tensor<100x100xf64, #sparse_tensor.encoding<{
      map = (d0, d1) -> (d0 : dense, d1 : compressed),
      symmetry = [[1, 0]]
    }>>
}
