import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:referral_reconciliation/utils/constants.dart';
import 'package:survey_form/survey_form.dart';

import '../../blocs/referral_recon_service_definition.dart';
import '../../router/referral_reconciliation_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class ReferralReasonChecklistPreviewPage extends LocalizedStatefulWidget {
  const ReferralReasonChecklistPreviewPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ReferralReasonChecklistPreviewPage> createState() =>
      _ReferralReasonChecklistPreviewPageState();
}

class _ReferralReasonChecklistPreviewPageState
    extends LocalizedState<ReferralReasonChecklistPreviewPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        footer: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Offstage(),
              serviceSearch: (serviceList, selectedService, loading) {
                return selectedService != null
                    ? DigitCard(
                        cardType: CardType.primary,
                        padding: EdgeInsets.all(theme.spacerTheme.spacer2),
                        children: [
                            DigitButton(
                              size: DigitButtonSize.large,
                              label: localizations
                                  .translate(i18.common.corecommonclose),
                              mainAxisSize: MainAxisSize.max,
                              onPressed: () {
                                context.read<ServiceBloc>().add(
                                      ServiceResetEvent(
                                          serviceList: serviceList),
                                    );
                                context.router.popUntil((route) =>
                                    route.settings.name ==
                                    SearchReferralReconciliationsRoute.name);
                                context.router.maybePop();
                              },
                              type: DigitButtonType.primary,
                            )
                          ])
                    : const Offstage();
              },
            );
          },
        ),
        children: [
          BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Offstage(),
              serviceSearch: (value1, value2, value3) {
                return value2 == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...value1.map((e) => e.serviceDefId != null
                              ? DigitCard(
                                  margin:
                                      EdgeInsets.all(theme.spacerTheme.spacer2),
                                  cardType: CardType.primary,
                                  children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              DateFormat(defaultDateFormat)
                                                  .format(
                                                DateFormat(defaultDateFormat)
                                                    .parse(
                                                  e.createdAt.toString(),
                                                ),
                                              ),
                                              style: textTheme.headingM,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  localizations.translate(
                                                    '${e.tenantId}',
                                                  ),
                                                ),
                                              ),
                                              DigitButton(
                                                label: localizations.translate(
                                                  i18.referralReconciliation
                                                      .iconLabel,
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceSelectionEvent(
                                                          service: e,
                                                        ),
                                                      );
                                                },
                                                type: DigitButtonType.secondary,
                                                size: DigitButtonSize.large,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ])
                              : const Offstage()),
                        ],
                      )
                    : BlocBuilder<ReferralReconServiceDefinitionBloc,
                            ReferralReconServiceDefinitionState>(
                        builder: (context, state) {
                        return state.maybeWhen(
                          serviceDefinitionFetch: (
                            item1,
                            item2,
                          ) {
                            return DigitCard(
                              cardType: CardType.primary,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              localizations.translate(
                                                item2?.code ?? '',
                                              ),
                                              style:
                                                  textTheme.headingXl,
                                            ),
                                          ),
                                          ...(value2.attributes ?? [])
                                              .where((a) =>
                                                  a.value !=
                                                      i18.checklist
                                                          .notSelectedKey &&
                                                  a.value != '')
                                              .map(
                                                (e) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          localizations
                                                              .translate(
                                                            "${item2?.code ?? ''}.${e.attributeCode!}",
                                                          ),
                                                          style: textTheme.headingS,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only()
                                                            .copyWith(
                                                          top: theme.spacerTheme
                                                              .spacer2,
                                                          bottom: theme
                                                              .spacerTheme
                                                              .spacer2,
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            e.dataType ==
                                                                    'SingleValueList'
                                                                ? localizations
                                                                    .translate(
                                                                    e.value
                                                                        .toString()
                                                                        .toUpperCase(),
                                                                  )
                                                                : e.value ?? "",
                                                          ),
                                                        ),
                                                      ),
                                                      e.additionalDetails !=
                                                                  '' &&
                                                              e.additionalDetails !=
                                                                  null
                                                          ? Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only()
                                                                      .copyWith(
                                                                top: theme
                                                                    .spacerTheme
                                                                    .spacer2,
                                                                bottom: theme
                                                                    .spacerTheme
                                                                    .spacer2,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      localizations
                                                                          .translate(
                                                                        "${item2?.code ?? ''}.${e.attributeCode!}.ADDITIONAL_FIELD",
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      localizations
                                                                          .translate(
                                                                        e.additionalDetails,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : const Offstage(),
                                                      const DigitDivider(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                        ].toList(),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                          orElse: () => const Offstage(),
                        );
                      });
              },
            );
          }),
        ],
      ),
    );
  }
}
