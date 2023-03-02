part of 'stock_recon.dart';

abstract class StockReconState {
  StockReconState();
}

class InitialStockReconState extends StockReconState {}

class StockReconLoadingState extends StockReconState {}

class StockReconLoadedState extends StockReconState {
  final StockReconModel stockReconModel;


  StockReconLoadedState({
    required this.stockReconModel,
  });
}
