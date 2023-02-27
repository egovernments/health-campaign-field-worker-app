import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<ProjectBloc>().add(
          const ProjectInitEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: Column(children: const [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  localizations.translate(
                    i18.projectSelection.projectDetailsLabelText,
                  ),
                  style: theme.textTheme.displayMedium,
                ),
              ),
              BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  return state.map(
                    loading: (value) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    empty: (value) => const Offstage(),
                    fetched: (ProjectSelectionFetchedState value) {
                      return Column(
                        children: value.projects
                            .map((element) => DigitProjectCell(
                                  projectText: element.name,
                                  onTap: () => DigitSyncDialogContent.show(
                                    context,
                                    barrierDismissible: true,
                                    type: DigitSyncDialogType.inProgress,
                                    label: localizations.translate(
                                      i18.projectSelection
                                          .syncInProgressTitleText,
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    },
                  );
                },
              ),
              //[TODO]: Need to do a refactoring- Naveen

              // DigitProjectCell(
              //   projectText: 'Sync Complete',
              //   onTap: () => DigitSyncDialogContent.show(
              //     context,
              //     type: DigitSyncDialogType.complete,
              //     label: localizations.translate(
              //       i18.projectSelection.syncCompleteTitleText,
              //     ),
              //     primaryAction: DigitDialogActions(
              //       label: localizations.translate(
              //         i18.projectSelection.syncCompleteButtonText,
              //       ),
              //       action: (context) => context.router.pop(),
              //     ),
              //   ),
              // ),
              // DigitProjectCell(
              //   projectText: 'Sync Fail',
              //   onTap: () => DigitSyncDialogContent.show(
              //     context,
              //     type: DigitSyncDialogType.failed,
              //     label: localizations.translate(
              //       i18.projectSelection.syncFailedTitleText,
              //     ),
              //     primaryAction: DigitDialogActions(
              //       label: localizations.translate(
              //         i18.projectSelection.retryButtonText,
              //       ),
              //       action: (context) => context.router.pop(),
              //     ),
              //     secondaryAction: DigitDialogActions(
              //       label: localizations.translate(
              //         i18.projectSelection.syncCompleteButtonText,
              //       ),
              //       action: (context) {
              //         // TODO: Complete Implementation
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
