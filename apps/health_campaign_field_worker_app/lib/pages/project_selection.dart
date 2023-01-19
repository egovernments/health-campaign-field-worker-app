import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';

import '../blocs/localization/app_localization.dart';
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
              Text(
                localizations.translate(
                  i18.projectSelection.projectDetailsLabelText,
                ),
                style: theme.textTheme.displayMedium,
              ),
              DigitProjectCell(
                projectText: 'projectText',
                onTap: () => DigitSyncDialog.showSyncInProgressDialog(
                  context,
                  syncInProgressTitleText:
                      AppLocalizations.of(context).translate(
                    i18.projectSelection.syncInProgressTitleText,
                  ),
                ),
              ),
              DigitProjectCell(
                projectText: 'projectText',
                onTap: () => DigitSyncDialog.showSyncCompleteDialog(
                  context,
                  syncCompleteTitleText: 'Sync complete',
                  syncCompleteButtonText: 'Close',
                  syncCompleteCallback: () {},
                ),
              ),
              DigitProjectCell(
                projectText: 'projectText',
                onTap: () => DigitSyncDialog.showSyncFailedDialog(
                  context,
                  syncFailedTitleText: 'Sync Failed',
                  retryButtonText: 'Retry',
                  dismissButtonText: 'Dismiss',
                  retryCallback: () {},
                  dismissCallback: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
