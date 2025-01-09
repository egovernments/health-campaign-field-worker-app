import 'package:reactive_forms/reactive_forms.dart';

class FormControlFactory {
  // This static method generates a FormControl based on the given type.
  static FormControl createFormControl({
    required String type,
    dynamic initialValue = "",
    dynamic localizations
  }) {
    switch (type) {
      case 'String':
        return FormControl<String>(
          value: localizations.translate(initialValue as String?),
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
          value: initialValue != '' ? localizations.translate(bool.tryParse(initialValue.toString())) : null,
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
            value: (initialValue != '' && initialValue.length != 0) ? initialValue as List<String>? : null,
        );
      default:
        throw Exception("Unsupported type $type");
    }
  }
}
