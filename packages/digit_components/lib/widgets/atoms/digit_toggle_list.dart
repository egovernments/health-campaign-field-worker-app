import 'package:flutter/material.dart';

import 'digit_toggle.dart';

class DigitToggleList extends StatefulWidget {
  final List<ToggleButtonModel> toggleButtons;
  final void Function(List<bool> selectedValues) onChanged;

  DigitToggleList({
    Key? key,
    required this.toggleButtons,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DigitToggleListState createState() => _DigitToggleListState();
}

class _DigitToggleListState extends State<DigitToggleList> {
  late List<bool> isSelectedList;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    isSelectedList = List.generate(widget.toggleButtons.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.toggleButtons.map(
            (button) {
          final index = widget.toggleButtons.indexOf(button);
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DigitToggle(
              onChanged: (isSelected) {
                setState(() {
                  if (isSelected) {
                    // Unselect the previously selected item
                    if (selectedIndex != null && selectedIndex != index) {
                      isSelectedList[selectedIndex!] = false;
                    }
                    selectedIndex = index;
                  } else {
                    selectedIndex = null;
                  }

                  isSelectedList[index] = isSelected;
                });

                widget.onChanged(isSelectedList);

                // Check if the button is selected and has a callback
                if (isSelected && button.onSelected != null) {
                  button.onSelected!();
                }
              },
              label: button.name,
            ),
          );
        },
      ).toList(),
    );
  }
}

class ToggleButtonModel {
  final String name;
  final String key;
  final void Function()? onSelected; // Callback function when the button is selected

  ToggleButtonModel({
    required this.name,
    required this.key,
    this.onSelected,
  });
}