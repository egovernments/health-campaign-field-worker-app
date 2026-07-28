import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorContainer extends StatelessWidget {
  final String label;
  final String prefixLabel;
  final String suffixLabel;

  /// Bar fill fraction (0.0 - 1.0). Pass `null` to render as an
  /// indeterminate/animated bar — used during the "waiting for the
  /// first batch" window on a downsync, where the numeric counters
  /// have nothing to advance yet but the user still needs a visual
  /// signal that work is in flight.
  final double? value;
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
      children: <Widget>[
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(spacer2 * 2),
          child: Column(
            children: [
              LinearProgressIndicator(
                backgroundColor: theme.colorTheme.generic.background,
                valueColor: valueColor ??
                    AlwaysStoppedAnimation<Color>(
                      theme.colorTheme.primary.primary1,
                    ),
                value: value,
                minHeight: height ?? 7.0,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(radius ?? spacer1),
                    left: Radius.circular(radius ?? spacer1)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: spacer2 + 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      prefixLabel,
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      suffixLabel,
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
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
