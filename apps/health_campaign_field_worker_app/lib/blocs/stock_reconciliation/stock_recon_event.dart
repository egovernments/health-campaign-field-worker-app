part of 'stock_recon.dart';

abstract class StockReconEvent{
  StockReconEvent();
}

class InitializeStockRecon extends StockReconEvent{
  InitializeStockRecon();
}


class CaptureProductVariant extends StockReconEvent{
  String? productVariantId;
  CaptureProductVariant({required this.productVariantId});
}

class CaptureWarehouseDetails extends StockReconEvent{
  String? warehouseId;
  CaptureWarehouseDetails({required this.warehouseId});

}

class SubmitStockReconUpdate extends StockReconEvent{
  String manualStockCount;
  String comments;
  SubmitStockReconUpdate({
    required this.manualStockCount,
    required this.comments,
});
}