// Import necessary packages for testing.
import 'package:test/test.dart';
import 'package:attendance_management/attendance_management.dart'; // Import your package for testing.
import 'package:attendance_management/blocs/date_session_bloc.dart'; // Import the bloc to be tested.
import 'package:mocktail/mocktail.dart'; // Import mocktail for mocking classes.

// Define a mock class for the DateSessionEmitter.
class MockDateSessionEmitter extends Mock implements DateSessionEmitter {}

void main() {
  // Define a test group for the DateSessionBloc.
  group('DateSessionBloc', () {
    late DateSessionBloc
        dateSessionBloc; // Declare a variable for the DateSessionBloc.
    late MockDateSessionEmitter
        mockEmitter; // Declare a mock emitter for testing.

    // Set up the test environment before each test.
    setUp(() {
      mockEmitter = MockDateSessionEmitter(); // Initialize the mock emitter.
      dateSessionBloc = DateSessionBloc(
          const DateSessionLoading()); // Initialize the DateSessionBloc with a default state.
    });

    // Test the initial state of the DateSessionBloc.
    test('initial state is correct', () {
      expect(
          dateSessionBloc.state,
          equals(
              const DateSessionLoading())); // Ensure that the initial state matches the expected state.
    });

    // Test if the correct state is emitted when InitialDateSession is added.
    test('emits DateSessionLoading when InitialDateSession is added', () {
      final expectedStates = [
        // Define the expected states.
        const DateSessionLoading(),
      ];
      expectLater(
          dateSessionBloc.stream,
          emitsInOrder(
              expectedStates)); // Ensure that the stream emits the expected states in order.

      dateSessionBloc.add(
          const InitialDateSession()); // Add the InitialDateSession event to the DateSessionBloc.
    });

    // Test if the correct state is emitted when LoadSelectedRegisterData is added.
    test('emits DateSessionLoaded when LoadSelectedRegisterData is added', () {
      final registerId = '1'; // Define a sample register ID.
      final registers = [
        // Define a list of sample registers.
        AttendanceRegisterModel(id: '1', name: 'Register 1'),
        AttendanceRegisterModel(id: '2', name: 'Register 2'),
      ];
      final selectedRegister = // Find the selected register based on the given register ID.
          registers.firstWhere((register) => register.id == registerId);

      final expectedStates = [
        // Define the expected states.
        DateSessionLoaded(selectedRegister: selectedRegister),
      ];

      expectLater(
          dateSessionBloc.stream,
          emitsInOrder(
              expectedStates)); // Ensure that the stream emits the expected states in order.

      dateSessionBloc.add(LoadSelectedRegisterData(
        // Add the LoadSelectedRegisterData event to the DateSessionBloc.
        registerID: registerId,
        registers: registers,
      ));
    });
  });
}
