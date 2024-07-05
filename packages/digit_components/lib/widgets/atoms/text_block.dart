import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class TextBlock extends StatelessWidget {
  final String? caption;
  final TextStyle? captionStyle;
  final String? heading;
  final TextStyle? headingStyle;
  final String? subHeading;
  final TextStyle? subHeadingStyle;
  final String? body;
  final TextStyle? bodyStyle;
  final EdgeInsets? padding;
  final double spacing;

  const TextBlock({
    Key? key,
    this.caption,
    this.heading,
    this.subHeading,
    this.body,
    this.captionStyle,
    this.headingStyle,
    this.subHeadingStyle,
    this.bodyStyle,
    this.padding,
    this.spacing = kPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (caption != null)
            Text(
              caption!,
              style: captionStyle ?? theme.textTheme.labelSmall?.copyWith(color: const DigitColors().davyGray),
            ),
          if (caption != null)  SizedBox(height: spacing),
          if (heading != null)
            Text(
              heading!,
              style: headingStyle ?? theme.textTheme.displayMedium?.copyWith(color: const DigitColors().woodsmokeBlack),
            ),
          if (heading != null && (subHeading != null || body != null)) SizedBox(height: spacing),
          if (subHeading != null)
            Text(
              subHeading!,
              style: subHeadingStyle ?? theme.textTheme.headlineMedium?.copyWith(color: const DigitColors().davyGray),
            ),
          if (subHeading != null && body != null) SizedBox(height: spacing),
          if (body != null)
            Text(
              body!,
              style: bodyStyle ?? theme.textTheme.bodyLarge?.copyWith(color: const DigitColors().davyGray),
            ),
        ],
      ),
    );
  }
}