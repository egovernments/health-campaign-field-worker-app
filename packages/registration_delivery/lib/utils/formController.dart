import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'constants.dart';

class FormControlFactory {
  // This static method generates a FormControl based on the given type.
  static FormControl createFormControl({
    required String type,
    dynamic initialValue = "",
  }) {
    switch (type) {
      case 'String':
        return FormControl<String>(
          value: initialValue as String?,
        );
      case 'int':
        return FormControl<int>(
          value: initialValue != '' ? int.tryParse(initialValue.toString()) : null,
        );
      case 'double':
        return FormControl<double>(
          value: initialValue != '' ? double.tryParse(initialValue.toString()) : null,
        );
      case 'bool':
        return FormControl<bool>(
          value: initialValue != '' ? bool.tryParse(initialValue.toString()) : null,
        );
      case 'DateTime':
        return FormControl<DateTime>(
          value: initialValue != ''
              ? DateTime.parse(
                  initialValue.toString(),
                )
              : null,
        );
      case 'List<String>':
        return FormControl<List<String>>(
            value: initialValue != '' ? initialValue as List<String>? : null,
        );
      default:
        throw Exception("Unsupported type $type");
    }
  }
}
