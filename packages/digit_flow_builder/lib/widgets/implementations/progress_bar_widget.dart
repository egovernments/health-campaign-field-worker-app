import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../resolved_flow_widget.dart';

class ProgressBarWidget extends ResolvedFlowWidget {
  @override
  String get format => 'progressBar';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final height = json["height"];
    final radius = json["radius"];
    final backgroundColor = json["backgroundColor"];
    final valueColor = json["valueColor"];
    final value = json['value'];

    Map<String, Color> colorMap = {'green': Colors.green};

    return LinearProgressIndicator(
      backgroundColor: colorMap[backgroundColor],
      valueColor: AlwaysStoppedAnimation<Color>(
        colorMap[valueColor] ?? Theme.of(context).colorTheme.primary.primary1,
      ),
      value: value,
      minHeight: height ?? 15.0,
      borderRadius: BorderRadius.horizontal(
          right: Radius.circular(radius ?? spacer2),
          left: Radius.circular(radius ?? spacer2)),
    );
  }
}

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
      children: <Widget>[
        Text(
          label,
          style: theme.textTheme.bodyMedium,
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
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
