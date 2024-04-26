import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class NoFacilitiesAssignedDialog {
  static Future<void> show(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleIcon: Icon(
          Icons.warning,
          color: Theme.of(context).colorScheme.error,
        ),
        titleText: 'No facilities assigned',
        contentText: 'Please select another boundary or '
            'contact the system administrator to assign '
            'a facility.',
        primaryAction: DigitDialogActions(
          label: 'Close',
          action: (dialogContext) {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.maybePop();
          },
        ),
      ),
    );
  }
}
