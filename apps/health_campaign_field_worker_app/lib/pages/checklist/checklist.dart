import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '../../blocs/auth/auth.dart';
import '../../blocs/service/service.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../models/entities/service.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/action_card/action_card.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/no_result_card/no_result_card.dart';

class ChecklistPage extends LocalizedStatefulWidget {
  const ChecklistPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends LocalizedState<ChecklistPage> {
  @override
  Widget build(BuildContext context) {
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              kPadding,
                            ),
                            child: Text(
                              localizations
                                  .translate(i18.checklist.checklistlabel),
                              style: theme.textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, authstate) {
                          return authstate.maybeMap(
                            orElse: () => const Offstage(),
                            authenticated: (res) {
                              List<String> roles = res.userModel.roles
                                  .map((e) => e.code.snakeCase.toUpperCase())
                                  .toList();
                              final values = value.serviceDefinitionList
                                  .where((item) => !roles
                                      .indexOf(
                                        item.code!.split('.').last,
                                      )
                                      .isNegative);

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
