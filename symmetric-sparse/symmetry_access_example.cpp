// Example C++ code showing how to access the symmetry field
// This is a reference implementation demonstrating the API usage

#include "mlir/Dialect/SparseTensor/IR/SparseTensor.h"
#include "mlir/IR/BuiltinTypes.h"

using namespace mlir;
using namespace mlir::sparse_tensor;

// Example 1: Check if a tensor has symmetry
bool hasSymmetry(RankedTensorType tensorType) {
    if (auto encoding = tensorType.getEncoding()
            .dyn_cast_or_null<SparseTensorEncodingAttr>()) {
        return encoding.getSymmetry() != nullptr;
    }
    return false;
}

// Example 2: Get symmetry groups
void printSymmetryGroups(SparseTensorEncodingAttr encoding) {
    ArrayAttr symmetry = encoding.getSymmetry();
    
    if (!symmetry) {
        llvm::outs() << "No symmetry defined\n";
        return;
    }
    
    llvm::outs() << "Symmetry groups:\n";
    for (auto group : symmetry.getValue()) {
        auto dimIndices = group.cast<ArrayAttr>();
        llvm::outs() << "  Group: [";
        for (auto dim : dimIndices.getValue()) {
            llvm::outs() << dim.cast<IntegerAttr>().getInt() << " ";
        }
        llvm::outs() << "]\n";
    }
}

// Example 3: Verify symmetry constraints
LogicalResult verifySymmetryConstraints(SparseTensorEncodingAttr encoding,
                                       ArrayRef<int64_t> shape) {
    ArrayAttr symmetry = encoding.getSymmetry();
    
    if (!symmetry)
        return success(); // No symmetry to verify
    
    for (auto group : symmetry.getValue()) {
        auto dimIndices = group.cast<ArrayAttr>();
        
        // Check that all dimensions in a symmetry group have the same size
        int64_t expectedSize = -1;
        for (auto dimAttr : dimIndices.getValue()) {
            int64_t dimIdx = dimAttr.cast<IntegerAttr>().getInt();
            
            if (dimIdx < 0 || dimIdx >= shape.size())
                return failure(); // Invalid dimension index
            
            if (expectedSize == -1) {
                expectedSize = shape[dimIdx];
            } else if (shape[dimIdx] != expectedSize) {
                return failure(); // Dimensions must have same size
            }
        }
    }
    
    return success();
}

// Example 4: Create an encoding with symmetry
SparseTensorEncodingAttr createSymmetricEncoding(
    MLIRContext *context,
    AffineMap dimToLvl,
    ArrayAttr symmetryGroups) {
    
    // Create a basic encoding with symmetry
    return SparseTensorEncodingAttr::get(
        context,
        dimToLvl,
        /*lvlToDim=*/AffineMap(),
        /*posWidth=*/0,
        /*crdWidth=*/0,
        /*explicitVal=*/Attribute(),
        /*implicitVal=*/Attribute(),
        /*dimSlices=*/ArrayAttr(),
        /*symmetry=*/symmetryGroups
    );
}

// Example 5: Modify encoding while preserving symmetry
SparseTensorEncodingAttr changeBitWidths(SparseTensorEncodingAttr encoding,
                                         unsigned posWidth,
                                         unsigned crdWidth) {
    // Use withBitWidths which automatically preserves symmetry
    return encoding.withBitWidths(posWidth, crdWidth);
    
    // Alternatively, create new encoding explicitly:
    // return SparseTensorEncodingAttr::get(
    //     encoding.getContext(),
    //     encoding.getDimToLvl(),
    //     encoding.getLvlToDim(),
    //     posWidth,
    //     crdWidth,
    //     encoding.getExplicitVal(),
    //     encoding.getImplicitVal(),
    //     encoding.getDimSlices(),
    //     encoding.getSymmetry()  // <-- Preserve symmetry
    // );
}

// Example 6: Add symmetry to an existing encoding
SparseTensorEncodingAttr addSymmetry(SparseTensorEncodingAttr encoding,
                                     ArrayAttr symmetryGroups) {
    return encoding.withSymmetry(symmetryGroups);
}

// Example 7: Remove symmetry from an encoding
SparseTensorEncodingAttr removeSymmetry(SparseTensorEncodingAttr encoding) {
    return encoding.withoutSymmetry();
}

// Example 8: Compare encodings by symmetry
bool hasSameSymmetry(SparseTensorEncodingAttr enc1,
                     SparseTensorEncodingAttr enc2) {
    ArrayAttr sym1 = enc1.getSymmetry();
    ArrayAttr sym2 = enc2.getSymmetry();
    
    // Both null -> same (no symmetry)
    if (!sym1 && !sym2)
        return true;
    
    // One null, one not -> different
    if (!sym1 || !sym2)
        return false;
    
    // Compare array contents
    return sym1 == sym2;
}

// Example 9: Pattern matching with symmetry
struct OptimizeSymmetricPattern : public OpRewritePattern<SomeOp> {
    using OpRewritePattern::OpRewritePattern;
    
    LogicalResult matchAndRewrite(SomeOp op,
                                 PatternRewriter &rewriter) const override {
        auto tensorType = op.getType().cast<RankedTensorType>();
        auto encoding = tensorType.getEncoding()
            .dyn_cast_or_null<SparseTensorEncodingAttr>();
        
        if (!encoding)
            return failure();
        
        // Check for symmetry
        ArrayAttr symmetry = encoding.getSymmetry();
        if (!symmetry)
            return failure(); // Only optimize symmetric tensors
        
        // Apply optimization specific to symmetric sparse tensors
        // ...
        
        return success();
    }
};

// Example 10: Creating symmetry ArrayAttr
ArrayAttr createSymmetryAttr(MLIRContext *context,
                             ArrayRef<ArrayRef<int64_t>> symmetryGroups) {
    SmallVector<Attribute> groups;
    
    for (auto group : symmetryGroups) {
        SmallVector<Attribute> dims;
        for (int64_t dim : group) {
            dims.push_back(IntegerAttr::get(
                IntegerType::get(context, 64), dim));
        }
        groups.push_back(ArrayAttr::get(context, dims));
    }
    
    return ArrayAttr::get(context, groups);
}

// Usage example:
void exampleUsage(MLIRContext *context) {
    // Create symmetry: [[0, 1]]
    auto symmetry = createSymmetryAttr(context, {{0, 1}});
    
    // Create affine map for CSR
    auto dimToLvl = AffineMap::getMultiDimIdentityMap(2, context);
    
    // Create symmetric encoding
    auto encoding = createSymmetricEncoding(context, dimToLvl, symmetry);
    
    // Access the symmetry
    llvm::outs() << "Has symmetry: " 
                 << (encoding.getSymmetry() ? "yes" : "no") << "\n";
    
    // Print symmetry groups
    printSymmetryGroups(encoding);
    
    // Add/remove symmetry
    auto withoutSym = encoding.withoutSymmetry();
    auto withSym = withoutSym.withSymmetry(symmetry);
    
    // Compare
    llvm::outs() << "Same symmetry after round-trip: "
                 << (hasSameSymmetry(encoding, withSym) ? "yes" : "no") << "\n";
}
