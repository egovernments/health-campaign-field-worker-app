import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/app_localization.dart';
import '../models/attendance_register.dart';
import '../utils/date_util_attendance.dart';
import '../widgets/back_navigation_help_header.dart';

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
      child: BlocBuilder<DateSessionBloc, DateSessionStates>(
          builder: (ctx, registerState) {
        return registerState.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            dateSessionLoaded: (selectedRegister) => ReactiveFormBuilder(
                  form: () => buildForm(
                    context,
                  ),
                  builder: (context, form, child) {
                    return ScrollableContent(
                      header: BackNavigationHelpHeaderWidget(
                        showHelp: false,
                        showLogoutCTA: false,
                        handleBack: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      enableFixedButton: true,
                      footer: DigitCard(
                        margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                        padding:
                            const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                        child: DigitElevatedButton(
                          child: Text(
                            localizations.translate(
                              i18.attendance.viewAttendance,
                            )
                          ),
                          onPressed: () {
                            if (form.control(_sessionRadio).value == null) {
                              form.control(_sessionRadio).setErrors({'': true});
                            }
                            form.markAllAsTouched();

                            if (!form.valid) {
                              return;
                            } else {
                              DateTime s = form.control(_dateOfSession).value;

                              final entryTime = AttendanceDateTimeManagement
                                  .getMillisecondEpoch(
                                s,
                                form.control(_sessionRadio).value != null
                                    ? form.control(_sessionRadio).value.key
                                    : "0",
                                "entryTime",
                              );

                              final exitTime = AttendanceDateTimeManagement
                                  .getMillisecondEpoch(
                                s,
                                form.control(_sessionRadio).value != null
                                    ? form.control(_sessionRadio).value.key
                                    : "1",
                                "exitType",
                              );
                              //
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => MarkAttendancePage(
                              //       attendeeIds: [],
                              //       dateTime: DateTime.now(),
                              //       entryTime: entryTime,
                              //       exitTime: exitTime,
                              //       registerId: "",
                              //       tenantId: "",
                              //       // projectId: "",
                              //     ),
                              //   ),
                              // );
                            }
                          },
                        ),
                      ),
                      children: [
                        DigitCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                i18.attendance.selectSession,
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .headlineLarge,
                              ),
                              DigitDateFormPicker(
                                start: selectedRegister?.startDate != null
                                    ? DateTime.fromMillisecondsSinceEpoch(
                                        selectedRegister!.startDate!)
                                    : null,
                                end: selectedRegister?.endDate != null
                                    ? DateTime.fromMillisecondsSinceEpoch(
                                        selectedRegister!.endDate!)
                                    : null,
                                label: i18.attendance.dateOfSession,
                                formControlName: _dateOfSession,
                                cancelText: "Cancel",
                                confirmText: "Select date",
                              ),
                              if (selectedRegister!
                                      .additionalDetails?['sessions'] ==
                                  2)
                                DigitRadioButtonList<KeyValue>(
                                  errorMessage: 'Please Select Session',
                                  formControlName: _sessionRadio,
                                  options: [
                                    KeyValue("morning session", 0),
                                    KeyValue("evening session", 1),
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
    ));
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
