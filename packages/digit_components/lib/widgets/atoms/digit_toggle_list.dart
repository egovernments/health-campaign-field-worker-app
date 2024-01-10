import 'package:flutter/material.dart';
import '../../models/toggleButtonModel.dart';
import 'digit_toggle.dart';

class DigitToggleList extends StatefulWidget {
  final List<ToggleButtonModel> toggleButtons;
  final void Function(List<bool> selectedValues) onChanged;
  final EdgeInsets? contentPadding;

  const DigitToggleList({
    Key? key,
    required this.toggleButtons,
    required this.onChanged,
    this.contentPadding,
  }) : super(key: key);

  @override
  _DigitToggleListState createState() => _DigitToggleListState();
}

class _DigitToggleListState extends State<DigitToggleList> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.toggleButtons.map(
            (button) {
          final index = widget.toggleButtons.indexOf(button);
          return Padding(
            padding: widget.contentPadding ?? const EdgeInsets.only(bottom: 8),
            child: DigitToggle(
              onChanged: (isSelected) {
                setState(() {
                  if (isSelected) {
                    if (selectedIndex != null && selectedIndex == index) {
                      /// Clicked on the already selected item, unselect it
                      selectedIndex = null;
                    } else {
                      /// Unselect the previously selected item
                      if (selectedIndex != null) {
                        widget.toggleButtons[selectedIndex!].onSelected?.call();
                      }
                      selectedIndex = index;
                    }
                  } else {
                    selectedIndex = null;
                  }
                });

                /// Check if the button is selected and has a callback
                if (isSelected && button.onSelected != null) {
                  button.onSelected!();
                }
              },
              label: button.name,
              isSelected: selectedIndex == index,
            ),
          );
        },
      ).toList(),
    );
  }
}

