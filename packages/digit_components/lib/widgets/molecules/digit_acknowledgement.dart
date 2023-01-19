import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitAcknowledgement extends StatelessWidget {
  final String label;
  final String description;
  final IconData icon;
  final VoidCallback action;
  final String actionLabel;
  final Color color;

  DigitAcknowledgement.success({
    super.key,
    required this.label,
    required this.description,
    required this.action,
    required this.actionLabel,
    IconData? icon,
    Color? color,
  })  : color = color ?? DigitTheme.instance.colors.darkSpringGreen,
        icon = icon ?? Icons.check_circle;

  DigitAcknowledgement.error({
    super.key,
    required this.label,
    required this.description,
    required this.action,
    required this.actionLabel,
    IconData? icon,
    Color? color,
  })  : color = color ?? DigitTheme.instance.colors.lavaRed,
        icon = icon ?? Icons.error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScrollableContent(
      children: [
        DigitCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DigitTheme.kPadding * 2,
                  vertical: DigitTheme.kPadding * 4,
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height / 3,
                ),
                color: color,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          textAlign: TextAlign.center,
                          label,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.onPrimary,
                          )),
                      Padding(
                        padding: DigitTheme.instance.containerMargin,
                        child: Icon(
                          icon,
                          size: 32,
                          color: theme.colorScheme.onPrimary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: DigitTheme.instance.containerMargin,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  DigitTheme.kPadding,
                  DigitTheme.kPadding,
                  DigitTheme.kPadding,
                  DigitTheme.kPadding * 2,
                ),
                child: DigitElevatedButton(
                  onPressed: action,
                  child: Text(actionLabel),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
