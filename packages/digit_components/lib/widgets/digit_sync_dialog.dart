import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitSyncDialog extends StatelessWidget {
  final Widget content;
  final List<Widget> actions;

  const DigitSyncDialog(
      {super.key, required this.content, this.actions = const []});

  static final _barrierColor =
      DigitTheme.instance.colors.black.withOpacity(0.7);

  static showSyncInProgressDialog(BuildContext context,
      {required String syncInProgressTitleText}) {
    return showDialog(
        context: context,
        barrierColor: _barrierColor,

        /// TODO - turn this to false during implementation
        barrierDismissible: true,
        builder: (context) => DigitSyncDialog(
              content: _InProgress(
                syncInProgressTitleText: syncInProgressTitleText,
              ),
            ));
  }

  static showSyncCompleteDialog(BuildContext context,
      {required String syncCompleteTitleText,
      required String syncCompleteButtonText,
      required VoidCallback syncCompleteCallback}) {
    return showDialog(
        context: context,
        barrierColor: _barrierColor,
        builder: (context) => DigitSyncDialog(
              content: _SyncComplete(
                syncCompleteTitleText: syncCompleteTitleText,
              ),
              actions: [
                DigitElevatedButton(
                  onPressed: syncCompleteCallback,
                  child: Center(child: Text(syncCompleteButtonText)),
                ),
              ],
            ));
  }

  static showSyncFailedDialog(
    BuildContext context, {
    required String syncFailedTitleText,
    required retryButtonText,
    required dismissButtonText,
    required VoidCallback retryCallback,
    required VoidCallback dismissCallback,
  }) {
    return showDialog(
        context: context,
        barrierColor: _barrierColor,
        builder: (context) => DigitSyncDialog(
              content: _SyncFailed(
                syncFailedTitleText: syncFailedTitleText,
              ),
              actions: [
                DigitElevatedButton(
                  onPressed: retryCallback,
                  child: Center(child: Text(retryButtonText)),
                ),
                TextButton(
                  onPressed: dismissCallback,
                  child: Center(child: Text(dismissButtonText)),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: content,
        // contentPadding: EdgeInsets.all(0),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: actions,
      );
}

class _InProgress extends StatelessWidget {
  final String syncInProgressTitleText;

  const _InProgress({required this.syncInProgressTitleText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.autorenew,
            size: 32,
            color: theme.colorScheme.secondary,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            syncInProgressTitleText,
            style: theme.textTheme.headlineSmall
                ?.copyWith(color: theme.colorScheme.secondary),
          )
        ],
      ),
    );
  }
}

class _SyncComplete extends StatelessWidget {
  final String syncCompleteTitleText;

  const _SyncComplete({required this.syncCompleteTitleText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check_circle,
          size: 32,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(syncCompleteTitleText,
            style: theme.textTheme.headlineLarge
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      ],
    );
  }
}

class _SyncFailed extends StatelessWidget {
  final String syncFailedTitleText;

  const _SyncFailed({required this.syncFailedTitleText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error_outline,
          size: 32,
          color: theme.colorScheme.error,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(syncFailedTitleText,
            style: theme.textTheme.headlineLarge
                ?.copyWith(color: theme.colorScheme.error)),
      ],
    );
  }
}
