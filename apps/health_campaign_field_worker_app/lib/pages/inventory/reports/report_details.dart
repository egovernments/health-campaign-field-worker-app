import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/inventory_report/inventory_report.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class InventoryReportDetailsPage extends LocalizedStatefulWidget
    with AutoRouteWrapper {
  final InventoryReportType reportType;

  const InventoryReportDetailsPage({
    Key? key,
    super.appLocalizations,
    required this.reportType,
  }) : super(key: key);

  @override
  State<InventoryReportDetailsPage> createState() =>
      _InventoryReportDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => InventoryReportBloc()
        ..add(
          InventoryReportLoadDataEvent(
            reportType: reportType,
          ),
        ),
      child: this,
    );
  }
}

class _InventoryReportDetailsPageState
    extends LocalizedState<InventoryReportDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InventoryReportBloc, InventoryReportState>(
        builder: (context, inventoryReportState) {
          return ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            mainAxisAlignment: MainAxisAlignment.start,
            footer: DigitCard(
              margin: EdgeInsets.zero,
              child: DigitElevatedButton(
                onPressed: () => context.router.popUntilRoot(),
                child: Text(
                  i18.inventoryReportDetails.backToHomeButtonLabel,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
            children: [
              if (inventoryReportState.loading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: _ReportDetailsContent(title: 'Report Details'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ReportDetailsContent extends StatelessWidget {
  final String title;

  const _ReportDetailsContent({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
