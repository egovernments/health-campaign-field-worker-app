import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
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
  DialogRoute? syncDialogRoute;

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
            const BackNavigationHelpHeaderWidget(
              showLogoutCTA: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
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
              if (syncDialogRoute?.isActive ?? false) {
                Navigator.of(context).removeRoute(syncDialogRoute!);
              }

              if (state.loading) {
                syncDialogRoute = DialogRoute(
                  context: context,
                  builder: (context) => DigitDialog(
                    options: DigitSyncDialog.getDigitDialog(
                      type: DigitSyncDialogType.inProgress,
                      label: 'Sync in progress',
                      barrierDismissible: false,
                    ),
                  ),
                );

                Navigator.of(context).push(syncDialogRoute!);
              }

              final selectedProject = state.selectedProject;
              if (selectedProject != null) {
                final boundary = selectedProject.address?.boundary;

                if (boundary != null) {
                  context.read<BoundaryBloc>().add(
                        BoundarySearchEvent(
                          code: boundary,
                        ),
                      );

                  context.router.replaceAll([
                    HomeRoute(),
                    const BoundarySelectionRoute(),
                  ]);
                } else {
                  DigitToast.show(
                    context,
                    options: DigitToastOptions(
                      'No boundary data associated with this project.',
                      true,
                      theme,
                    ),
                  );
                }
              }
            },
            builder: (context, state) {
              if (state.loading) {
                return const Expanded(
                  child: Center(child: Offstage()),
                );
              }

              final projects = state.projects;

              if (projects.isEmpty) {
                return Center(
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
                );
              }

              return Column(
                children: projects
                    .map(
                      (element) => DigitProjectCell(
                        projectText: element.name,
                        onTap: () => context.read<ProjectBloc>().add(
                              ProjectSelectProjectEvent(element),
                            ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
