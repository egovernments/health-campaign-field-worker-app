import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:attendance_management/models/enum_values.mapper.g.dart';
import 'package:attendance_management/pages/session_select.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../models/enum_values.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/no_result_card.dart';

class ManageAttendancePage extends LocalizedStatefulWidget {
  final AttendanceListeners attendanceListeners;
  final String projectId;
  final String userId;
  final String appVersion;
  const ManageAttendancePage({
    required this.attendanceListeners,
    required this.projectId,
    required this.userId,
    required this.appVersion,
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
        userId: widget.userId,
        appVersion: widget.appVersion);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AttendanceLocalization.of(context);
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
                      t.translate(i18.attendance.campaignNameLabel):
                          register.name,
                      // register.additionalDetails?[
                      //     EnumValues.campaignName.toValue()],
                      t.translate(i18.attendance.eventTypeLabel): register
                          .additionalDetails?[EnumValues.eventType.toValue()],
                      t.translate(i18.attendance.staffCountLabel):
                          register.attendees?.length ?? 0,
                      t.translate(i18.attendance.startDateLabel):
                          register.startDate != null
                              ? DigitDateUtils.getDateFromTimestamp(
                                  register.startDate!)
                              : 'N/A',
                      t.translate(i18.attendance.endDateLabel):
                          register.endDate != null
                              ? DigitDateUtils.getDateFromTimestamp(
                                  register.endDate!)
                              : 'N/A',
                      t.translate(i18.attendance.statusLabel):
                          t.translate(register.status.toString()),
                      t.translate(i18.attendance.attendanceCompletionLabel):
                          calculateCompletedDays(attendanceRegisters) ?? 'N/A',
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
              footer: (list.length == 1)
                  ? PoweredByDigit(
                      version: AttendanceSingleton().appVersion,
                    )
                  : const SizedBox.shrink(),
              children: [
                BlocBuilder<AttendanceBloc, AttendanceStates>(
                  builder: (context, blocState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            AttendanceLocalization.of(context).translate(
                                i18.attendance.attendanceRegistarLabel),
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineLarge
                                ?.apply(color: const DigitColors().black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        blocState.maybeWhen(
                          orElse: () => const SizedBox.shrink(),
                          registerLoaded: (
                            registers,
                          ) =>
                              Column(
                            children: [
                              if (list.isEmpty)
                                NoResultCard(
                                  align: Alignment.center,
                                  label: t.translate(
                                    i18.common.noResultsFound,
                                  ),
                                ),
                              ...list,
                              if (list.length > 1)
                                PoweredByDigit(
                                    version: AttendanceSingleton().appVersion),
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

  calculateCompletedDays(
      List<AttendancePackageRegisterModel> attendanceRegisters) {
    var completedDays = 0;
    var totalDays = 0;
    for (var att in attendanceRegisters) {
      totalDays = att.attendanceLog!.length;
      for (var element in att.attendanceLog!) {
        if (element.containsValue(true)) {
          completedDays++;
        }
      }
    }

    return '${completedDays.toString()}/${totalDays.toString()}';
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
    var t = AttendanceLocalization.of(context);

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
                        ? AttendanceLocalization.of(context)
                            .translate(i18.attendance.markAttendance)
                        : AttendanceLocalization.of(context)
                            .translate(i18.attendance.viewAttendance),
                  ),
                  onPressed: () async {
                    if (noOfAttendees == 0) {
                      DigitToast.show(
                        context,
                        options: DigitToastOptions(
                          t.translate(
                              i18.attendance.noAttendeesEnrolledMessage),
                          true,
                          DigitTheme.instance.mobileTheme,
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AttendanceDateSessionSelectionPage(
                            registers: registers,
                            registerID: registerId,
                          ),
                        ),
                      );
                    }
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
