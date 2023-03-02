import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_recon_event.dart';

part 'stock_recon_state.dart';

class StockReconBloc extends Bloc<StockReconEvent, StockReconState> {
  StockReconBloc() : super(InitialStockReconState()) {
    on<InitializeStockRecon>(_onInitializeStockRecon);
    on<SubmitStockReconUpdate>(_onSubmitStockReconUpdate);
  }

  _onInitializeStockRecon(
    InitializeStockRecon event,
    Emitter<StockReconState> state,
  ) async {
    emit(StockReconLoadingState());

    /// todo - make db calls to fetch the data

    final stockReconModel = StockReconModel(
        stockReceived: 234,
        stockIssued: 200,
        stockReturned: 16,
        stockLost: 50,
        stockDamaged: 50,
        stockOnHand: 50,
    );
    emit(StockReconLoadedState(
      stockReconModel: stockReconModel,
    ));
  }

  _onSubmitStockReconUpdate(
    SubmitStockReconUpdate event,
    Emitter<StockReconState> state,
  ) async {}
}

class StockReconModel {
  int stockReceived;
  int stockIssued;
  int stockReturned;
  int stockLost;
  int stockDamaged;
  int stockOnHand;
  final dateOfReconciliation = DateTime.now();

  StockReconModel({
    required this.stockReceived,
    required this.stockIssued,
    required this.stockReturned,
    required this.stockLost,
    required this.stockDamaged,
    required this.stockOnHand,
  });
}
