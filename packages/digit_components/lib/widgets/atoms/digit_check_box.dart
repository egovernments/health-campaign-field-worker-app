import 'package:flutter/material.dart';

class DigitCheckBox extends StatelessWidget {
  final bool isChecked;
  final String checkBoxText;
  final Function() onChange;

  const DigitCheckBox(
      {super.key,
      required this.checkBoxText,
      required this.onChange,
      this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: InkWell(
        onTap: onChange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                  value: isChecked,
                  side: MaterialStateBorderSide.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return BorderSide(
                          width: 2.0, color: theme.colorScheme.secondary);
                    }
                  }),
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return theme.colorScheme.surface;
                    }
                    return theme.colorScheme.secondary;
                  }),
                  checkColor: theme.colorScheme.secondary,
                  onChanged: (bool? value) {
                    onChange;
                  }),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              checkBoxText,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
