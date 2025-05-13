import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:flutter/material.dart';
import 'package:registration/blocs/app_localization.dart';

import '../../utils/i18_key_constants.dart' as i18;

class NoFacilitiesAssignedDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => Popup(
        titleIcon: Icon(
          Icons.warning,
          color: DigitTheme.instance.colors.light.alertError,
        ),
        title: RegistrationDeliveryLocalization.of(context)
            .translate(i18.referBeneficiary.noFacilityAssigned),
        description: RegistrationDeliveryLocalization.of(context)
            .translate(i18.referBeneficiary.noFacilityAssignedDescription),
        actions: [
          DigitButton(
            label: RegistrationDeliveryLocalization.of(context)
                .translate(i18.common.corecommonclose),
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              context.router.maybePop();
            },
          ),
        ],
      ),
    );
  }
}
