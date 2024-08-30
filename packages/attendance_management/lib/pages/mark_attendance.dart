import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/utils/extensions/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/attendance_individual_bloc.dart';
import '../router/attendance_router.gm.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/circular_button.dart';
import '../widgets/no_result_card.dart';

@RoutePage()
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
  AttendanceIndividualBloc? individualLogBloc;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(searchByName);
    context.read<LocationBloc>().add(const LoadLocationEvent());
    individualLogBloc = AttendanceIndividualBloc(
      const AttendanceIndividualState.loading(),
      attendanceLogDataRepository: context
          .repository<AttendanceLogModel, AttendanceLogSearchModel>(context),
      attendanceLogLocalRepository: context.read<
          LocalRepository<AttendanceLogModel, AttendanceLogSearchModel>>(),
    );
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
                                                  context,
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
                                                        context,
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
                            header: const BackNavigationHelpHeaderWidget(
                              showHelp: true,
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
            individualLogBloc!.add(
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
    DigitComponentsUtils().showLocationCapturingDialog(
        context,
        localizations.translate(i18.common.locationCapturing),
        DigitSyncDialogType.inProgress);
    Future.delayed(const Duration(seconds: 2), () async {
      DigitComponentsUtils().hideDialog(context);
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
                individualLogBloc?.add(SaveAsDraftEvent(
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
                DigitDialog.show(context,
                    options: DigitDialogOptions(
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
                          individualLogBloc?.add(SaveAsDraftEvent(
                            entryTime: widget.entryTime,
                            exitTime: widget.exitTime,
                            selectedDate: widget.dateTime,
                            isSingleSession: widget.session == null,
                            createOplog: type != EnumValues.draft.toValue(),
                            latitude: latitude,
                            longitude: longitude,
                          ));
                          Navigator.of(context).pop();
                          navigateToAcknowledgement(localizations);
                        },
                      ),
                      secondaryAction: DigitDialogActions(
                        label: localizations
                            .translate(i18.common.coreCommonGoback),
                        action: (context) {
                          Navigator.of(context).pop();
                        },
                      ),
                    ));
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
}
