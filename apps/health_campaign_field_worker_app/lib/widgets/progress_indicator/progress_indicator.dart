import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

const Color _progressBarColor = Color(0xFF12AD65);

class ProgressIndicatorContainer extends StatelessWidget {
  final String label;
  final String prefixLabel;
  final String suffixLabel;
  final double value;
  final String? subLabel;
  final Animation<Color?>? valueColor;
  final double? height;
  final double? radius;

  const ProgressIndicatorContainer(
      {super.key,
      required this.label,
      required this.prefixLabel,
      required this.suffixLabel,
      required this.value,
      this.valueColor,
      this.subLabel,
      this.height,
      this.radius});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: theme.digitTextTheme(context).headingS.copyWith(
                color: theme.colorTheme.primary.primary2,
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: spacer2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                backgroundColor: theme.colorTheme.generic.background,
                valueColor: valueColor ??
                    const AlwaysStoppedAnimation<Color>(_progressBarColor),
                value: value,
                minHeight: height ?? 16.0,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(radius ?? spacer1),
                    left: Radius.circular(radius ?? spacer1)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: spacer2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      prefixLabel,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorTheme.alert.success,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      suffixLabel,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorTheme.alert.success,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (subLabel != null)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(spacer2),
              child: Text(
                subLabel ?? '',
                style: TextStyle(
                  color: theme.colorTheme.primary.primary1,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
