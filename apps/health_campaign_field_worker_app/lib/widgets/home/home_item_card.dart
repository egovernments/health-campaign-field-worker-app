import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/localization/app_localization.dart';

class HomeItemCard extends StatelessWidget {
  final IconData icon;
  final String customIcon;
  final String label;
  final VoidCallback? onPressed;
  final double? customIconSize;
  final bool enableCustomIcon;

  const HomeItemCard({
    required this.icon,
    required this.label,
    this.enableCustomIcon = false,
    this.customIcon = "",
    this.customIconSize,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return DigitCard(
        onPressed: onPressed,
        padding: const EdgeInsets.all(spacer1).copyWith(top: spacer1),
        margin: const EdgeInsets.all(spacer2),
        inline: true,
        children: [
          const Padding(padding: EdgeInsets.only(top: spacer1)),
          if (enableCustomIcon)
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                customIcon,
                width: customIconSize ?? 25,
                height: customIconSize ?? 25,
              ),
            ),
          if (!enableCustomIcon)
            Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: onPressed == null
                    ? theme.disabledColor
                    : theme.colorTheme.primary.primary1,
                size: 40,
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: [
                Text(
                  AppLocalizations.of(context).translate(
                    label,
                  ),
                  style: textTheme.bodyS,
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ]);
  }
}
