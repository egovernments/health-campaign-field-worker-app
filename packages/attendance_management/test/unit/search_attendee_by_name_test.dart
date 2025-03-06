// Import necessary packages for testing.
import 'package:attendance_management/data/repositories/local/attendance_logs.dart';
import 'package:attendance_management/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../constants/test_constants.dart';

class MockAttendanceLogDataRepository extends Mock
    implements AttendanceLogDataRepository {}

class MockAttendanceLogLocalRepository extends Mock
    implements AttendanceLogsLocalRepository {}

void main() {
  late AttendanceIndividualBloc attendanceIndividualBloc;
  final attendanceLogDataRepository = MockAttendanceLogDataRepository();
  final attendanceLogLocalRepository = MockAttendanceLogLocalRepository();

  setUp(() {
    attendanceIndividualBloc = AttendanceIndividualBloc(
      AttendanceIndividualState.loaded(
          attendanceCollectionModel: AttendanceTestConstants.attendees),
      attendanceLogLocalRepository: attendanceLogLocalRepository,
      attendanceLogDataRepository: attendanceLogDataRepository,
    );
  });

  // Define a test group for the AttendanceIndividualBloc.
  group('AttendanceIndividualBloc', () {
    // Test the initial state of the bloc.
    test('Test initial State', () {
      // Create an instance of the bloc.
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: AttendanceTestConstants.attendees,
      );

      attendanceIndividualBloc
          .emit(currentState); // Emit the current state to the bloc.
      expect(attendanceIndividualBloc.state,
          currentState); // Ensure that the current state matches the expected state.
    });

    // Test searching attendees when name matches exactly.
    test('Search attendees when name matches', () {
      final currentState = AttendanceIndividualState.loaded(
          attendanceCollectionModel: AttendanceTestConstants.attendees);
      const event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: AttendanceTestConstants.existingAttendeeName,
      );

      attendanceIndividualBloc
          .emit(currentState); // Emit the current state to the bloc.
      attendanceIndividualBloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        attendanceIndividualBloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList: AttendanceTestConstants.attendees
                .where(
                  (attendee) =>
                      attendee.name ==
                      AttendanceTestConstants.existingAttendeeName,
                )
                .toList(),
            attendanceCollectionModel: AttendanceTestConstants.attendees,
          ),
        ),
      );
    });

    // Test searching attendees when name partially matches.
    test('Search attendees when name partially matches', () {
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: AttendanceTestConstants.attendees,
      );
      const event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: AttendanceTestConstants.partialAttendeeName,
      );

      attendanceIndividualBloc
          .emit(currentState); // Emit the current state to the bloc.
      attendanceIndividualBloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        attendanceIndividualBloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList:
                AttendanceTestConstants.attendees.where((element) {
              if (element.name!
                  .contains(AttendanceTestConstants.partialAttendeeName)) {
                return true;
              } else {
                return false;
              }
            }).toList(),
            attendanceCollectionModel: AttendanceTestConstants.attendees,
          ),
        ),
      );
    });

    // Test searching attendees when name does not match.
    test('Search attendees when name does not match', () {
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: AttendanceTestConstants.attendees,
      );
      const event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: AttendanceTestConstants.nonExistAttendeeName,
      );

      attendanceIndividualBloc
          .emit(currentState); // Emit the current state to the bloc.
      attendanceIndividualBloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        attendanceIndividualBloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList: [],
            attendanceCollectionModel: AttendanceTestConstants.attendees,
          ),
        ),
      );
    });

    // Test searching attendees when name partially matches but is in different case.
    test(
        'Search attendees when name partially matches but is in different case',
        () {
      final currentState = AttendanceIndividualState.loaded(
        // Define the current state.
        attendanceCollectionModel: AttendanceTestConstants.attendees,
      );
      var event = AttendanceIndividualEvent.searchAttendees(
        // Define the search event.
        name: AttendanceTestConstants.partialAttendeeName.toLowerCase(),
      );

      attendanceIndividualBloc
          .emit(currentState); // Emit the current state to the bloc.
      attendanceIndividualBloc.add(event); // Add the search event to the bloc.

      // Ensure that the bloc stream emits the expected state after searching.
      expect(
        attendanceIndividualBloc.stream,
        emits(
          AttendanceIndividualState.loaded(
            attendanceSearchModelList: AttendanceTestConstants.attendees.where(
              (element) {
                if (element.name!
                    .contains(AttendanceTestConstants.partialAttendeeName)) {
                  return true;
                } else {
                  return false;
                }
              },
            ).toList(),
            attendanceCollectionModel: AttendanceTestConstants.attendees,
          ),
        ),
      );
    });
  });
}
