import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:mocktail/mocktail.dart';

class MockInventorySingleton extends Mock implements InventorySingleton {}

void main() {
  group('ProductVariantBloc', () {
    late MockInventorySingleton mockInventorySingleton;
    late ProductVariantBloc productVariantBloc;

    setUp(() {
      mockInventorySingleton = MockInventorySingleton();
      productVariantBloc = ProductVariantBloc(
          const ProductVariantState.loading(),
          inventorySingleton: mockInventorySingleton);
    });

    blocTest<ProductVariantBloc, ProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantFetchedState] when load event is added',
      build: () {
        when(() => mockInventorySingleton.getProductVariants())
            .thenAnswer((_) async => [ProductVariantModel(id: '1')]);
        return productVariantBloc;
      },
      act: (bloc) => bloc
          .add(ProductVariantEvent.load(query: ProjectResourceSearchModel())),
      expect: () => <ProductVariantState>[
        const ProductVariantLoadingState(),
        ProductVariantFetchedState(
            productVariants: [ProductVariantModel(id: '1')]),
      ],
    );

    blocTest<ProductVariantBloc, ProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantEmptyState] when load event is added and no product variants are returned',
      build: () {
        when(() => mockInventorySingleton.getProductVariants())
            .thenAnswer((_) async => []);
        return productVariantBloc;
      },
      act: (bloc) => bloc
          .add(ProductVariantEvent.load(query: ProjectResourceSearchModel())),
      expect: () => <ProductVariantState>[
        const ProductVariantLoadingState(),
        const ProductVariantEmptyState(),
      ],
    );
  });
}
