import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/localization/app_localization.dart';

//TODO: TO user details to generate the qrcode, after API integration
void showQRForNonMobileUser(
    {required BuildContext context,
    required AppLocalizations localizations,
    required DigitTextTheme textTheme}) {
  final theme = Theme.of(context);
  showCustomPopup(
      context: context,
      builder: (ctx) {
        return Popup(
          actionAlignment: MainAxisAlignment.center,
          type: PopUpType.simple,
          onCrossTap: () {
            Navigator.of(ctx).pop();
          },
          additionalWidgets: [
            const Center(
                child: DigitTextBlock(
              //TODO: TO show the selected user name
              subHeading: "Pitabash Choudhdry",
            )),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(theme.colorTheme.paper.secondary.value),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Color(theme.colorTheme.paper.secondary.value),
              ),
              child: DigitTextBlock(
                spacing: 0,
                padding: const EdgeInsets.all(spacer1),
                description: "ID 56565656",
                descriptionStyle: textTheme.label,
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: theme.colorTheme.primary.primary1,
                  width: 2,
                )),
                child: QrImageView(
                  data: "PitabashChoudhry23/03/2025",
                  version: QrVersions.auto,
                  size: 220.0,
                ),
              ),
            )
          ],
          actions: [
            DigitButton(
              capitalizeLetters: false,
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              label: localizations.translate(
                i18.common.coreCommonGoback,
              ),
            ),
          ],
          title: localizations.translate(i18.nonMobileUser.showQrCodeLabel),
        );
      });
}
