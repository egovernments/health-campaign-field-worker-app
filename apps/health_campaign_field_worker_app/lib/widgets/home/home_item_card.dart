import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/radius.dart';
import 'package:digit_ui_components/theme/spacers.dart';
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
  final double? iconSize;
  final EdgeInsets? iconPadding;

  const HomeItemCard({
    required this.icon,
    required this.label,
    this.enableCustomIcon = false,
    this.customIcon = "",
    this.customIconSize,
    this.onPressed,
    this.iconSize,
    this.iconPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Material(
      color: theme.colorTheme.paper.primary,
      borderRadius: BorderRadius.circular(radius4),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius4),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorTheme.paper.primary,
            borderRadius: BorderRadius.circular(radius4),
            boxShadow: [
              BoxShadow(
                color: theme.colorTheme.text.primary.withOpacity(.16),
                offset: const Offset(0, 1),
                spreadRadius: 0,
                blurRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(spacer4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (enableCustomIcon)
                Padding(
                  padding: iconPadding ?? EdgeInsets.zero,
                  child: SvgPicture.asset(
                    customIcon,
                    width: customIconSize ?? 25,
                    height: customIconSize ?? 25,
                  ),
                ),
              if (!enableCustomIcon)
                Icon(
                  icon,
                  color: onPressed == null
                      ? theme.disabledColor
                      : theme.colorTheme.primary.primary1,
                  size: iconSize ?? 40,
                ),
              const SizedBox(height: spacer2),
              Text(
                AppLocalizations.of(context).translate(label),
                style: textTheme.bodyS,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
