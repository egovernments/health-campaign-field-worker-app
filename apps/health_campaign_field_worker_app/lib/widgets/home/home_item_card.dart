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
          padding: const EdgeInsets.symmetric(
            horizontal: spacer2,
            vertical: spacer3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Fixed-height icon slot and label zone keep every tile's
              // icon on a shared axis and every label starting on the same
              // line, regardless of 1- vs 2-line label text.
              SizedBox(
                height: spacer12,
                child: Center(
                  child: enableCustomIcon
                      ? Padding(
                          padding: iconPadding ?? EdgeInsets.zero,
                          child: SvgPicture.asset(
                            customIcon,
                            width: customIconSize ?? 25,
                            height: customIconSize ?? 25,
                          ),
                        )
                      : Icon(
                          icon,
                          color: onPressed == null
                              ? theme.disabledColor
                              : theme.colorTheme.primary.primary1,
                          size: iconSize ?? 40,
                        ),
                ),
              ),
              const SizedBox(height: spacer2),
              SizedBox(
                // bodyS on tablet is 16px * 1.37 line-height = ~44px for two
                // lines; spacer10 (40) clipped the second line ("Stock
                // Reconcili..."). spacer12 fits both mobile and tablet.
                height: spacer12,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).translate(label),
                    style: textTheme.bodyS,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
