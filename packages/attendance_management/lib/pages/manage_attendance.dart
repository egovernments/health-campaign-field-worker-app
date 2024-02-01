import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:attendance_management/pages/session_select.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/utils/app_logger.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/molecules/digit_table_card.dart';
import 'package:digit_components/widgets/powered_by_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class ManageAttendancePage extends LocalizedStatefulWidget {
  final AttendanceListeners attendanceListeners;
  final String projectId;
  final String userId;
  const ManageAttendancePage({
    required this.attendanceListeners,
    required this.projectId,
    required this.userId,
    super.key,
  });

  @override
  State<ManageAttendancePage> createState() => _ManageAttendancePageState();
}

class _ManageAttendancePageState extends State<ManageAttendancePage> {
  List<AttendancePackageRegisterModel> attendanceRegisters = [];
  var list = <Widget>[];

  bool empty = false;
  AttendanceBloc attendanceBloc = AttendanceBloc(const RegisterLoading());
  DateSessionBloc sessionBloc = DateSessionBloc(const DateSessionLoading());

  @override
  void initState() {
    AttendanceSingleton().setAttendanceListeners(
        attendanceListeners: widget.attendanceListeners,
        projectId: widget.projectId,
        userId: widget.userId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AttendanceBloc>(
      create: (context) =>
          attendanceBloc..add(const AttendanceEvents.initial()),
      child: BlocProvider<DateSessionBloc>(
        create: (context) => sessionBloc,
        child: BlocListener<AttendanceBloc, AttendanceStates>(
          listener: (ctx, states) {
            if (states is RegisterLoaded) {
              attendanceRegisters = states.registers;
              for (int i = 0; i < attendanceRegisters.length; i++) {
                final register = attendanceRegisters[i];
                list.add(RegisterCard(
                    data: {
                      'Campaign Type':
                          register.additionalDetails?['campaignName'],
                      'Event Type': register.additionalDetails?['eventType'],
                      'Staff Count': register.staff?.length ?? 0,
                      'Start Date': register.startDate != null
                          ? DigitDateUtils.getDateFromTimestamp(
                              register.startDate!)
                          : 'N/A',
                      'End Date': register.endDate != null
                          ? DigitDateUtils.getDateFromTimestamp(
                              register.endDate!)
                          : 'N/A',
                      'Status': register.status,
                      'Attendance Completion': 'N/A'
                    },
                    registers: attendanceRegisters,
                    noOfAttendees: register.attendees?.length ?? 0,
                    registerId: register.id,
                    tenantId: register.tenantId ?? 'N/A',
                    show: register.startDate != null &&
                        register.endDate != null &&
                        attendanceRegisters.isNotEmpty,
                    startDate: register.startDate != null
                        ? DateTime.fromMillisecondsSinceEpoch(
                            register.startDate!,
                          )
                        : null,
                    endDate: register.startDate != null
                        ? DateTime.fromMillisecondsSinceEpoch(
                            register.endDate!,
                          )
                        : null));
              }
            }
          },
          child: Scaffold(
            body: ScrollableContent(
              header: BackNavigationHelpHeaderWidget(
                showHelp: false,
                showLogoutCTA: false,
                handleBack: () {
                  AttendanceSingleton().callSync();
                },
              ),
              footer: const PoweredByDigit(
                version: '1.2.0',
              ),
              children: [
                BlocBuilder<AttendanceBloc, AttendanceStates>(
                  builder: (context, blocState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            AttendanceLocalization.of(context)!.translate(
                                i18.attendance.attendanceRegistarLabel)!,
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineLarge
                                ?.apply(color: const DigitColors().black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        empty
                            ? const Center(
                                child: Card(
                                  child: SizedBox(
                                    height: 60,
                                    width: 200,
                                    child: Center(child: Text("No Data Found")),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        blocState.maybeWhen(
                          orElse: () => const SizedBox.shrink(),
                          registerLoaded: (
                            registers,
                          ) =>
                              Column(
                            children: [
                              ...list,
                            ],
                          ),
                          registerLoading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          registerError: (message) => Center(
                            child: Card(
                              child: SizedBox(
                                height: 60,
                                width: 200,
                                child: Center(child: Text(message)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String tenantId;
  final String registerId;
  final bool show;
  final DateTime? startDate;
  final DateTime? endDate;
  final int noOfAttendees;
  final List<AttendancePackageRegisterModel> registers;

  const RegisterCard({
    super.key,
    required this.data,
    required this.tenantId,
    required this.registerId,
    this.show = false,
    this.startDate,
    this.endDate,
    this.noOfAttendees = 0,
    required this.registers,
  });

  @override
  Widget build(BuildContext context) {
    DateTime s = DateTime.now();

    return DigitCard(
      child: Column(
        children: [
          DigitTableCard(
            element: data,
          ),
          show
              ? DigitElevatedButton(
                  child: Text(
                    ((s.isAfter(startDate!) ||
                                s.isAtSameMomentAs(startDate!)) &&
                            (s.isBefore(endDate!) ||
                                s.isAtSameMomentAs(endDate!)))
                        ? AttendanceLocalization.of(context)!
                            .translate(i18.attendance.markAttendance)!
                        : AttendanceLocalization.of(context)!
                            .translate(i18.attendance.viewAttendance)!,
                  ),
                  onPressed: () async {
                    // if (noOfAttendees == 0) {
                    //   DigitToast.show(
                    //     context,
                    //     options: DigitToastOptions(
                    //       'No Attendee registered for this register',
                    //       true,
                    //       DigitTheme.instance.mobileTheme,
                    //     ),
                    //   );
                    // } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            AttendanceDateSessionSelectionPage(
                          registers: registers,
                          registerID: registerId,
                        ),
                      ),
                    );
                    // }
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
