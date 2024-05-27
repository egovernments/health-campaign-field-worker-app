import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/blocs/boundary/boundary.dart';
import 'package:digit_data_model/models/entities/boundary.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBoundaryDataRepository extends Mock
    implements BoundaryDataRepository {}

class FakeBoundarySearchModel extends Fake implements BoundarySearchModel {}

void main() {
  // Registering fallback value for the search model.
  setUpAll(() {
    registerFallbackValue(FakeBoundarySearchModel());
  });

  late MockBoundaryDataRepository mockBoundaryDataRepository;
  late BoundaryBloc boundaryBloc;

  // Initializing mock objects before each test.
  setUp(() {
    mockBoundaryDataRepository = MockBoundaryDataRepository();
    boundaryBloc = BoundaryBloc(
      const BoundaryState(),
      boundaryRepository: mockBoundaryDataRepository,
    );
  });

  group('BoundaryBloc', () {
    // Testing the initial state.
    test('initial state is BoundaryState', () {
      expect(boundaryBloc.state, equals(const BoundaryState()));
    });

    // Mock data for testing.
    final testBoundaries = [
      BoundaryModel(name: 'Bangalore', code: 'BAN001'),
    ];

    // Test case for successfully loading boundaries.
    blocTest<BoundaryBloc, BoundaryState>(
      'emits [BoundaryState with loading true, BoundaryState with empty boundaries] when BoundarySearchEvent results in no match',
      build: () {
        when(() => mockBoundaryDataRepository.search(any()))
            .thenAnswer((invocation) async {
          final searchModel =
              invocation.positionalArguments[0] as BoundarySearchModel;
          if (searchModel.codes == testBoundaries.first.code) {
            return testBoundaries;
          } else {
            return [];
          }
        });
        return boundaryBloc;
      },
      act: (bloc) =>
          bloc.add(const BoundaryEvent.search(code: 'BAN001', boundaryNum: 1)),
      expect: () => [
        const BoundaryState(loading: true),
        BoundaryState(boundaryList: testBoundaries, loading: false),
      ],
      verify: (_) {
        verify(() => mockBoundaryDataRepository.search(any())).called(1);
      },
    );

    // Test case for empty boundaries result.
    blocTest<BoundaryBloc, BoundaryState>(
      'emits [BoundaryState with loading true, BoundaryState with empty boundaries] when BoundarySearchEvent results in empty boundaries',
      build: () {
        when(() => mockBoundaryDataRepository.search(any()))
            .thenAnswer((_) async => []);
        return boundaryBloc;
      },
      act: (bloc) =>
          bloc.add(const BoundaryEvent.search(code: 'BAN001', boundaryNum: 1)),
      expect: () => [
        const BoundaryState(loading: true),
        const BoundaryState(boundaryList: [], loading: false),
      ],
      verify: (_) {
        verify(() => mockBoundaryDataRepository.search(any())).called(1);
      },
    );
  });
}
