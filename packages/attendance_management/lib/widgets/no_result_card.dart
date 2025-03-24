import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';

class NoResultCard extends StatelessWidget {
  final AlignmentGeometry align;
  final String? label;

  const NoResultCard({
    super.key,
    this.align = Alignment.centerLeft,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
        alignment: align,
        child: Padding(
            padding: EdgeInsets.all(theme.spacerTheme.spacer2),
            child: Column(
              children: [
                SvgPicture.asset(noResultSvg),
                Text(
                  label ?? '',
                  style: theme.textTheme.bodyMedium,
                )
              ],
            )));
  }
}
