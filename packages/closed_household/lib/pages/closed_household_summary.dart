import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/closed_household.dart';
import 'package:closed_household/models/entities/action.dart';
import 'package:closed_household/models/entities/status.dart';
import 'package:closed_household/models/entities/user_action.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:closed_household/utils/extensions/extensions.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/details_card.dart';
import 'package:digit_data_model/data_model.dart';
import '../../models/entities/action.dart' as action;
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
      _ClosedHouseholdSummaryPageState();
}

class _ClosedHouseholdSummaryPageState
    extends LocalizedState<ClosedHouseholdSummaryPage> {
  String getLocalizedMessage(String code) {
    return localizations.translate(code);
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            //[TODO: Add the route to auto_route]
                            MaterialPageRoute(
                              builder: (context) => const DigitScannerPage(
                                quantity: 1,
                                isGS1code: false,
                                singleValue: true,
                                isEditEnabled: true,
                              ),
                              settings:
                                  const RouteSettings(name: '/qr-scanner'),
                            ),
                          );
                        },
                        child: Container(
                          color: const DigitColors().seaShellGray,
                          padding: const EdgeInsets.symmetric(
                              vertical: kPadding, horizontal: kPadding * 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner,
                                color: const DigitColors().burningOrange,
                                size: kPadding * 3,
                              ),
                              const SizedBox(
                                width: kPadding,
                              ),
                              Flexible(
                                child: Text(
                                  localizations.translate(i18.closeHousehold
                                      .closeHouseholdVoucherScannerLabel),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color:
                                            const DigitColors().burningOrange,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      DigitElevatedButton(
                        onPressed: () {
                          final userAction = UserActionModel(
                            action: action.Actions.closeHousehold.toValue(),
                            projectId: ClosedHouseholdSingleton().projectId,
                            status: Status.closeHousehold.toValue(),
                            tenantId: ClosedHouseholdSingleton().tenantId,
                            clientReferenceId: IdGen.i.identifier,
                            latitude: householdState.summary?.latitude,
                            longitude: householdState.summary?.longitude,
                            boundary: ClosedHouseholdSingleton().boundary?.code,
                            locationAccuracy:
                                householdState.summary?.locationAccuracy,
                            additionalFields:
                                householdState.summary?.additionalFields,
                            beneficiaryTag: scannerState.qrCodes.first,
                            clientAuditDetails: ClientAuditDetails(
                              createdBy:
                                  ClosedHouseholdSingleton().loggedInUserUuid!,
                              createdTime: context.millisecondsSinceEpoch(),
                            ),
                            auditDetails: AuditDetails(
                              createdBy:
                                  ClosedHouseholdSingleton().loggedInUserUuid!,
                              createdTime: context.millisecondsSinceEpoch(),
                            ),
                          );
                          context.read<ClosedHouseholdBloc>().add(
                              ClosedHouseholdEvent.handleSubmit(
                                  userAction, false));
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
                            value: (DigitDateUtils.getDateFromTimestamp(DateTime.now().millisecondsSinceEpoch)).toString(),
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
                            value: householdState
                                    .summary?.additionalFields?.fields
                                    .where((h) => h.key == 'householdHead')
                                    .firstOrNull
                                    ?.value ??
                                localizations
                                    .translate(i18.common.coreCommonNA),
                          ),
                          LabelValuePair(
                            label: localizations.translate(i18
                                .closeHousehold.closeHouseholdGpsAccuracyLabel),
                            value: householdState.summary?.locationAccuracy
                                    .toString() ??
                                localizations
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
                      return Container(); // Return an empty container if qrCodes is empty
                    }
                  }),
                ],
              ),
            )
          ]));
    });
  }
}
