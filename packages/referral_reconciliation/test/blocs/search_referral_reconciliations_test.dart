import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:referral_reconciliation/blocs/search_referral_reconciliations.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:referral_reconciliation/utils/typedefs.dart';

import '../constants/test_constants.dart';

class MockReferralRepository extends Mock implements HFReferralDataRepository {}

void main() {
  late MockReferralRepository mockRepository;
  late SearchReferralsBloc referralBloc;

  setUp(() {
    mockRepository = MockReferralRepository();
    referralBloc = SearchReferralsBloc(
      const SearchReferralsState(),
      referralReconDataRepository: mockRepository,
    );
  });

  tearDown(() {
    referralBloc.close();
  });

  setUpAll(() {
    registerFallbackValue(HFReferralSearchModel(
      projectId: ['11891de8-02a2-4844-80ff-a080b7b40b65'],
      name: 'test',
    ));
    registerFallbackValue(ReferralReconSingleton().projectId ==
        '11891de8-02a2-4844-80ff-a080b7b40b65');
  });

  group('ReferralBloc Tests', () {
    //Test case to fetch referrals based on the name search
    blocTest<SearchReferralsBloc, SearchReferralsState>(
      'emits [loading, referrals] when search returns results',
      build: () {
        when(() => mockRepository.search(any())).thenAnswer(
            (_) async => [ReferralReconTestConstants().hfReferralModel]);
        return referralBloc;
      },
      act: (bloc) =>
          bloc.add(const SearchReferralsEvent.searchByName(searchText: 'test')),
      expect: () => [
        const SearchReferralsState(loading: true, searchQuery: 'test'),
        SearchReferralsState(
            loading: false,
            searchQuery: 'test',
            referrals: [ReferralReconTestConstants().hfReferralModel]),
      ],
    );

    //Test case to clear search results
    blocTest<SearchReferralsBloc, SearchReferralsState>(
        'emits empty referral list when clear event is called',
        build: () {
          return referralBloc;
        },
        act: (bloc) {
          bloc.add(const SearchReferralsClearEvent());
        },
        expect: () => [
              const SearchReferralsState(
                searchQuery: null,
                referrals: [],
                tag: null,
              ),
            ]);
  });
}
