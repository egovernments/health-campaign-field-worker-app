// Importing necessary packages and modules
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for InventorySingleton
class MockInventorySingleton extends Mock implements InventorySingleton {}

class MockProductVariantModel extends Mock implements ProductVariantModel {
  @override
  String get id => 'product1';
}

void main() {
  // Grouping tests related to ProductVariantBloc
  group('ProductVariantBloc', () {
    // Declaring variables for mock and bloc
    late MockInventorySingleton mockInventorySingleton;
    late ProductVariantBloc productVariantBloc;
    late MockProductVariantModel mockProductVariantModel;

    // Setting up the mock and the bloc for each test
    setUp(() {
      mockInventorySingleton = MockInventorySingleton();
      productVariantBloc = ProductVariantBloc(
          const ProductVariantState.loading(),
          inventorySingleton: mockInventorySingleton);
      mockProductVariantModel = MockProductVariantModel();
    });

    // Test for load event when product variants are returned
    blocTest<ProductVariantBloc, ProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantFetchedState] when load event is added',
      build: () {
        // Mocking the getProductVariants method to return a list with one product variant
        when(() => mockInventorySingleton.getProductVariants())
            .thenAnswer((_) async => [mockProductVariantModel]);
        return productVariantBloc;
      },
      act: (bloc) => bloc
          .add(ProductVariantEvent.load(query: ProjectResourceSearchModel())),
      // Expecting the bloc to emit a loading state and then a fetched state with the returned product variants
      expect: () => <ProductVariantState>[
        const ProductVariantLoadingState(),
        ProductVariantFetchedState(productVariants: [mockProductVariantModel]),
      ],
    );

    // Test for load event when no product variants are returned
    blocTest<ProductVariantBloc, ProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantEmptyState] when load event is added and no product variants are returned',
      build: () {
        // Mocking the getProductVariants method to return an empty list
        when(() => mockInventorySingleton.getProductVariants())
            .thenAnswer((_) async => []);
        return productVariantBloc;
      },
      act: (bloc) => bloc
          .add(ProductVariantEvent.load(query: ProjectResourceSearchModel())),
      // Expecting the bloc to emit a loading state and then an empty state
      expect: () => <ProductVariantState>[
        const ProductVariantLoadingState(),
        const ProductVariantEmptyState(),
      ],
    );
  });
}
