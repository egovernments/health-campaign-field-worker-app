import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../blocs/app_localization.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;

void showLowIdsAlert(
    {required BuildContext context,
    required RegistrationDeliveryLocalization localizations,
    required Function(bool proceed) shouldProceedFurther}) {
  showCustomPopup(
      context: context,
      builder: (context) {
        return Popup(
          type: PopUpType.alert,
          actions: [
            DigitButton(
              capitalizeLetters: false,
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                Navigator.of(context).pop();
                context.router.push(BeneficiaryIdDownSyncRoute());
              },
              prefixIcon: Icons.download,
              label: localizations.translate(
                i18.beneficiaryDetails.downloadBeneficiaryIds,
              ),
            ),
            DigitButton(
              capitalizeLetters: false,
              type: DigitButtonType.tertiary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                Navigator.of(context).pop();
                shouldProceedFurther(true);
              },
              label: localizations.translate(
                i18.common.coreCommonSkipContinue,
              ),
            ),
          ],
          title: localizations
              .translate(i18.beneficiaryDetails.lowBeneficiaryIdsLabel),
          description: localizations
              .translate(i18.beneficiaryDetails.lowBeneficiaryIdsText),
        );
      });
}

void showNoIdsAlert(
    {required BuildContext context,
    required RegistrationDeliveryLocalization localizations}) {
  showCustomPopup(
      context: context,
      builder: (context) {
        return Popup(
          type: PopUpType.alert,
          actions: [
            DigitButton(
              capitalizeLetters: false,
              type: DigitButtonType.secondary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                Navigator.of(context).pop();
                context.router.push(BeneficiaryIdDownSyncRoute());
              },
              prefixIcon: Icons.download,
              label: localizations.translate(
                i18.beneficiaryDetails.downloadBeneficiaryIds,
              ),
            ),
          ],
          title: localizations
              .translate(i18.beneficiaryDetails.noBeneficiaryIdsLabel),
          description: localizations
              .translate(i18.beneficiaryDetails.noBeneficiaryIdsText),
        );
      });
}
