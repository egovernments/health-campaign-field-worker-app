import 'package:digit_components/widgets/atoms/digit_dropdown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../models/entities/facility.dart';
import '../../models/entities/product_variant.dart';

part 'stock_recon_event.dart';

part 'stock_recon_state.dart';

typedef StockReconEmitter = Emitter<StockReconState>;

/// Dummy data -
final prodsDummyData = [
  ProductVariantModel(
    clientReferenceId: 'clientReferenceId',
    productId: '123',
    sku: 'Product 1',
  ),
  ProductVariantModel(
    clientReferenceId: 'clientReferenceId',
    productId: '321',
    sku: 'Product 2',
  ),
];

final facilityDummyData = [
  FacilityModel(clientReferenceId: 'id1', id: 'Facility A'),
  FacilityModel(clientReferenceId: 'id2', id: 'Facility b'),
];

class StockReconBloc extends Bloc<StockReconEvent, StockReconState> {
  late StockReconModel stockReconModel;
  String? _productVariantId = "";
  String? _warehouseId = "";
  List<ProductVariantModel> _products = [];
  List<FacilityModel> _facilities = [];

  List<MenuItemModel> productMenuItems = [];
  List<MenuItemModel> facilityMenuItems = [];

  StockReconBloc() : super(InitialStockReconState()) {
    on<InitializeStockRecon>(_onInitializeStockRecon);
    on<CaptureWarehouseDetails>(_onCaptureWarehouseDetails);
    on<CaptureProductVariant>(_onCaptureProductVariant);
    on<SubmitStockReconUpdate>(_onSubmitStockReconUpdate);

    stockReconModel = StockReconModel();
  }

  _onInitializeStockRecon(
    InitializeStockRecon event,
    StockReconEmitter emit,
  ) async {
    emit(StockReconLoadingState());
    makeStocksZero();

    /// TODO - get prods and facilities from the API
    /// it will be initialized only once
    _facilities = facilityDummyData;

    facilityMenuItems = [];

    for (var facility in _facilities) {
      facilityMenuItems.add(MenuItemModel(facility.id!, facility.id!));
    }
    emit(StockReconLoadedState(
      stockReconModel: stockReconModel,
      productMenuItems: productMenuItems,
      facilityMenuItems: facilityMenuItems,
    ));
  }

  _onCaptureWarehouseDetails(
    CaptureWarehouseDetails event,
    StockReconEmitter emit,
  ) {
    makeStocksZero();
    productMenuItems = [];

    _warehouseId = event.warehouseId ?? "";
    if (_warehouseId != "") {
      /// todo - make API Call to get products in a particular facility
      _products = prodsDummyData;
      for (var prod in _products) {
        productMenuItems.add(MenuItemModel(prod.sku!, prod.productId!));
      }
    }

    emit(StockReconLoadedState(
      stockReconModel: stockReconModel,
      productMenuItems: productMenuItems,
      facilityMenuItems: facilityMenuItems,
      resetProductDropDown: true,
    ));
  }

  _onCaptureProductVariant(
    CaptureProductVariant event,
    StockReconEmitter emit,
  ) {
    if (_productVariantId != event.productVariantId) {
      makeStocksZero();
      emit(StockReconLoadedState(
        stockReconModel: stockReconModel,
        productMenuItems: productMenuItems,
        facilityMenuItems: facilityMenuItems,
      ));
      _productVariantId = event.productVariantId;

      /// TODO - Implement Following API Calls
      ///   1. Fetch stockReceived
      ///   2. Fetch stockIssued
      ///   3. Fetch stockReturned
      ///   4. Fetch stockLost
      ///   5. Fetch stockDamaged
      ///

      /// TODO - update the values from API Calls
      stockReconModel.stockReceived = 321;
      stockReconModel.stockIssued = 111;
      stockReconModel.stockReturned = 222;
      stockReconModel.stockLost = 333;
      stockReconModel.stockDamaged = 44;

      emit(StockReconLoadedState(
        stockReconModel: stockReconModel,
        productMenuItems: productMenuItems,
        facilityMenuItems: facilityMenuItems,
      ));
    }
  }

  _onSubmitStockReconUpdate(
    SubmitStockReconUpdate event,
    StockReconEmitter emit,
  ) async {}

  makeStocksZero() {
    stockReconModel.stockReceived = 0;
    stockReconModel.stockIssued = 0;
    stockReconModel.stockReturned = 0;
    stockReconModel.stockLost = 0;
    stockReconModel.stockDamaged = 0;
  }
}

class StockReconModel {
  int stockReceived;
  int stockIssued;
  int stockReturned;
  int stockLost;
  int stockDamaged;
  final _dateOfReconciliation = DateTime.now();

  String get dateOfRecon =>
      DateFormat('dd MMMM yyyy').format(_dateOfReconciliation);

  int get stockOnHand =>
      stockReceived + stockReturned - stockIssued - stockLost - stockDamaged;

  StockReconModel({
    this.stockReceived = 0,
    this.stockIssued = 0,
    this.stockReturned = 0,
    this.stockLost = 0,
    this.stockDamaged = 0,
  });
}
