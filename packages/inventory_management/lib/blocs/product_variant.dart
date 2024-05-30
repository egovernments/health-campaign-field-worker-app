// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:digit_data_model/data_model.dart';

import '../utils/typedefs.dart';

part 'product_variant.freezed.dart';

typedef ProductVariantEmitter = Emitter<InventoryProductVariantState>;

// Bloc for handling product variant related events and states
class InventoryProductVariantBloc
    extends Bloc<InventoryProductVariantEvent, InventoryProductVariantState> {
  final ProjectResourceDataRepository projectResourceDataRepository;
  final ProductVariantDataRepository productVariantDataRepository;

  InventoryProductVariantBloc(
      {required this.projectResourceDataRepository,
      required this.productVariantDataRepository})
      : super(const InventoryProductVariantState.loading()) {
    on<ProductVariantLoadEvent>(_handleLoad);
  }

  // Event handler for loading product variants
  FutureOr<void> _handleLoad(
    ProductVariantLoadEvent event,
    ProductVariantEmitter emit,
  ) async {
    // Emitting the loading state
    emit(const ProductVariantLoadingState());
    // Fetching the product variants
    final projectResources = await projectResourceDataRepository.search(
      event.query,
    );

    final productVariants = await productVariantDataRepository.search(
      ProductVariantSearchModel(
        id: projectResources.map((e) {
          return e.resource.productVariantId;
        }).toList(),
      ),
    );

    // Checking if the product variants are null
    if (productVariants.isEmpty) {
      // Emitting the empty state if product variants are null
      emit((const ProductVariantEmptyState()));
    } else {
      // Emitting the fetched state with the fetched product variants
      emit(InventoryProductVariantState.fetched(
          productVariants: productVariants));
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
  const factory InventoryProductVariantState.loading() =
      ProductVariantLoadingState;

  // State for when there are no product variants
  const factory InventoryProductVariantState.empty() = ProductVariantEmptyState;

  // State for when the product variants have been fetched
  const factory InventoryProductVariantState.fetched({
    required List<ProductVariantModel> productVariants,
  }) = ProductVariantFetchedState;
}
