import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:inventory_management/blocs/product_variant.dart';

import '../constants/test_constants.dart';

class MockProjectResourceDataRepository extends Mock
    implements ProjectResourceDataRepository {}

class MockProductVariantDataRepository extends Mock
    implements ProductVariantDataRepository {}

void main() {
  group('InventoryProductVariantBloc', () {
    late MockProjectResourceDataRepository mockProjectResourceDataRepository;
    late MockProductVariantDataRepository mockProductVariantDataRepository;
    late InventoryProductVariantBloc inventoryProductVariantBloc;

    setUp(() {
      mockProjectResourceDataRepository = MockProjectResourceDataRepository();
      mockProductVariantDataRepository = MockProductVariantDataRepository();
      inventoryProductVariantBloc = InventoryProductVariantBloc(
        projectResourceDataRepository: mockProjectResourceDataRepository,
        productVariantDataRepository: mockProductVariantDataRepository,
      );
    });

    setUpAll(() {
      registerFallbackValue(ProjectResourceSearchModel());
      registerFallbackValue(ProductVariantSearchModel());
    });

    blocTest<InventoryProductVariantBloc, InventoryProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantFetchedState] when ProductVariantLoadEvent is added and product variants are found',
      build: () {
        when(() => mockProjectResourceDataRepository.search(any())).thenAnswer(
          (_) async => [
            InventoryReportConstants.projectResourceModel,
          ],
        );
        when(() => mockProductVariantDataRepository.search(any())).thenAnswer(
          (_) async => [
            InventoryReportConstants.productVariantModel,
          ],
        );
        return inventoryProductVariantBloc;
      },
      act: (bloc) => bloc.add(
        InventoryProductVariantEvent.load(query: ProjectResourceSearchModel()),
      ),
      expect: () => [
        const InventoryProductVariantState.loading(),
        InventoryProductVariantState.fetched(productVariants: [
          InventoryReportConstants.productVariantModel,
        ]),
      ],
      verify: (_) {
        verify(() => mockProjectResourceDataRepository.search(any())).called(1);
        verify(() => mockProductVariantDataRepository.search(any())).called(1);
      },
    );

    blocTest<InventoryProductVariantBloc, InventoryProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantEmptyState] when ProductVariantLoadEvent is added and no product variants are found',
      build: () {
        when(() => mockProjectResourceDataRepository.search(any())).thenAnswer(
          (_) async => [
            InventoryReportConstants.projectResourceModel,
          ],
        );
        when(() => mockProductVariantDataRepository.search(any())).thenAnswer(
          (_) async => [],
        );
        return inventoryProductVariantBloc;
      },
      act: (bloc) => bloc.add(InventoryProductVariantEvent.load(
          query: ProjectResourceSearchModel())),
      expect: () => [
        const InventoryProductVariantState.loading(),
        const InventoryProductVariantState.empty(),
      ],
    );
  });
}
