class InputValidators {
  static String? validate(String? value, List<Validator> validations) {
    for (var validation in validations) {
      final error = _applyValidation(value, validation);
      if (error != null) {
        return error;
      }
    }
    return null; // Validation passed
  }

  static String? _applyValidation(String? value, Validator validation) {
    switch (validation.type) {
      case ValidatorType.maxLength:
        if (value != null && value.length > validation.value) {
          return validation.errorMessage ?? 'Maximum length exceeded';
        }
        break;
      case ValidatorType.minLength:
        if (value != null && value.length < validation.value) {
          return validation.errorMessage ?? 'Minimum length not met';
        }
        break;
      case ValidatorType.pattern:
        if (value != null && value.isNotEmpty && !RegExp(validation.value).hasMatch(value)) {
          return validation.errorMessage ?? 'Invalid format';
        }
        break;
      case ValidatorType.mobileNumber:
        if (value != null && value.isNotEmpty && !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
          return validation.errorMessage ?? 'Invalid mobile number';
        }
        break;
      case ValidatorType.email:
        if (value != null && value.isNotEmpty && !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
          return validation.errorMessage ?? 'Invalid email address';
        }
        break;
      case ValidatorType.customFunction:
        if (validation.customValidation != null) {
          final error = validation.customValidation!(value);
          if (error != null) {
            return error;
          }
        }
        break;
      case ValidatorType.required:
        if (value == null || value.isEmpty) {
          return validation.errorMessage ?? 'Field is required';
        }
        break;

      case ValidatorType.minValue:
        if (value != null) {
          final intValue = int.tryParse(value);

          if (intValue == null || intValue < validation.value) {
            return validation.errorMessage ?? 'Value is less than the minimum allowed';
          }
        }
        break;
      case ValidatorType.maxValue:
        if (value != null) {
          final intValue = int.tryParse(value);

          if (intValue == null || intValue > validation.value) {
            return validation.errorMessage ?? 'Value exceeds the maximum allowed';
          }
        }
        break;

      default:
        return null;
    }
    return null;
  }
}

enum ValidatorType {
  maxLength,
  pattern,
  minLength,
  mobileNumber,
  email,
  customFunction,
  required,
  minValue,
  maxValue,
}

class Validator {
  final ValidatorType type;
  final dynamic? value;
  final String? errorMessage;
  final String? Function(String?)? customValidation;

  Validator(this.type, this.value, {this.errorMessage, this.customValidation});
}
