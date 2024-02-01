import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:digit_components/digit_components.dart';
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
  final List<AttendancePackageRegisterModel> registers;
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
    // Clear the data when the widget is disposed

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
                                showHelp: false,
                                showLogoutCTA: false,
                              ),
                              enableFixedButton: true,
                              footer: DigitCard(
                                margin: const EdgeInsets.fromLTRB(
                                    0, kPadding, 0, 0),
                                padding: const EdgeInsets.fromLTRB(
                                    kPadding, 0, kPadding, 0),
                                child: DigitElevatedButton(
                                  child: Text(localizations.translate(
                                    i18.attendance.viewAttendance,
                                  )),
                                  onPressed: () {
                                    if (form.control(_sessionRadio).value ==
                                        null) {
                                      form
                                          .control(_sessionRadio)
                                          .setErrors({'': true});
                                    }
                                    form.markAllAsTouched();

                                    if (!form.valid) {
                                      return;
                                    } else {
                                      DateTime s =
                                          form.control(_dateOfSession).value;

                                      final entryTime = selectedRegister
                                                      .additionalDetails?[
                                                  'sessions'] ==
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
                                                      .control(_sessionRadio)
                                                      .value
                                                      .key
                                                  : 0,
                                              "entryTime",
                                            )
                                          : (DateTime(s.year, s.month, s.day, 9)
                                                  .millisecondsSinceEpoch) /
                                              1000;

                                      final exitTime = selectedRegister
                                                      .additionalDetails?[
                                                  'sessions'] ==
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
                                                      .control(_sessionRadio)
                                                      .value
                                                      .key
                                                  : 1,
                                              "exitTime",
                                            )
                                          : (DateTime(s.year, s.month, s.day, 6)
                                                  .millisecondsSinceEpoch) /
                                              1000;

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MarkAttendancePage(
                                            attendees: selectedRegister
                                                        .attendees !=
                                                    null
                                                ? selectedRegister.attendees!
                                                : [],
                                            dateTime: s,
                                            entryTime: entryTime,
                                            exitTime: exitTime,
                                            registerId: selectedRegister.id,
                                            tenantId: selectedRegister.tenantId
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
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
                                            .textTheme.headlineLarge,
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
                                        cancelText: "Cancel",
                                        confirmText: "Select date",
                                      ),
                                      if (selectedRegister
                                              .additionalDetails?['sessions'] ==
                                          2)
                                        DigitRadioButtonList<KeyValue>(
                                          errorMessage: 'Please Select Session',
                                          formControlName: _sessionRadio,
                                          options: [
                                            KeyValue("Morning Session", 0),
                                            KeyValue("Evening Session", 1),
                                          ],
                                          valueMapper: (value) {
                                            return value.label;
                                          },
                                        ),
                                      // temporarily commented
                                      // CustomInfoCard(
                                      //   title:
                                      //       " ${localizations.translate(i18.attendance.missedAttendanceInfo)}",
                                      //   description:
                                      //       " ${localizations.translate(i18.attendance.missedAttendanceDesc)}",
                                      // ),
                                    ],
                                  ),
                                ),
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
}

class KeyValue {
  String label;
  dynamic key;
  KeyValue(this.label, this.key);
}
