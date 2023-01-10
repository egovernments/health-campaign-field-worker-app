import 'package:flutter/material.dart';

class DigitDropDown extends StatelessWidget {
  final String initialValue;
  final List<String> menuItems;
  final void Function(String? value) onChanged;

  const DigitDropDown(
      {super.key,
      required this.initialValue,
      required this.menuItems,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        border: Border.all(
            color: Colors.grey, style: BorderStyle.solid, width: 2.0),
      ),
      child: DropdownButton<String>(
        underline: Container(
          color: Theme.of(context).canvasColor,
        ),
        isDense: false,
        isExpanded: true,
        alignment: Alignment.topLeft,
        value: initialValue,
        icon: const Icon(Icons.arrow_drop_down),
        style: TextStyle(color: Theme.of(context).primaryColor),
        onChanged: (String? value) {
          onChanged(value);
        },
        items: menuItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        }).toList(),
      ),
    );
  }
}
