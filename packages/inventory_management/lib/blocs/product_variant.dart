// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/entities/product_variant.dart';
import '../models/entities/project_resource.dart';

part 'product_variant.freezed.dart';

typedef ProductVariantEmitter = Emitter<ProductVariantState>;

class ProductVariantBloc
    extends Bloc<ProductVariantEvent, ProductVariantState> {
  ProductVariantBloc(super.initialState) {
    on(_handleLoad);
  }

  FutureOr<void> _handleLoad(
    ProductVariantLoadEvent event,
    ProductVariantEmitter emit,
  ) async {
    emit(const ProductVariantLoadingState());
    var variants;
    // final projectResources = await projectResourceDataRepository.search(
    //   event.query,
    // );
    //
    // final variants = await productVariantDataRepository.search(
    //   ProductVariantSearchModel(
    //     id: projectResources.map((e) {
    //       return e.resource.productVariantId;
    //     }).toList(),
    //   ),
    // );

    if (variants == null || variants.isEmpty) {
      emit(const ProductVariantEmptyState());
    } else {
      emit(ProductVariantFetchedState(productVariants: variants));
    }
  }
}

@freezed
class ProductVariantEvent with _$ProductVariantEvent {
  const factory ProductVariantEvent.load({
    required ProjectResourceSearchModel query,
  }) = ProductVariantLoadEvent;
}

@freezed
class ProductVariantState with _$ProductVariantState {
  const factory ProductVariantState.loading() = ProductVariantLoadingState;

  const factory ProductVariantState.empty() = ProductVariantEmptyState;

  const factory ProductVariantState.fetched({
    required List<ProductVariantModel> productVariants,
  }) = ProductVariantFetchedState;
}
