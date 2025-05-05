import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:attendance_management/utils/typedefs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../constants/test_constants.dart';

// Mock classes for dependencies
class MockAttendanceLogDataRepository extends Mock
    implements AttendanceLogDataRepository {}

class MockAttendanceLogLocalRepository extends Mock
    implements LocalRepository<AttendanceLogModel, AttendanceLogSearchModel> {}

// Fake classes for types used with `any`
class FakeAttendanceLogSearchModel extends Fake
    implements AttendanceLogSearchModel {}

void main() {
  group('AttendanceIndividualBloc', () {
    late AttendanceIndividualBloc attendanceIndividualBloc;
    late MockAttendanceLogDataRepository mockAttendanceLogDataRepository;
    late MockAttendanceLogLocalRepository mockAttendanceLogLocalRepository;

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(FakeAttendanceLogSearchModel());
    });

    setUp(() {
      mockAttendanceLogDataRepository = MockAttendanceLogDataRepository();
      mockAttendanceLogLocalRepository = MockAttendanceLogLocalRepository();
      attendanceIndividualBloc = AttendanceIndividualBloc(
        const AttendanceIndividualState.initial(),
        attendanceLogDataRepository: mockAttendanceLogDataRepository,
        attendanceLogLocalRepository: mockAttendanceLogLocalRepository,
      );
    });

    tearDown(() {
      attendanceIndividualBloc.close();
    });

    group('AttendanceIndividualLogSearchEvent', () {
      final mockAttendees = AttendanceTestConstants.attendees;
      final mockAttendanceLogs = AttendanceTestConstants.attendanceLogs;
      final mockSearchEvent =
          AttendanceIndividualEvent.individualAttendanceLogSearch(
        registerId: 'registerId',
        tenantId: 'tenantId',
        entryTime: DateTime.now().millisecondsSinceEpoch,
        exitTime: DateTime.now().millisecondsSinceEpoch,
        currentDate: DateTime.now().millisecondsSinceEpoch,
        attendees: mockAttendees,
        offset: 0,
        limit: 10,
        isSingleSession: false,
      );

      blocTest<AttendanceIndividualBloc, AttendanceIndividualState>(
        'emits [AttendanceIndividualState.loading, AttendanceIndividualState.loaded] when successful',
        build: () {
          when(() => mockAttendanceLogDataRepository.search(any()))
              .thenAnswer((_) async => mockAttendanceLogs);
          return attendanceIndividualBloc;
        },
        act: (bloc) => bloc.add(mockSearchEvent),
        expect: () => [
          const AttendanceIndividualState.loading(),
          AttendanceIndividualState.loaded(
              attendanceCollectionModel: mockAttendees, viewOnly: false),
        ],
      );

      blocTest<AttendanceIndividualBloc, AttendanceIndividualState>(
        'emits [AttendanceIndividualState.loading, AttendanceIndividualState.error] when repository throws an error',
        build: () {
          when(() => mockAttendanceLogDataRepository.search(any()))
              .thenThrow(Exception('Failed to fetch data'));
          return attendanceIndividualBloc;
        },
        act: (bloc) => bloc.add(mockSearchEvent),
        expect: () => [
          const AttendanceIndividualState.loading(),
          const AttendanceIndividualState.error(
              'Exception: Failed to fetch data'),
        ],
      );
    });

    group('AttendanceMarkEvent', () {
      blocTest<AttendanceIndividualBloc, AttendanceIndividualState>(
        'emits updated state with changed attendance status',
        build: () {
          return attendanceIndividualBloc;
        },
        seed: () => AttendanceIndividualState.loaded(
            attendanceCollectionModel: [AttendanceTestConstants.attendees[0]]),
        act: (bloc) =>
            bloc.add(const AttendanceIndividualEvent.individualAttendanceMark(
          individualId: 'individualId1',
          registerId: 'registerId',
        )),
        expect: () => [
          AttendanceIndividualState.loaded(attendanceCollectionModel: [
            AttendanceTestConstants.attendees[0].copyWith(status: 1)
          ], viewOnly: false),
        ],
      );
    });
  });
}
