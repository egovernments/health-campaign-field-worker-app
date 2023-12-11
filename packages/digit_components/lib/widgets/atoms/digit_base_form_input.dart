import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../utils/validators/validator.dart';

class BaseDigitFormInput extends StatefulWidget {
  final TextEditingController controller;
  final bool readOnly;
  final bool isDisabled;
  final String? label;
  final bool? info;
  final String? infoText;
  final bool charCount;
  final String? innerLabel;
  final String? helpText;
  final IconData? suffix;
  final TooltipTriggerMode triggerMode;
  final bool preferToolTipBelow;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final void Function(String?)? onError;
  final void Function()? onSuffixTap;
  final int minLine;
  final int maxLine;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final String? initialValue;
  final double height;
  final double width;
  final List<Validator>? validations;

  const BaseDigitFormInput(
      {Key? key,
      required this.controller,
      this.isDisabled = false,
      this.readOnly = false,
      this.initialValue,
      this.label,
      this.info,
        this.infoText,
      this.suffix,
      this.charCount = false,
      this.innerLabel,
      this.helpText,
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
        this.validations,
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
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.removeListener(onFocusChange);
    myFocusNode.dispose();
  }

  String? customValidator(String? value) {
    final validationError = InputValidators.validate(
      value,
      widget.validations ?? [],
    );

    setState(() {
      _errorMessage = validationError;
      _hasError = validationError != null;
    });

    // Call the provided onError function if there is an error
    if (_hasError && widget.onError != null) {
      widget.onError!(_errorMessage);
    }

    return validationError;
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

    int? getValidatorValue(List<Validator>? validators, ValidatorType type) {
      for (var validator in validators!) {
        if (validator?.type == type) {
          return validator?.value as int?;
        }
      }
      return null;
    }
    int? maxLengthValue = widget.charCount
        ? (widget.validations != null
        ? getValidatorValue(widget.validations, ValidatorType.maxLength) ?? 64
        : 64)
        : null;

    // Responsive width based on screen size
    double inputWidth = MediaQuery.of(context).size.width < 600 ? 340 : 600;


    return Container(
      width: inputWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget?.label != null)
                Text(
                  widget!.label!,
                  style: theme.textTheme.bodyLarge?.apply(color: const DigitColors().woodsmokeBlack),
                ),
              if (widget?.info == true)
                Tooltip(
                  message: widget.infoText,
                  preferBelow: widget.preferToolTipBelow,
                  triggerMode: widget.triggerMode,
                  child: const Icon(
                    Icons.info_outline,
                    size: 16,
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            focusNode: myFocusNode,
            obscureText: isVisible,
            controller: widget.controller,
            readOnly: widget.readOnly,
            enabled: !widget.isDisabled,
            autovalidateMode: AutovalidateMode.disabled,
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            maxLength: maxLengthValue,
            decoration: InputDecoration(
              // isDense: true,
              counterText: '',
              hoverColor: Colors.transparent,

              constraints: widget.minLine>1 ? const BoxConstraints(maxWidth: 600, maxHeight: 100, minHeight: 40): const BoxConstraints(maxWidth: 600, maxHeight: 40, minHeight: 40),
              contentPadding: widget.minLine>1 ?
              const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12):
                  const EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
              hintText: widget.innerLabel,
              filled: true,
              fillColor: widget.readOnly
                  ? const DigitColors().seaShellGray
                  : Colors.transparent,
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
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const DigitColors().cloudGray, width: 1.0),
                borderRadius: BorderRadius.zero,
              ),
              prefixIconConstraints: widget.prefixIcon != null
                  ? const BoxConstraints(
                      maxWidth: 48,
                      maxHeight: 40,
                    )
                  : null,
              suffixIconConstraints: widget.suffixIcon != null
                  ? const BoxConstraints(
                      maxWidth: 48,
                      maxHeight: 40,
                    )
                  : const BoxConstraints(
                      maxHeight: 24,
                    ),
              suffixIcon: widget.suffixIcon != null
                  ? GestureDetector(
                      onTap: widget.readOnly ? null : onSuffixIconClick,
                      child: Container(
                        height: 38,
                        width: 40,
                        margin: const EdgeInsets.only(left: kPadding, right: 1,),
                        decoration: BoxDecoration(
                          color: const DigitColors().seaShellGray,
                          border: Border(
                            left: BorderSide(
                              color: widget.isDisabled
                                  ? const DigitColors().cloudGray
                                  : const DigitColors().davyGray,
                              width: 1.0, // specify the width of the border
                            ),
                            top: BorderSide.none,
                            bottom: BorderSide.none,
                            right: BorderSide.none,
                          ),
                        ),
                        child: Icon(
                          widget.suffixIcon!,
                          size: 20,
                          color: widget.isDisabled
                              ? const DigitColors().cloudGray
                              : const DigitColors().davyGray,
                        ),
                      ),
                    )
                  : widget.suffix != null
                      ? GestureDetector(
                          onTap: widget.readOnly ? null : onSuffixIconClick,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ), // Set padding to 0
                            child: Icon(
                              isVisible==true ? Icons.visibility_off : widget.suffix,
                              size: 24,
                            ),
                          ),
                        )
                      : null,
              suffixIconColor: widget.isDisabled
                  ? const DigitColors().cloudGray
                  : const DigitColors().davyGray,
              prefixIcon: widget.prefixIcon != null
                  ? GestureDetector(
                      onTap: widget.readOnly ? null : onPrefixIconClick,
                      child: Container(
                        height: 38,
                        width: 40,
                        margin: const EdgeInsets.only(right: kPadding, left: 1,),
                        decoration: BoxDecoration(
                          color : const DigitColors().seaShellGray,
                          border: Border(
                            right: BorderSide(
                              color: widget.isDisabled
                                  ? const DigitColors().cloudGray
                                  : const DigitColors().davyGray,
                              width: 1.0, // specify the width of the border
                            ),
                            top: BorderSide.none,
                            bottom: BorderSide.none,
                            left: BorderSide.none,
                          ),
                        ),
                        child: Icon(
                          widget.prefixIcon!,
                          size: 20,
                          color: widget.isDisabled
                              ? const DigitColors().cloudGray
                              : const DigitColors().davyGray,
                        ),
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
                          style: theme.textTheme.bodyMedium?.apply(color: const DigitColors().davyGray),
                        ),

                  if (widget.helpText == null && _hasError == false)
                    const Spacer(),
                if (widget.charCount ==true)
                Text(
                  '${widget.controller.text.length ?? 0}/$maxLengthValue',
                ),
              ],
            ),
        ],
      ),
    );
  }
}
