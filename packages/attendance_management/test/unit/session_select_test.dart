import 'package:attendance_management/blocs/app_localization.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:attendance_management/models/entities/attendance_log.dart';
import 'package:attendance_management/models/entities/attendance_register.dart';
import 'package:attendance_management/pages/session_select.dart';
import 'package:attendance_management/utils/typedefs.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../constants/test_constants.dart';

class MockDateSessionBloc extends Mock implements DateSessionBloc {}

class MockAttendanceIndividualBloc extends Mock
    implements AttendanceIndividualBloc {}

class MockAttendanceLogDataRepository extends Mock
    implements AttendanceLogDataRepository {}

class MockAttendanceLogLocalRepository extends Mock
    implements LocalRepository<AttendanceLogModel, AttendanceLogSearchModel> {}

class MockAttendanceLocalizations extends Mock
    implements AttendanceLocalization {}

class Language {
  late String label;
  late String value;

  Language(this.label, this.value);
}

class Localization {
  late String code;

  late String message;

  late String module;

  late String locale;

  Localization(
      {required this.code,
      required this.message,
      required this.module,
      required this.locale});
}

void main() {
  group('AttendanceDateSessionSelectionPage Tests', () {
    late DateSessionBloc mockDateSessionBloc;
    late AttendanceIndividualBloc mockAttendanceIndividualBloc;
    late MockAttendanceLocalizations mockAttendanceLocalizations;

    setUp(() {
      mockDateSessionBloc = MockDateSessionBloc();
      mockAttendanceIndividualBloc = MockAttendanceIndividualBloc();
      mockAttendanceLocalizations = MockAttendanceLocalizations();
    });

    testWidgets('should render page correctly', (WidgetTester tester) async {
      final registers = [AttendanceRegisterModel(id: '1', attendees: [])];

      when(() => mockDateSessionBloc.state)
          .thenReturn(const DateSessionLoading());
      when(() => mockAttendanceIndividualBloc.state)
          .thenReturn(const AttendanceIndividualState.loading());

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en', 'MZ'),
          supportedLocales: const [Locale('en', 'MZ')],
          localizationsDelegates: [
            AttendanceLocalization.getDelegate(
                Future.value([
                  Localization(
                      code: 'example_code',
                      message: 'Example message',
                      locale: 'en_MZ',
                      module: 'test-module'),
                ]),
                [Language("English", "en_MZ")]),
          ],
          home: MultiRepositoryProvider(
            providers: [
              RepositoryProvider<AttendanceLogDataRepository>.value(
                  value: MockAttendanceLogDataRepository()),
              RepositoryProvider<
                      LocalRepository<AttendanceLogModel,
                          AttendanceLogSearchModel>>.value(
                  value: MockAttendanceLogLocalRepository()),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<DateSessionBloc>.value(value: mockDateSessionBloc),
                BlocProvider<AttendanceIndividualBloc>.value(
                    value: mockAttendanceIndividualBloc),
              ],
              child: AttendanceDateSessionSelectionPage(
                registers: registers,
                registerID: '1',
                appLocalizations: mockAttendanceLocalizations,
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('should show session selection when data is loaded',
        (WidgetTester tester) async {
      when(() => mockDateSessionBloc.state).thenReturn(DateSessionLoaded(
          selectedRegister: AttendanceTestConstants.registers[0]));
      when(() => mockAttendanceIndividualBloc.state)
          .thenReturn(AttendanceIndividualState.loaded());

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en', 'MZ'),
          supportedLocales: const [Locale('en', 'MZ')],
          localizationsDelegates: [
            AttendanceLocalization.getDelegate(
                Future.value([
                  Localization(
                      code: 'example_code',
                      message: 'Example message',
                      locale: 'en_MZ',
                      module: 'test-module'),
                ]),
                [Language("English", "en_MZ")]),
          ],
          home: MultiBlocProvider(
            providers: [
              BlocProvider<DateSessionBloc>.value(value: mockDateSessionBloc),
              BlocProvider<AttendanceIndividualBloc>.value(
                  value: mockAttendanceIndividualBloc),
            ],
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider<AttendanceLogDataRepository>.value(
                    value: MockAttendanceLogDataRepository()),
                RepositoryProvider<
                        LocalRepository<AttendanceLogModel,
                            AttendanceLogSearchModel>>.value(
                    value: MockAttendanceLogLocalRepository()),
              ],
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<DateSessionBloc>.value(
                      value: mockDateSessionBloc),
                  BlocProvider<AttendanceIndividualBloc>.value(
                      value: mockAttendanceIndividualBloc),
                ],
                child: AttendanceDateSessionSelectionPage(
                  registers: AttendanceTestConstants.registers,
                  registerID: '1',
                  appLocalizations: mockAttendanceLocalizations,
                ),
              ),
            ),
          ),
        ),
      );
    });
  });
}
