import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitListView extends StatelessWidget {
  final IconData? prefixIcon;
  final String title;
  final String? description;
  final IconData? sufixIcon;
  final VoidCallback? onPressed;

  const DigitListView({
    super.key,
    this.prefixIcon,
    required this.title,
    this.description,
    this.sufixIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DigitCard(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding,
        vertical: kPadding * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      prefixIcon,
                      color: theme.colorScheme.secondary,
                      size: 24,
                    ),
                    const SizedBox(width: kPadding * 2),
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                if (description != null) ...[
                  const SizedBox(height: kPadding),
                  Text(description!),
                ],
              ],
            ),
          ),
          Icon(
            sufixIcon,
            color: theme.colorScheme.secondary,
            size: 36,
          ),
        ],
      ),
    );
  }
}
