import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';

class DigitRowCard extends StatelessWidget {
  final List<DigitRowCardModel> list;
  final Function onPressed;
  final double width;
  const DigitRowCard({
    super.key,
    required this.onPressed,
    required this.list,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list
            .map(
              (ele) => SizedBox(
                height: 38,
                width: width,
                child: GestureDetector(
                  onTap: () => onPressed(ele),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ele.isSelected
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                      color: ele.isSelected
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: Center(
                      child: Text(
                        ele.label,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ele.isSelected
                              ? Theme.of(context).colorScheme.onSecondary
                              : Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList());
  }
}
