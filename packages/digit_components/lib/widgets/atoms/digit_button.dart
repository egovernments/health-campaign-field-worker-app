/// `DigitButton` is a customizable button widget that supports various styles and states.
///
/// This widget provides options for primary, secondary, tertiary, and link button types.
/// It handles hover effects, disabled state, and different icon placements.
///
/// Example usage:
/// ```dart
/// DigitButton(
///   label: 'Click me',
///   onPressed: () {
///     // Handle button press
///   },
///   type: ButtonType.primary,
///   prefixIcon: Icons.star,
///   suffixIcon: Icons.arrow_forward,
///   isDisabled: false,
///   buttonPadding: DigitButtonConstants.defaultButtonPadding,
///   contentPadding: DigitButtonConstants.defaultContentPadding,
///   iconSize: DigitButtonConstants.defaultIconSize,
/// )
/// ```
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../enum/app_enums.dart';

class DigitButton extends StatefulWidget {
  /// The text displayed on the button, representing the button's label or content.
  final String label;

  /// Callback function invoked when the button is pressed. Defines the action to be performed.
  final VoidCallback onPressed;

  /// Specifies the type or style of the button (primary, secondary, tertiary, or link).
  final ButtonType type;

  /// Icon to be displayed before the label text. Can be null if no prefix icon is needed.
  final IconData? prefixIcon;

  /// Icon to be displayed after the label text. Can be null if no suffix icon is needed.
  final IconData? suffixIcon;

  /// Indicates whether the button is in a disabled state. If true, the button is disabled and cannot be interacted with.
  final bool isDisabled;

  /// Padding around the entire button. Customizes the spacing between the button's content and its border.
  final EdgeInsetsGeometry buttonPadding;

  /// Padding around the content of the button (label and icons).
  final EdgeInsetsGeometry contentPadding;

  /// Size of the icons (prefixIcon and suffixIcon) displayed on the button in logical pixels.
  final double iconSize;

  const DigitButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.buttonPadding = DigitButtonConstants.defaultButtonPadding,
    this.contentPadding = DigitButtonConstants.defaultContentPadding,
    this.iconSize = DigitButtonConstants.defaultIconSize,
  }) : super(key: key);

  @override
  _DigitButtonState createState() => _DigitButtonState();
}

class _DigitButtonState extends State<DigitButton> {
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

  /// Build the button widget based on its type and state.
  Widget _buildButtonWidget() {
    if (widget.type == ButtonType.primary ||
        widget.type == ButtonType.secondary) {
      return InkWell(
        onTap: widget.isDisabled ? null : widget.onPressed,
        splashColor: const DigitColors().transaparent,
        hoverColor: const DigitColors().transaparent,
        child: IntrinsicWidth(
          child: Container(
            padding: widget.buttonPadding,
            decoration: BoxDecoration(
              boxShadow: (widget.type == ButtonType.primary)
                  ? [
                BoxShadow(
                  color: isHovered
                      ? DigitButtonConstants.defaultPrimaryColor
                      : DigitButtonConstants.defaultSecondaryColor,
                  offset: const Offset(0, 2.0),
                ),
              ]
                  : [],
              borderRadius: BorderRadius.zero,
              border: Border.all(
                color: widget.isDisabled
                    ? DigitButtonConstants.defaultDisabledColor
                    : DigitButtonConstants.defaultPrimaryColor,
                width: isHovered ? DigitButtonConstants.defaultHoverWidth : DigitButtonConstants.defaultWidth,
              ),
              color: widget.type == ButtonType.primary
                  ? (widget.isDisabled
                  ? DigitButtonConstants.defaultDisabledColor
                  : DigitButtonConstants.defaultPrimaryColor)
                  : null,
            ),
            child: _buildButton(),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: widget.isDisabled ? null : widget.onPressed,
        hoverColor: const DigitColors().transaparent,
        splashColor: const DigitColors().transaparent,
        child: IntrinsicWidth(
          child: _buildButton(),
        ),
      );
    }
  }

  /// Build the content of the button, including label and icons.
  Widget _buildButton() {
    return Center(
      child: Padding(
        padding: widget.contentPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefixIcon != null) ...[
              Icon(
                widget.prefixIcon,
                size: widget.iconSize,
                color: widget.type == ButtonType.primary
                    ? DigitButtonConstants.defaultTextColor
                    : (widget.isDisabled
                    ? DigitButtonConstants.defaultDisabledColor
                    : DigitButtonConstants.defaultPrimaryColor),
              ),
            ],
            Text(widget.label,
                style: DigitTheme.instance.mobileTheme.textTheme.bodyLarge
                    ?.copyWith(
                  color: widget.type == ButtonType.primary
                      ? DigitButtonConstants.defaultTextColor
                      : (widget.isDisabled
                      ? DigitButtonConstants.defaultDisabledColor
                      : DigitButtonConstants.defaultPrimaryColor),
                  decoration: widget.type == ButtonType.link
                      ? TextDecoration.underline
                      : null,
                )),
            if (widget.suffixIcon != null) ...[
              Icon(
                widget.suffixIcon,
                size: widget.iconSize,
                color: widget.type == ButtonType.primary
                    ? DigitButtonConstants.defaultTextColor
                    : (widget.isDisabled
                    ? DigitButtonConstants.defaultDisabledColor
                    : DigitButtonConstants.defaultPrimaryColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
