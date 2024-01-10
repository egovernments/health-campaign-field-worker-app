import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class DigitToggle extends StatefulWidget {
  final void Function(bool isSelected) onChanged;
  final String label;
  bool isSelected;

  DigitToggle({
    Key? key,
    required this.onChanged,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  @override
  _DigitToggleState createState() => _DigitToggleState();
}

class _DigitToggleState extends State<DigitToggle> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Align(
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
            widget.onChanged(true);
          },
          child: Container(
            height: 32,
            width: 112,
            constraints: const BoxConstraints(
              minWidth: 40,
              maxWidth: 200,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              border: Border.all(
                color: (isHovered || widget.isSelected)
                    ? const DigitColors().burningOrange
                    : const DigitColors().cloudGray,
                width: 1.0,
              ),
              color: widget.isSelected
                  ? const DigitColors().burningOrange
                  : Colors.transparent,
            ),
            child: Center(
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium?.copyWith(
                  color: (isHovered && !widget.isSelected)
                      ? const DigitColors().burningOrange
                      : widget.isSelected
                      ? const DigitColors().white
                      : const DigitColors().cloudGray,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
