import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/attendance_management.dart';
import 'package:mocktail/mocktail.dart';

class MockAttendanceSingleton extends Mock implements AttendanceSingleton {}

void main() {
  group('AttendanceBloc', () {
    late AttendanceBloc attendanceBloc;

    setUp(() {
      attendanceBloc = AttendanceBloc(const AttendanceStates.registerLoading());
    });

    test('Initial state is correct', () {
      expect(attendanceBloc.state,
          equals(const AttendanceStates.registerLoading()));
    });

    test(
        'Emits SelectedRegisterLoaded state when LoadSelectedAttendanceRegisterData event is added',
        () {
      const registerID = '123';
      final registers = [
        AttendanceRegisterModel(id: '123', name: 'Test Register'),
      ];

      const preState = AttendanceStates.registerLoading();
      final expectedState = AttendanceStates.selectedRegisterLoaded(
          selectedRegister: registers.first);

      attendanceBloc.add(AttendanceEvents.loadSelectedRegister(
          registers: registers, registerID: registerID));

      expectLater(
          attendanceBloc.stream, emitsInOrder([preState, expectedState]));
    });
  });
}
