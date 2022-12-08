import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitLanguageCard extends StatelessWidget {
  final List<DigitRowCardModel> list;
  final Function onPressedicon;
  final VoidCallback onPressedButton;
  final String actionlabel;
  const DigitLanguageCard({
    super.key,
    required this.list,
    required this.onPressedicon,
    required this.onPressedButton,
    required this.actionlabel,
  });

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      margin: const EdgeInsets.only(bottom: 102, left: 8, right: 8),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 108),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
              ),
              child: DigitRowCard(
                onPressed: (data) => onPressedicon(data),
                list: list,
                width: (MediaQuery.of(context).size.width / list.length) -
                    16 * list.length,
              ),
            ),
            DigitElevatedButton(
              onPressed: () => onPressedButton(),
              child: Center(
                child: Text(actionlabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
