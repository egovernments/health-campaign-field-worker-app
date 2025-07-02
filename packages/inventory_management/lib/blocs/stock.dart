import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/models/entities/stock.dart';

abstract class StockEvent {}

class StockSelectedEvent extends StockEvent {
  final List<ProductVariantModel> selectedProducts;
  final String receivedFrom;
  final String secondaryPartyType;

  StockSelectedEvent(
      {required this.selectedProducts,
      required this.receivedFrom,
      required this.secondaryPartyType});
}

class SubmitStockEvent extends StockEvent {
  final List<StockModel> stockModels;

  SubmitStockEvent({required this.stockModels});
}

abstract class StockState {}

class StockInitial extends StockState {}

class StockSelectedState extends StockState {
  final List<ProductVariantModel> selectedProducts;
  final String receivedFrom;
  final String secondaryPartyType;

  StockSelectedState(
      {required this.selectedProducts,
      required this.receivedFrom,
      required this.secondaryPartyType});
}

class StockSubmittedState extends StockState {
  final List<StockModel> submittedStocks;

  StockSubmittedState(this.submittedStocks);
}

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    on<StockSelectedEvent>((event, emit) {
      emit(StockSelectedState(
        selectedProducts: event.selectedProducts,
        receivedFrom: event.receivedFrom,
        secondaryPartyType: event.secondaryPartyType,
      ));
    });

    on<SubmitStockEvent>((event, emit) {
      emit(StockSubmittedState(event.stockModels));
    });
  }
}

// In your StockBloc
class StockLoadedState extends StockState {
  final Map<String, List<StockModel>> groupedStocks;

  StockLoadedState(this.groupedStocks);

  @override
  List<Object?> get props => [groupedStocks];
}

// In your repository or where you fetch stocks
Map<String, List<StockModel>> groupStocksByMRN(List<StockModel> stocks) {
  final grouped = <String, List<StockModel>>{};

  for (final stock in stocks) {
    final mrn = stock.additionalFields?.fields
            .firstWhere(
              (field) => field.key == 'materialNoteNumber',
              orElse: () => AdditionalField('materialNoteNumber', ''),
            )
            .value
            ?.toString() ??
        'unclassified';

    grouped.putIfAbsent(mrn, () => []).add(stock);
  }

  return grouped;
}
