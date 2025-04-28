import 'package:auto_route/annotations.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:survey_form/survey_form.dart';

import '../utils/constants.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
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
        enableFixedDigitButton: true,
        footer: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Offstage(),
              serviceSearch: (value1, value2, value3) {
                return value2 != null
                    ? DigitCard(
                        cardType: CardType.primary,
                        margin: const EdgeInsets.only(top: spacer2),
                        children: [
                            DigitButton(
                              mainAxisSize: MainAxisSize.max,
                              label: localizations
                                  .translate(i18.common.corecommonclose),
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
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
                            children: [
                              ...serviceList
                                  .map((e) => e.serviceDefId != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.all(spacer2),
                                          child: DigitCard(
                                              cardType: CardType.primary,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    DateFormat(Constants
                                                            .SurveyFormPreviewDateFormat)
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
                                                    DigitButton(
                                                      label: localizations
                                                          .translate(
                                                        i18.searchBeneficiary
                                                            .iconLabel,
                                                      ),
                                                      type: DigitButtonType
                                                          .secondary,
                                                      size: DigitButtonSize
                                                          .medium,
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
                                              ]),
                                        )
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
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(spacer2),
                                          child: Text(
                                            localizations.translate(
                                              item2?.code ?? '',
                                            ),
                                            style: textTheme.headingXl,
                                          ),
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
                                                  const EdgeInsets.all(spacer2),
                                              child: Align(
                                                alignment: AlignmentDirectional
                                                    .topStart,
                                                child:
                                                    LabelValueSummary(items: [
                                                  LabelValueItem(
                                                    label:
                                                        localizations.translate(
                                                      "${item2?.code ?? ''}.${e.attributeCode!}",
                                                    ),
                                                    value: e.dataType ==
                                                            'SingleValueList'
                                                        ? localizations
                                                            .translate(
                                                            '${item2?.code ?? ''}.${e.value.toString().toUpperCase()}',
                                                          )
                                                        : e.value ?? "",
                                                    isInline: false,
                                                  ),
                                                  if (e.additionalDetails !=
                                                          '' &&
                                                      e.additionalDetails !=
                                                          null) ...[
                                                    LabelValueItem(
                                                      label: localizations
                                                          .translate(
                                                        "${item2?.code ?? ''}.${e.attributeCode!}.ADDITIONAL_FIELD",
                                                      ),
                                                      value: localizations
                                                          .translate(
                                                        e.additionalDetails,
                                                      ),
                                                      isInline: false,
                                                      labelTextStyle:
                                                          textTheme.bodyL,
                                                    )
                                                  ]
                                                ]),
                                              ),
                                            ),
                                          )
                                    ].toList(),
                                  ),
                                ]);
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
