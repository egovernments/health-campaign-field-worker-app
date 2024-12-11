import 'package:attendance_management/utils/constants.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            padding: const EdgeInsets.all(spacer1),
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
