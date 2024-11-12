import 'package:reactive_forms/reactive_forms.dart';

class FormControlFactory {
  // This static method generates a FormControl based on the given type.
  static FormControl createFormControl({
    required String type,
    required dynamic initialValue,
    required List<ValidatorFunction> validators,
  }) {
    switch (type) {
      case 'String':
        return FormControl<String>(
          value: initialValue as String?,
          validators: validators,
        );
      case 'int':
        return FormControl<int>(
          value: initialValue as int?,
          validators: validators,
        );
      case 'double':
        return FormControl<double>(
          value: initialValue as double?,
          validators: validators,
        );
      case 'bool':
        return FormControl<bool>(
          value: initialValue as bool?,
          validators: validators,
        );
        case 'DateTime':
          return FormControl<DateTime>(
            value: initialValue as DateTime?,
            validators: validators,
          );
          case 'List<String>':
            return FormControl<List<String>>(
              value: initialValue as List<String>?,
              validators: validators,
          );
      default:
        throw Exception("Unsupported type $type");
    }
  }
}
