import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:attendance_management/models/attendee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AttendanceIndividualBloc', () {
    test('Test initial State', () {
      final bloc = AttendanceIndividualBloc();
      final currentState = AttendanceIndividualState.loaded(
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

      bloc.emit(currentState);
      expect(bloc.state, currentState);
    });

    test('Search attendees when name matches', () {
      final bloc = AttendanceIndividualBloc();
      final currentState = AttendanceIndividualState.loaded(
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
        name: 'First User',
      );

      bloc.emit(currentState);
      bloc.add(event);

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

    test('Search attendees when name partially matches', () {
      final bloc = AttendanceIndividualBloc();
      final currentState = AttendanceIndividualState.loaded(
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
        name: 'First',
      );

      bloc.emit(currentState);
      bloc.add(event);

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

    test('Search attendees when name does not match', () {
      final bloc = AttendanceIndividualBloc();
      final currentState = AttendanceIndividualState.loaded(
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
        name: 'Third',
      );

      bloc.emit(currentState);
      bloc.add(event);

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

    test(
        'Search attendees when name partially matches but is in different case',
        () {
      final bloc = AttendanceIndividualBloc();
      final currentState = AttendanceIndividualState.loaded(
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
        name: 'first',
      );

      bloc.emit(currentState);
      bloc.add(event);

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
