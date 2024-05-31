import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/blocs/product_variant/product_variant.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_product_variant.dart';
import 'package:digit_data_model/models/entities/project_resource.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductVariantDataRepository extends Mock
    implements ProductVariantDataRepository {}

class MockProjectResourceDataRepository extends Mock
    implements ProjectResourceDataRepository {}

class FakeProductVariantSearchModel extends Fake
    implements ProductVariantSearchModel {}

class FakeProjectResourceSearchModel extends Fake
    implements ProjectResourceSearchModel {}

void main() {
  // Registering fallback values for the search models.
  setUpAll(() {
    registerFallbackValue(FakeProductVariantSearchModel());
    registerFallbackValue(FakeProjectResourceSearchModel());
  });

  late MockProductVariantDataRepository mockProductVariantDataRepository;
  late MockProjectResourceDataRepository mockProjectResourceDataRepository;
  late ProductVariantBloc productVariantBloc;

  // Initializing mock objects before each test.
  setUp(() {
    mockProductVariantDataRepository = MockProductVariantDataRepository();
    mockProjectResourceDataRepository = MockProjectResourceDataRepository();
    productVariantBloc = ProductVariantBloc(
      const ProductVariantEmptyState(),
      mockProductVariantDataRepository,
      mockProjectResourceDataRepository,
    );
  });

  group('ProductVariantBloc', () {
    // Testing the initial state.
    test('initial state is ProductVariantEmptyState', () {
      expect(
          productVariantBloc.state, equals(const ProductVariantEmptyState()));
    });

    String testProjectId = 'test_project_id';

    // Mock data for testing.
    final testProductVariants = [
      ProductVariantModel(id: '1'),
    ];
    final testProjectResources = [
      ProjectResourceModel(
          id: '1', resource: ProjectProductVariantModel(productVariantId: '1')),
    ];

    // Test case for successfully loading product variants.
    blocTest<ProductVariantBloc, ProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantFetchedState] when ProductVariantLoadEvent is added',
      build: () {
        when(() => mockProjectResourceDataRepository.search(any()))
            .thenAnswer((invocation) async {
          final searchModel =
              invocation.positionalArguments[0] as ProjectResourceSearchModel;
          if (searchModel.projectId!.contains(testProjectId)) {
            return testProjectResources;
          } else {
            return [];
          }
        });
        when(() => mockProductVariantDataRepository.search(any()))
            .thenAnswer((invocation) async {
          final searchModel =
              invocation.positionalArguments[0] as ProductVariantSearchModel;
          if (searchModel.id != null &&
              searchModel.id!.contains(testProductVariants.first.id)) {
            return testProductVariants;
          } else {
            return [];
          }
        });
        return productVariantBloc;
      },
      act: (bloc) => bloc.add(ProductVariantEvent.load(
          query: ProjectResourceSearchModel(projectId: [testProjectId]))),
      expect: () => [
        const ProductVariantLoadingState(),
        ProductVariantFetchedState(productVariants: testProductVariants),
      ],
      verify: (_) {
        verify(() => mockProjectResourceDataRepository.search(any())).called(1);
        verify(() => mockProductVariantDataRepository.search(any())).called(1);
      },
    );

    // Test case for empty product variants result.
    blocTest<ProductVariantBloc, ProductVariantState>(
      'emits [ProductVariantLoadingState, ProductVariantEmptyState] when ProductVariantLoadEvent results in empty product variants',
      build: () {
        when(() => mockProjectResourceDataRepository.search(any()))
            .thenAnswer((_) async => []);
        when(() => mockProductVariantDataRepository.search(any()))
            .thenAnswer((_) async => []);
        return productVariantBloc;
      },
      act: (bloc) => bloc.add(ProductVariantEvent.load(
          query: ProjectResourceSearchModel(projectId: [testProjectId]))),
      expect: () => [
        const ProductVariantLoadingState(),
        const ProductVariantEmptyState(),
      ],
      verify: (_) {
        verify(() => mockProjectResourceDataRepository.search(any())).called(1);
        verify(() => mockProductVariantDataRepository.search(any())).called(1);
      },
    );
  });
}
