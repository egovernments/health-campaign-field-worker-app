import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/app_localization.dart';

class NoFacilitiesAssignedDialog {
  static Future<void> show(
      BuildContext context, InventoryLocalization localizations) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleIcon: Icon(
          Icons.warning,
          color: Theme.of(context).colorScheme.error,
        ),
        titleText: localizations.translate(
          i18.warehouseDetails.noFacilitiesAssigned,
        ),
        contentText: localizations.translate(
          i18.warehouseDetails.noFacilitiesAssignedDescription,
        ),
        primaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.common.corecommonclose,
          ),
          action: (dialogContext) {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.maybePop();
          },
        ),
      ),
    );
  }
}
