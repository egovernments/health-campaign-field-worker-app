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

  List<Widget> _conditionalRender(String? text, TextStyle? style, {bool addSpacing = false}) {
    if (text == null) return [];
    List<Widget> children = [
      Text(
        text,
        style: style,
      ),
    ];
    if (addSpacing) children.add(SizedBox(height: spacing));
    return children;
  }

  List<Widget> _buildTextBlocks(BuildContext context) {
    final theme = Theme.of(context);
    final List<Widget> blocks = [];

    blocks.addAll(_conditionalRender(
      caption,
      captionStyle ?? theme.textTheme.labelSmall?.copyWith(color: const DigitColors().davyGray),
      addSpacing: caption != null && (heading != null || subHeading != null || body != null),
    ));

    blocks.addAll(_conditionalRender(
      heading,
      headingStyle ?? theme.textTheme.displayMedium?.copyWith(color: const DigitColors().woodsmokeBlack),
      addSpacing: heading != null && (subHeading != null || body != null),
    ));

    blocks.addAll(_conditionalRender(
      subHeading,
      subHeadingStyle ?? theme.textTheme.headlineMedium?.copyWith(color: const DigitColors().davyGray),
      addSpacing: subHeading != null && body != null,
    ));

    blocks.addAll(_conditionalRender(
      body,
      bodyStyle ?? theme.textTheme.bodyLarge?.copyWith(color: const DigitColors().davyGray),
    ));

    return blocks;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildTextBlocks(context),
      ),
    );
  }
}
