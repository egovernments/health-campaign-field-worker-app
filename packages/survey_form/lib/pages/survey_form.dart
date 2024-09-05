import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/helper_widget/button_list.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_form/survey_form.dart';

import '../router/survey_form_router.gm.dart';
import '../utils/constants.dart';
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
  ServiceDefinitionModel? selectedServiceDefinition;

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
                empty: (value) => Text(
                  localizations.translate(
                    i18.surveyForm.noSurveyFormFound,
                  ),
                ),
                isloading: (value) => const Center(
                  child: CircularProgressIndicator(),
                ),
                serviceDefinitionFetch:
                    (ServiceDefinitionServiceFetchedState value) {
                  final values = value.serviceDefinitionList
                      .where((item) =>
                          !SurveyFormSingleton()
                              .roles
                              .indexOf(
                                item.code!.split('.').lastOrNull!,
                              )
                              .isNegative &&
                          !item.code!.contains(
                              Constants.healthFacilitySurveyFormPrefix) &&
                          (item.code ?? '')
                              .contains(SurveyFormSingleton().projectName));

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
                  return Padding(
                    padding: const EdgeInsets.all(spacer4),
                    child: ButtonListTile(
                        spacing: spacer4,
                        sortButtons: false,
                        isVertical: true,
                        buttons: values
                            .map((e)=>Button(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            label: localizations.translate('${e.code}'),
                            type: ButtonType.secondary,
                            size: ButtonSize.large,
                            prefixIcon: Icons.article,
                            suffixIcon: Icons.arrow_forward,
                            onPressed: () {
                              context.read<ServiceDefinitionBloc>().add(
                                  ServiceDefinitionSelectionEvent(
                                    serviceDefinition: e,));

                              showPopup(
                                  context: context,
                                  title: "",
                                  type: PopUpType.simple,
                                  actions: [
                                    Button(
                                        label: localizations.translate(i18
                                            .surveyForm
                                            .surveyFormCreateActionLabel),
                                        onPressed: () {
                                          context.router.push(
                                            SurveyFormBoundaryViewRoute(),
                                          );
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();
                                        },
                                        type: ButtonType.secondary,
                                        size: ButtonSize.medium,
                                      prefixIcon: Icons.edit_calendar,
                                    ),
                                    Button(
                                        label: localizations.translate(i18
                                            .surveyForm
                                            .surveyFormViewActionLabel),
                                        onPressed: () {
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
                                        type: ButtonType.secondary,
                                        size: ButtonSize.medium,
                                        prefixIcon: Icons.visibility,
                                    ),
                                  ]
                              );
                            },
                        )).toList()
                    ),
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
