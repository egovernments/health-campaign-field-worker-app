// Import necessary packages for Flutter testing and mocktail.
import 'package:complaints/blocs/complaints_registration/complaints_registration.dart';
import 'package:complaints/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:complaints/complaints.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'constants/test_constants.dart';

class MockPgrServiceDataRepository extends Mock
    implements PgrServiceDataRepository {}


void main() {
  // Define a test group for the ComplaintsRegistrationBloc
  group('ComplaintRegistrationBloc', ()
  {
    late ComplaintsRegistrationBloc
    complaintsRegistrationBloc; // Declare a variable for the ComplaintsRegistrationBloc.
    // Mock the required repositories
    final pgrServiceDataRepository = MockPgrServiceDataRepository();

    // Set up the test environment before each test.
    setUp(() {
      complaintsRegistrationBloc = ComplaintsRegistrationBloc(
          const ComplaintsRegistrationState.create(),
          pgrServiceRepository: pgrServiceDataRepository
      );
    });

    setUpAll(() {
      registerFallbackValue(ComplaintsRegistrationConstants.mockPgrServiceModel);
    });

    // Test the initial state of the ComplaintsRegistrationBloc.
    test('Initial state is correct', () {
      expect(
          complaintsRegistrationBloc.state,
          equals(const ComplaintsRegistrationState
              .create())); // Ensure that the initial state matches the expected state.
    });

    //Test case for _handleSaveComplaintType in create state
    blocTest<ComplaintsRegistrationBloc, ComplaintsRegistrationState>(
        'emits [ComplaintsRegistrationState with complaintType] when _handleSaveComplaintType is called in create state',
        build: () => complaintsRegistrationBloc,
        act: (bloc) {
          bloc.add(const ComplaintsRegistrationSaveComplaintTypeEvent(
            complaintType: ComplaintsRegistrationConstants.complaintType,
          ));
        },
        expect: ()=> [
          const ComplaintsRegistrationState.create(
            complaintType: ComplaintsRegistrationConstants.complaintType,
          ),
        ],
    );

    //Test case for _handleSaveAddress in create state
    blocTest<ComplaintsRegistrationBloc, ComplaintsRegistrationState>(
        'emits [ComplaintsRegistrationState with complaintAddress] when _handleSaveAddress is called in create state',
        build: ()=>complaintsRegistrationBloc,
        act: (bloc){
          bloc.add(ComplaintsRegistrationSaveAddressEvent(
              addressModel: ComplaintsRegistrationConstants.addressModel,
          ));
        },
        expect: ()=>[
          ComplaintsRegistrationState.create(
            addressModel: ComplaintsRegistrationConstants.addressModel,
          ),
        ],
    );

    //Test case for _handleComplaintDetails in create state
    blocTest<ComplaintsRegistrationBloc, ComplaintsRegistrationState>(
        'emits [ComplaintsRegistrationState with complaintsDetails] when _handleComplaintDetails is called in create state',
        build: ()=>complaintsRegistrationBloc,
        act: (bloc){
          bloc.add(
            ComplaintsRegistrationSaveComplaintDetailsEvent(
                complaintsDetailsModel: ComplaintsRegistrationConstants.complaintsDetailsModel,
                boundaryModel: ComplaintsRegistrationConstants.boundaryModel,
            )
          );
        },
        expect: ()=>[
          ComplaintsRegistrationState.create(
            complaintsDetailsModel: ComplaintsRegistrationConstants.complaintsDetailsModel,
          ),
        ],
    );

    //Test case for _handleSubmitComplaints in create state
    blocTest<ComplaintsRegistrationBloc, ComplaintsRegistrationState>(
      'emits [ComplaintsRegistrationPersistedState] when _handleSubmitComplaints is called',
      build: () {
        when(()=>pgrServiceDataRepository.create(any()))
        .thenAnswer((_) async => ComplaintsRegistrationConstants.mockPgrServiceModel);
        return complaintsRegistrationBloc;
      },

      act: (bloc){
        bloc.emit(ComplaintsRegistrationState.create(
          complaintType: ComplaintsRegistrationConstants.complaintType,
          addressModel: ComplaintsRegistrationConstants.addressModel,
          complaintsDetailsModel: ComplaintsRegistrationConstants.complaintsDetailsModel,
        ));
      },
      expect: ()=>[
        ComplaintsRegistrationState.create(
          complaintType: ComplaintsRegistrationConstants.complaintType,
          addressModel: ComplaintsRegistrationConstants.addressModel,
          complaintsDetailsModel: ComplaintsRegistrationConstants.complaintsDetailsModel,
          loading: false,
        ),
      ],
    );

  });
}
