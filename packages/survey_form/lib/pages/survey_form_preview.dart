import 'package:auto_route/annotations.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
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
                        child: DigitElevatedButton(
                          onPressed: () {
                            context.read<ServiceBloc>().add(
                                  ServiceResetEvent(serviceList: value1),
                                );
                          },
                          child: Text(
                            localizations.translate(i18.common.corecommonclose),
                          ),
                        ),
                      )
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
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  DateFormat(Constants.SurveyFormPreviewDateFormat)
                                                      .format(
                                                    DateFormat(Constants.defaultDateFormat)
                                                        .parse(
                                                      e.createdAt.toString(),
                                                    ),
                                                  ),
                                                  style: theme
                                                      .textTheme.headlineMedium,
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
                                                  DigitOutLineButton(
                                                    label:
                                                        localizations.translate(
                                                      i18.searchBeneficiary
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
                                                    buttonStyle: OutlinedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
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
                              child: Column(
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
                                                        top: kPadding,
                                                        bottom: kPadding,
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          e.dataType ==
                                                                  'SingleValueList'
                                                              ? localizations
                                                                  .translate(
                                                                  '${item2?.code ?? ''}.${e.value.toString().toUpperCase()}',
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
                                                              top: kPadding,
                                                              bottom: kPadding,
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
                              ),
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
