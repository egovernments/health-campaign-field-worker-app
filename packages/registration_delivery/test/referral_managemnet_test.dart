import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:registration_delivery/blocs/referral_management/referral_management.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:digit_data_model/data/data_repository.dart';

import 'constants/test_constants.dart';

class MockReferralRepository extends Mock
    implements DataRepository<ReferralModel, ReferralSearchModel> {}

void main() {
  late MockReferralRepository mockRepository;
  late ReferralBloc referralBloc;

  final mockReferral = ReferralModel(clientReferenceId: '');
  final mockSearchQuery = ReferralSearchModel();
  final mockSearchResult = [mockReferral];

  setUp(() {
    mockRepository = MockReferralRepository();
    referralBloc =
        ReferralBloc(const ReferralState(), referralRepository: mockRepository);
  });

  tearDown(() {
    referralBloc.close();
  });

  setUpAll(() {
    registerFallbackValue(ReferralSearchModel());
    registerFallbackValue(RegistrationDeliveryTestConstants.referralModel);
  });

  group('ReferralBloc Tests', () {
    blocTest<ReferralBloc, ReferralState>(
      'emits [loading, referrals] when search returns results',
      build: () {
        when(() => mockRepository.search(any()))
            .thenAnswer((_) async => mockSearchResult);
        return referralBloc;
      },
      act: (bloc) => bloc.add(ReferralEvent.handleSearch(mockSearchQuery)),
      expect: () => [
        const ReferralState(loading: true),
        ReferralState(loading: false, referrals: mockSearchResult),
      ],
      verify: (_) {
        verify(() => mockRepository.search(mockSearchQuery)).called(1);
      },
    );

    blocTest<ReferralBloc, ReferralState>(
      'emits [loading] and updates repository when submit is called for creation',
      build: () {
        when(() => mockRepository.create(any()))
            .thenAnswer((_) => RegistrationDeliveryTestConstants.referralModel);
        return referralBloc;
      },
      act: (bloc) => bloc.add(ReferralEvent.handleSubmit(mockReferral, false)),
      expect: () => [
        const ReferralState(loading: true),
        const ReferralState(loading: false),
      ],
      verify: (_) {
        verify(() => mockRepository.create(mockReferral)).called(1);
      },
    );

    blocTest<ReferralBloc, ReferralState>(
      'emits [loading] and updates repository when submit is called for update',
      build: () {
        when(() => mockRepository.update(any())).thenAnswer((_) async {});
        return referralBloc;
      },
      act: (bloc) => bloc.add(ReferralEvent.handleSubmit(mockReferral, true)),
      expect: () => [
        const ReferralState(loading: true),
        const ReferralState(loading: false),
      ],
      verify: (_) {
        verify(() => mockRepository.update(mockReferral)).called(1);
      },
    );
  });
}
