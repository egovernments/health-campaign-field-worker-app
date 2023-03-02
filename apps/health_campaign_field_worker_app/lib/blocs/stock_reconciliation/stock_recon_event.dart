part of 'stock_recon.dart';

abstract class StockReconEvent{
  StockReconEvent();
}

class InitializeStockRecon extends StockReconEvent{
  InitializeStockRecon();
}

// class UpdateAnswer extends StockReconEvent {
//   int index;
//   bool option;
//   String reason;
//
//   UpdateAnswer({required this.index, required this.option, this.reason = ''});
// }


class SubmitStockReconUpdate extends StockReconEvent{
  SubmitStockReconUpdate();
}