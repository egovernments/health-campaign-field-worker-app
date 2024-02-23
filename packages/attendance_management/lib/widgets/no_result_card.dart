import 'package:digit_components/digit_components.dart';
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
            padding: const EdgeInsets.all(kPadding),
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
