import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class AcknowledgementPage extends StatelessWidget {
  const AcknowledgementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DigitAcknowledgement(
        color: DigitTheme.instance.colorScheme.onSurfaceVariant,
        cardHeight: MediaQuery.of(context).size.height / 3,
        action: (() {}),
        actionLabel: 'Back to Search',
        description: 'The data has been recorded successfully. ',
        icon: Icons.check_circle,
        label: 'Data recorded successfully',
      ),
    );
  }
}
