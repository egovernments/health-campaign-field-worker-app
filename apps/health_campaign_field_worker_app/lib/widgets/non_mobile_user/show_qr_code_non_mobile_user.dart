import 'package:attendance_management/models/entities/scanned_individual_data.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/localization/app_localization.dart';

void showQRForNonMobileUser(
    {required BuildContext context,
    required ScannedIndividualDataModel individualScannerData,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  localizations.translate(individualScannerData.name!),
                  style: textTheme.headingS.copyWith(color: theme.colorTheme.text.primary),
                )),
                const SizedBox(height: spacer4,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*.64,
                    padding: const EdgeInsets.symmetric(
                        horizontal: spacer1/2, vertical: spacer1/2),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(spacer2)),
                      border: Border(
                          left: BorderSide(color: theme.colorTheme.generic.divider),
                          right: BorderSide(color: theme.colorTheme.generic.divider),
                          bottom: BorderSide(color: theme.colorTheme.generic.divider),
                          top: BorderSide(color: theme.colorTheme.generic.divider)),
                      color: theme.colorTheme.paper.secondary,
                    ),
                    child: Center(
                      child: Text(individualScannerData.individualId!,
                          style: textTheme.headingXS
                              .copyWith(color: theme.colorTheme.primary.primary2)),
                    ),
                  ),
                ),
                const SizedBox(height: spacer4,),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(spacer2),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(spacer1)),
                        border: Border.all(
                          color: theme.colorTheme.primary.primary1,
                          width: 2,
                        )),
                    child: QrImageView(
                      data: DataMapEncryptor()
                          .encryptWithRandomKey(individualScannerData.toMap()),
                      version: QrVersions.auto,
                      size: MediaQuery.of(context).size.width*.59,
                    ),
                  ),
                ),
                const SizedBox(height: spacer4,),
              ],
            ),
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
