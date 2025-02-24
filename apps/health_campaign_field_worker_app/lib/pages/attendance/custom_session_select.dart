import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:attendance_management/utils/extensions/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/router/app_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:attendance_management/utils/i18_key_constants.dart' as i18;
import 'package:attendance_management/widgets/localized.dart';
import 'package:attendance_management/blocs/app_localization.dart';
import 'package:attendance_management/blocs/attendance_individual_bloc.dart';
import 'package:attendance_management/models/entities/attendance_log.dart';
import 'package:attendance_management/models/entities/attendance_register.dart';
import 'package:attendance_management/models/entities/enum_values.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:attendance_management/utils/date_util_attendance.dart';
import 'package:attendance_management/widgets/back_navigation_help_header.dart';

@RoutePage()
class CustomAttendanceDateSessionSelectionPage extends LocalizedStatefulWidget {
  final List<AttendanceRegisterModel> registers;
  final String registerID;

  const CustomAttendanceDateSessionSelectionPage({
    required this.registers,
    required this.registerID,
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomAttendanceDateSessionSelectionPage> createState() =>
      _CustomAttendanceDateSessionSelectionPageState();
}

class _CustomAttendanceDateSessionSelectionPageState
    extends State<CustomAttendanceDateSessionSelectionPage> {
  static const _dateOfSession = 'dateOfSession';
  static const _sessionRadio = 'sessionRadio';
  List<String> attendeeList = [];
  String missedDays = "";
  DateSessionBloc sessionBloc = DateSessionBloc(const DateSessionLoading());
  AttendanceIndividualBloc? individualLogBloc;

  @override
  void initState() {
    individualLogBloc = AttendanceIndividualBloc(
      const AttendanceIndividualState.loading(),
      attendanceLogDataRepository: context
          .repository<AttendanceLogModel, AttendanceLogSearchModel>(context),
      attendanceLogLocalRepository: context.read<
          LocalRepository<AttendanceLogModel, AttendanceLogSearchModel>>(),
    );
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
    final theme = Theme.of(context);
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
              create: (context) => individualLogBloc!,
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
                              enableFixedDigitButton: true,
                              footer: DigitCard(
                                  padding:
                                      EdgeInsets.all(theme.spacerTheme.spacer2),
                                  children: [
                                    DigitButton(
                                      size: DigitButtonSize.large,
                                      type: DigitButtonType.primary,
                                      mainAxisSize: MainAxisSize.max,
                                      label: localizations.translate(
                                        isAttendanceCompleted(form
                                                .control(_dateOfSession)
                                                .value as DateTime)
                                            ? i18.attendance.viewAttendance
                                            : i18.attendance.markAttendance,
                                      ),
                                      onPressed: () async {
                                        form.markAllAsTouched();
                                        if (selectedRegister.additionalDetails?[
                                                    EnumValues.sessions
                                                        .toValue()] ==
                                                2 &&
                                            form.control(_sessionRadio).value ==
                                                null) {
                                          form
                                              .control(_sessionRadio)
                                              .setErrors({'': true});

                                          form
                                              .control(_sessionRadio)
                                              .setValidators(
                                                  [Validators.required]);

                                          // Ensure form control is updated after changing validators
                                          form
                                              .control(_sessionRadio)
                                              .updateValueAndValidity();
                                        } else {
                                          if (!form.valid) {
                                            return;
                                          } else {
                                            final session = form
                                                .control(_sessionRadio)
                                                .value;
                                            DateTime dateSession = form
                                                .control(_dateOfSession)
                                                .value;

                                            final entryTime = selectedRegister
                                                            .additionalDetails?[
                                                        EnumValues.sessions
                                                            .toValue()] ==
                                                    2
                                                ? AttendanceDateTimeManagement
                                                    .getMillisecondEpoch(
                                                    dateSession,
                                                    form
                                                                .control(
                                                                    _sessionRadio)
                                                                .value !=
                                                            null
                                                        ? int.parse(form
                                                            .control(
                                                                _sessionRadio)
                                                            .value)
                                                        : 0,
                                                    "entryTime",
                                                  )
                                                : (DateTime(
                                                        dateSession.year,
                                                        dateSession.month,
                                                        dateSession.day,
                                                        9)
                                                    .millisecondsSinceEpoch);

                                            final exitTime = selectedRegister
                                                            .additionalDetails?[
                                                        EnumValues.sessions
                                                            .toValue()] ==
                                                    2
                                                ? AttendanceDateTimeManagement
                                                    .getMillisecondEpoch(
                                                    dateSession,
                                                    form
                                                                .control(
                                                                    _sessionRadio)
                                                                .value !=
                                                            null
                                                        ? int.parse(form
                                                            .control(
                                                                _sessionRadio)
                                                            .value)
                                                        : 1,
                                                    "exitTime",
                                                  )
                                                : (DateTime(
                                                        dateSession.year,
                                                        dateSession.month,
                                                        dateSession.day,
                                                        18)
                                                    .millisecondsSinceEpoch);

                                            final submit =
                                                await context.router.push(
                                              CustomMarkAttendanceRoute(
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
                                                dateTime: dateSession,
                                                session: session != null
                                                    ? int.parse(session)
                                                    : null,
                                                entryTime: entryTime,
                                                exitTime: exitTime,
                                                registerId: selectedRegister.id,
                                                tenantId: selectedRegister
                                                    .tenantId
                                                    .toString(),
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
                                    )
                                  ]),
                              children: [
                                DigitCard(children: [
                                  Text(
                                    localizations.translate(
                                      i18.attendance.selectSession,
                                    ),
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.displayMedium,
                                  ),
                                  ReactiveWrapperField(
                                      formControlName: _dateOfSession,
                                      builder: (field) {
                                        return LabeledField(
                                          label: localizations.translate(
                                            i18.attendance.dateOfSession,
                                          ),
                                          child: DigitDateFormInput(
                                            onChange: (val) => {
                                              form
                                                  .control(_dateOfSession)
                                                  .markAsTouched(),
                                              form
                                                      .control(_dateOfSession)
                                                      .value =
                                                  AttendanceDateTimeManagement
                                                      .getFormattedDateToDateTime(
                                                          val),
                                            },
                                            initialValue:
                                                AttendanceDateTimeManagement
                                                    .getDateString(form
                                                        .control(_dateOfSession)
                                                        .value),
                                            firstDate: selectedRegister
                                                        .startDate !=
                                                    null
                                                ? DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        selectedRegister
                                                            .startDate!)
                                                : null,
                                            lastDate: selectedRegister
                                                        .endDate !=
                                                    null
                                                ? selectedRegister.endDate! <
                                                        DateTime.now()
                                                            .millisecondsSinceEpoch
                                                    ? DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            selectedRegister
                                                                .endDate!)
                                                    : DateTime.now()
                                                : null,
                                            cancelText: localizations.translate(
                                                i18.common.coreCommonCancel),
                                            confirmText:
                                                localizations.translate(
                                                    i18.common.coreCommonOk),
                                          ),
                                        );
                                      }),
                                  if (selectedRegister.additionalDetails?[
                                          EnumValues.sessions.toValue()] ==
                                      2)
                                    ReactiveWrapperField<String>(
                                        formControlName: _sessionRadio,
                                        validationMessages: {
                                          'required': (_) =>
                                              localizations.translate(i18
                                                  .attendance.plzSelectSession),
                                        },
                                        showErrors: (control) =>
                                            control.invalid && control.touched,
                                        // Ensures error is shown if invalid and touched
                                        builder: (field) {
                                          return LabeledField(
                                            isRequired: true,
                                            label: localizations.translate(i18
                                                .attendance
                                                .sessionDescForRadio),
                                            child: RadioList(
                                                onChanged: (val) {
                                                  form
                                                      .control(_sessionRadio)
                                                      .markAsTouched();
                                                  form
                                                      .control(_sessionRadio)
                                                      .value = val.code;
                                                },
                                                groupValue: form
                                                        .control(_sessionRadio)
                                                        .value ??
                                                    "",
                                                errorMessage: field.errorText,
                                                radioDigitButtons: [
                                                  RadioButtonModel(
                                                      code: "0",
                                                      name: localizations
                                                          .translate(
                                                        i18.attendance
                                                            .morningSession,
                                                      )),
                                                  RadioButtonModel(
                                                      code: "1",
                                                      name: localizations
                                                          .translate(
                                                        i18.attendance
                                                            .eveningSession,
                                                      ))
                                                ]),
                                          );
                                        }),
                                ]),
                                if (showInfoCard(
                                  selectedRegister,
                                  DateTime.now(),
                                ))
                                  DigitCard(children: [
                                    InfoCard(
                                      title: localizations.translate(
                                        i18.attendance.missedAttendanceHeader,
                                      ),
                                      type: InfoType.info,
                                      description: localizations.translate(
                                        getMissedDays(context),
                                      ),
                                    ),
                                  ])
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
      _sessionRadio: FormControl<String>(value: null, validators: []),
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
              AttendanceDateTimeManagement.getFilteredDate(
                  l.keys.first.toString()) ==
              AttendanceDateTimeManagement.getFilteredDate(
                  selectedDate.toString()))
          .firstOrNull
          ?.values
          .firstOrNull;

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
