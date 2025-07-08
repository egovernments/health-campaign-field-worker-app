// import 'package:auto_route/auto_route.dart';
// import 'package:digit_ui_components/enum/app_enums.dart';
// import 'package:digit_ui_components/theme/spacers.dart';
// import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
// import 'package:flutter/material.dart';
// import 'package:inventory_management/blocs/record_stock.dart';
// import 'package:inventory_management/models/entities/stock.dart';
// import 'package:inventory_management/router/inventory_router.gm.dart';
// import 'package:inventory_management/widgets/localized.dart';
// import '../../../utils/i18_key_constants.dart' as i18;

// @RoutePage()
// class StockAcknowledgementPage extends LocalizedStatefulWidget {
//   final String mrnNumber;
//   final List<StockModel> stockRecords;
//   final StockRecordEntryType entryType;

//   const StockAcknowledgementPage({
//     super.key,
//     super.appLocalizations,
//     required this.mrnNumber,
//     required this.stockRecords,
//     required this.entryType,
//   });

//   @override
//   State<StockAcknowledgementPage> createState() =>
//       StockAcknowledgementPageState();
// }

// class StockAcknowledgementPageState
//     extends LocalizedState<StockAcknowledgementPage> {
//   @override
//   Widget build(BuildContext context) {
//     var showLabel =
//         localizations.translate(i18.acknowledgementSuccess.mrnNumberLabel);
//     var showDescription = localizations
//         .translate(i18.acknowledgementSuccess.mrrnNumberDescription);
//     var showHeading =
//         localizations.translate(i18.acknowledgementSuccess.mrrnNumberHeading);

//     if (widget.entryType == StockRecordEntryType.dispatch && context.isCDD) {
//       showLabel =
//           localizations.translate(i18.acknowledgementSuccess.mrnNumberLabel);
//       showDescription = localizations
//           .translate(i18.acknowledgementSuccess.mrnNumberDescription);
//       showHeading =
//           localizations.translate(i18.acknowledgementSuccess.mrnNumberHeading);
//     } else if (widget.entryType == StockRecordEntryType.dispatch) {
//       showLabel =
//           localizations.translate(i18.acknowledgementSuccess.minNumberLabel);
//       showDescription = localizations
//           .translate(i18.acknowledgementSuccess.minNumberDescription);
//       showHeading =
//           localizations.translate(i18.acknowledgementSuccess.minNumberHeading);
//     } else if (widget.entryType == StockRecordEntryType.returned) {
//       showLabel =
//           localizations.translate(i18.acknowledgementSuccess.mrnNumberLabel);
//       showDescription = localizations
//           .translate(i18.acknowledgementSuccess.mrnNumberDescription);
//       showHeading =
//           localizations.translate(i18.acknowledgementSuccess.mrnNumberHeading);
//     }

//     Map<String, String> mrnnumber = {
//       'id': showLabel,
//       'value': widget.mrnNumber
//     };
//     return PopScope(
//       canPop: false,
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(spacer2),
//           child: CustomPanelCard(
//             type: PanelType.success,
//             subTitle: mrnnumber,
//             title: showHeading,
//             description: showDescription,
//             actions: [
//               DigitButton(
//                 label: localizations.translate(
//                   i18.acknowledgementSuccess.viewtransactions,
//                 ),
//                 onPressed: () {
//                   context.router.push(
//                     ViewStockRecordsRoute(
//                       mrnNumber: widget.mrnNumber,
//                       stockRecords: widget.stockRecords,
//                     ),
//                   );
//                 },
//                 type: DigitButtonType.primary,
//                 size: DigitButtonSize.large,
//               ),
//               DigitButton(
//                 label: localizations.translate(
//                   i18.acknowledgementSuccess.createNewTransactions,
//                 ),
//                 onPressed: () {
//                   // context
//                   //     .read<RecordStockBloc>()
//                   //     .add(const RecordStockEvent.reset());
//                   context.router.popUntilRouteWithName(ManageStocksRoute.name);
//                 },
//                 type: DigitButtonType.secondary,
//                 size: DigitButtonSize.large,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
