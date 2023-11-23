import 'package:flutter/material.dart';

import '../../theme/colors.dart';

enum InputState { Default, Filled, Disabled, NonEditable, Focus, Error }

class BaseDigitFormInput extends StatefulWidget {
  // final InputState state;
  final TextEditingController controller;
  final String state;
  final String? label;
  final String? info;
  final bool charCount;
  final String? innerLabel;
  final String? helpText;
  final IconData? suffix;
  final TooltipTriggerMode triggerMode;
  final bool preferToolTipBelow;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onError;
  final void Function()? onSuffixTap;
  final int minLine;
  final int maxLine;
  final TextInputType keyboardType;
  final TextAlign textAlign;

  const BaseDigitFormInput({
    Key? key,
    required this.controller,
    // required this.state,
    this.state = 'default',
    this.label,
    this.info,
    this.suffix,
    this.charCount = false,
    this.innerLabel,
    this.helpText,
    this.validator,
    this.onError,
    this.triggerMode = TooltipTriggerMode.tap,
    this.preferToolTipBelow = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onSuffixTap,
    this.minLine = 1,
    this.maxLine = 1,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start

  }) : super(key: key);

  @override
  BaseDigitFormInputState createState() => BaseDigitFormInputState();
}

class BaseDigitFormInputState extends State<BaseDigitFormInput> {
  String? _value;
  bool _hasError = false;
  late FocusNode _focusNode;
  bool isVisible = false;

  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Call the custom validator when focus is lost
        setState(() {
          if (widget.validator != null) {
            _errorMessage = widget.validator!(widget.controller.text);
            _hasError = _errorMessage != null;
          } else {
            _errorMessage = customValidator!(widget.controller.text);
            _hasError = _errorMessage != null;
          }
        });
      }
    });
  }

  String? customValidator(String? value) {
    // Your custom validation logic here
    if (_focusNode.hasFocus) {
      // Only perform validation when the user is typing
      if (value == null || value.isEmpty) {
        return "Please enter a valid value."; // Return any non-null value to indicate validation failure
      }
    }

    return null; // Return null if the validation passes.
  }

  void toggleObsecureText() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void onSuffixIconClick({void Function()? customFunction}) {
    // Call the provided function if it's not null
    customFunction?.call();
  }
  void onPrefixIconClick({void Function()? customFunction}) {
    // Call the provided function if it's not null
    customFunction?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDisabled =
        widget.state == 'Disabled' || widget.state == 'NonEditable';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget?.label != null)
              Text(
                widget!.label!,
                style: theme.textTheme.bodyLarge,
              ),
            if (widget?.info != null)
              Tooltip(
                message: widget.info,
                preferBelow: widget.preferToolTipBelow,
                triggerMode: widget.triggerMode,
                child: const Icon(
                  Icons.info_outline,
                  size: 20,
                ),
              )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          child: TextFormField(
            obscureText: isVisible,
            controller: widget.controller,
            enabled: !isDisabled,
            autovalidateMode: AutovalidateMode.disabled,
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              hintText: widget.innerLabel,
              filled: true,
              fillColor:
                  isDisabled ? const DigitColors().seaShellGray : Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: const DigitColors().burningOrange)),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const DigitColors().lavaRed, width: 1.0),
                borderRadius: BorderRadius.zero,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const DigitColors().lavaRed, width: 1.0),
                borderRadius: BorderRadius.zero,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const DigitColors().burningOrange, width: 1.0),
                borderRadius: BorderRadius.zero,
              ),
              // suffix: Icon(widget.suffix, size: 24,),
              suffixIcon:  widget.suffixIcon != null
                  ? GestureDetector(
                    onTap: onSuffixIconClick,
                    child: Container(
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          color: const DigitColors().seaShellGray,
                          border: Border.all(
                            color: const DigitColors().davyGray,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                        child: Icon(widget.suffixIcon!,
                            size: 20, color: const DigitColors().davyGray),
                      ),
                  )
                  :  widget.suffix!=null ? GestureDetector(
                  onTap: onSuffixIconClick,
                  child: Icon(widget.suffix, size: 24,),) : null,
              suffixIconColor: const DigitColors().davyGray,
              prefixIcon: widget.prefixIcon != null
                  ? GestureDetector(
                    onTap: onPrefixIconClick,
                    child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: const DigitColors().seaShellGray,
                          border: Border.all(
                            color: const DigitColors().davyGray,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                        child: Icon(widget.prefixIcon!,
                            size: 20, color: const DigitColors().davyGray),
                      ),
                  )
                  : null,
            ),
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        if (widget.helpText != null || widget.charCount != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.helpText != null)
                _hasError ? Text(_errorMessage!) : Text(
                  widget.helpText!,
                  style: theme.textTheme.bodyMedium,
                ),
              if (widget.charCount != null)
                if (widget.helpText == null && _hasError==false) const Spacer(),
              Text(
                '${widget.controller.text.length ?? 0}/64',
              ),
            ],
          ),
      ],
    );
  }
}
