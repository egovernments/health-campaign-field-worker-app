import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:attendance_management/models/attendee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test cases to verify the logic used in marking attendance', () {
    late AttendanceIndividualBloc attendanceIndividualBloc;

    setUp(() {
      attendanceIndividualBloc = AttendanceIndividualBloc();
    });

    for (double initStatus in [-1, 1]) {
      final currentState = AttendanceIndividualState.loaded(
        attendanceCollectionModel: [
          AttendeeModel(
            individualId: '1',
            registerId: '101',
            status: initStatus,
          ),
        ],
      );

      for (var currentSessionisSingle in [true, false]) {
        test(
            'If the status is -1 initially, it should become 1, else when initial status is 1, trying out the session logic for single session and otherwise',
            () {
          attendanceIndividualBloc.emit(currentState);

          var event = AttendanceIndividualEvent.individualAttendanceMark(
            isSingleSession: currentSessionisSingle,
            individualId: '1',
            registerId: '101',
          );

          attendanceIndividualBloc.add(event);

          final expectedState =
              AttendanceIndividualState.loaded(attendanceCollectionModel: [
            AttendeeModel(
                individualId: '1',
                registerId: '101',
                status:
                    initStatus == -1 ? 1 : (currentSessionisSingle ? 0.5 : 0))
          ]);

          expect(attendanceIndividualBloc.stream, emits(expectedState));
        });
      }
    }
  });
}
