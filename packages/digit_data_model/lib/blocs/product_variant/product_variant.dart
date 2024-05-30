// Importing necessary packages and files.
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:digit_data_model/data_model.dart';
import '../../utils/typedefs.dart';

// Part directive for the generated code.
part 'product_variant.freezed.dart';

// Type alias for a function that emits a `ProductVariantState`.
typedef ProductVariantEmitter = Emitter<ProductVariantState>;

/// `ProductVariantBloc` is a class that extends `Bloc` and manages the state of product variants.
/// It uses `ProductVariantDataRepository` and `ProjectResourceDataRepository` to interact with the data layer.
class ProductVariantBloc
    extends Bloc<ProductVariantEvent, ProductVariantState> {
  // The data repositories used by this bloc.
  final ProjectResourceDataRepository projectResourceDataRepository;
  final ProductVariantDataRepository productVariantDataRepository;

  /// The constructor for `ProductVariantBloc`.
  /// It initializes the bloc with an empty state and sets up the event handler for loading product variants.
  ProductVariantBloc(
    super.initialState,
    this.productVariantDataRepository,
    this.projectResourceDataRepository,
  ) {
    on(_handleLoad);
  }

  /// The `_handleLoad` method handles the `ProductVariantLoadEvent` event.
  /// It loads the product variants for a project and emits a new state.
  FutureOr<void> _handleLoad(
    ProductVariantLoadEvent event,
    ProductVariantEmitter emit,
  ) async {
    emit(const ProductVariantLoadingState());
    final projectResources = await projectResourceDataRepository.search(
      event.query,
    );

    final variants = await productVariantDataRepository.search(
      ProductVariantSearchModel(
        id: projectResources.map((e) {
          return e.resource.productVariantId;
        }).toList(),
      ),
    );

    if (variants.isEmpty) {
      emit(const ProductVariantEmptyState());
    } else {
      emit(ProductVariantFetchedState(productVariants: variants));
    }
  }
}

/// `ProductVariantEvent` is a freezed union of all possible events that can occur in the `ProductVariantBloc`.
@freezed
class ProductVariantEvent with _$ProductVariantEvent {
  /// The `ProductVariantLoadEvent` event is triggered when product variants need to be loaded for a project.
  const factory ProductVariantEvent.load({
    required ProjectResourceSearchModel query,
  }) = ProductVariantLoadEvent;
}

/// `ProductVariantState` is a freezed union of all possible states that can occur in the `ProductVariantBloc`.
@freezed
class ProductVariantState with _$ProductVariantState {
  /// The `ProductVariantLoadingState` state represents the state where product variants are being loaded.
  const factory ProductVariantState.loading() = ProductVariantLoadingState;

  /// The `ProductVariantEmptyState` state represents the state where no product variants are loaded.
  const factory ProductVariantState.empty() = ProductVariantEmptyState;

  /// The `ProductVariantFetchedState` state represents the state where product variants have been loaded.
  const factory ProductVariantState.fetched({
    required List<ProductVariantModel> productVariants,
  }) = ProductVariantFetchedState;
}
