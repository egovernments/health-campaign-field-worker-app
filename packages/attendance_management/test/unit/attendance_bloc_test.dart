// Import necessary packages for Flutter testing and mocktail.
import 'package:attendance_management/utils/typedefs.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/attendance_management.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import '../constants/test_constants.dart';

class MockAttendanceDataRepository extends Mock
    implements AttendanceDataRepository {}

class MockAttendanceLogDataRepository extends Mock
    implements AttendanceLogDataRepository {}

class MockIndividualDataRepository extends Mock
    implements IndividualDataRepository {}

void main() {
  // Define a test group for the AttendanceBloc.
  group('AttendanceBloc', () {
    late AttendanceBloc
        attendanceBloc; // Declare a variable for the AttendanceBloc.
    // Mock the required repositories
    final attendanceDataRepository = MockAttendanceDataRepository();
    final attendanceLogDataRepository = MockAttendanceLogDataRepository();
    final individualDataRepository = MockIndividualDataRepository();

    // Set up the test environment before each test.
    setUp(() {
      attendanceBloc = AttendanceBloc(
        const AttendanceStates.registerLoading(),
        attendanceLogDataRepository: attendanceLogDataRepository,
        attendanceDataRepository: attendanceDataRepository,
        individualDataRepository: individualDataRepository,
      );
    });

    setUpAll(() {
      registerFallbackValue(AttendanceRegisterSearchModel());
      registerFallbackValue(AttendanceRegisterModel(id: ''));
      registerFallbackValue(AttendanceLogSearchModel());
      registerFallbackValue(AttendanceLogModel(id: ''));
      registerFallbackValue(IndividualSearchModel());
      registerFallbackValue(IndividualModel(id: '', clientReferenceId: ''));
    });

    // Test the initial state of the AttendanceBloc.
    test('Initial state is correct', () {
      expect(
          attendanceBloc.state,
          equals(const AttendanceStates
              .registerLoading())); // Ensure that the initial state matches the expected state.
    });

    // Fetch the attendance registers.
    blocTest<AttendanceBloc, AttendanceStates>(
      'emits [RegisterLoading, RegisterLoaded] when Initial event is added',
      build: () {
        when(() => attendanceDataRepository.search(any()))
            .thenAnswer((_) async => AttendanceTestConstants.registers);
        when(() => individualDataRepository.search(any()))
            .thenAnswer((_) async => AttendanceTestConstants.individuals);
        when(() => attendanceLogDataRepository.search(any()))
            .thenAnswer((_) async => AttendanceTestConstants.attendanceLogs);
        return attendanceBloc;
      },
      act: (bloc) {
        bloc.add(const AttendanceEvents.initial());
      },
      expect: () => [
        const RegisterLoading(),
        RegisterLoaded(
            registers: AttendanceTestConstants.registers,
            offset: 10,
            limit: 10),
      ],
      verify: (_) {
        verify(() => attendanceDataRepository.search(any())).called(1);
        verify(() => individualDataRepository.search(any())).called(2);
        verify(() => attendanceLogDataRepository.search(any())).called(2);
      },
    );

    //Test case for fetching data for the selected attendance register
    blocTest<AttendanceBloc, AttendanceStates>(
        'emits [RegisterLoading, SelectedRegisterLoaded] when loadSelectedRegisterData event is added',
        build: () {
          when(() => attendanceDataRepository.search(any()))
              .thenAnswer((_) async => AttendanceTestConstants.registers);
          when(() => individualDataRepository.search(any()))
              .thenAnswer((_) async => AttendanceTestConstants.individuals);
          when(() => attendanceLogDataRepository.search(any()))
              .thenAnswer((_) async => AttendanceTestConstants.attendanceLogs);
          return attendanceBloc;
        },
        act: (bloc) {
          bloc.add(LoadSelectedAttendanceRegisterData(
              registers: AttendanceTestConstants.registers,
              registerID: AttendanceTestConstants.registerId));
        },
        expect: () => [
              const RegisterLoading(),
              SelectedRegisterLoaded(
                selectedRegister: AttendanceTestConstants.registers[0],
              ),
            ]);
  });
}
