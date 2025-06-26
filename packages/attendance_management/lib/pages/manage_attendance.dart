import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/utils/extensions/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../router/attendance_router.gm.dart';
import '../utils/date_util_attendance.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/no_result_card.dart';

@RoutePage()
class ManageAttendancePage extends LocalizedStatefulWidget {
  const ManageAttendancePage({
    super.key,
  });

  @override
  State<ManageAttendancePage> createState() => _ManageAttendancePageState();
}

class _ManageAttendancePageState extends State<ManageAttendancePage> {
  List<AttendanceRegisterModel> attendanceRegisters = [];
  var list = <Widget>[];

  int offSet = 0;
  int limit = 10;

  bool empty = false;
  AttendanceBloc? attendanceBloc;

  @override
  void initState() {
    attendanceBloc = AttendanceBloc(
      const RegisterLoading(),
      attendanceDataRepository: context.repository<AttendanceRegisterModel,
          AttendanceRegisterSearchModel>(context),
      attendanceLogDataRepository: context
          .repository<AttendanceLogModel, AttendanceLogSearchModel>(context),
      individualDataRepository:
          context.repository<IndividualModel, IndividualSearchModel>(context),
    );
    super.initState();
  }

  @override
  void dispose() {
    attendanceBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var localization = AttendanceLocalization.of(context);
    return BlocProvider<AttendanceBloc>(
      create: (context) =>
          attendanceBloc!..add(const AttendanceEvents.initial()),
      child: BlocListener<AttendanceBloc, AttendanceStates>(
        listener: (ctx, states) {
          if (states is RegisterLoaded) {
            list.clear();
            offSet = states.offset;
            limit = states.limit;
            attendanceRegisters = states.registers;
            for (int i = 0; i < attendanceRegisters.length; i++) {
              final register = attendanceRegisters[i];
              list.add(RegisterCard(
                  attendanceBloc: attendanceBloc!,
                  data: {
                    localization.translate(i18.attendance.campaignNameLabel):
                        register.additionalDetails?[localization.translate(
                                EnumValues.campaignName.toValue())] ??
                            localization.translate(i18.common.coreCommonNA),
                    localization.translate(i18.attendance.eventTypeLabel):
                        register.additionalDetails?[localization
                                .translate(EnumValues.eventType.toValue())] ??
                            localization.translate(i18.common.coreCommonNA),
                    localization.translate(i18.attendance.staffCountLabel):
                        register.attendees?.length ?? 0,
                    localization.translate(i18.attendance.startDateLabel):
                        register.startDate != null
                            ? AttendanceDateTimeManagement.getDateFromTimestamp(
                                register.startDate!)
                            : localization.translate(i18.common.coreCommonNA),
                    localization.translate(i18.attendance.endDateLabel):
                        register.endDate != null
                            ? AttendanceDateTimeManagement.getDateFromTimestamp(
                                register.endDate!)
                            : localization.translate(i18.common.coreCommonNA),
                    localization.translate(i18.attendance.statusLabel):
                        register.endDate != null &&
                                register.endDate! >
                                    DateTime.now().millisecondsSinceEpoch
                            ? localization.translate(register.status.toString())
                            : localization.translate(i18.common.inactive),
                    localization.translate(
                            i18.attendance.attendanceCompletionLabel):
                        calculateCompletedDays(attendanceRegisters[i]) ??
                            localization.translate(i18.common.coreCommonNA),
                  },
                  registers: attendanceRegisters,
                  noOfAttendees: register.attendees?.length ?? 0,
                  registerId: register.id,
                  tenantId: register.tenantId ??
                      localization.translate(i18.common.coreCommonNA),
                  show: register.startDate != null &&
                      register.endDate != null &&
                      attendanceRegisters.isNotEmpty &&
                      register.endDate! > DateTime.now().millisecondsSinceEpoch,
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
            setState(() {});
          }
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              final metrics = scrollNotification.metrics;
              if (metrics.atEdge && metrics.pixels != 0) {
                attendanceBloc!.add(
                    AttendanceEvents.loadMoreAttendanceRegisters(
                        limit: limit, offset: offSet));
              }
            }
            return false;
          },
          child: Scaffold(
            body: ScrollableContent(
              header: const BackNavigationHelpHeaderWidget(
                showHelp: false,
                showLogoutCTA: false,
              ),
              footer: (list.length == 1)
                  ? PoweredByDigit(
                      version: AttendanceSingleton().appVersion,
                    )
                  : const Offstage(),
              slivers: [
                SliverToBoxAdapter(
                  child: BlocBuilder<AttendanceBloc, AttendanceStates>(
                    builder: (context, blocState) {
                      return blocState.maybeWhen(
                        orElse: () => const SizedBox.shrink(),
                        registerLoaded: (
                          registers,
                          limit,
                          offset,
                        ) =>
                            Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(theme.spacerTheme.spacer2)
                                  .copyWith(
                                top: 2,
                                left: theme.spacerTheme.spacer2 * 2,
                              ),
                              child: Text(
                                AttendanceLocalization.of(context).translate(
                                    i18.attendance.attendanceRegistarLabel),
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .displayMedium
                                    ?.apply(color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            if (list.isEmpty)
                              NoResultCard(
                                align: Alignment.center,
                                label: localization.translate(
                                  i18.common.noResultsFound,
                                ),
                              ),
                            ...list,
                            if (list.length > 1)
                              PoweredByDigit(
                                  version: AttendanceSingleton().appVersion),
                            // Show here if more than one register
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
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateCompletedDays(AttendanceRegisterModel attendanceRegister) {
    var completedDays = 0;
    var totalDays = 0;
    totalDays = attendanceRegister.attendanceLog!.length;
    for (var element in attendanceRegister.attendanceLog!) {
      if (element.containsValue(true)) {
        completedDays++;
      }
    }

    return '${completedDays.toString()}/${totalDays.toString()}';
  }
}

class RegisterCard extends StatelessWidget {
  final AttendanceBloc attendanceBloc;
  final Map<String, dynamic> data;
  final String tenantId;
  final String registerId;
  final bool show;
  final DateTime? startDate;
  final DateTime? endDate;
  final int noOfAttendees;
  final List<AttendanceRegisterModel> registers;

  const RegisterCard({
    super.key,
    required this.data,
    required this.attendanceBloc,
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
    final theme = Theme.of(context);
    var localization = AttendanceLocalization.of(context);

    return DigitCard(
        margin: EdgeInsets.all(theme.spacerTheme.spacer2),
        children: [
          LabelValueSummary(
            padding: EdgeInsets.all(theme.spacerTheme.spacer3),
            items: data.keys.map((e) {
              return LabelValueItem(
                  label: e, labelFlex: 5, value: data[e]?.toString() ?? '');
            }).toList(),
          ),
          show
              ? DigitButton(
                  size: DigitButtonSize.large,
                  type: DigitButtonType.primary,
                  mainAxisSize: MainAxisSize.max,
                  label: AttendanceLocalization.of(context)
                      .translate(i18.attendance.openRegister),
                  onPressed: () async {
                    if (noOfAttendees == 0) {
                      Toast.showToast(
                        context,
                        message: localization.translate(
                            i18.attendance.noAttendeesEnrolledMessage),
                        type: ToastType.error,
                      );
                    } else if (startDate != null &&
                        startDate!.millisecondsSinceEpoch >
                            DateTime.now().millisecondsSinceEpoch) {
                      Toast.showToast(
                        context,
                        message: localization
                            .translate(i18.attendance.registerNotStarted),
                        type: ToastType.error,
                      );
                    } else {
                      await context.router.push(
                        MarkAttendanceRoute(
                            registerModel: registers
                                .firstWhere((e) => e.id == registerId)),
                      );
                      attendanceBloc.add(const AttendanceEvents.initial());
                    }
                  },
                )
              : const Offstage(),
        ]);
  }
}
