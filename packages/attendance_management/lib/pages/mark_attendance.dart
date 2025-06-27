import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/entities/scanned_individual_data.dart';
import 'package:attendance_management/utils/extensions/extensions.dart';
import 'package:attendance_management/widgets/custom_attendance_info_card.dart';
import 'package:attendance_management/widgets/labelled_toggle.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
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
  late TextEditingController controller, dateController;
  AttendanceIndividualBloc? individualLogBloc;
  late FormGroup form;
  var entryTime = 0, exitTime = 0;
  var currentSelectedDate =
          DateTime.now().getFormattedDate('dd MMM yyyy').toString(),
      selectedSession = 0;
  bool markManualAttendance = false;
  String? manualAttendanceReason;
  String? manualAttendanceComment;

  @override
  void initState() {
    controller = TextEditingController();
    dateController = TextEditingController();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showMissedAttendanceDialog(
          currentSelectedDate, AttendanceLocalization.of(context));
    });
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
                          sortType,
                        ) {
                          final attendees =
                              attendanceSearchModelList?.isNotEmpty == true
                                  ? attendanceSearchModelList!
                                  : controller.text.isNotEmpty
                                      ? attendanceSearchModelList ?? []
                                      : attendanceCollectionModel;

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
                                                type: (((attendanceCollectionModel ?? [])
                                                                .any((a) =>
                                                                    a.status == -1 ||
                                                                    a.status ==
                                                                        null) &&
                                                            EnumValues.submit.toValue() !=
                                                                EnumValues.draft
                                                                    .toValue()) ||
                                                        ((attendanceCollectionModel ?? [])
                                                                .every((a) =>
                                                                    a.status == -1 ||
                                                                    a.status ==
                                                                        null) &&
                                                            EnumValues.submit.toValue() ==
                                                                EnumValues.draft
                                                                    .toValue()))
                                                    ? DigitButtonType.primary
                                                    : DigitButtonType.secondary,
                                                mainAxisSize: MainAxisSize.max,
                                                onPressed: () async {
                                                  final scannerBloc = context
                                                      .read<DigitScannerBloc>();

                                                  scannerBloc.add(
                                                    const DigitScannerEvent
                                                        .handleScanner(
                                                      barCode: [],
                                                      qrCode: [],
                                                    ),
                                                  );
                                                  var manualMode =
                                                      await Navigator.of(
                                                              context)
                                                          .push(
                                                              MaterialPageRoute(
                                                    builder: (scanContext) =>
                                                        AttendanceDigitScannerPage(
                                                      quantity: widget
                                                          .registerModel
                                                          .attendees!
                                                          .length,
                                                      onScanResult:
                                                          (scannedData,
                                                              result) {
                                                        if (result.isValid) {
                                                          var user =
                                                              scannedData;
                                                          context
                                                              .read<
                                                                  AttendanceIndividualBloc>()
                                                              .add(
                                                                AttendanceMarkEvent(
                                                                    individualId:
                                                                        getIndividualId(
                                                                            user),
                                                                    registerId:
                                                                        widget
                                                                            .registerModel
                                                                            .id,
                                                                    status: 1.0,
                                                                    isSingleSession:
                                                                        false,
                                                                    entryTime:
                                                                        entryTime,
                                                                    exitTime:
                                                                        exitTime,
                                                                    additionalFields: AttendeeAdditionalFields(
                                                                        version:
                                                                            1,
                                                                        fields: [
                                                                          if (scannedData.manualEntry != null ||
                                                                              markManualAttendance == true)
                                                                            AdditionalField('isMarkedManually', scannedData.manualEntry),
                                                                          if (scannedData.manualEntry == null &&
                                                                              scannedData.manualEntry == false)
                                                                            AdditionalField('qrCreatedTime', scannedData.qrCreatedTime)
                                                                        ])),
                                                              );
                                                        } else {
                                                          Toast.showToast(
                                                              context,
                                                              message:
                                                                  localizations
                                                                      .translate(
                                                                result
                                                                    .errorMessage!,
                                                              ),
                                                              type: ToastType
                                                                  .error);
                                                          context
                                                              .read<
                                                                  DigitScannerBloc>()
                                                              .add(
                                                                const DigitScannerEvent
                                                                    .handleScanner(
                                                                  barCode: [],
                                                                  qrCode: [],
                                                                ),
                                                              );
                                                        }
                                                      },
                                                      isGS1code: false,
                                                      singleValue: false,
                                                      registerModel:
                                                          widget.registerModel,
                                                    ),
                                                  ));
                                                  if (manualMode != null &&
                                                      manualMode[
                                                              'isManualScan'] ==
                                                          'true') {
                                                    setState(() {
                                                      markManualAttendance =
                                                          manualMode['isManualScan'] ==
                                                                  'true'
                                                              ? true
                                                              : false;
                                                      manualAttendanceReason =
                                                          manualMode['reason'];
                                                      manualAttendanceComment =
                                                          manualMode[
                                                              'reasonComment'];
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
                                          isDisabled:
                                              (((attendanceCollectionModel ??
                                                              [])
                                                          .any((a) =>
                                                              a.status == -1 ||
                                                              a.status ==
                                                                  null) &&
                                                      EnumValues.submit
                                                              .toValue() !=
                                                          EnumValues.draft
                                                              .toValue()) ||
                                                  ((attendanceCollectionModel ??
                                                              [])
                                                          .every((a) =>
                                                              a.status == -1 ||
                                                              a.status ==
                                                                  null) &&
                                                      EnumValues.submit
                                                              .toValue() ==
                                                          EnumValues.draft
                                                              .toValue())),
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(spacer2),
                                child: Text(
                                  localizations.translate(
                                    i18.attendance.markAttendanceLabel,
                                  ),
                                  style: DigitTheme.instance.mobileTheme
                                      .textTheme.displayMedium,
                                ),
                              ),
                              InfiniteDateScrollInput(
                                controller: dateController,
                                disableScroll: true,
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
                                  controller.clear();
                                  if (AttendanceDateTimeManagement.isToday(
                                      AttendanceDateTimeManagement
                                          .getFormattedDateToDateTime(
                                              currentSelectedDate)!)) {
                                    setState(() {
                                      markManualAttendance = false;
                                    });
                                  } else {
                                    setState(() {
                                      markManualAttendance = true;
                                    });
                                  }
                                  setRegisterData();
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
                                              'entryTime'),
                                      entryTime: entryTime,
                                      isSingleSession: false,
                                      exitTime: exitTime,
                                      registerId: widget.registerModel.id,
                                      tenantId: widget.registerModel.tenantId
                                          .toString(),
                                    ),
                                  );
                                  showMissedAttendanceDialog(
                                      date, localizations);
                                },
                              ),
                              DigitCard(
                                margin: EdgeInsets.only(
                                  top: theme.spacerTheme.spacer4,
                                  bottom: theme.spacerTheme.spacer4,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: spacer2),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: SizedBox(
                                            height: 44,
                                            child: DigitSearchFormInput(
                                              controller: controller,
                                              innerLabel:
                                                  localizations.translate(i18
                                                      .common.searchByNameOrID),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: spacer2),
                                        SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Builder(
                                            builder: (context) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: theme
                                                      .colorTheme.paper.primary,
                                                  border: Border.all(
                                                      color: theme.colorTheme
                                                          .generic.inputBorder),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          spacer1),
                                                ),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.swap_vert,
                                                    color: theme.colorTheme
                                                        .generic.inputBorder,
                                                  ),
                                                  onPressed: () async {
                                                    final RenderBox button =
                                                        context.findRenderObject()
                                                            as RenderBox;
                                                    final RenderBox overlay =
                                                        Overlay.of(context)
                                                                .context
                                                                .findRenderObject()
                                                            as RenderBox;
                                                    final Offset offset =
                                                        button.localToGlobal(
                                                            Offset.zero,
                                                            ancestor: overlay);
                                                    final Size size =
                                                        button.size;

                                                    final selected =
                                                        await showMenu<String>(
                                                      context: context,
                                                      position:
                                                          RelativeRect.fromLTRB(
                                                        offset.dx,
                                                        offset.dy + size.height,
                                                        offset.dx + size.width,
                                                        offset.dy,
                                                      ),
                                                      color: theme.colorTheme
                                                          .paper.primary,
                                                      items: [
                                                        PopupMenuItem(
                                                          value:
                                                              AttendanceSortType
                                                                  .presentFirst
                                                                  .name,
                                                          child: Row(
                                                            children: [
                                                              const SizedBox(
                                                                  width:
                                                                      spacer2),
                                                              Text(localizations
                                                                  .translate(i18
                                                                      .attendance
                                                                      .present)),
                                                            ],
                                                          ),
                                                        ),
                                                        PopupMenuItem(
                                                          value:
                                                              AttendanceSortType
                                                                  .absentFirst
                                                                  .name,
                                                          child: Row(
                                                            children: [
                                                              const SizedBox(
                                                                  width:
                                                                      spacer2),
                                                              Text(localizations
                                                                  .translate(i18
                                                                      .attendance
                                                                      .absent)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );

                                                    if (selected != null) {
                                                      final sortType =
                                                          AttendanceSortType
                                                              .values
                                                              .firstWhere((e) =>
                                                                  e.name ==
                                                                  selected);
                                                      context
                                                          .read<
                                                              AttendanceIndividualBloc>()
                                                          .add(
                                                            ToggleSortTypeEvent(
                                                                sortType:
                                                                    sortType),
                                                          );
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DigitLabeledToggle(
                                    value: isMorning,
                                    onChanged: (val) {
                                      setState(() {
                                        isMorning = val;
                                      });
                                      setRegisterData();
                                    },
                                    activeLabel: localizations.translate(
                                        i18.attendance.morningSession),
                                    inactiveLabel: localizations.translate(
                                        i18.attendance.eveningSession),
                                  ),
                                ],
                              ),
                              if (!AttendanceDateTimeManagement.isToday(
                                  AttendanceDateTimeManagement
                                      .getFormattedDateToDateTime(
                                          currentSelectedDate)!))
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: InfoCard(
                                      title: localizations.translate(i18
                                          .attendance.scannerNotAvailableTitle),
                                      type: InfoType.info,
                                      capitalizedLetter: false,
                                      description: localizations.translate(i18
                                          .attendance
                                          .scannerNotAvailableDescription)),
                                ),
                              Container(
                                margin:
                                    EdgeInsets.all(theme.spacerTheme.spacer3),
                                child: ((attendees ?? []).isNotEmpty)
                                    ? Column(
                                        children:
                                            (attendees ?? []).map((individual) {
                                          return CustomAttendanceInfoCard(
                                            name: individual.name ??
                                                localizations.translate(
                                                  i18.attendance.name,
                                                ),
                                            individualNumber:
                                                individual.individualNumber ??
                                                    localizations.translate(
                                                      i18.attendance.userId,
                                                    ),
                                            status: individual.status,
                                            markManualAttendance:
                                                AttendanceDateTimeManagement.isToday(
                                                            AttendanceDateTimeManagement
                                                                .getFormattedDateToDateTime(
                                                                    currentSelectedDate)!) &&
                                                        !markManualAttendance
                                                    ? false
                                                    : true,
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
                                                        entryTime: entryTime,
                                                        exitTime: exitTime,
                                                        additionalFields:
                                                            AttendeeAdditionalFields(
                                                                version: 1,
                                                                fields: [
                                                              const AdditionalField(
                                                                  'isMarkedManually',
                                                                  true),
                                                            ])),
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
                                                        entryTime: entryTime,
                                                        exitTime: exitTime,
                                                        additionalFields:
                                                            AttendeeAdditionalFields(
                                                                version: 1,
                                                                fields: [
                                                              const AdditionalField(
                                                                  'isMarkedManually',
                                                                  true),
                                                            ])),
                                                  );
                                            },
                                            viewOnly: viewOnly,
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
                      top: spacer2,
                      bottom: spacer2,
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
            sortType,
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
                    comment: form.control(_commentKey).value,
                    additionalDetails: {
                      if (markManualAttendance)
                        'isMarkedManually': markManualAttendance,
                      if (manualAttendanceReason != null &&
                          manualAttendanceReason!.isNotEmpty)
                        'manualMarkingReason': manualAttendanceReason,
                      if (manualAttendanceComment != null &&
                          manualAttendanceComment!.isNotEmpty)
                        'manualMarkingComment': manualAttendanceComment
                    }));
                Toast.showToast(
                  context,
                  message:
                      localizations.translate(i18.attendance.draftSavedMessage),
                  type: ToastType.success,
                );
                return;
              } else {
                final dialogForm =
                    buildForm(); // Call it once — outside the showDialog

                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return Popup(
                        title: localizations.translate(
                          i18.attendance.confirmationLabel,
                        ),
                        description:
                            '${localizations.translate(i18.attendance.confirmationDesc)} \n\n${localizations.translate(i18.attendance.confirmationDescNote)}',
                        additionalWidgets: [
                          ReactiveForm(
                            formGroup: dialogForm,
                            child: ReactiveWrapperField(
                              formControlName: _commentKey,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                    i18.attendance.validationRequiredError),
                              },
                              builder: (field) => LabeledField(
                                capitalizedFirstLetter: false,
                                label: localizations
                                    .translate(i18.common.commentKey),
                                isRequired: true,
                                child: DigitTextAreaFormInput(
                                  errorMessage: field.errorText,
                                  maxLine: 3,
                                  onChange: (value) {
                                    dialogForm.control(_commentKey).value =
                                        value;
                                  },
                                  initialValue:
                                      dialogForm.control(_commentKey).value,
                                ),
                              ),
                            ),
                          )
                        ],
                        actions: [
                          DigitButton(
                            label: localizations.translate(
                              i18.attendance.proceed,
                            ),
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            onPressed: () {
                              dialogForm.markAllAsTouched();

                              if (dialogForm.valid) {
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
                                  comment:
                                      dialogForm.control(_commentKey).value,
                                ));
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(true);
                                navigateToAcknowledgement(localizations);
                              } else {
                                dialogForm
                                    .control(_commentKey)
                                    .markAllAsTouched();
                              }
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
      _commentKey: FormControl<String>(
        validators: [Validators.required],
      ),
    });
  }

  void setRegisterData() {
    DateTime dateSession = DateTime.now().isAfter(
            DateTime.fromMillisecondsSinceEpoch(widget.registerModel.endDate!))
        ? DateTime.fromMillisecondsSinceEpoch(widget.registerModel.endDate!)
        : AttendanceDateTimeManagement.getFormattedDateToDateTime(
            currentSelectedDate)!;
    entryTime = AttendanceDateTimeManagement.getMillisecondEpoch(
      dateSession,
      isMorning ? 0 : 1,
      "entryTime",
    );

    exitTime = AttendanceDateTimeManagement.getMillisecondEpoch(
      dateSession,
      isMorning ? 0 : 1,
      "exitTime",
    );

    individualLogBloc!.add(
      AttendanceIndividualLogSearchEvent(
        attendees: widget.registerModel.attendees!.isNotEmpty
            ? widget.registerModel.attendees!
            : [],
        limit: 10,
        offset: 0,
        currentDate: AttendanceDateTimeManagement.getMillisecondEpoch(
            AttendanceDateTimeManagement.getFormattedDateToDateTime(
                currentSelectedDate)!,
            isMorning ? 0 : 1,
            'entryTime'),
        entryTime: entryTime,
        isSingleSession: false,
        exitTime: exitTime,
        registerId: widget.registerModel.id,
        tenantId: widget.registerModel.tenantId.toString(),
      ),
    );
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
    return "${AttendanceLocalization.of(context).translate(i18.attendance.missedAttendanceDescription)}\n$missedDays";
  }

  getIndividualId(ScannedIndividualDataModel user) {
    var id = widget.registerModel.attendees!
        .firstWhere((e) => e.individualNumber == user.individualId!)
        .individualId!;

    return id;
  }

  void showMissedAttendanceDialog(
      String date, AttendanceLocalization localizations) {
    if (showInfoCard(
        widget.registerModel,
        AttendanceDateTimeManagement.getFormattedDateToDateTime(
            currentSelectedDate)!)) {
      showCustomPopup(
          context: context,
          builder: (ctx) {
            return Popup(
              type: PopUpType.simple,
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
                    currentSelectedDate = date;
                    individualLogBloc!.add(
                      AttendanceIndividualLogSearchEvent(
                        attendees: widget.registerModel.attendees!.isNotEmpty
                            ? widget.registerModel.attendees!
                            : [],
                        limit: 10,
                        offset: 0,
                        currentDate:
                            AttendanceDateTimeManagement.getMillisecondEpoch(
                                AttendanceDateTimeManagement
                                    .getFormattedDateToDateTime(
                                        currentSelectedDate)!,
                                selectedSession,
                                'entryTime'),
                        entryTime: entryTime,
                        isSingleSession: false,
                        exitTime: exitTime,
                        registerId: widget.registerModel.id,
                        tenantId: widget.registerModel.tenantId.toString(),
                      ),
                    );
                    setRegisterData();
                    Navigator.of(ctx).pop();
                  },
                  label: localizations.translate(
                    i18.attendance.ctaDateChangeProceed,
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
              title: localizations.translate(i18.attendance.actionRequired),
              additionalWidgets: [
                InfoCard(
                    title: localizations
                        .translate(i18.attendance.missedAttendanceInfo),
                    type: InfoType.info,
                    capitalizedLetter: false,
                    description: getMissedDays(context))
              ],
              description: '',
            );
          });
    }
  }
}
