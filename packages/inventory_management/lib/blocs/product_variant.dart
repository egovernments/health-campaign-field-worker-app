// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:digit_data_model/data_model.dart';

import '../utils/utils.dart';

part 'product_variant.freezed.dart';

typedef ProductVariantEmitter = Emitter<InventoryProductVariantState>;

// Bloc for handling product variant related events and states
class InventoryProductVariantBloc
    extends Bloc<InventoryProductVariantEvent, InventoryProductVariantState> {
  final InventorySingleton inventorySingleton;

  // Constructor for the bloc
  InventoryProductVariantBloc(super.initialState, {required this.inventorySingleton}) {
    // Registering the event handler for loading product variants
    on(_handleLoad);
  }

  // Event handler for loading product variants
  FutureOr<void> _handleLoad(
    ProductVariantLoadEvent event,
    ProductVariantEmitter emit,
  ) async {
    // Emitting the loading state
    emit(const ProductVariantLoadingState());
    // Fetching the product variants
    List<ProductVariantModel>? productVariants =
        await inventorySingleton.getProductVariants();

    // Checking if the product variants are null
    if (productVariants == null || productVariants.isEmpty) {
      // Emitting the empty state if product variants are null
      emit((const ProductVariantEmptyState()));
    } else {
      // Emitting the fetched state with the fetched product variants
      emit(InventoryProductVariantState.fetched(productVariants: productVariants));
    }
  }
}

// Freezed union class for product variant events
@freezed
class InventoryProductVariantEvent with _$InventoryProductVariantEvent {
  // Event for loading product variants
  const factory InventoryProductVariantEvent.load({
    required ProjectResourceSearchModel query,
  }) = ProductVariantLoadEvent;
}

// Freezed union class for product variant states
@freezed
class InventoryProductVariantState with _$InventoryProductVariantState {
  // State for when the product variants are being loaded
  const factory InventoryProductVariantState.loading() = ProductVariantLoadingState;

  // State for when there are no product variants
  const factory InventoryProductVariantState.empty() = ProductVariantEmptyState;

  // State for when the product variants have been fetched
  const factory InventoryProductVariantState.fetched({
    required List<ProductVariantModel> productVariants,
  }) = ProductVariantFetchedState;
}
