import 'package:digit_components/digit_components.dart';
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

    return DigitCard(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kPadding / 2).copyWith(top: kPadding / 2),
      margin: const EdgeInsets.all(kPadding),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (enableCustomIcon)
              SvgPicture.asset(
                customIcon,
                width: customIconSize ?? 25,
                height: customIconSize ?? 25,
              ),
            if (!enableCustomIcon)
              Icon(
                icon,
                color: onPressed == null
                    ? theme.disabledColor
                    : theme.colorScheme.secondary,
                size: 40,
              ),
            Wrap(
              children: [
                Text(
                  AppLocalizations.of(context).translate(
                    label,
                  ),
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
