import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitToggle extends StatefulWidget {
  final void Function(bool isSelected) onChanged;
  String label;
  final EdgeInsets? padding;
  final double width;

  DigitToggle({
    Key? key,
    required this.onChanged,
    required this.label,
    this.padding,
    this.width = 112,
  }) : super(key: key);

  @override
  _DigitToggleState createState() => _DigitToggleState();
}

class _DigitToggleState extends State<DigitToggle> {
  bool isSelected = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: Align(
      alignment: Alignment.centerLeft,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },

          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
              widget.onChanged(isSelected);
            },
            child: Container(
              height: 32,
              width: widget.width,
              constraints: const BoxConstraints(
                minWidth: 40,
                maxWidth: 200,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                border: Border.all(
                  color: (isHovered || isSelected) ? const DigitColors().burningOrange :const DigitColors().cloudGray,
                  width: 1.0,
                ),
                color: isSelected ? const DigitColors().burningOrange :Colors.transparent,
              ),
              child: Center(
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (isHovered && isSelected==false) ? const DigitColors().burningOrange : isSelected ? const DigitColors().white :const DigitColors().cloudGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
