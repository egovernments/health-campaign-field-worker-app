import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isDisabled;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return widget.isDisabled
        ? _buildButtonWidget() // If disabled, don't use MouseRegion
        : MouseRegion(
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
      child: _buildButtonWidget(),
    );
  }

  Widget _buildButtonWidget() {
    if (widget.type == ButtonType.primary || widget.type == ButtonType.secondary) {
      return InkWell(
        onTap: widget.isDisabled ? null :widget.onPressed,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: IntrinsicWidth(
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: (widget.type == ButtonType.primary)
                  ? [
                BoxShadow(
                  color: isHovered ? const DigitColors().burningOrange :const DigitColors().woodsmokeBlack,
                  offset: const Offset(0, 2.0),
                ),
              ]
                  : [],
              borderRadius: BorderRadius.zero,
              border: Border.all(
                color: widget.isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange,
                width: isHovered ? 2 : 1,
              ),
              color: widget.type == ButtonType.primary
                  ? (widget.isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange)
                  : null,
            ),
            child: _buildButton(),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: widget.isDisabled ? null :widget.onPressed,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: IntrinsicWidth(
          child: _buildButton(),
        ),
      );
    }
  }

  Widget _buildButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefixIcon != null) ...[
              Icon(
                widget.prefixIcon,
                size: 20,
                color: widget.type == ButtonType.primary
                    ? const DigitColors().white
                    : (widget.isDisabled ? const DigitColors().cloudGray: const DigitColors().burningOrange),
              ),
            ],
            Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: widget.type == ButtonType.primary
                    ? const DigitColors().white
                    : (widget.isDisabled ? const DigitColors().cloudGray: const DigitColors().burningOrange),
                decoration:
                widget.type == ButtonType.link ? TextDecoration.underline : null,
              ),
            ),
            if (widget.suffixIcon != null) ...[
              Icon(
                widget.suffixIcon,
                size: 20,
                color: widget.type == ButtonType.primary
                    ? const DigitColors().white
                    : (widget.isDisabled ? const DigitColors().cloudGray: const DigitColors().burningOrange),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary,
  tertiary,
  link,
}
