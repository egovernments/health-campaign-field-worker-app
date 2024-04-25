// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';

import '../models/entities/product_variant.dart';
import '../models/entities/project_resource.dart';

part 'product_variant.freezed.dart';

typedef ProductVariantEmitter = Emitter<ProductVariantState>;

// Bloc for handling product variant related events and states
class ProductVariantBloc
    extends Bloc<ProductVariantEvent, ProductVariantState> {
  final InventorySingleton inventorySingleton;

  // Constructor for the bloc
  ProductVariantBloc(super.initialState, {required this.inventorySingleton}) {
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
      emit(ProductVariantState.fetched(productVariants: productVariants));
    }
  }
}

// Freezed union class for product variant events
@freezed
class ProductVariantEvent with _$ProductVariantEvent {
  // Event for loading product variants
  const factory ProductVariantEvent.load({
    required ProjectResourceSearchModel query,
  }) = ProductVariantLoadEvent;
}

// Freezed union class for product variant states
@freezed
class ProductVariantState with _$ProductVariantState {
  // State for when the product variants are being loaded
  const factory ProductVariantState.loading() = ProductVariantLoadingState;

  // State for when there are no product variants
  const factory ProductVariantState.empty() = ProductVariantEmptyState;

  // State for when the product variants have been fetched
  const factory ProductVariantState.fetched({
    required List<ProductVariantModel> productVariants,
  }) = ProductVariantFetchedState;
}
