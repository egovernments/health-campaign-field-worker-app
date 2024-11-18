import 'package:complaints/blocs/complaints_inbox/complaints_inbox.dart';
import 'package:complaints/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:complaints/complaints.dart';

import 'constants/test_constants.dart';


class MockPgrServiceDataRepository extends Mock implements
    PgrServiceDataRepository {}

void main(){
  //Define a test group for the Complaints Inbox Bloc
  group('ComplaintsInboxBloc', () {
    //Declare a variable for complaint inbox bloc
    late ComplaintsInboxBloc complaintsInboxBloc;

    //Mock the required repositories
    late MockPgrServiceDataRepository pgrServiceDataRepository;

    setUp((){
      pgrServiceDataRepository = MockPgrServiceDataRepository();
      complaintsInboxBloc = ComplaintsInboxBloc(
          const ComplaintInboxState.complaints(),
          pgrRepository: pgrServiceDataRepository
      );
    });


    //Test case for _handleLoadComplaints
    blocTest<ComplaintsInboxBloc, ComplaintInboxState>(
        'emits [ComplaintsInboxState with isFiltered false] when ComplaintInboxLoadComplaintEvent is added',
        build: (){
          return complaintsInboxBloc;
        },
        act: (bloc){
          bloc.add(
              ComplaintInboxLoadComplaintsEvent(
                  updatedModels: [ComplaintsConstants.mockPgrServiceModel],
                  createdByUserId: ComplaintsConstants.createdByUserId));
        },
        expect: ()=>[
          ComplaintInboxState.complaints(
            loading: false,
            complaints: [ComplaintsConstants.mockPgrServiceModel],
            isFiltered: false,
          ),
        ]
    );

  });
}