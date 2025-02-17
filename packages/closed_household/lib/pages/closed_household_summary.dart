import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/closed_household.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';

@RoutePage()
class ClosedHouseholdSummaryPage extends LocalizedStatefulWidget {
  const ClosedHouseholdSummaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ClosedHouseholdSummaryPage> createState() =>
      ClosedHouseholdSummaryPageState();
}

class ClosedHouseholdSummaryPageState
    extends LocalizedState<ClosedHouseholdSummaryPage> {
  String getLocalizedMessage(String code) {
    return localizations.translate(code);
  }

  @override
  void initState() {
    context
        .read<DigitScannerBloc>()
        .add(const DigitScannerEvent.handleScanner(qrCode: [], barCode: []));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocBuilder<ClosedHouseholdBloc, ClosedHouseholdState>(
        builder: (context, householdState) {
      return Scaffold(
          body: ScrollableContent(
              enableFixedDigitButton: true,
              header: const BackNavigationHelpHeaderWidget(
                showHelp: false,
              ),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    BlocBuilder<DigitScannerBloc, DigitScannerState>(
                        builder: (context, scannerState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DigitButton(
                            size: DigitButtonSize.large,
                            type: DigitButtonType.secondary,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () {
                              Navigator.of(context).push(
                                // [TODO: Add the route to auto_route]
                                MaterialPageRoute(
                                  builder: (context) => const DigitScannerPage(
                                    quantity: 1,
                                    isGS1code: false,
                                    singleValue: true,
                                  ),
                                  settings:
                                      const RouteSettings(name: '/qr-scanner'),
                                ),
                              );
                            },
                            prefixIcon: Icons.qr_code,
                            label: localizations.translate(i18.closeHousehold
                                .closeHouseholdVoucherScannerLabel),
                          ),
                          SizedBox(
                            height: theme.spacerTheme.spacer3,
                          ),
                          DigitButton(
                            size: DigitButtonSize.large,
                            type: DigitButtonType.primary,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () {
                              context.read<ClosedHouseholdBloc>().add(
                                  ClosedHouseholdEvent.handleSubmit(
                                      context: context,
                                      householdHeadName:
                                          householdState.householdHeadName,
                                      locationAccuracy:
                                          householdState.locationAccuracy,
                                      longitude: householdState.longitude,
                                      latitude: householdState.latitude,
                                      tag: scannerState.qrCodes.isNotEmpty
                                          ? scannerState.qrCodes.first
                                          : null));

                              ///clear the scanner
                              context.router
                                  .push(ClosedHouseholdAcknowledgementRoute());
                            },
                            label: localizations
                                .translate(i18.common.coreCommonSubmit),
                          ),
                        ],
                      );
                    }),
                  ]),
              slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  DigitCard(margin: const EdgeInsets.all(spacer2), children: [
                    LabelValueSummary(
                        padding: EdgeInsets.zero,
                        heading: localizations.translate(
                            i18.closeHousehold.closeHouseholdSummaryLabel),
                        headingStyle: textTheme.headingXl.copyWith(
                            color: theme.colorTheme.primary.primary2
                        ),
                        withDivider: false,
                        items: [
                          LabelValueItem(
                            label: localizations.translate(
                                i18.closeHousehold.closeHouseholdDate),
                            value: (DigitDateUtils.getDateFromTimestamp(
                                    DateTime.now().millisecondsSinceEpoch,
                                    dateFormat: 'dd MMM yyyy'))
                                .toString(),
                            labelFlex: 5,
                            padding: const EdgeInsets.only(bottom: spacer2),
                          ),
                          LabelValueItem(
                            label: localizations.translate(
                                i18.closeHousehold.closeHouseholdVillageName),
                            value: localizations.translate(
                                ClosedHouseholdSingleton()
                                    .boundary!
                                    .code
                                    .toString()),
                            labelFlex: 5,
                          ),
                          LabelValueItem(
                            label: localizations.translate(
                                i18.closeHousehold.closeHouseholdHeadName),
                            value: householdState.householdHeadName ??
                                localizations
                                    .translate(i18.common.coreCommonNA),
                            labelFlex: 5,
                          ),
                          LabelValueItem(
                            label: localizations.translate(i18
                                .closeHousehold.closeHouseholdGpsAccuracyLabel),
                            value:
                                '${householdState.locationAccuracy.toStringAsFixed(2)} ${localizations.translate(i18.common.coreCommonMeters)}',
                            labelFlex: 5,
                            padding: const EdgeInsets.only(top: spacer2),
                          ),
                        ]),
                  ]),
                  BlocBuilder<DigitScannerBloc, DigitScannerState>(
                      builder: (context, state) {
                    if (state.qrCodes.isNotEmpty) {
                      return DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          children: [
                            LabelValueSummary(
                              padding: EdgeInsets.zero,
                              heading: localizations.translate(i18
                                  .closeHousehold
                                  .closeHouseholdVoucherSummaryLabel),
                              headingStyle: textTheme.headingXl.copyWith(
                                  color: theme.colorTheme.primary.primary2
                              ),
                              withDivider: false,
                              items: [
                                LabelValueItem(
                                  label: localizations.translate(i18
                                      .closeHousehold
                                      .closeHouseholdVoucherCodeLabel),
                                  value: state.qrCodes.first,
                                  labelFlex: 5,
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ]);
                    } else {
                      return const SizedBox();
                    }
                  }),
                ],
              ),
            )
          ]));
    });
  }
}
