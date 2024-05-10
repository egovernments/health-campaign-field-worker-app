// Import necessary packages for Flutter testing and mocktail.
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/attendance_management.dart'; // Import your package for testing.
import 'package:mocktail/mocktail.dart'; // Import mocktail for mocking classes.

// Define a mock class for the AttendanceSingleton.
class MockAttendanceSingleton extends Mock implements AttendanceSingleton {}

void main() {
  // Define a test group for the AttendanceBloc.
  group('AttendanceBloc', () {
    late AttendanceBloc
        attendanceBloc; // Declare a variable for the AttendanceBloc.

    // Set up the test environment before each test.
    setUp(() {
      attendanceBloc = AttendanceBloc(const AttendanceStates
          .registerLoading()); // Initialize the AttendanceBloc with a default state.
    });

    // Test the initial state of the AttendanceBloc.
    test('Initial state is correct', () {
      expect(
          attendanceBloc.state,
          equals(const AttendanceStates
              .registerLoading())); // Ensure that the initial state matches the expected state.
    });

    // Test if the correct state is emitted when LoadSelectedAttendanceRegisterData event is added.
    test(
        'Emits SelectedRegisterLoaded state when LoadSelectedAttendanceRegisterData event is added',
        () {
      const registerID = '123'; // Define a sample register ID.
      final registers = [
        // Define a list of sample registers.
        AttendanceRegisterModel(id: '123', name: 'Test Register'),
      ];

      const preState =
          AttendanceStates.registerLoading(); // Define the initial state.
      final expectedState = AttendanceStates.selectedRegisterLoaded(
          // Define the expected state after adding the event.
          selectedRegister: registers.first);

      attendanceBloc.add(AttendanceEvents.loadSelectedRegister(
          // Add the LoadSelectedAttendanceRegisterData event to the AttendanceBloc.
          registers: registers,
          registerID: registerID));

      // Ensure that the stream emits the expected states in order.
      expectLater(
          attendanceBloc.stream, emitsInOrder([preState, expectedState]));
    });
  });
}
