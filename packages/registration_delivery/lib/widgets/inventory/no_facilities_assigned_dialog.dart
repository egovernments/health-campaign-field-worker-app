import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:flutter/material.dart';

class NoFacilitiesAssignedDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx)=> Popup(
        titleIcon: Icon(
          Icons.warning,
          color: DigitTheme.instance.colors.light.alertError,
        ),
        title: 'No facilities assigned',
        description: 'Please select another boundary or '
            'contact the system administrator to assign '
            'a facility.',
        actions: [
          Button(
            label: 'Close',
            type: ButtonType.primary,
            size: ButtonSize.large,
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop();
              context.router.maybePop();
            },
          ),
        ],
      ),
    );
  }
}
