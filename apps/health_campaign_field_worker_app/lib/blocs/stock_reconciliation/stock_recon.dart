import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'stock_recon_event.dart';

part 'stock_recon_state.dart';

typedef StockReconEmitter = Emitter<StockReconState>;

class StockReconBloc extends Bloc<StockReconEvent, StockReconState> {
  late StockReconModel stockReconModel;
  String? _productVariantId = "";
  String? _warehouseId = "";

  StockReconBloc() : super(InitialStockReconState()) {
    on<InitializeStockRecon>(_onInitializeStockRecon);
    on<CaptureWarehouseDetails>(_onCaptureWarehouseDetails);
    on<CaptureProductVariant>(_onCaptureProductVariant);
    on<SubmitStockReconUpdate>(_onSubmitStockReconUpdate);

    stockReconModel = StockReconModel();
  }

  _onCaptureWarehouseDetails(
    CaptureWarehouseDetails event,
    StockReconEmitter emit,
  ) {
    _warehouseId = event.warehouseId ?? "";
    if (_warehouseId == "" || _productVariantId == "") {
      makeStocksZero();
      emit(StockReconLoadedState(
        stockReconModel: stockReconModel,
      ));
    } else {
      fetchData();
    }
  }

  _onCaptureProductVariant(
    CaptureProductVariant event,
    StockReconEmitter emit,
  ) {
    _productVariantId = event.productVariantId ?? "";
    if (_productVariantId == "" || _warehouseId == "") {
      makeStocksZero();
      emit(StockReconLoadedState(
        stockReconModel: stockReconModel,
      ));
    } else {
      fetchData();
    }
  }

  fetchData() {
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
    ));
  }

  _onInitializeStockRecon(
    InitializeStockRecon event,
    StockReconEmitter emit,
  ) async {
    emit(StockReconLoadingState());
    makeStocksZero();
    emit(StockReconLoadedState(
      stockReconModel: stockReconModel,
    ));
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
