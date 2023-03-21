import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth.dart';
import '../blocs/boundary/boundary.dart';
import '../blocs/project/project.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class ProjectSelectionPage extends LocalizedStatefulWidget {
  const ProjectSelectionPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ProjectSelectionPage> createState() => _ProjectSelectionPageState();
}

class _ProjectSelectionPageState extends LocalizedState<ProjectSelectionPage> {
  @override
  void initState() {
    context.read<ProjectBloc>().add(const ProjectInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackNavigationHelpHeaderWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                localizations.translate(
                  i18.projectSelection.projectDetailsLabelText,
                ),
                style: theme.textTheme.displayMedium,
              ),
            ),
          ],
        ),
        children: [
          BlocConsumer<ProjectBloc, ProjectState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {
                  return;
                },
                fetched: (projects, selectedProject) {
                  if (selectedProject != null) {
                    context.read<BoundaryBloc>().add(BoundarySearchEvent(
                          code: selectedProject.address!.boundary!,
                        ));
                    context.router.replace(HomeRoute());
                  }
                },
              );
            },
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(localizations.translate(
                          i18.projectSelection.noProjectsAssigned,
                        )),
                        Text(localizations.translate(
                          i18.projectSelection.contactSysAdmin,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SizedBox(
                            width: 300,
                            child: DigitElevatedButton(
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthLogoutEvent());
                              },
                              child: Center(
                                child: Text(
                                  localizations.translate(
                                    i18.common.coreCommonOk,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                loading: (value) => const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                fetched: (ProjectSelectionFetchedState value) => Column(
                  children: value.projects
                      .map(
                        (element) => DigitProjectCell(
                          projectText: element.name,
                          onTap: () => context.read<ProjectBloc>().add(
                                ProjectSelectProjectEvent(element),
                              ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
