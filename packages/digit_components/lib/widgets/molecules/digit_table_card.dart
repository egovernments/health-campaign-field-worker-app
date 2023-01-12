import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitTableCard extends StatelessWidget {
  final Map<String, dynamic> element;
  final EdgeInsets? padding;
  const DigitTableCard({super.key, required this.element, this.padding});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: element.keys
          .map((e) => Row(
                children: [
                  Container(
                    margin: DigitTheme.instance.verticalMargin,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        e,
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ),
                  Text(element[e].toString())
                ],
              ))
          .toList(),
    );
  }
}
