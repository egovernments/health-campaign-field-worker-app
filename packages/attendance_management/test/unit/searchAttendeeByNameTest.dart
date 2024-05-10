// Import necessary packages for testing.
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart'; // Import the bloc to be tested.
import 'package:attendance_management/models/attendee.dart'; // Import the model needed for testing.

void main() {
  // Define a test group for the AttendanceIndividualBloc.
  group('AttendanceIndividualBloc', () {
    // Test the initial state of the bloc.
    test('Test initial State', () {
      final bloc =
          AttendanceIndividualBloc(); // Create an instance of the bloc.
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: [
          AttendeeModel(
            individualId: '1',
            name: 'First User',
          ),
          AttendeeModel(
            individualId: '2',
            name: 'Second User',
          ),
        ],
      );

      bloc.emit(currentState); // Emit the current state to the bloc.
      expect(bloc.state,
          currentState); // Ensure that the current state matches the expected state.
    });

    // Test searching attendees when name matches exactly.
    test('Search attendees when name matches', () {
      final bloc =
          AttendanceIndividualBloc(); // Create an instance of the bloc.
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: [
          AttendeeModel(
            individualId: '1',
            name: 'First User',
          ),
          AttendeeModel(
            individualId: '2',
            name: 'Second User',
          ),
        ],
      );
      const event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: 'First User',
      );

      bloc.emit(currentState); // Emit the current state to the bloc.
      bloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        bloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList: [
              AttendeeModel(
                individualId: '1',
                name: 'First User',
              ),
            ],
            attendanceCollectionModel: [
              AttendeeModel(
                individualId: '1',
                name: 'First User',
              ),
              AttendeeModel(
                individualId: '2',
                name: 'Second User',
              ),
            ],
          ),
        ),
      );
    });

    // Test searching attendees when name partially matches.
    test('Search attendees when name partially matches', () {
      final bloc =
          AttendanceIndividualBloc(); // Create an instance of the bloc.
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: [
          AttendeeModel(
            individualId: '1',
            name: 'First User',
          ),
          AttendeeModel(
            individualId: '2',
            name: 'Second User',
          ),
        ],
      );
      const event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: 'First',
      );

      bloc.emit(currentState); // Emit the current state to the bloc.
      bloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        bloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList: [
              AttendeeModel(
                individualId: '1',
                name: 'First User',
              ),
            ],
            attendanceCollectionModel: [
              AttendeeModel(
                individualId: '1',
                name: 'First User',
              ),
              AttendeeModel(
                individualId: '2',
                name: 'Second User',
              ),
            ],
          ),
        ),
      );
    });

    // Test searching attendees when name does not match.
    test('Search attendees when name does not match', () {
      final bloc =
          AttendanceIndividualBloc(); // Create an instance of the bloc.
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: [
          AttendeeModel(
            individualId: '1',
            name: 'First User',
          ),
          AttendeeModel(
            individualId: '2',
            name: 'Second User',
          ),
        ],
      );
      const event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: 'Third',
      );

      bloc.emit(currentState); // Emit the current state to the bloc.
      bloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        bloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList: [],
            attendanceCollectionModel: [
              AttendeeModel(
                individualId: '1',
                name: 'First User',
              ),
              AttendeeModel(
                individualId: '2',
                name: 'Second User',
              ),
            ],
          ),
        ),
      );
    });

    // Test searching attendees when name partially matches but is in different case.
    test(
        'Search attendees when name partially matches but is in different case',
        () {
      final bloc =
          AttendanceIndividualBloc(); // Create an instance of the bloc.
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: [
          AttendeeModel(
            individualId: '1',
            name: 'First User',
          ),
          AttendeeModel(
            individualId: '2',
            name: 'Second User',
          ),
        ],
      );
      const event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: 'first',
      );

      bloc.emit(currentState); // Emit the current state to the bloc.
      bloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        bloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList: [
              AttendeeModel(
                individualId: '1',
                name: 'First User',
              ),
            ],
            attendanceCollectionModel: [
              AttendeeModel(
                individualId: '1',
                name: 'First User',
              ),
              AttendeeModel(
                individualId: '2',
                name: 'Second User',
              ),
            ],
          ),
        ),
      );
    });
  });
}
