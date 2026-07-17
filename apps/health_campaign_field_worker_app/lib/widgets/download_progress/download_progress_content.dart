import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../blocs/localization/app_localization.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;

class DownloadProgressContent extends StatelessWidget {
  final String title;
  final double progress;

  /// Pre-formatted count string, e.g. "150/1000"
  final String countLabel;

  const DownloadProgressContent({
    super.key,
    required this.title,
    required this.progress,
    required this.countLabel,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: progress >= 1.0
              ? Lottie.asset(
                  Constants.downloadSuccessAnimation,
                  repeat: false,
                  height: MediaQuery.of(context).size.height * 0.1,
                )
              : Lottie.asset(
                  Constants.downloadAnimation,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
        ),
        Center(
          child: Text(
            title,
            style: Theme.of(context).digitTextTheme(context).headingM.copyWith(
                  color: Theme.of(context).colorTheme.primary.primary2,
                ),
          ),
        ),
        const SizedBox(height: spacer2 * 2),
        LinearProgressIndicator(
          value: progress,
          minHeight: spacer1,
          color: Theme.of(context).colorTheme.alert.success,
          borderRadius: const BorderRadius.all(Radius.circular(spacer2)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              progress >= 1.0
                  ? localizations
                      .translate(i18.beneficiaryDetails.downloadcompleted)
                  : localizations.translate(i18.common.coreCommonDownloading),
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorTheme.text.primary,
              ),
            ),
            Text(
              countLabel,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorTheme.text.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
