import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/app_localization.dart';

class NoFacilitiesAssignedDialog {
  static Future<void> show(
      BuildContext context, InventoryLocalization localizations) {
    return
      showCustomPopup(
        context: context,
        builder: (popupContext) => Popup(
          title: localizations.translate(
            i18.warehouseDetails.noFacilitiesAssigned,
          ),
          onOutsideTap: () {
            Navigator.of(popupContext).pop();
          },
          description:localizations.translate(
            i18.warehouseDetails.noFacilitiesAssignedDescription,
          ),
          type: PopUpType.alert,
          actions: [
            DigitButton(
              label: localizations.translate(
          i18.common.corecommonclose,
        ),
              onPressed: () {
                Navigator.of(popupContext, rootNavigator: true).pop();
                popupContext.router.maybePop();
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
            ),
          ],
        ),
      );
  }
}
