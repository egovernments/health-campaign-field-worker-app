import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:attendance_management/attendance_management.dart';

class MockDateSessionEmitter extends Mock implements DateSessionEmitter {}

void main() {
  group('DateSessionBloc', () {
    late DateSessionBloc dateSessionBloc;
    late MockDateSessionEmitter mockEmitter;

    setUp(() {
      mockEmitter = MockDateSessionEmitter();
      dateSessionBloc = DateSessionBloc(const DateSessionLoading());
    });

    test('initial state is correct', () {
      expect(dateSessionBloc.state, equals(const DateSessionLoading()));
    });

    test('emits DateSessionLoading when InitialDateSession is added', () {
      final expectedStates = [
        const DateSessionLoading(),
      ];
      expectLater(dateSessionBloc.stream, emitsInOrder(expectedStates));

      dateSessionBloc.add(const InitialDateSession());
    });

    test('emits DateSessionLoaded when LoadSelectedRegisterData is added', () {
      // Prepare test data
      final registerId = '1';
      final registers = [
        AttendanceRegisterModel(id: '1', name: 'Register 1'),
        AttendanceRegisterModel(id: '2', name: 'Register 2'),
      ];
      final selectedRegister =
          registers.firstWhere((register) => register.id == registerId);

      final expectedStates = [
        DateSessionLoaded(selectedRegister: selectedRegister),
      ];

      expectLater(dateSessionBloc.stream, emitsInOrder(expectedStates));

      // Trigger the event
      dateSessionBloc.add(LoadSelectedRegisterData(
        registerID: registerId,
        registers: registers,
      ));
    });
  });
}
