part of 'stock_recon.dart';

abstract class StockReconState {
  StockReconState();
}

class InitialStockReconState extends StockReconState {}

class StockReconLoadingState extends StockReconState {}

class StockReconLoadedState extends StockReconState {
  final StockReconModel stockReconModel;
  final List<MenuItemModel> productMenuItems;
  final List<MenuItemModel> facilityMenuItems;
  final bool resetProductDropDown;

  StockReconLoadedState({
    required this.stockReconModel,
    required this.productMenuItems,
    required this.facilityMenuItems,
    this.resetProductDropDown = false,
  });
}
