import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/utils/extensions/extensions.dart';
import 'package:attendance_management/widgets/custom_attendance_info_card.dart';
import 'package:attendance_management/widgets/labeledtoggle.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart'
    as table;
import 'package:digit_ui_components/widgets/molecules/infinite_date_scroll.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/attendance_individual_bloc.dart';
import '../router/attendance_router.gm.dart';
import '../utils/date_util_attendance.dart';
import '../widgets/attendance_qr_scanner.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/circular_button.dart';
import '../widgets/no_result_card.dart';

@RoutePage()
class MarkAttendancePage extends LocalizedStatefulWidget {
  final AttendanceRegisterModel registerModel;

  const MarkAttendancePage({
    required this.registerModel,
    super.key,
    super.appLocalizations,
  });

  @override
  State<MarkAttendancePage> createState() => _MarkAttendancePageState();
}

class _MarkAttendancePageState extends State<MarkAttendancePage> {
  bool isDialogOpen = false;
  bool isMorning = true;
  static const _commentKey = 'comment';
  Timer? _debounce;
  late TextEditingController controller;
  AttendanceIndividualBloc? individualLogBloc;
  late FormGroup form;
  var entryTime = 0, exitTime = 0;
  var currentSelectedDate = DateTime.now().toString(), selectedSession = 0;
  bool markManualAttendance = false;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(searchByName);
    individualLogBloc = AttendanceIndividualBloc(
      const AttendanceIndividualState.loading(),
      attendanceLogDataRepository: context
          .repository<AttendanceLogModel, AttendanceLogSearchModel>(context),
      attendanceLogLocalRepository: context.read<
          LocalRepository<AttendanceLogModel, AttendanceLogSearchModel>>(),
    );
    form = buildForm(); // Initialize the form using your method
    super.initState();
  }

  void searchByName() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (controller.text.length >= 2) {
        individualLogBloc!
            .add(SearchAttendeesEvent(name: controller.text.trim()));
      } else if (controller.text.length < 2) {
        individualLogBloc!.add(const SearchAttendeesEvent(name: ''));
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var localizations = AttendanceLocalization.of(context);

    return BlocProvider<LocationBloc>(
        create: (_) {
          return LocationBloc(location: Location())
            ..add(const LoadLocationEvent());
        },
        lazy: false,
        child: BlocProvider<AttendanceIndividualBloc>(
            create: (context) => individualLogBloc!
              ..add(
                AttendanceIndividualLogSearchEvent(
                  attendees: widget.registerModel.attendees!.isNotEmpty
                      ? widget.registerModel.attendees!
                      : [],
                  limit: 10,
                  offset: 0,
                  currentDate: DateTime.now().isAfter(
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.registerModel.endDate!))
                      ? widget.registerModel.endDate!
                      : DateTime.now().millisecondsSinceEpoch,
                  entryTime: entryTime,
                  isSingleSession: false,
                  exitTime: exitTime,
                  registerId: widget.registerModel.id,
                  tenantId: widget.registerModel.tenantId.toString(),
                ),
              ),
            child: PopScope(
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, locationState) {
                  return Scaffold(
                      body: BlocBuilder<AttendanceIndividualBloc,
                          AttendanceIndividualState>(
                    buildWhen: (p, c) {
                      print('BlocBuilder rebuild triggered!');
                      return p != c ? true : false;
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const SizedBox.shrink();
                        },
                        loaded: (
                          attendanceSearchModelList,
                          attendanceCollectionModel,
                          offsetData,
                          currentOffset,
                          countData,
                          limitData,
                          viewOnly,
                        ) {
                          final attendees =
                              attendanceSearchModelList?.isNotEmpty == true
                                  ? attendanceSearchModelList!
                                  : attendanceCollectionModel ?? [];

                          return ScrollableContent(
                            enableFixedDigitButton: true,
                            footer: viewOnly
                                ? const SizedBox.shrink()
                                : DigitCard(
                                    margin: EdgeInsets.only(
                                        top: theme.spacerTheme.spacer4),
                                    children: [
                                        AttendanceDateTimeManagement.isToday(
                                                AttendanceDateTimeManagement
                                                    .getFormattedDateToDateTime(
                                                        currentSelectedDate)!)
                                            ? DigitButton(
                                                size: DigitButtonSize.large,
                                                type: DigitButtonType.primary,
                                                mainAxisSize: MainAxisSize.max,
                                                onPressed: () async {
                                                  var manualMode =
                                                      await Navigator.of(
                                                              context)
                                                          .push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AttendanceDigitScannerPage(
                                                        quantity: 1,
                                                        isGS1code: false,
                                                        singleValue: false,
                                                      ),
                                                      settings:
                                                          const RouteSettings(
                                                              name:
                                                                  '/qr-scanner'),
                                                    ),
                                                  );
                                                  if (manualMode != null) {
                                                    setState(() {
                                                      markManualAttendance =
                                                          manualMode;
                                                    });
                                                  }
                                                },
                                                prefixIcon: Icons
                                                    .document_scanner_outlined,
                                                label: localizations.translate(
                                                  i18.attendance.markAttendance,
                                                ),
                                              )
                                            : const Offstage(),
                                        DigitButton(
                                          size: DigitButtonSize.large,
                                          type: DigitButtonType.secondary,
                                          mainAxisSize: MainAxisSize.max,
                                          onPressed: () {
                                            checkIfAllAttendeesMarked(
                                              state,
                                              localizations,
                                              theme,
                                              EnumValues.draft.toValue(),
                                              locationState.latitude,
                                              locationState.longitude,
                                              context,
                                            );
                                          },
                                          prefixIcon: Icons.drafts_outlined,
                                          label: localizations.translate(
                                            i18.attendance
                                                .saveAndMarkLaterLabel,
                                          ),
                                        ),
                                        DigitButton(
                                          size: DigitButtonSize.large,
                                          type: DigitButtonType.primary,
                                          mainAxisSize: MainAxisSize.max,
                                          onPressed: !viewOnly
                                              ? () {
                                                  checkIfAllAttendeesMarked(
                                                    state,
                                                    localizations,
                                                    theme,
                                                    EnumValues.submit.toValue(),
                                                    locationState.latitude,
                                                    locationState.longitude,
                                                    context,
                                                  );
                                                }
                                              : () {},
                                          label: localizations.translate(
                                            (!viewOnly)
                                                ? i18.common.coreCommonSubmit
                                                : i18.attendance.closeButton,
                                          ),
                                        ),
                                      ]),
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            header: const BackNavigationHelpHeaderWidget(
                              showHelp: true,
                            ),
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  localizations.translate(
                                    i18.attendance.markAttendanceLabel,
                                  ),
                                  style: DigitTheme.instance.mobileTheme
                                      .textTheme.displayMedium,
                                ),
                              ),
                              InfiniteDateScrollInput(
                                initialValue: DateTime.now().isAfter(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            widget.registerModel.endDate!))
                                    ? AttendanceDateTimeManagement
                                        .getDateFromTimestamp(
                                            widget.registerModel.endDate!)
                                    : DateTime.now().getFormattedDate(),
                                firstDate: DateTime.fromMillisecondsSinceEpoch(
                                    widget.registerModel.startDate!),
                                lastDate: DateTime.now().isAfter(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                widget
                                                    .registerModel.endDate!)) ||
                                        DateTime.now().isAtSameMomentAs(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                widget.registerModel.endDate!))
                                    ? DateTime.fromMillisecondsSinceEpoch(
                                        widget.registerModel.endDate!)
                                    : DateTime.now(),
                                onChange: (String date) {
                                  currentSelectedDate = date;
                                  individualLogBloc!.add(
                                    AttendanceIndividualLogSearchEvent(
                                      attendees: widget.registerModel.attendees!
                                              .isNotEmpty
                                          ? widget.registerModel.attendees!
                                          : [],
                                      limit: 10,
                                      offset: 0,
                                      currentDate: AttendanceDateTimeManagement
                                          .getMillisecondEpoch(
                                              AttendanceDateTimeManagement
                                                  .getFormattedDateToDateTime(
                                                      currentSelectedDate)!,
                                              selectedSession,
                                              entryTime.toString()),
                                      entryTime: entryTime,
                                      isSingleSession: false,
                                      exitTime: exitTime,
                                      registerId: widget.registerModel.id,
                                      tenantId: widget.registerModel.tenantId
                                          .toString(),
                                    ),
                                  );
                                  setRegisterData();
                                  if (showInfoCard(
                                      widget.registerModel,
                                      AttendanceDateTimeManagement
                                          .getFormattedDateToDateTime(
                                              currentSelectedDate)!)) {
                                    showCustomPopup(
                                        context: context,
                                        builder: (ctx) {
                                          return Popup(
                                            type: PopUpType.alert,
                                            onCrossTap: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            actions: [
                                              DigitButton(
                                                capitalizeLetters: false,
                                                type: DigitButtonType.primary,
                                                size: DigitButtonSize.large,
                                                mainAxisSize: MainAxisSize.max,
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                label: localizations.translate(
                                                  i18.attendance
                                                      .ctaDateChangeProceed,
                                                ),
                                              ),
                                              DigitButton(
                                                capitalizeLetters: false,
                                                type: DigitButtonType.tertiary,
                                                size: DigitButtonSize.large,
                                                mainAxisSize: MainAxisSize.max,
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                label: localizations.translate(
                                                  i18.common.coreCommonCancel,
                                                ),
                                              ),
                                            ],
                                            title: localizations.translate(
                                                i18.attendance.actionRequired),
                                            description: getMissedDays(context),
                                          );
                                        });
                                  }
                                },
                              ),
                             
                              DigitCard(
                                margin: EdgeInsets.only(
                                    top: theme.spacerTheme.spacer4,
                                    bottom: theme.spacerTheme.spacer4),
                                children: [
                                  DigitSearchBar(
                                    controller: controller,
                                    hintText: localizations
                                        .translate(i18.common.searchByName),
                                    borderRadius: 0,
                                    margin: const EdgeInsets.all(0),
                                    textCapitalization:
                                        TextCapitalization.words,
                                  ),
                                  DigitLabeledToggle(
                                    value: isMorning,
                                    onChanged: (val) {
                                      setState(() {
                                        isMorning = val;
                                      });

                                      final now = DateTime.now();
                                      final currentDate =
                                          DateTime(now.year, now.month, now.day)
                                              .millisecondsSinceEpoch;

                                      entryTime = isMorning
                                          ? DateTime(now.year, now.month,
                                                  now.day, 9, 0)
                                              .millisecondsSinceEpoch
                                          : DateTime(now.year, now.month,
                                                  now.day, 14, 0)
                                              .millisecondsSinceEpoch;

                                      exitTime = isMorning
                                          ? DateTime(now.year, now.month,
                                                  now.day, 11, 58)
                                              .millisecondsSinceEpoch
                                          : DateTime(now.year, now.month,
                                                  now.day, 17, 0)
                                              .millisecondsSinceEpoch;

                                      final isSingleSession = (widget
                                                      .registerModel
                                                      .additionalDetails?[
                                                  'sessions'] ??
                                              1) ==
                                          1;

                                      individualLogBloc?.add(
                                        AttendanceIndividualLogSearchEvent(
                                          attendees:
                                              widget.registerModel.attendees ??
                                                  [],
                                          limit: 100,
                                          offset: 0,
                                          currentDate: currentDate,
                                          entryTime: entryTime,
                                          exitTime: exitTime,
                                          isSingleSession: isSingleSession,
                                          registerId: widget.registerModel.id!,
                                          tenantId:
                                              widget.registerModel.tenantId!,
                                        ),
                                      );
                                    },
                                    activeLabel: localizations.translate(
                                        i18.attendance.morningSession),
                                    inactiveLabel: localizations.translate(
                                        i18.attendance.eveningSession),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    EdgeInsets.all(theme.spacerTheme.spacer3),
                                child: (attendees.isNotEmpty)
                                    ? Column(
                                        children: attendees.map((individual) {
                                          return CustomAttendanceInfoCard(
                                            name: individual.name ?? "Unnamed",
                                            individualNumber:
                                                individual.individualNumber ??
                                                    "Unknown ID",
                                            status: individual.status,
                                            markManualAttendance:
                                                markManualAttendance, 
                                            onMarkPresent: () {
                                              context
                                                  .read<
                                                      AttendanceIndividualBloc>()
                                                  .add(
                                                    AttendanceMarkEvent(
                                                      individualId: individual
                                                          .individualId!,
                                                      registerId: individual
                                                          .registerId!,
                                                      status: 1.0,
                                                      isSingleSession: false,
                                                    ),
                                                  );
                                            },
                                            onMarkAbsent: () {
                                              context
                                                  .read<
                                                      AttendanceIndividualBloc>()
                                                  .add(
                                                    AttendanceMarkEvent(
                                                      individualId: individual
                                                          .individualId!,
                                                      registerId: individual
                                                          .registerId!,
                                                      status: 0.0,
                                                      isSingleSession: false,
                                                    ),
                                                  );
                                            },
                                          );
                                        }).toList(),
                                      )
                                    : NoResultCard(
                                        align: Alignment.center,
                                        label: localizations.translate(
                                          i18.common.noResultsFound,
                                        ),
                                      ),
                              ),
                              DigitCard(
                                margin:
                                    EdgeInsets.all(theme.spacerTheme.spacer3),
                                children: [
                                  ReactiveForm(
                                    formGroup: form,
                                    child: ReactiveWrapperField(
                                      formControlName: _commentKey,
                                      builder: (field) => LabeledField(
                                        label: localizations
                                            .translate(i18.common.commentKey),
                                        child: DigitTextFormInput(
                                          errorMessage: field.errorText,
                                          onChange: (value) {
                                            form.control(_commentKey).value =
                                                value;
                                          },
                                          initialValue:
                                              form.control(_commentKey).value,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                        loading: () {
                          return Center(
                            child: DigitLoaders.inlineLoader(),
                          );
                        },
                      );
                    },
                  ));
                }),
              ),
            )));
  }

  Future<dynamic> showWarningDialog(BuildContext context, dynamic k) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_outlined,
                    size: 40,
                    color: DigitTheme.instance.colorScheme.error,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      k.translate(
                        i18.attendance.checkAttendanceMark,
                      ),
                      //"Please Make sure that all attendees are marked attendance",
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: DigitButton(
                      size: DigitButtonSize.large,
                      type: DigitButtonType.primary,
                      mainAxisSize: MainAxisSize.max,
                      label: k.translate(
                        i18.attendance.closeButton,
                      ),
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void checkIfAllAttendeesMarked(
      AttendanceIndividualState state,
      AttendanceLocalization localizations,
      ThemeData theme,
      String type,
      double? latitude,
      double? longitude,
      BuildContext context) {
    context.read<LocationBloc>().add(const LoadLocationEvent());
    DigitComponentsUtils.showDialog(
        context,
        localizations.translate(i18.common.locationCapturing),
        DialogType.inProgress);
    Future.delayed(const Duration(seconds: 2), () async {
      DigitComponentsUtils.hideDialog(context);
      state.maybeWhen(
          orElse: () {},
          loaded: (
            attendanceSearchModelList,
            attendanceCollectionModel,
            offsetData,
            currentOffset,
            countData,
            limitData,
            flag,
          ) async {
            if (((attendanceCollectionModel ?? [])
                        .any((a) => a.status == -1 || a.status == null) &&
                    type != EnumValues.draft.toValue()) ||
                ((attendanceCollectionModel ?? [])
                        .every((a) => a.status == -1 || a.status == null) &&
                    type == EnumValues.draft.toValue())) {
              Toast.showToast(
                context,
                message: localizations
                    .translate(i18.attendance.pleaseMarkAttForIndividuals),
                type: ToastType.error,
              );
            } else {
              if (type == EnumValues.draft.toValue()) {
                individualLogBloc?.add(SaveAsDraftEvent(
                    entryTime: entryTime,
                    exitTime: exitTime,
                    selectedDate:
                        AttendanceDateTimeManagement.getFormattedDateToDateTime(
                            currentSelectedDate)!,
                    isSingleSession: false,
                    createOplog: type != EnumValues.draft.toValue(),
                    latitude: latitude,
                    longitude: longitude,
                    comment: form.control(_commentKey).value));
                Toast.showToast(
                  context,
                  message:
                      localizations.translate(i18.attendance.draftSavedMessage),
                  type: ToastType.success,
                );
                return;
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return Popup(
                        title: localizations.translate(
                          i18.attendance.confirmationLabel,
                        ),
                        description:
                            '${localizations.translate(i18.attendance.confirmationDesc)} \n\n${localizations.translate(i18.attendance.confirmationDescNote)}',
                        actions: [
                          DigitButton(
                            label: localizations.translate(
                              i18.attendance.proceed,
                            ),
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            onPressed: () {
                              individualLogBloc?.add(SaveAsDraftEvent(
                                  entryTime: entryTime,
                                  exitTime: exitTime,
                                  selectedDate: AttendanceDateTimeManagement
                                      .getFormattedDateToDateTime(
                                          currentSelectedDate)!,
                                  isSingleSession: false,
                                  createOplog:
                                      type != EnumValues.draft.toValue(),
                                  latitude: latitude,
                                  longitude: longitude,
                                  comment: form.control(_commentKey).value));
                              Navigator.of(
                                context,
                                rootNavigator: true,
                              ).pop(true);
                              navigateToAcknowledgement(localizations);
                            },
                          ),
                          DigitButton(
                            label: localizations
                                .translate(i18.common.coreCommonGoback),
                            type: DigitButtonType.secondary,
                            size: DigitButtonSize.large,
                            onPressed: () {
                              Navigator.of(
                                context,
                                rootNavigator: true,
                              ).pop(false);
                            },
                          )
                        ],
                      );
                    });
              }
            }
          });
    });
  }

  void navigateToAcknowledgement(AttendanceLocalization localizations) {
    context.router.push(
      AttendanceAcknowledgementRoute(
        label: localizations
            .translate(i18.attendance.attendanceSubmittedSuccessMsg),
        actionLabel: localizations.translate(i18.attendance.goHome),
        action: () {
          context.router.popUntilRoot();
        },
        secondaryLabel:
            localizations.translate(i18.attendance.goToAttendanceRegisters),
        secondaryAction: () {
          context.router.popUntilRouteWithName(ManageAttendanceRoute.name);
        },
      ),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _commentKey: FormControl<String>(value: ""),
    });
  }

  void setRegisterData() {
    DateTime dateSession = DateTime.now().isAfter(
            DateTime.fromMillisecondsSinceEpoch(widget.registerModel.endDate!))
        ? DateTime.fromMillisecondsSinceEpoch(widget.registerModel.endDate!)
        : AttendanceDateTimeManagement.getFormattedDateToDateTime(
            currentSelectedDate)!;
    entryTime = widget.registerModel
                .additionalDetails?[EnumValues.sessions.toValue()] ==
            2
        ? AttendanceDateTimeManagement.getMillisecondEpoch(
            dateSession,
            0,
            "entryTime",
          )
        : (DateTime(dateSession.year, dateSession.month, dateSession.day, 9)
            .millisecondsSinceEpoch);

    exitTime = widget.registerModel
                .additionalDetails?[EnumValues.sessions.toValue()] ==
            2
        ? AttendanceDateTimeManagement.getMillisecondEpoch(
            dateSession,
            1,
            "exitTime",
          )
        : (DateTime(dateSession.year, dateSession.month, dateSession.day, 18)
            .millisecondsSinceEpoch);
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

  // Method to get missed attendance days
  String getMissedDays(BuildContext context) {
    String missedDays = ""; // Initialize the missedDays string

    // Get current date
    DateTime nowTime = DateTime.now();
    DateTime currentDate = DateTime(nowTime.year, nowTime.month, nowTime.day);

    // Check if attendance log exists
    if (widget.registerModel.attendanceLog != null) {
      // Iterate through attendance log entries
      for (var entry in widget.registerModel.attendanceLog!) {
        // Check each entry for missed attendance
        entry.forEach((key, value) {
          if (value == false && key.isBefore(currentDate)) {
            // Add missed day to missedDays string
            missedDays += "${key.day}/${key.month}/${key.year} \n";
          }
        });
      }
    }

    // Return missed attendance days with description
    return "$missedDays${AttendanceLocalization.of(context).translate(i18.attendance.missedAttendanceDescription)}";
  }
}
