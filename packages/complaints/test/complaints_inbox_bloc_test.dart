import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:complaints/complaints.dart';

import 'constants/test_constants.dart';

class MockPgrServiceLocalRepository extends Mock
    implements PgrServiceLocalRepository {
  @override
  FutureOr<List<PgrServiceModel>> search(PgrServiceSearchModel query,
      [String? userId]) {
    return [ComplaintsConstants.mockPgrServiceModel];
  }
}

void main() {
  //Define a test group for the Complaints Inbox Bloc
  group('ComplaintsInboxBloc', () {
    //Declare a variable for complaint inbox bloc
    late ComplaintsInboxBloc complaintsInboxBloc;

    //Mock the required repositories
    late MockPgrServiceLocalRepository pgrServiceLocalRepository;

    setUp(() {
      pgrServiceLocalRepository = MockPgrServiceLocalRepository();
      complaintsInboxBloc = ComplaintsInboxBloc(
          const ComplaintInboxState.complaints(),
          pgrRepository: pgrServiceLocalRepository);
      ComplaintsSingleton().setTenantId(tenantId: 'mz');
    });

    setUpAll(() {
      registerFallbackValue(const PgrServiceSearchModel(
        tenantId: ComplaintsConstants.tenantId,
        complainantMobileNumber: '9192939495',
      ));
    });

    //Test case for _handleLoadComplaints
    blocTest<ComplaintsInboxBloc, ComplaintInboxState>(
        'emits [ComplaintsInboxState with isFiltered false] when ComplaintInboxLoadComplaintEvent is added',
        build: () {
          return complaintsInboxBloc;
        },
        act: (bloc) {
          bloc.add(ComplaintInboxLoadComplaintsEvent(
              updatedModels: [ComplaintsConstants.mockPgrServiceModel],
              createdByUserId: ComplaintsConstants.createdByUserId));
        },
        expect: () => [
              ComplaintInboxState.complaints(
                loading: false,
                complaints: [ComplaintsConstants.mockPgrServiceModel],
                isFiltered: false,
              ),
            ]);

    //Test case to search complaint based on the mobile number
    blocTest<ComplaintsInboxBloc, ComplaintInboxState>(
      'emits searched complaints when ComplaintInboxSearchComplaintsEvent is added',
      build: () => complaintsInboxBloc,
      act: (bloc) {
        bloc.add(const ComplaintInboxSearchComplaintsEvent(
          createdByUserId: ComplaintsConstants.createdByUserId,
          mobileNumber: '9192939495',
        ));
      },
      expect: () => [
        const ComplaintInboxState.complaints(loading: true),
        ComplaintInboxState.complaints(
          loading: false,
          searchKeys: PgrSearchKeys(
            complainantMobileNumber: '9192939495',
          ),
        ),
        ComplaintInboxState.complaints(
          loading: false,
          filteredComplaints: [ComplaintsConstants.mockPgrServiceModel],
          isFiltered: true,
          searchKeys: PgrSearchKeys(
            complainantMobileNumber: '9192939495',
          ),
        ),
      ],
    );
  });
}
