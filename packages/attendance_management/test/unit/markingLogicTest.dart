// Import necessary packages for testing.
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart'; // Import the bloc to be tested.
import 'package:attendance_management/models/attendee.dart'; // Import the model needed for testing.

void main() {
  // Define a test group for verifying the logic used in marking attendance.
  group('Test cases to verify the logic used in marking attendance', () {
    late AttendanceIndividualBloc
        attendanceIndividualBloc; // Declare a variable for the AttendanceIndividualBloc.

    // Set up the test environment before each test.
    setUp(() {
      attendanceIndividualBloc =
          AttendanceIndividualBloc(); // Initialize the AttendanceIndividualBloc.
    });

    // Iterate over different initial statuses.
    for (double initStatus in [-1, 1]) {
      // Define the current state based on the initial status.
      final currentState = AttendanceIndividualState.loaded(
        attendanceCollectionModel: [
          AttendeeModel(
            individualId: '1',
            registerId: '101',
            status: initStatus,
          ),
        ],
      );

      // Iterate over different scenarios of single or multiple sessions.
      for (var currentSessionisSingle in [true, false]) {
        // Test the logic for marking attendance based on initial status and session type.
        test(
            'If the status is -1 initially, it should become 1, else when initial status is 1, trying out the session logic for single session and otherwise',
            () {
          attendanceIndividualBloc
              .emit(currentState); // Emit the current state to the bloc.

          // Create the attendance marking event based on session type and attendee details.
          var event = AttendanceIndividualEvent.individualAttendanceMark(
            isSingleSession: currentSessionisSingle,
            individualId: '1',
            registerId: '101',
          );

          attendanceIndividualBloc
              .add(event); // Add the attendance marking event to the bloc.

          // Define the expected state after attendance marking based on the logic.
          final expectedState =
              AttendanceIndividualState.loaded(attendanceCollectionModel: [
            AttendeeModel(
                individualId: '1',
                registerId: '101',
                status:
                    initStatus == -1 ? 1 : (currentSessionisSingle ? 0.5 : 0))
          ]);

          // Ensure that the bloc stream emits the expected state.
          expect(attendanceIndividualBloc.stream, emits(expectedState));
        });
      }
    }
  });
}
