import 'package:forms_engine/utils/utils.dart';

import '../blocs/app_localization.dart';
import '../models/property_schema/property_schema.dart';

/// Translates each rule.message via [localize].
Map<String, String Function(Object)> buildValidationMessages(
  List<ValidationRule>? validations,
  FormLocalization localize,
) {
  final Map<String, String Function(Object)> messages = {};

  if (validations == null) return messages;

  for (final rule in validations) {
    if (rule.message == null) continue;

    // first translate the message
    final translated = translateIfPresent(rule.message, localize) ??
        localize.translate("FIELD_VALIDATION_ERROR");

    switch (rule.type) {
      case 'required':
        messages['required'] = (_) => translated;
        break;
      case 'minLength':
        messages['minLength'] = (_) => translated;
        break;
      case 'maxLength':
        messages['maxLength'] = (_) => translated;
        break;
      case 'min':
      case 'minValue':
        messages['min'] = (_) => translated;
        break;
      case 'max':
      case 'maxValue':
        messages['max'] = (_) => translated;
        break;
      case 'pattern':
        messages['pattern'] = (_) => translated;
        break;
      default:
        break;
    }
  }

  return messages;
}
