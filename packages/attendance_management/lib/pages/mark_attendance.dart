// import 'dart:async';
//
// import 'package:attendance_management/attendance_management.dart';
// import 'package:digit_components/digit_components.dart';
// import 'package:digit_components/models/digit_table_model.dart';
// import 'package:digit_components/widgets/digit_sync_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
//
// import '../../widgets/localized.dart';
// import '../../utils/i18_key_constants.dart' as i18;
//
// class MarkAttendancePage extends LocalizedStatefulWidget {
//   final List<String> attendeeIds;
//   final String registerId;
//   final String tenantId;
//   final DateTime dateTime;
//   final int entryTime;
//   final int exitTime;
//   const MarkAttendancePage({
//     required this.exitTime,
//     required this.entryTime,
//     required this.dateTime,
//     required this.attendeeIds,
//     required this.registerId,
//     required this.tenantId,
//     super.key,
//     super.appLocalizations,
//   });
//
//   @override
//   State<MarkAttendancePage> createState() => _MarkAttendancePageState();
// }
//
// class _MarkAttendancePageState extends State<MarkAttendancePage> {
//   bool isDialogOpen = false;
//   Timer? _debounce;
//   late TextEditingController controller;
//
//   @override
//   void initState() {
//     controller = TextEditingController();
//     controller.addListener(searchByName);
//
//     super.initState();
//   }
//
//   void searchByName() {
//     if (_debounce?.isActive ?? false) _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       if (controller.text.length > 2) {
//       } else if (controller.text.isEmpty) {}
//     });
//   }
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final localizations = AttendanceAppLocalizations.of(context);
//
//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: GestureDetector(
//         onTap: () {
//           FocusManager.instance.primaryFocus?.unfocus();
//         },
//         child: Scaffold(
//           body: BlocListener<MarkAttendanceBloc, MarkAttendanceState>(
//             listener: (context, state) {
//               state.maybeMap(
//                 orElse: () {},
//                 loaded: (value) {
//                   if (value.flagStatus) {
//                     Navigator.of(
//                       context,
//                       rootNavigator: true,
//                     ).popUntil(
//                       (route) => route is! PopupRoute,
//                     );
//                     context.router.popAndPush(
//                       AttendanceAcknowledgementRoute(
//                         enableViewHousehold: true,
//                         secondaryLabel: localizations.translate(
//                           i18.attendance.backToAttendanceManager,
//                         ),
//                         actionLabel: localizations.translate(
//                           i18.acknowledgementSuccess.goToHome,
//                         ),
//                         label: localizations.translate(
//                           i18.acknowledgementSuccess.acknowledgementLabelText,
//                         ),
//                         description: localizations.translate(
//                           i18.acknowledgementSuccess
//                               .acknowledgementDescriptionText,
//                         ),
//                       ),
//                     );
//                   } else {}
//                 },
//                 loading: (value) {
//                   Navigator.of(
//                     context,
//                     rootNavigator: true,
//                   ).popUntil(
//                     (route) => route is! PopupRoute,
//                   );
//                   Loaders.showLoadingDialog(context);
//                 },
//                 error: (value) {
//                   Navigator.of(
//                     context,
//                     rootNavigator: true,
//                   ).popUntil(
//                     (route) => route is! PopupRoute,
//                   );
//                   showErrorDialog(context, localizations, false);
//                 },
//               );
//             },
//             child: BlocBuilder<MarkAttendanceBloc, MarkAttendanceState>(
//               builder: (context, state) {
//                 return BlocBuilder<AttendanceIndividualBloc,
//                     AttendanceIndividualState>(
//                   buildWhen: (p, c) {
//                     return p != c ? true : false;
//                   },
//                   builder: (context, state) {
//                     return state.maybeWhen(
//                       orElse: () {
//                         return const SizedBox.shrink();
//                       },
//                       loaded: (
//                         attendanceSearchModelList,
//                         attendanceCollectionModel,
//                         offsetData,
//                         currentOffset,
//                         countData,
//                         limitData,
//                         flag,
//                       ) {
//                         List<TableDataRow> tableData = [];
//
//                         tableData = attendanceSearchModelList!.isNotEmpty
//                             ? getAttendanceData(attendanceSearchModelList)
//                             : getAttendanceData(attendanceCollectionModel!);
//
//                         return ScrollableContent(
//                           footer: SizedBox(
//                             height: 50,
//                             child: DigitElevatedButton(
//                               onPressed: (widget.dateTime.day ==
//                                       DateTime.now().day)
//                                   ? () {
//                                       FocusManager.instance.primaryFocus
//                                           ?.unfocus();
//                                       if (currentOffset == 0) {
//                                         markConfirmationDialog(
//                                           context.read<MarkAttendanceBloc>(),
//                                           localizations,
//                                         );
//                                       } else {
//                                         showWarningDialog(
//                                           context,
//                                           localizations,
//                                         );
//                                       }
//                                     }
//                                   : () {
//                                       context.router.pop();
//                                     },
//                               child: Text(
//                                 localizations.translate(
//                                   (widget.dateTime.day == DateTime.now().day)
//                                       ? i18.attendance.markAttendance
//                                       : i18.attendance.closeButton,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           header: const BackNavigationHelpHeaderWidget(
//                             showHelp: false,
//                           ),
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child: SizedBox(
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Text(
//                                   localizations.translate(
//                                     i18.attendance.markAttendanceLabel,
//                                   ),
//                                   style: DigitTheme.instance.mobileTheme
//                                       .textTheme.headlineLarge,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child: SizedBox(
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Text(
//                                   DateFormat("dd MMMM yyyy")
//                                       .format(widget.dateTime)
//                                       .toString(),
//                                   style: DigitTheme.instance.mobileTheme
//                                       .textTheme.headlineMedium,
//                                 ),
//                               ),
//                             ),
//                             DigitCard(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   DigitTextField(
//                                     hintText: "Search by Name",
//                                     controller: controller,
//                                     label: '',
//                                     prefixIcon: const Icon(Icons.search),
//                                     isFilled: true,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(bottom: 8.0),
//                                     child: DigitTable(
//                                       height:
//                                           (100.0 + (tableData.length * 53.0)),
//                                       headerList: headerList(
//                                         widget.dateTime,
//                                         localizations,
//                                       ),
//                                       tableData: tableData,
//                                       columnWidth: 100,
//                                       scrollPhysics:
//                                           const NeverScrollableScrollPhysics(),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                       loading: () {
//                         return Center(
//                           child: Loaders.circularLoader(context),
//                         );
//                       },
//                       error: (error) {
//                         return Center(
//                           child: Card(
//                             child: SizedBox(
//                               height: 120,
//                               width: 200,
//                               child: Column(
//                                 children: [
//                                   Icon(
//                                     Icons.error_outline_outlined,
//                                     size: 40,
//                                     color:
//                                         DigitTheme.instance.colorScheme.error,
//                                   ),
//                                   Text(
//                                     "${i18.attendance.somethingWentWrong}!!!",
//                                     style: DigitTheme.instance.mobileTheme
//                                         .textTheme.headlineMedium,
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: SizedBox(
//                                       width: 80,
//                                       height: 40,
//                                       child: DigitElevatedButton(
//                                         child: Text(i18.attendance.retry),
//                                         onPressed: () {
//                                           context
//                                               .read<AttendanceIndividualBloc>()
//                                               .add(
//                                                 AttendanceIndividualLogSearchEvent(
//                                                   attendeeId:
//                                                       widget.attendeeIds,
//                                                   limit: 10,
//                                                   offset: 0,
//                                                   currentDate: widget.dateTime
//                                                       .millisecondsSinceEpoch,
//                                                   entryTime: widget.entryTime,
//                                                   exitTime: widget.exitTime,
//                                                   projectId: context.projectId,
//                                                   registerId: widget.registerId,
//                                                   tenantId: widget.tenantId,
//                                                 ),
//                                               );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<dynamic> showErrorDialog(BuildContext context, dynamic k, bool retry) {
//     return showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: SizedBox(
//             height: 200,
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline_outlined,
//                     size: 40,
//                     color: DigitTheme.instance.colorScheme.error,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 8.0,
//                       bottom: 8.0,
//                     ),
//                     child: Text(
//                       "${i18.attendance.somethingWentWrong} \n ${i18.attendance.pleaseTryAgain}!!",
//                       style: DigitTheme
//                           .instance.mobileTheme.textTheme.headlineMedium,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 100,
//                     height: 40,
//                     child: DigitElevatedButton(
//                       onPressed: retry
//                           ? () {
//                               Navigator.of(context).pop();
//                               context.read<AttendanceIndividualBloc>().add(
//                                     AttendanceIndividualLogSearchEvent(
//                                       attendeeId: widget.attendeeIds,
//                                       limit: 10,
//                                       offset: 0,
//                                       currentDate: widget
//                                           .dateTime.millisecondsSinceEpoch,
//                                       entryTime: widget.entryTime,
//                                       exitTime: widget.exitTime,
//                                       projectId: context.projectId,
//                                       registerId: widget.registerId,
//                                       tenantId: widget.tenantId,
//                                     ),
//                                   );
//                             }
//                           : () {
//                               Navigator.of(context).pop();
//                             },
//                       child: Text(
//                         k.translate(
//                           retry
//                               ? i18.attendance.retryButton
//                               : i18.attendance.closeButton,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   List<TableDataRow> getAttendanceData(List<AttendeeCollectionModel>? list) {
//     return list!.map((e) => getAttendanceRow(e)).toList();
//   }
//
//   TableDataRow getAttendanceRow(AttendeeCollectionModel tableDataModel) {
//     return TableDataRow([
//       TableData(
//         label: tableDataModel.name,
//         apiKey: tableDataModel.name,
//       ),
//       TableData(
//         label: tableDataModel.userName,
//         apiKey: tableDataModel.userName,
//       ),
//       TableData(
//         apiKey: tableDataModel.status.toString(),
//         widget: CircularButton(
//           icon: Icons.circle_rounded,
//           size: 15,
//           viewOnly: false,
//           color: const Color.fromRGBO(0, 100, 0, 1),
//           index: double.parse(tableDataModel.status.toString()) ?? -1,
//           isNotGreyed: false,
//           onTap: (widget.dateTime.day == DateTime.now().day)
//               ? () {
//                   context.read<AttendanceIndividualBloc>().add(
//                         AttendanceMarkEvent(
//                           individualId: tableDataModel.individualId!,
//                           registarId: tableDataModel!.registerId!,
//                           status: tableDataModel.individualId,
//                           id: tableDataModel.id!,
//                         ),
//                       );
//                 }
//               : null,
//         ),
//       ),
//     ]);
//   }
//
//   List<TableHeader> headerList(DateTime s, AppLocalizations localizations) {
//     return [
//       TableHeader(
//         localizations.translate(i18.attendance.tableHeaderName),
//         cellKey: 'name',
//       ),
//       TableHeader(
//         localizations.translate(i18.attendance.tableHeaderUserId),
//         cellKey: "userId",
//       ),
//       TableHeader(
//         //DateFormat("dd MMMM yyyy").format(s).toString(),
//         localizations.translate(i18.attendance.tableHeaderAttendance),
//         cellKey: 'date',
//       ),
//     ];
//   }
//
//   Future<dynamic> showWarningDialog(BuildContext context, dynamic k) {
//     return showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: SizedBox(
//             height: 200,
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.warning_outlined,
//                     size: 40,
//                     color: DigitTheme.instance.colorScheme.error,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 8.0,
//                       bottom: 8.0,
//                     ),
//                     child: Text(
//                       k.translate(
//                         i18.attendance.checkAttendanceMark,
//                       ),
//                       //"Please Make sure that all attendees are marked attendance",
//                       style: DigitTheme
//                           .instance.mobileTheme.textTheme.headlineMedium,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 100,
//                     height: 40,
//                     child: DigitElevatedButton(
//                       child: Text(
//                         k.translate(
//                           i18.attendance.closeButton,
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<dynamic> markConfirmationDialog(
//     MarkAttendanceBloc data,
//     dynamic k,
//   ) async {
//     return showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Card(
//             child: SizedBox(
//               height: 250,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 4.0,
//                       bottom: 8.0,
//                     ),
//                     child: Text(
//                       k.translate(i18.attendance.confirmationLabel),
//                       style: DigitTheme
//                           .instance.mobileTheme.textTheme.headlineMedium,
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 4.0,
//                       bottom: 4.0,
//                     ),
//                     child: Text(
//                       k.translate(i18.attendance.confirmationDesc),
//                       // "The Attendance details for the Session have been pre-populated.Please confirm before submitting.",
//                       style:
//                           DigitTheme.instance.mobileTheme.textTheme.bodyMedium,
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 4.0,
//                       bottom: 8.0,
//                     ),
//                     child: Text(
//                       k.translate(i18.attendance.confirmationDescNote),
//                       // "Note: You can not edit attendance details for the past days",
//                       style:
//                           DigitTheme.instance.mobileTheme.textTheme.bodyMedium,
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 100,
//                     height: 40,
//                     child: DigitElevatedButton(
//                       child: Text(
//                         k.translate(i18.attendance.proceed),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                         data.add(
//                           UploadAttendanceMarkEvent(
//                             entryTime: widget.entryTime,
//                             exitTime: widget.exitTime,
//                             projectId: context.projectId,
//                             registarId: widget.registerId,
//                             status: 1,
//                             tenantId: widget.tenantId,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(
//                       k.translate(i18.attendance.goBackButton),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
