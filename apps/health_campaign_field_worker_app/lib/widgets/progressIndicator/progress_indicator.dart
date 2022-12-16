import 'package:digit_components/widgets/digit_card.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorContainer extends StatelessWidget {
  final String progressIndicatorLabel;
  final String progressIndicatorPrefixLabel;
  final String progressIndicatorSufixLabel;
  final double progressIndicatorvalue;
  const ProgressIndicatorContainer({
    super.key,
    required this.progressIndicatorLabel,
    required this.progressIndicatorPrefixLabel,
    required this.progressIndicatorSufixLabel,
    required this.progressIndicatorvalue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DigitCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            progressIndicatorLabel,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.onSurfaceVariant,
                  ),
                  value: progressIndicatorvalue,
                  minHeight: 7.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        progressIndicatorPrefixLabel,
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        progressIndicatorSufixLabel,
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
