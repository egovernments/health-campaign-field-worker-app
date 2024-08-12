import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/checklist_router.gm.dart';
import '../utils/constants.dart';
import '../widgets/action_card.dart';
import '../blocs/app_localization.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/no_result_card.dart';

@RoutePage()
class ChecklistPage extends LocalizedStatefulWidget {
  const ChecklistPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = ChecklistLocalization.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
            builder: (context, state) {
              return state.map(
                empty: (value) => const Text('No Checklist'),
                isloading: (value) => const Center(
                  child: CircularProgressIndicator(),
                ),
                serviceDefinitionFetch:
                    (ServiceDefinitionServiceFetchedState value) {
                      final values = value.serviceDefinitionList.where(
                              (item) =>
                          !ChecklistSingleton().roles
                              .indexOf(
                            item.code!.split('.').lastOrNull!,
                          )
                              .isNegative &&
                              !item.code!.contains(Constants
                                  .healthFacilityChecklistPrefix) &&
                              (item.code ?? '').contains(
                                  ChecklistSingleton().projectName));
                      print('Printed value-----> $values');

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
                                      .checklist
                                      .checklistCreateActionLabel),
                                  action: () {
                                    context.router.push(
                                      ChecklistBoundaryViewRoute(),
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
                                      .checklist
                                      .checklistViewActionLabel),
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
                                      ChecklistPreviewRoute(),
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
