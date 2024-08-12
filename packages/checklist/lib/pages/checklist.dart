import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/checklist_router.gm.dart';
import '../widgets/action_card.dart';
import '../blocs/app_localization.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;


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
    // var localizations = ChecklistLocalization.of(context);
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
                              " My Checklist",
                              // localizations.translate(i18.checklist.checklistlabel),
                              style: theme.textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ),
                      ActionCard(items: [
                        ActionCardModel(
                          icon: Icons.edit_calendar,
                          label: "Create Checklist",
                          // label: localizations.translate(i18
                          //     .checklist
                          //     .checklistCreateActionLabel),
                          action: () {
                            context.router.push(
                              ChecklistBoundaryViewRoute(),
                            );
                            // Navigator.of(
                            //   context,
                            //   rootNavigator: true,
                            // ).pop();
                          },
                        ),
                        ActionCardModel(
                          icon: Icons.visibility,
                          label: "View Submitted Checklist",
                          // label: localizations.translate(i18
                          //     .checklist
                          //     .checklistViewActionLabel),
                          action: () {
                            context
                                .read<ServiceBloc>()
                                .add(
                              ServiceSearchEvent(
                                serviceSearchModel:
                                ServiceSearchModel(
                                  id: "12",
                                ),
                              ),
                            );
                            context.router.push(
                              ChecklistPreviewRoute(),
                            );
                            // Navigator.of(
                            //   context,
                            //   rootNavigator: true,
                            // ).pop();
                          },
                        ),],)
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
