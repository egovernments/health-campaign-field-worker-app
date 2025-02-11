import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

class DeliveryWidget extends StatelessWidget {
  final int count;
  final String description;
  final double? width;

  const DeliveryWidget(
      {required this.count, required this.description, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: DigitCard(margin: const EdgeInsets.all(spacer2), children: [
        Center(
          child: Text(
            count.toString(),
            textAlign: TextAlign.center,
            style: theme.digitTextTheme(context).headingXl.copyWith(
                  color: theme.colorTheme.primary.primary2,
                ),
          ),
        ),
        Center(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: theme.digitTextTheme(context).bodyS.copyWith(
                  color: theme.colorTheme.text.secondary,
                ),
          ),
        )
      ]),
    );
  }
}
