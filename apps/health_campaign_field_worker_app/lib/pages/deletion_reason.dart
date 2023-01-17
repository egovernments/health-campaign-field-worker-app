import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../widgets/header/back_navigation_help_header.dart';

class DeletionReasonPage extends StatelessWidget {
  const DeletionReasonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: Column(children: const [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          DigitCard(
            child: Column(children: const []),
          ),
        ],
      ),
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: DigitCard(
          child: DigitElevatedButton(
            onPressed: null,
            child: Center(
              child: Text(
                "Delete",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
