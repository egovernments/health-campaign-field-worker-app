import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:flutter/material.dart';

class DigitComponentsUtils {
  void hideLocationDialog(BuildContext context) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).popUntil(
      (route) => route is! PopupRoute,
    );
  }

  void showLocationCapturingDialog(
      BuildContext context, String label, DigitSyncDialogType dialogType) {
    DigitSyncDialog.show(
      context,
      type: dialogType,
      label: label,
    );
  }

  void hideLocalizationLoadingDialog(BuildContext context) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).popUntil(
          (route) => route is! PopupRoute,
    );
  }

  void showLocalizationLoadingDialog(
      BuildContext context, DigitSyncDialogType dialogType) {
    DigitSyncDialog.show(
      context,
      type: dialogType,
    );
  }
}
