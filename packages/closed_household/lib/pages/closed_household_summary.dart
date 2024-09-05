import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/closed_household.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/details_card.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/showcase/showcase_button.dart';

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
    return BlocBuilder<ClosedHouseholdBloc, ClosedHouseholdState>(
        builder: (context, householdState) {
      return Scaffold(
          body: ScrollableContent(
              enableFixedButton: true,
              header: const BackNavigationHelpHeaderWidget(
                showHelp: false,
                showcaseButton: ShowcaseButton(),
              ),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding:
                    const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
                child: BlocBuilder<DigitScannerBloc, DigitScannerState>(
                    builder: (context, scannerState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DigitOutlineIconButton(
                        buttonStyle: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
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
                        icon: Icons.qr_code,
                        label: localizations.translate(i18
                            .closeHousehold.closeHouseholdVoucherScannerLabel),
                      ),
                      DigitElevatedButton(
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
                        child: Center(
                          child: Text(
                            localizations
                                .translate(i18.common.coreCommonSubmit),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  DigitCard(
                    child: LabelValueList(
                        heading: localizations.translate(
                            i18.closeHousehold.closeHouseholdSummaryLabel),
                        withDivider: false,
                        items: [
                          LabelValuePair(
                            label: localizations.translate(
                                i18.closeHousehold.closeHouseholdDate),
                            value: (DigitDateUtils.getDateFromTimestamp(
                                    DateTime.now().millisecondsSinceEpoch,
                                    dateFormat: 'dd MMM yyyy'))
                                .toString(),
                          ),
                          LabelValuePair(
                            label: localizations.translate(
                                i18.closeHousehold.closeHouseholdVillageName),
                            value: ClosedHouseholdSingleton()
                                .boundary!
                                .name
                                .toString(),
                          ),
                          LabelValuePair(
                            label: localizations.translate(
                                i18.closeHousehold.closeHouseholdHeadName),
                            value: householdState.householdHeadName ??
                                localizations
                                    .translate(i18.common.coreCommonNA),
                          ),
                          LabelValuePair(
                            label: localizations.translate(i18
                                .closeHousehold.closeHouseholdGpsAccuracyLabel),
                            value: householdState.locationAccuracy != null
                                ? '${householdState.locationAccuracy.toStringAsFixed(2)} ${localizations.translate(i18.common.coreCommonMeters)}'
                                : localizations
                                    .translate(i18.common.coreCommonNA),
                          ),
                        ]),
                  ),
                  BlocBuilder<DigitScannerBloc, DigitScannerState>(
                      builder: (context, state) {
                    if (state.qrCodes.isNotEmpty) {
                      return DigitCard(
                        child: LabelValueList(
                          heading: localizations.translate(i18.closeHousehold
                              .closeHouseholdVoucherSummaryLabel),
                          withDivider: false,
                          items: [
                            LabelValuePair(
                              label: localizations.translate(i18.closeHousehold
                                  .closeHouseholdVoucherCodeLabel),
                              value: state.qrCodes.first,
                            ),
                          ],
                        ),
                      );
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
