import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/widgets/attendance_acknowledgement.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/attendance_individual_bloc.dart';
import '../models/enum_values.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/circular_button.dart';
import '../widgets/no_result_card.dart';

class MarkAttendancePage extends LocalizedStatefulWidget {
  final List<AttendeeModel> attendees;
  final String registerId;
  final String tenantId;
  final DateTime dateTime;
  final int entryTime;
  final int exitTime;
  final int? session;

  const MarkAttendancePage({
    required this.exitTime,
    required this.entryTime,
    required this.dateTime,
    required this.attendees,
    required this.registerId,
    required this.tenantId,
    this.session,
    super.key,
    super.appLocalizations,
  });

  @override
  State<MarkAttendancePage> createState() => _MarkAttendancePageState();
}

class _MarkAttendancePageState extends State<MarkAttendancePage> {
  bool isDialogOpen = false;
  Timer? _debounce;
  late TextEditingController controller;
  AttendanceIndividualBloc individualLogBloc = AttendanceIndividualBloc();
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(searchByName);
    super.initState();
  }

  void searchByName() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (controller.text.length >= 2) {
        individualLogBloc
            .add(SearchAttendeesEvent(name: controller.text.trim()));
      } else if (controller.text.length < 2) {
        individualLogBloc.add(const SearchAttendeesEvent(name: ''));
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    if (overlayEntry != null && overlayEntry?.mounted == true) {
      overlayEntry?.remove();
    }
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
            create: (context) => individualLogBloc
              ..add(
                AttendanceIndividualLogSearchEvent(
                  attendees:
                      widget.attendees.isNotEmpty ? widget.attendees : [],
                  limit: 10,
                  offset: 0,
                  currentDate: widget.dateTime.millisecondsSinceEpoch,
                  entryTime: widget.entryTime,
                  isSingleSession: widget.session == null,
                  exitTime: widget.exitTime,
                  registerId: widget.registerId,
                  tenantId: widget.tenantId.toString(),
                ),
              ),
            child: PopScope(
              canPop: overlayEntry == null,
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
                        ) {
                          List<TableDataRow> tableData = [];

                          tableData = attendanceSearchModelList != null
                              ? getAttendanceData(
                                  attendanceSearchModelList, viewOnly)
                              : getAttendanceData(
                                  attendanceCollectionModel!, viewOnly);

                          return ScrollableContent(
                            enableFixedButton: true,
                            footer: viewOnly
                                ? const SizedBox.shrink()
                                : SizedBox(
                                    height: 140,
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            kPadding, 0, kPadding, 0),
                                        child: Column(
                                          children: [
                                            DigitOutlineIconButton(
                                              buttonStyle:
                                                  OutlinedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                ),
                                              ),
                                              onPressed: () {
                                                checkIfAllAttendeesMarked(
                                                  state,
                                                  localizations,
                                                  theme,
                                                  EnumValues.draft.toValue(),
                                                  locationState.latitude,
                                                  locationState.longitude,
                                                );
                                              },
                                              icon: Icons.drafts_outlined,
                                              label: localizations.translate(
                                                i18.attendance
                                                    .saveAndMarkLaterLabel,
                                              ),
                                            ),
                                            DigitElevatedButton(
                                              onPressed: !viewOnly
                                                  ? () {
                                                      checkIfAllAttendeesMarked(
                                                        state,
                                                        localizations,
                                                        theme,
                                                        EnumValues.submit
                                                            .toValue(),
                                                        locationState.latitude,
                                                        locationState.longitude,
                                                      );
                                                    }
                                                  : () {
                                                      // context.router.pop();
                                                    },
                                              child: Text(
                                                localizations.translate(
                                                  (!viewOnly)
                                                      ? i18.common
                                                          .coreCommonSubmit
                                                      : i18.attendance
                                                          .closeButton,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            header: BackNavigationHelpHeaderWidget(
                              showHelp: true,
                              handleBack: () {
                                AttendanceSingleton().callSync();
                              },
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: kPadding * 2,
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    localizations.translate(
                                      i18.attendance.markAttendanceLabel,
                                    ),
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.displayMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: kPadding * 2, top: 4, bottom: 16),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    '${DateFormat("dd MMMM yyyy").format(widget.dateTime)} ${widget.session != null ? widget.session == 0 ? '- ${localizations.translate(
                                        i18.attendance.morningSession,
                                      )}' : '- ${localizations.translate(
                                        i18.attendance.eveningSession,
                                      )}' : ''}',
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineSmall
                                        ?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DigitSearchBar(
                                  controller: controller,
                                  hintText: localizations
                                      .translate(i18.common.searchByName),
                                  borderRadius: 0,
                                  margin: const EdgeInsets.all(0),
                                  textCapitalization: TextCapitalization.words,
                                ),
                              ),
                              DigitCard(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: tableData.isNotEmpty
                                          ? DigitTable(
                                              height: tableData.length > 2
                                                  ? (tableData.length + 1) * 57
                                                  : (tableData.length + 1) * 65,
                                              headerList: headerList(
                                                widget.dateTime,
                                                localizations,
                                              ),
                                              tableData: tableData,
                                              columnWidth: 140,
                                              scrollPhysics:
                                                  const NeverScrollableScrollPhysics(),
                                            )
                                          : NoResultCard(
                                              align: Alignment.center,
                                              label: localizations.translate(
                                                i18.common.noResultsFound,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        loading: () {
                          return Center(
                            child: Loaders.circularLoader(context),
                          );
                        },
                      );
                    },
                  ));
                }),
              ),
            )));
  }

  List<TableDataRow> getAttendanceData(
    List<AttendeeModel>? list,
    bool viewOnly,
  ) {
    return list!.map((e) => getAttendanceRow(e, viewOnly)).toList();
  }

  TableDataRow getAttendanceRow(AttendeeModel tableDataModel, bool viewOnly) {
    return TableDataRow([
      TableData(
        tableDataModel.name.toString(),
        cellKey: tableDataModel.name,
      ),
      TableData(
        '',
        cellKey: tableDataModel.status.toString(),
        widget: CircularButton(
          icon: Icons.circle_rounded,
          size: 15,
          viewOnly: viewOnly,
          color: const Color.fromRGBO(0, 100, 0, 1),
          index: double.parse(tableDataModel.status.toString()),
          isNotGreyed: false,
          onTap: () {
            individualLogBloc.add(
              AttendanceMarkEvent(
                individualId: tableDataModel.individualId!,
                registerId: tableDataModel.registerId!,
                status: tableDataModel.status,
                isSingleSession: widget.session == null,
              ),
            );
          },
        ),
      ),
      TableData(
        tableDataModel.individualNumber.toString(),
        cellKey: tableDataModel.individualNumber,
      ),
    ]);
  }

  List<TableHeader> headerList(DateTime s, dynamic localizations) {
    return [
      TableHeader(
        localizations.translate(i18.attendance.tableHeaderName),
        cellKey: 'name',
      ),
      TableHeader(
        //DateFormat("dd MMMM yyyy").format(s).toString(),
        localizations.translate(i18.attendance.tableHeaderAttendance),
        cellKey: 'date',
      ),
      TableHeader(
        localizations.translate(i18.attendance.tableHeaderUserId),
        cellKey: "userId",
      ),
    ];
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
                    child: DigitElevatedButton(
                      child: Text(
                        k.translate(
                          i18.attendance.closeButton,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
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
      double? longitude) {
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
            DigitToast.show(
              context,
              options: DigitToastOptions(
                localizations
                    .translate(i18.attendance.pleaseMarkAttForIndividuals),
                true,
                theme,
              ),
            );
          } else {
            if (type == EnumValues.draft.toValue()) {
              individualLogBloc.add(SaveAsDraftEvent(
                entryTime: widget.entryTime,
                exitTime: widget.exitTime,
                selectedDate: widget.dateTime,
                isSingleSession: widget.session == null,
                createOplog: type != EnumValues.draft.toValue(),
                latitude: latitude,
                longitude: longitude,
              ));
              DigitToast.show(
                context,
                options: DigitToastOptions(
                  localizations.translate(i18.attendance.draftSavedMessage),
                  false,
                  theme,
                ),
              );
            } else {
              showOverlay(
                context,
                DigitDialogOptions(
                  titleText: localizations.translate(
                    i18.attendance.confirmationLabel,
                  ),
                  contentText:
                      '${localizations.translate(i18.attendance.confirmationDesc)} \n\n${localizations.translate(i18.attendance.confirmationDescNote)}',
                  primaryAction: DigitDialogActions(
                    label: localizations.translate(
                      i18.attendance.proceed,
                    ),
                    action: (context) {
                      if (overlayEntry != null) {
                        overlayEntry?.remove();
                      }
                      individualLogBloc.add(SaveAsDraftEvent(
                        entryTime: widget.entryTime,
                        exitTime: widget.exitTime,
                        selectedDate: widget.dateTime,
                        isSingleSession: widget.session == null,
                        createOplog: type != EnumValues.draft.toValue(),
                        latitude: latitude,
                        longitude: longitude,
                      ));
                      Navigator.of(context).pop(true);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AttendanceAcknowledgementPage(
                                  label: localizations.translate(i18.attendance
                                      .attendanceSubmittedSuccessMsg),
                                  actionLabel: localizations
                                      .translate(i18.attendance.goHome),
                                  action: () {
                                    AttendanceSingleton().callSync();
                                    Navigator.popUntil(
                                        context, (route) => route.isFirst);
                                  },
                                  secondaryLabel: localizations.translate(
                                      i18.attendance.goToAttendanceRegisters),
                                  secondaryAction: () {
                                    AttendanceSingleton().callSync();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop(true);
                                  },
                                )),
                      );
                    },
                  ),
                  secondaryAction: DigitDialogActions(
                    label: localizations.translate(i18.common.coreCommonGoback),
                    action: (context) {
                      if (overlayEntry != null) {
                        // Remove the overlay when the button is pressed
                        overlayEntry?.remove();
                        overlayEntry?.dispose();
                      }
                    },
                  ),
                ),
              );
            }
          }
        });
  }

  void showOverlay(
      BuildContext context, DigitDialogOptions digitDialogOptions) {
    // Initialize overlayEntry
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.75),
            ),
          ),
          Center(
            child: Material(
              color: Colors.white.withOpacity(0.25),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.25,
                height: MediaQuery.of(context).size.height / 2.28,
                color: Colors.white.withOpacity(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: digitDialogOptions.dialogPadding != null
                          ? digitDialogOptions.dialogPadding!
                          : const EdgeInsets.all(kPadding),
                      child: digitDialogOptions.title != null
                          ? digitDialogOptions.title!
                          : Row(
                              children: [
                                if (digitDialogOptions.titleIcon != null) ...[
                                  digitDialogOptions.titleIcon!,
                                  const SizedBox(width: 8),
                                ],
                                Expanded(
                                  child: Text(
                                    digitDialogOptions.titleText ?? '',
                                    textAlign: TextAlign.left,
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineMedium,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: digitDialogOptions.content ??
                            Text(
                              digitDialogOptions.contentText ?? '',
                              textAlign: TextAlign.left,
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.bodyMedium,
                            ),
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    if (digitDialogOptions.primaryAction != null)
                      Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: DigitElevatedButton(
                          onPressed: () {
                            digitDialogOptions.primaryAction?.action
                                ?.call(context);
                          },
                          child: Center(
                              child: Text(
                                  digitDialogOptions.primaryAction!.label)),
                        ),
                      ),
                    if (digitDialogOptions.secondaryAction != null)
                      TextButton(
                        onPressed: () {
                          digitDialogOptions.secondaryAction?.action
                              ?.call(context);
                        },
                        child: Center(
                            child: Text(
                                digitDialogOptions.secondaryAction!.label)),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Insert overlayEntry into the overlay stack
    Overlay.of(context).insert(overlayEntry!);
  }
}
