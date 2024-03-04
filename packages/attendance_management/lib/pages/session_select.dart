import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:attendance_management/models/enum_values.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/app_localization.dart';
import '../blocs/attendance_individual_bloc.dart';
import '../models/attendance_register.dart';
import '../utils/date_util_attendance.dart';
import '../widgets/back_navigation_help_header.dart';
import 'mark_attendance.dart';

class AttendanceDateSessionSelectionPage extends LocalizedStatefulWidget {
  final List<AttendanceRegisterModel> registers;
  final String registerID;

  const AttendanceDateSessionSelectionPage({
    required this.registers,
    required this.registerID,
    super.key,
    super.appLocalizations,
  });

  @override
  State<AttendanceDateSessionSelectionPage> createState() =>
      _AttendanceDateSessionSelectionPageState();
}

class _AttendanceDateSessionSelectionPageState
    extends State<AttendanceDateSessionSelectionPage> {
  static const _dateOfSession = 'dateOfSession';
  static const _sessionRadio = 'sessionRadio';
  List<String> attendeeList = [];
  String missedDays = "";
  DateSessionBloc sessionBloc = DateSessionBloc(const DateSessionLoading());
  AttendanceIndividualBloc individualLogBloc = AttendanceIndividualBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AttendanceLocalization.of(context);

    return Scaffold(
        body: BlocProvider<DateSessionBloc>(
            create: (context) => sessionBloc
              ..add(
                LoadSelectedRegisterData(
                  registers: widget.registers,
                  registerID: widget.registerID,
                ),
              ),
            child: BlocProvider<AttendanceIndividualBloc>(
              create: (context) => individualLogBloc,
              child: BlocBuilder<DateSessionBloc, DateSessionStates>(
                  builder: (ctx, registerState) {
                return registerState.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    dateSessionLoaded: (selectedRegister) =>
                        ReactiveFormBuilder(
                          form: () => buildForm(
                            context,
                          ),
                          builder: (context, form, child) {
                            return ScrollableContent(
                              header: const BackNavigationHelpHeaderWidget(
                                showHelp: true,
                                showLogoutCTA: false,
                              ),
                              enableFixedButton: true,
                              footer: DigitCard(
                                  margin: const EdgeInsets.fromLTRB(
                                      0, kPadding, 0, 0),
                                  padding: const EdgeInsets.fromLTRB(
                                      kPadding, 0, kPadding, 0),
                                  child: ReactiveValueListenableBuilder(
                                      formControlName: _dateOfSession,
                                      builder: (context, value, _) {
                                        return DigitElevatedButton(
                                          child: Text(localizations.translate(
                                            isAttendanceCompleted(
                                                    value.value as DateTime)
                                                ? i18.attendance.viewAttendance
                                                : i18.attendance.markAttendance,
                                          )),
                                          onPressed: () async {
                                            if (selectedRegister
                                                            .additionalDetails?[
                                                        EnumValues.sessions
                                                            .toValue()] ==
                                                    2 &&
                                                form
                                                        .control(_sessionRadio)
                                                        .value ==
                                                    null) {
                                              form
                                                  .control(_sessionRadio)
                                                  .setErrors({'': true});
                                            } else {
                                              form.markAllAsTouched();

                                              if (!form.valid) {
                                                return;
                                              } else {
                                                final session = form
                                                    .control(_sessionRadio)
                                                    .value as KeyValue?;
                                                DateTime s = form
                                                    .control(_dateOfSession)
                                                    .value;

                                                final entryTime = selectedRegister
                                                                .additionalDetails?[
                                                            EnumValues.sessions
                                                                .toValue()] ==
                                                        2
                                                    ? AttendanceDateTimeManagement
                                                        .getMillisecondEpoch(
                                                        s,
                                                        form
                                                                    .control(
                                                                        _sessionRadio)
                                                                    .value !=
                                                                null
                                                            ? form
                                                                .control(
                                                                    _sessionRadio)
                                                                .value
                                                                .key
                                                            : 0,
                                                        "entryTime",
                                                      )
                                                    : (DateTime(s.year, s.month,
                                                            s.day, 9)
                                                        .millisecondsSinceEpoch);

                                                final exitTime = selectedRegister
                                                                .additionalDetails?[
                                                            EnumValues.sessions
                                                                .toValue()] ==
                                                        2
                                                    ? AttendanceDateTimeManagement
                                                        .getMillisecondEpoch(
                                                        s,
                                                        form
                                                                    .control(
                                                                        _sessionRadio)
                                                                    .value !=
                                                                null
                                                            ? form
                                                                .control(
                                                                    _sessionRadio)
                                                                .value
                                                                .key
                                                            : 1,
                                                        "exitTime",
                                                      )
                                                    : (DateTime(s.year, s.month,
                                                            s.day, 18)
                                                        .millisecondsSinceEpoch);

                                                final submit =
                                                    await Navigator.of(context)
                                                        .push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MarkAttendancePage(
                                                      attendees: selectedRegister
                                                                  .attendees !=
                                                              null
                                                          //Filtering attendees based on current time and enrollment date of the attendee
                                                          ? (selectedRegister
                                                                      .attendees ??
                                                                  [])
                                                              .where((att) =>
                                                                  att.enrollmentDate !=
                                                                      null &&
                                                                  att.enrollmentDate! <=
                                                                      entryTime)
                                                              .toList()
                                                          : [],
                                                      dateTime: s,
                                                      session: session?.key,
                                                      entryTime: entryTime,
                                                      exitTime: exitTime,
                                                      registerId:
                                                          selectedRegister.id,
                                                      tenantId: selectedRegister
                                                          .tenantId
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
                                                if (submit == null) {
                                                  form
                                                      .control(_sessionRadio)
                                                      .value = null;
                                                }
                                              }
                                            }
                                          },
                                        );
                                      })),
                              children: [
                                DigitCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        localizations.translate(
                                          i18.attendance.selectSession,
                                        ),
                                        style: DigitTheme.instance.mobileTheme
                                            .textTheme.displayMedium,
                                      ),
                                      DigitDateFormPicker(
                                        start: selectedRegister.startDate !=
                                                null
                                            ? DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    selectedRegister.startDate!)
                                            : null,
                                        end: selectedRegister.endDate != null
                                            ? selectedRegister.endDate! <
                                                    DateTime.now()
                                                        .millisecondsSinceEpoch
                                                ? DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        selectedRegister
                                                            .endDate!)
                                                : DateTime.now()
                                            : null,
                                        label: localizations.translate(
                                          i18.attendance.dateOfSession,
                                        ),
                                        formControlName: _dateOfSession,
                                        cancelText: localizations.translate(
                                            i18.common.coreCommonCancel),
                                        confirmText: localizations
                                            .translate(i18.common.coreCommonOk),
                                      ),
                                      if (selectedRegister.additionalDetails?[
                                              EnumValues.sessions.toValue()] ==
                                          2)
                                        DigitRadioButtonList<KeyValue>(
                                          labelText: localizations.translate(i18
                                              .attendance.sessionDescForRadio),
                                          labelStyle: DigitTheme
                                              .instance
                                              .mobileTheme
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                          isRequired: true,
                                          errorMessage: localizations.translate(
                                              i18.attendance.plzSelectSession),
                                          formControlName: _sessionRadio,
                                          options: [
                                            KeyValue(
                                                i18.attendance.morningSession,
                                                0),
                                            KeyValue(
                                                i18.attendance.eveningSession,
                                                1),
                                          ],
                                          valueMapper: (value) {
                                            return localizations
                                                .translate(value.label);
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                                if (showInfoCard(
                                  selectedRegister,
                                  DateTime.now(),
                                ))
                                  DigitInfoCard(
                                    title: localizations.translate(
                                      i18.attendance.missedAttendanceHeader,
                                    ),
                                    description: localizations.translate(
                                      getMissedDays(context),
                                    ),
                                  )
                                else
                                  const SizedBox(),
                              ],
                            );
                          },
                        ));
              }),
            )));
  }

  FormGroup buildForm(BuildContext ctx) {
    return fb.group(<String, Object>{
      _dateOfSession:
          FormControl<DateTime>(value: DateTime.now(), validators: []),
      _sessionRadio: FormControl<KeyValue>(value: null),
    });
  }

  // Method to get missed attendance days
  String getMissedDays(BuildContext context) {
    missedDays = ""; // Initialize the missedDays string

    // Get current date
    DateTime nowTime = DateTime.now();
    DateTime currentDate = DateTime(nowTime.year, nowTime.month, nowTime.day);

    // Iterate through attendance registers
    for (var element in widget.registers) {
      // Check if the register ID matches
      if (element.id == widget.registerID) {
        // Check if attendance log exists
        if (element.attendanceLog != null) {
          // Iterate through attendance log entries
          for (var entry in element.attendanceLog!) {
            // Check each entry for missed attendance
            entry.forEach((key, value) {
              if (value == false && key.isBefore(currentDate)) {
                // Add missed day to missedDays string
                missedDays += "${key.day}/${key.month}/${key.year} \n";
              }
            });
          }
        }
      }
    }

    // Return missed attendance days with description
    return "$missedDays${AttendanceLocalization.of(context).translate(i18.attendance.missedAttendanceDescription)}";
  }

  isAttendanceCompleted(DateTime selectedDate) {
    final register = widget.registers
        .where((register) => register.id == widget.registerID)
        .first;
    if ((register.attendanceLog ?? []).isNotEmpty) {
      final selectDateCompleted = register.attendanceLog
          ?.where((l) =>
              DigitDateUtils.getFilteredDate(l.keys.first.toString()) ==
              DigitDateUtils.getFilteredDate(selectedDate.toString()))
          .first
          .values
          .first;

      return selectDateCompleted;
    }

    return false;
  }

  bool showInfoCard(
      AttendanceRegisterModel selectedRegister, DateTime selectedDate) {
    final selectedFormattedDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    final nowTime = DateTime.now();
    final todayTime = DateTime(
      nowTime.year,
      nowTime.month,
      nowTime.day,
    );

    // Check if attendance log is available
    if (selectedRegister.attendanceLog != null) {
      for (var log in selectedRegister.attendanceLog!) {
        for (var entry in log.entries) {
          final logDate = entry.key;
          final isAttendanceMarked = entry.value;

          // If logDate is before or equal to selectedDate
          if (logDate.isBefore(selectedFormattedDate)) {
            // If selectedDate is not today
            if (selectedFormattedDate != todayTime) {
              // If attendance is not marked for any date before or on selectedDate
              if (!isAttendanceMarked) {
                return true;
              }
            }
            // If selectedDate is today
            else {
              // If today's attendance is not marked, show info card
              if (!isAttendanceMarked) {
                return true;
              }
            }
          }
        }
      }
    }

    // If attendance log is null or all logs are marked
    return false;
  }
}

class KeyValue {
  String label;
  dynamic key;

  KeyValue(this.label, this.key);
}
