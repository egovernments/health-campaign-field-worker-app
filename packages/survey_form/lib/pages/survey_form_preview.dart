import 'package:auto_route/annotations.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:survey_form/survey_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/constants.dart';
import '../widgets/no_result_card.dart';

@RoutePage()
class SurveyFormPreviewPage extends LocalizedStatefulWidget {
  const SurveyFormPreviewPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<SurveyFormPreviewPage> createState() => SurveyFormPreviewPageState();
}

class SurveyFormPreviewPageState extends LocalizedState<SurveyFormPreviewPage> {
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
              serviceSearch: (value1, value2, value3) {
                return value2 != null
                    ? DigitCard(
                        cardType: CardType.primary,
                        margin: const EdgeInsets.only(top: spacer2),
                        padding: const EdgeInsets.all(spacer2),
                        children: [
                            Button(
                              mainAxisSize: MainAxisSize.max,
                              label: localizations
                                  .translate(i18.common.corecommonclose),
                              type: ButtonType.primary,
                              size: ButtonSize.large,
                              onPressed: () {
                                context.read<ServiceBloc>().add(
                                      ServiceResetEvent(serviceList: value1),
                                    );
                              },
                            ),
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
              serviceSearch: (serviceList, selectedService, loading) {
                return selectedService == null
                    ? serviceList.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...serviceList
                                  .map((e) => e.serviceDefId != null
                                      ? DigitCard(
                                          cardType: CardType.primary,
                                          children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  DateFormat(Constants.SurveyFormPreviewDateFormat)
                                                      .format(
                                                    DateFormat(Constants
                                                            .defaultDateFormat)
                                                        .parse(
                                                      e.createdAt.toString(),
                                                    ),
                                                  ),
                                                  style: textTheme.headingXl,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      localizations.translate(
                                                        '${e.tenantId}',
                                                      ),
                                                    ),
                                                  ),
                                                  Button(
                                                    label: localizations.translate(
                                                      i18.searchBeneficiary
                                                          .iconLabel,
                                                    ),
                                                    type: ButtonType.secondary,
                                                    size: ButtonSize.medium,
                                                    onPressed: () {
                                                      context
                                                          .read<ServiceBloc>()
                                                          .add(
                                                            ServiceSelectionEvent(
                                                              service: e,
                                                            ),
                                                          );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ])
                                      : const Offstage())
                                  .toList(),
                            ],
                          )
                        : Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: NoResultCard(
                                  align: Alignment.center,
                                  label: localizations.translate(
                                      i18.surveyForm.noSurveyFormFound),
                                ),
                              ),
                            ),
                          )
                    : BlocBuilder<ServiceDefinitionBloc,
                        ServiceDefinitionState>(builder: (context, state) {
                        return state.maybeWhen(
                          serviceDefinitionFetch: (
                            item1,
                            item2,
                          ) {
                            return DigitCard(
                              cardType: CardType.primary,
                              children: [Column(
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
                                          theme.textTheme.displayMedium,
                                    ),
                                  ),
                                  ...(selectedService.attributes ?? [])
                                      .where((a) =>
                                          a.value !=
                                              i18.surveyForm
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
                                                alignment:
                                                    Alignment.centerLeft,
                                                child: Text(
                                                  localizations.translate(
                                                    "${item2?.code ?? ''}.${e.attributeCode!}",
                                                  ),
                                                  style: theme.textTheme
                                                      .headlineSmall,
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets
                                                        .only()
                                                    .copyWith(
                                                  top: spacer2,
                                                  bottom: spacer2,
                                                ),
                                                child: Align(
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  child: Text(
                                                    e.dataType ==
                                                            'SingleValueList'
                                                        ? localizations
                                                            .translate(
                                                            'CORE_COMMON_${e.value.toString().toUpperCase()}',
                                                          )
                                                        : e.value ?? "",
                                                  ),
                                                ),
                                              ),
                                              e.additionalDetails != '' &&
                                                      e.additionalDetails !=
                                                          null
                                                  ? Container(
                                                      margin:
                                                          const EdgeInsets
                                                                  .only()
                                                              .copyWith(
                                                        top: spacer2,
                                                        bottom: spacer2,
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
                              ),]
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
