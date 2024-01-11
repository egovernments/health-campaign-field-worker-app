
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/AppView.dart';
import '../../constants/app_constants.dart';
import '../../utils/validators/validator.dart';

/// `BaseDigitFormInput` is a base class for different form input fields. It provides a set of customizable
/// parameters and common functionality for building various types of input fields within a form.
class BaseDigitFormInput extends StatefulWidget {
  /// Text editing controller for the input field.
  final TextEditingController controller;

  /// Determines if the input field is read-only.
  final bool readOnly;

  /// Indicates whether the input field is disabled.
  final bool isDisabled;

  /// Label displayed above the input field.
  final String? label;

  /// Indicates whether additional information (tooltip) is available.
  final bool? info;

  /// Additional information text for tooltip.
  final String? infoText;

  /// Indicates whether to show character count.
  final bool charCount;

  /// Inner label (hint) for the input field.
  final String? innerLabel;

  /// Help text displayed below the input field.
  final String? helpText;

  /// Icon to be displayed as a suffix in the input field.
  final IconData? suffix;

  /// Determines when the tooltip should be triggered.
  final TooltipTriggerMode triggerMode;

  /// Determines whether the tooltip should appear below the input field.
  final bool preferToolTipBelow;

  /// Icon to be displayed as a suffix in the input field.
  final IconData? suffixIcon;

  /// Icon to be displayed as a prefix in the input field.
  final IconData? prefixIcon;

  /// Callback function triggered on validation error.
  final void Function(String?)? onError;

  /// Callback function triggered on suffix icon tap.
  final void Function(String)? onSuffixTap;

  /// Minimum number of lines for the input field.
  final int minLine;

  /// Maximum number of lines for the input field.
  final int maxLine;

  /// Preferred height of the input field.
  final double height;

  /// Preferred width of the input field.
  final double width;

  /// List of validation rules to be applied.
  final List<Validator>? validations;

  /// Callback function triggered on input value change.
  final void Function(String)? onChange;

  /// Step value (used for specific input types like numbers).
  final int step;

  /// Minimum allowed value (used for specific input types like numbers).
  final int minValue;

  /// Maximum allowed value (used for specific input types like numbers).
  final int maxValue;

  /// Determines whether the cursor should be visible in the input field.
  final bool showCurser;

  /// Initial value for the input field.
  final String? initialValue;

  /// Keyboard type for the input field.
  final TextInputType keyboardType;

  /// Text alignment within the input field.
  final TextAlign textAlign;

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
      this.height = Default.height,
      this.step = 1,
      this.minValue = 0,
      this.maxValue = 100,
      this.showCurser = true,
      this.width = Default.mobileInputWidth,
      this.onChange,
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
      /// If the focus is lost, perform validation
      setState(() {
        _errorMessage = customValidator?.call(widget.controller.text);
        _hasError = _errorMessage != null;
      });

      /// Call the provided onError function if there is an error
      if (_hasError) {
        widget.onError?.call(_errorMessage);
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

    return validationError;
  }

  void toggleObsecureText() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void onSuffixIconClick({void Function()? customFunction}) {
    /// Call the provided function if it's not null
    customFunction?.call();
  }

  void onPrefixIconClick({void Function()? customFunction}) {
    /// Call the provided function if it's not null
    customFunction?.call();
  }

  @override
  Widget build(BuildContext context) {
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
            ? getValidatorValue(widget.validations, ValidatorType.maxLength) ??
                64
            : 64)
        : null;

    double inputWidth = AppView.isMobileView(MediaQuery.of(context).size.width)
        ? Default.mobileInputWidth
        : Default.desktopInputWidth;

    return SizedBox(
      width: inputWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget?.label != null)
                Text(
                  widget!.label!,
                  style: DigitTheme.instance.mobileTheme.textTheme.bodyLarge
                      ?.copyWith(
                    color: const DigitColors().woodsmokeBlack,
                  ),
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
          const Gap(
            kPadding / 2,
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
            showCursor: widget.showCurser,
            decoration: InputDecoration(
              counterText: '',
              hoverColor: const DigitColors().transaparent,
              constraints: inputWidth == Default.mobileInputWidth
                  ? BoxConstraints(
                      maxHeight: widget.minLine > 1 ? BaseConstants.inputMaxHeight : BaseConstants.inputMinHeight,
                      minHeight: BaseConstants.inputMinHeight,
                      minWidth: BaseConstants.mobileInputMinWidth,
                    )
                  : BoxConstraints(
                      maxHeight: widget.minLine > 1 ? BaseConstants.inputMaxHeight : BaseConstants.inputMinHeight,
                      minHeight: BaseConstants.inputMinHeight,
                      minWidth: BaseConstants.desktopInputMinWidth,
                    ),
              contentPadding: widget.minLine > 1
                  ? const EdgeInsets.all(
                      12,
                    )
                  : const EdgeInsets.symmetric(
                      vertical: kPadding/2,
                      horizontal: 12,
                    ),
              hintText: widget.innerLabel,
              filled: true,
              fillColor: widget.readOnly
                  ? const DigitColors().seaShellGray
                  : const DigitColors().transaparent,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _hasError
                      ? const DigitColors().lavaRed
                      : const DigitColors().davyGray,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.zero,
              ),
              focusedBorder: BaseConstants.focusedBorder,
              disabledBorder:BaseConstants.disabledBorder,
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
                        margin: const EdgeInsets.only(
                          left: kPadding,
                          right: 1,
                        ),
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
                          size: BaseConstants.suffixIconSize,
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
                              right: kPadding,
                            ),
                            child: Icon(
                              isVisible == true
                                  ? Icons.visibility_off
                                  : widget.suffix,
                              size: BaseConstants.suffixIconSize,
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
                        margin: const EdgeInsets.only(
                          right: kPadding,
                          left: 1,
                        ),
                        decoration: BoxDecoration(
                          color: const DigitColors().seaShellGray,
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
                          size: BaseConstants.suffixIconSize,
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
              widget.onChange?.call(value);
            },
          ),
          const Gap(
            kPadding / 2,
          ),
          if (widget.helpText != null || widget.charCount != null || _hasError)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.helpText != null || _hasError)
                  _hasError
                      ? Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: const DigitColors().lavaRed,
                              size: BaseConstants.errorIconSize,
                            ),
                            Text(
                              _errorMessage!,
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.bodyMedium
                                  ?.copyWith(
                                color: const DigitColors().lavaRed,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          widget.helpText!,
                          style: DigitTheme
                              .instance.mobileTheme.textTheme.bodyMedium
                              ?.copyWith(
                            color: const DigitColors().davyGray,
                          ),
                        ),
                if (widget.helpText == null && _hasError == false)
                  const Spacer(),
                if (widget.charCount == true)
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
