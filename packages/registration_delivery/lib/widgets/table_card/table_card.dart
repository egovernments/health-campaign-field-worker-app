import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';

class DigitTableCard extends StatelessWidget {
  final Map<String, dynamic> element;
  final Border? border;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double gap;
  final num fraction;
  final EdgeInsetsGeometry? topPadding;
  final TextStyle? labelStyle;
  final TextStyle? descriptionStyle;

  const DigitTableCard({
    super.key,
    required this.element,
    this.border,
    this.color,
    this.padding,
    this.gap = 0,
    this.fraction = 1.8,
    this.topPadding,
    this.labelStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return LabelValueSummary(
      padding: const EdgeInsets.all(0),
      items: element.keys
          .map((e) => LabelValueItem(
                label: e,
                value: element[e].toString(),
                labelFlex: 8,
                valueFlex: 5,
              ))
          .toList(),
    );
  }
}
