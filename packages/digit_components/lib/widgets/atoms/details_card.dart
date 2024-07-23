import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';

class LabelValueList extends StatelessWidget {
  final List<LabelValuePair> items;
  final EdgeInsets? padding;
  final String? heading;
  final bool withDivider;

  const LabelValueList({
    Key? key,
    required this.items,
    this.padding,
    this.heading,
    this.withDivider = false,

    /// Default to no divider
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading != null)
          Padding(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              heading!,
              style: textTheme.headlineLarge?.copyWith(
                color: const DigitColors().woodsmokeBlack,
              ),
            ),
          ),
        ..._buildItemsWithDividers(items, context),
      ],
    );
  }

  List<Widget> _buildItemsWithDividers(
      List<LabelValuePair> items, BuildContext context) {
    List<Widget> itemList = [];
    for (int i = 0; i < items.length; i++) {
      itemList.add(_buildItem(items[i], context));
      if (i < items.length - 1 && withDivider) {
        itemList.add(
          const DigitDivider(),
        );
      }
    }
    return itemList;
  }

  Widget _buildItem(LabelValuePair item, BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8.0),
      child: item.isInline
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label taking 30% width
                Expanded(
                  flex: 6, // 45% width
                  child: Text(
                    item.label,
                    style: textTheme.headlineSmall?.copyWith(
                      height: 1.14,
                      color: const DigitColors().woodsmokeBlack,
                    ),
                  ),
                ),
                const SizedBox(
                    width: kPadding * 4), // Gap between label and value
                // Value taking rest of the width
                Expanded(
                  flex: 8, // Remaining 55% width
                  child: Text(
                    item.value,
                    style: textTheme.bodyLarge?.copyWith(
                      height: 1.14,
                      color: const DigitColors().woodsmokeBlack,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: textTheme.headlineSmall?.copyWith(
                    color: const DigitColors().woodsmokeBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.value,
                  style: textTheme.bodyMedium?.copyWith(
                    color: const DigitColors().woodsmokeBlack,
                  ),
                ),
              ],
            ),
    );
  }
}

class LabelValuePair {
  final String label;
  final String value;
  final bool isInline;

  LabelValuePair({
    required this.label,
    required this.value,
    this.isInline = true,
  });
}
