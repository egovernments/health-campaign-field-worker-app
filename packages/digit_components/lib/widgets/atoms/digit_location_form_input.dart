import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

class DigitLocationFormInput extends BaseDigitFormInput {
  DigitLocationFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? infoText,
    bool? info,
    bool readOnly = false,
    bool isDisabled = false,
    String? initialValue,
    bool charCount = false,
    String? innerLabel,
    String? helpText,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    IconData suffix = Icons.my_location,
    void Function(String?)? onError,
    final List<Validator>? validations,
    final void Function(String)? onChange,
  }) : super(
    key: key,
    controller: controller,
    label: label,
    info: info,
    infoText: infoText,
    readOnly: readOnly,
    isDisabled: isDisabled,
    charCount: charCount,
    innerLabel: innerLabel,
    helpText: helpText,
    triggerMode: triggerMode,
    preferToolTipBelow: preferToolTipBelow,
    suffix: suffix,
    onError: onError,
    initialValue: initialValue,
    validations: validations,
    onChange: onChange,
  );

  @override
  _DigitLocationFormInputState createState() => _DigitLocationFormInputState();
}

class _DigitLocationFormInputState extends BaseDigitFormInputState {

  @override
  void onSuffixIconClick({void Function()? customFunction}) async{

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request location permission
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Update the text field with the current location's latitude and longitude
      String location = "${position.latitude}, ${position.longitude}";
      widget.controller.text = location;
    }
  }

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}
