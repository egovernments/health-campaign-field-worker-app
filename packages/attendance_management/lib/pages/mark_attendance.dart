import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/enum_values.mapper.g.dart';
import 'package:attendance_management/widgets/attendance_acknowledgement.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var localizations = AttendanceLocalization.of(context);

    return BlocProvider<AttendanceIndividualBloc>(
        create: (context) => individualLogBloc
          ..add(
            AttendanceIndividualLogSearchEvent(
              attendees: widget.attendees.isNotEmpty ? widget.attendees : [],
              limit: 10,
              offset: 0,
              currentDate: widget.dateTime.millisecondsSinceEpoch,
              entryTime: widget.entryTime,
              exitTime: widget.exitTime,
              registerId: widget.registerId,
              tenantId: widget.tenantId.toString(),
              // eventEndDate: widget.eventEndTime.millisecondsSinceEpoch,
              // eventStartDate: widget.eventStartTime.millisecondsSinceEpoch,
            ),
          ),
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
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
                        ? getAttendanceData(attendanceSearchModelList, viewOnly)
                        : getAttendanceData(
                            attendanceCollectionModel!, viewOnly);

                    return ScrollableContent(
                      enableFixedButton: true,
                      footer: viewOnly
                          ? const SizedBox.shrink()
                          : SizedBox(
                              height: 150,
                              child: Card(
                                margin: const EdgeInsets.all(0),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      kPadding, 0, kPadding, 0),
                                  child: Column(
                                    children: [
                                      DigitOutlineIconButton(
                                        buttonStyle: OutlinedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                          ),
                                        ),
                                        onPressed: () {
                                          checkIfAllAttendeesMarked(
                                              state,
                                              localizations,
                                              theme,
                                              EnumValues.draft.toValue());
                                        },
                                        icon: Icons.drafts_outlined,
                                        label: localizations.translate(
                                          i18.attendance.saveAndMarkLaterLabel,
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
                                                        .toValue());
                                              }
                                            : () {
                                                // context.router.pop();
                                              },
                                        child: Text(
                                          localizations.translate(
                                            (!viewOnly)
                                                ? i18.common.coreCommonSubmit
                                                : i18.attendance.closeButton,
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
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              localizations.translate(
                                i18.attendance.markAttendanceLabel,
                              ),
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.headlineLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${DateFormat("dd MMMM yyyy").format(widget.dateTime)} - ${widget.session != null ? widget.session == 0 ? localizations.translate(
                                  i18.attendance.morningSession,
                                ) : localizations.translate(
                                  i18.attendance.eveningSession,
                                ) : ''}',
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.headlineSmall
                                  ?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        DigitCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // DigitTextField(
                              //   hintText: "Search by Name",
                              //   controller: controller,
                              //   label: '',
                              //   prefixIcon: const Icon(Icons.search),
                              //   isFilled: true,
                              // ),
                              DigitSearchBar(
                                controller: controller,
                                hintText: localizations
                                    .translate(i18.common.searchByName),
                                borderRadius: 0,
                                margin: const EdgeInsets.all(0),
                                textCapitalization: TextCapitalization.words,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: tableData.isNotEmpty
                                    ? DigitTable(
                                        height: (tableData.length + 1) * 56.5,
                                        headerList: headerList(
                                          widget.dateTime,
                                          localizations,
                                        ),
                                        tableData: tableData,
                                        columnWidth: 130,
                                        scrollPhysics:
                                            const NeverScrollableScrollPhysics(),
                                        centerData: true,
                                        centerTitle: true,
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
            )),
          ),
        ));
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
          index: double.parse(tableDataModel.status.toString()) ?? -1,
          isNotGreyed: false,
          onTap: () {
            individualLogBloc.add(
              AttendanceMarkEvent(
                individualId: tableDataModel.individualId!,
                registerId: tableDataModel.registerId!,
                status: tableDataModel.status,
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
            height: 200,
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

  void checkIfAllAttendeesMarked(AttendanceIndividualState state,
      AttendanceLocalization localizations, ThemeData theme, String type) {
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
            individualLogBloc.add(SaveAsDraftEvent(
              entryTime: widget.entryTime,
              exitTime: widget.exitTime,
              createOplog: type != EnumValues.draft.toValue(),
            ));
            if (type == EnumValues.draft.toValue()) {
              DigitToast.show(
                context,
                options: DigitToastOptions(
                  localizations.translate(i18.attendance.draftSavedMessage),
                  false,
                  theme,
                ),
              );
            } else {
              Navigator.of(context).pop(true);
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AttendanceAcknowledgementPage(
                          label: localizations.translate(
                              i18.attendance.attendanceSubmittedSuccessMsg),
                          actionLabel:
                              localizations.translate(i18.attendance.goHome),
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
            }
          }
        });
  }

  // Future<dynamic> markConfirmationDialog(
  //   MarkAttendanceBloc data,
  //   dynamic k,
  // ) async {
  //   return showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) {
  //       return Dialog(
  //         child: Card(
  //           child: SizedBox(
  //             height: 250,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                     top: 4.0,
  //                     bottom: 8.0,
  //                   ),
  //                   child: Text(
  //                     k.translate(i18.attendance.confirmationLabel),
  //                     style: DigitTheme
  //                         .instance.mobileTheme.textTheme.headlineMedium,
  //                     textAlign: TextAlign.left,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                     top: 4.0,
  //                     bottom: 4.0,
  //                   ),
  //                   child: Text(
  //                     k.translate(i18.attendance.confirmationDesc),
  //                     // "The Attendance details for the Session have been pre-populated.Please confirm before submitting.",
  //                     style:
  //                         DigitTheme.instance.mobileTheme.textTheme.bodyMedium,
  //                     textAlign: TextAlign.left,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                     top: 4.0,
  //                     bottom: 8.0,
  //                   ),
  //                   child: Text(
  //                     k.translate(i18.attendance.confirmationDescNote),
  //                     // "Note: You can not edit attendance details for the past days",
  //                     style:
  //                         DigitTheme.instance.mobileTheme.textTheme.bodyMedium,
  //                     textAlign: TextAlign.left,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 100,
  //                   height: 40,
  //                   child: DigitElevatedButton(
  //                     child: Text(
  //                       k.translate(i18.attendance.proceed),
  //                     ),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                       data.add(
  //                         UploadAttendanceMarkEvent(
  //                           entryTime: widget.entryTime,
  //                           exitTime: widget.exitTime,
  //                           projectId: context.projectId,
  //                           registarId: widget.registerId,
  //                           status: 1,
  //                           tenantId: widget.tenantId,
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //                 TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: Text(
  //                     k.translate(i18.attendance.goBackButton),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
