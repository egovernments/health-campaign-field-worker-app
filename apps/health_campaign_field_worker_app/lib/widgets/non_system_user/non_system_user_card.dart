import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import '../localized.dart';

class NonSystemUserCard extends LocalizedStatefulWidget {
  const NonSystemUserCard({super.key});

  @override
  State<NonSystemUserCard> createState() => _MyWidgetState();
}

class _MyWidgetState extends LocalizedState<NonSystemUserCard> {
  @override
  Widget build(BuildContext context) {
    return DigitCard(
        margin: const EdgeInsets.all(spacer2),
        padding: const EdgeInsets.all(spacer1),
        children: [
          const LabelValueSummary(items: [
            LabelValueItem(labelFlex: 5, label: "name", value: "Prak"),
            LabelValueItem(labelFlex: 5, label: "do", value: ""),
          ]),
          DigitButton(
            label: "Scan Me",
            mainAxisSize: MainAxisSize.max,
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
            onPressed: () {},
          ),
        ]);
  }
}
