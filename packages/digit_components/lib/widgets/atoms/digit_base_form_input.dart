import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
  final String? initialValue;
  final double height;
  final double width;

  const BaseDigitFormInput(
      {Key? key,
      required this.controller,
      // required this.state,
      this.state = 'default',
      this.initialValue,
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
      this.height = 40,
      this.width = 380,
      this.keyboardType = TextInputType.text,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  BaseDigitFormInputState createState() => BaseDigitFormInputState();
}

class BaseDigitFormInputState extends State<BaseDigitFormInput> {
  String? _value;
  bool _hasError = false;
  late FocusNode myFocusNode;
  bool isVisible = false;

  String? _errorMessage;

  void onFocusChange() {
    if (!myFocusNode.hasFocus) {
      // If the focus is lost, perform validation
      setState(() {
        _errorMessage = customValidator?.call(widget.controller.text);
        _hasError = _errorMessage != null;
      });

      // Call the provided onError function if there is an error
      if (_hasError && widget.onError != null) {
        widget.onError!(_errorMessage);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();

    myFocusNode.addListener(onFocusChange);

    if (widget.initialValue != null) {
      widget.controller.text = widget.initialValue!;
    }

    // _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.removeListener(onFocusChange);
    myFocusNode.dispose();
  }

  String? customValidator(String? value) {
    // Only perform validation when the user is typing
    if (value == null || value.isEmpty) {
      return "Please enter a valid value."; // Return any non-null value to indicate validation failure
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
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            focusNode: myFocusNode,
            obscureText: isVisible,
            controller: widget.controller,
            enabled: !isDisabled,
            autovalidateMode: AutovalidateMode.disabled,
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            // style: DigitTheme.instance.mobileTheme.textTheme.bodyLarge?.apply(
            //   color: theme.colorScheme.primary,
            // ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
              hintText: widget.innerLabel,
              filled: true,
              fillColor:
                  isDisabled ? const DigitColors().seaShellGray : Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _hasError
                      ? const DigitColors().lavaRed
                      : const DigitColors().davyGray,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.zero,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const DigitColors().burningOrange, width: 1.0),
                borderRadius: BorderRadius.zero,
              ),

              // suffix: Icon(widget.suffix, size: 24,),
              suffixIcon: widget.suffixIcon != null
                  ? GestureDetector(
                      onTap: onSuffixIconClick,
                      child: Container(
                        margin: const EdgeInsets.only(left: kPadding),
                        decoration: BoxDecoration(
                          color: const DigitColors().seaShellGray,
                          border: Border.all(
                            color: const DigitColors().davyGray,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                        child: Icon(
                          widget.suffixIcon!,
                          size: 20,
                          color: const DigitColors().davyGray,
                        ),
                      ),
                    )
                  : widget.suffix != null
                      ? GestureDetector(
                          onTap: onSuffixIconClick,
                          child: Padding(
                            padding:
                                const EdgeInsets.all(0.0), // Set padding to 0
                            child: Icon(
                              widget.suffix,
                              size: 24,
                            ),
                          ),
                        )
                      : null,
              suffixIconColor: const DigitColors().davyGray,
              prefixIcon: widget.prefixIcon != null
                  ? GestureDetector(
                      onTap: onPrefixIconClick,
                      child: Container(
                        margin: const EdgeInsets.only(right: kPadding),
                        decoration: BoxDecoration(
                          color: const DigitColors().seaShellGray,
                          border: Border(
                            top: BorderSide(
                              color: MaterialStateColor.resolveWith((states) =>
                                  states.contains(MaterialState.focused)
                                      ? const DigitColors().burningOrange
                                      : const DigitColors().davyGray),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: MaterialStateColor.resolveWith((states) =>
                                  states.contains(MaterialState.focused)
                                      ? const DigitColors().burningOrange
                                      : const DigitColors().davyGray),
                              width: 1.0,
                            ),
                            left: BorderSide(
                              color: MaterialStateColor.resolveWith((states) =>
                                  states.contains(MaterialState.focused)
                                      ? const DigitColors().burningOrange
                                      : const DigitColors().davyGray),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              color: const DigitColors().davyGray,
                              width: 1.0,
                            ),
                          ),
                          // borderRadius: BorderRadius.zero,
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
                _hasError
                    ? Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: const DigitColors().lavaRed,
                            size: 16,
                          ),
                          Text(
                            _errorMessage!,
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.bodyMedium
                                ?.apply(
                              color: const DigitColors().lavaRed,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        widget.helpText!,
                        style: theme.textTheme.bodyMedium,
                      ),
              if (widget.charCount != null)
                if (widget.helpText == null && _hasError == false)
                  const Spacer(),
              Text(
                '${widget.controller.text.length ?? 0}/64',
              ),
            ],
          ),
      ],
    );
  }
}

