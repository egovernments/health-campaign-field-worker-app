import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitRadioList extends StatefulWidget {
  final dynamic value;
  final dynamic groupValue;
  final ValueChanged<dynamic>? onChanged;
  final String label;
  final List<RadioButtonModel> radioButtons;

  const DigitRadioList({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    required this.radioButtons,
  }) : super(key: key);

  @override
  _DigitRadioListState createState() => _DigitRadioListState();
}

class _DigitRadioListState extends State<DigitRadioList> {
  dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.radioButtons
          .map(
            (button) => Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedValue = button.value;
                });
                widget.onChanged?.call(button.value);
              },
              child: Padding(
                padding: EdgeInsets.all(0), // Set padding to 0
                child: Row(
                  children: [
                    Radio(
                          splashRadius: 1,
                          // fillColor: MaterialStateColor.resolveWith(
                          //         (states) => const DigitColors().burningOrange),
                          value: button.value,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                            widget.onChanged?.call(value);
                          },
                        ),
                    Text(button.label),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
          .toList(),
    );
  }
}

class RadioButtonModel {
  final dynamic value;
  final String label;
  final ValueChanged<dynamic>? onChanged;

  RadioButtonModel({
    required this.value,
    required this.label,
    this.onChanged,
  });
}
