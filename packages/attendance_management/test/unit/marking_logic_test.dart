// Import necessary packages for testing.
import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/entities/attendee.dart';
import 'package:attendance_management/utils/typedefs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../constants/test_constants.dart'; // Import the bloc to be tested.

class MockAttendanceLogDataRepository extends Mock
    implements AttendanceLogDataRepository {}

class MockAttendanceLogLocalRepository extends Mock
    implements AttendanceLogsLocalRepository {}

void main() {
  // Define a test group for verifying the logic used in marking attendance.
  group('Test cases to verify the logic used in marking attendance', () {
    late AttendanceIndividualBloc
        attendanceIndividualBloc; // Declare a variable for the AttendanceIndividualBloc.

    // Mock the required repositories
    final attendanceLogDataRepository = MockAttendanceLogDataRepository();
    final attendanceLogLocalRepository = MockAttendanceLogLocalRepository();

    // Set up the test environment before each test.
    setUp(() {
      attendanceIndividualBloc = AttendanceIndividualBloc(
        AttendanceIndividualState.loaded(attendanceCollectionModel: []),
        attendanceLogLocalRepository: attendanceLogLocalRepository,
        attendanceLogDataRepository: attendanceLogDataRepository,
      ); // Initialize the AttendanceIndividualBloc.
    });

    setUpAll(() {
      registerFallbackValue(AttendanceLogSearchModel());
      registerFallbackValue(AttendanceLogModel(id: ''));
      registerFallbackValue(AttendeeSearchModel());
      registerFallbackValue(AttendeeModel(
        id: '',
      ));
    });

    test('Initial state is correct', () {
      expect(
          attendanceIndividualBloc.state,
          equals(
              AttendanceIndividualState.loaded(attendanceCollectionModel: [])));
    });

    blocTest<AttendanceIndividualBloc, AttendanceIndividualState>(
      'emits [AttendanceIndividualState.loading(), AttendanceIndividualState.loaded()] when AttendanceIndividualLogSearchEvent is added',
      build: () {
        when(() => attendanceLogDataRepository.search(any()))
            .thenAnswer((_) async => []);
        return attendanceIndividualBloc;
      },
      act: (bloc) {
        bloc.add(AttendanceIndividualEvent.individualAttendanceLogSearch(
          registerId: AttendanceTestConstants.registerId,
          tenantId: AttendanceTestConstants.tenantId,
          entryTime: 0,
          exitTime: 0,
          currentDate: 0,
          attendees: AttendanceTestConstants.attendees,
          offset: 0,
          limit: 0,
        ));
      },
      expect: () => [
        const AttendanceIndividualState.loading(),
        AttendanceIndividualState.loaded(
            attendanceCollectionModel: AttendanceTestConstants.attendees),
      ],
      verify: (_) {
        verify(() => attendanceLogDataRepository.search(any())).called(1);
      },
    );
  });
}
