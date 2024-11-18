import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_form/survey_form.dart';

import '../router/survey_form_router.gm.dart';
import '../utils/constants.dart';
import '../widgets/action_card.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/no_result_card.dart';

@RoutePage()
class SurveyformPage extends LocalizedStatefulWidget {
  const SurveyformPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<SurveyformPage> createState() => SurveyFormPageState();
}

class SurveyFormPageState extends State<SurveyformPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = SurveyFormLocalization.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
            builder: (context, state) {
              return state.map(
                empty: (value) => Text(localizations.translate(
                  i18.surveyForm.noSurveyFormFound,
                ),),
                isloading: (value) => const Center(
                  child: CircularProgressIndicator(),
                ),
                serviceDefinitionFetch:
                    (ServiceDefinitionServiceFetchedState value) {
                      final values = value.serviceDefinitionList.where(
                              (item) =>
                          !SurveyFormSingleton().roles
                              .indexOf(
                            item.code!.split('.').lastOrNull!,
                          )
                              .isNegative &&
                              !item.code!.contains(Constants
                                  .healthFacilitySurveyFormPrefix) &&
                              (item.code ?? '').contains(
                                  SurveyFormSingleton().projectName));

                      if (values.isEmpty) {
                        return Column(
                          children: [
                            NoResultCard(
                              align: Alignment.center,
                              label: localizations.translate(
                                i18.common.noResultsFound,
                              ),
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: values
                            .map((e) => DigitProjectCell(
                          projectText: localizations
                              .translate('${e.code}'),
                          onTap: () {
                            context
                                .read<ServiceDefinitionBloc>()
                                .add(
                              ServiceDefinitionSelectionEvent(
                                serviceDefinition: e,
                              ),
                            );
                            DigitActionDialog.show(
                              context,
                              widget: ActionCard(items: [
                                ActionCardModel(
                                  icon: Icons.edit_calendar,
                                  label: localizations.translate(i18
                                      .surveyForm
                                      .surveyFormCreateActionLabel),
                                  action: () {
                                    context.router.push(
                                      SurveyFormBoundaryViewRoute(),
                                    );
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                  },
                                ),
                                ActionCardModel(
                                  icon: Icons.visibility,
                                  label: localizations.translate(i18
                                      .surveyForm
                                      .surveyFormViewActionLabel),
                                  action: () {
                                    context
                                        .read<ServiceBloc>()
                                        .add(
                                      ServiceSearchEvent(
                                        serviceSearchModel:
                                        ServiceSearchModel(
                                          id: e.id,
                                        ),
                                      ),
                                    );
                                    context.router.push(
                                      SurveyFormPreviewRoute(),
                                    );
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                  },
                                ),
                              ]),
                            );
                          },
                        ))
                            .toList(),
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
