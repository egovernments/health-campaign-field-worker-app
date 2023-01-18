import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';

import '../widgets/header/back_navigation_help_header.dart';

class ProjectSelectionPage extends StatelessWidget {
  const ProjectSelectionPage({super.key});

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
              DigitProjectCell(
                projectText: 'projectText',
                onTap: () => DigitDialog.show(
                  context,
                  title: 'Hello',
                  content: 'i18.forgotPassword.contentText',
                  primaryActionLabel: 'i18.forgotPassword.primaryActionLabel',
                  primaryAction: () => Navigator.pop(context),
                ),
              ),
              DigitProjectCell(
                  projectText: 'projectText',
                  onTap: () => DigitSyncDialog.showSyncInProgressDialog(context,
                      progressTitleText: 'Retry all you want',),),
              DigitProjectCell(
                  projectText: 'projectText',
                  onTap: () => DigitSyncDialog.showSyncCompleteDialog(context,
                      syncCompleteTitleText: 'Sync complete',
                      retryButtonText: 'Close',
                      retryCallback: () {},),),
              DigitProjectCell(
                  projectText: 'projectText',
                  onTap: () => DigitSyncDialog.showSyncFailedDialog(context,
                      syncFailedTitleText: 'Sync Failed',
                      retryButtonText: 'Retry',
                      dismissButtonText: 'Dismiss',
                      retryCallback: () {},
                      dismissCallback: () {},),),
            ],
          ),
        ],
      ),
    );
  }
}
