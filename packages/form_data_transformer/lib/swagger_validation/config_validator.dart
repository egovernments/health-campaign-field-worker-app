import 'models/swagger_model.dart';
import 'models/validation_result.dart';

class ConfigValidator {
  static ValidationResult validate({
    required Map<String, dynamic> config,
    required SwaggerSchema swaggerSchema,
  }) {
    final result = ValidationResult();

    final entityType = config['entity'] as String?;
    if (entityType == null) {
      result.addError("Missing 'entity' in config.");
      return result;
    }

    final model = swaggerSchema.models[entityType];
    if (model == null) {
      result.addError("Model '$entityType' not found in Swagger definitions.");
      return result;
    }

    _validateMappings(config['mappings'], model, swaggerSchema, result);
    _validateListMappings(config['listMappings'], swaggerSchema, result);
    _validateAdditionalFields(config['additionalFields'], swaggerSchema, result);

    return result;
  }

  static void _validateMappings(
      Map<String, dynamic>? mappings,
      SwaggerModel model,
      SwaggerSchema schema,
      ValidationResult result,
      ) {
    if (mappings == null) return;

    for (final entry in mappings.entries) {
      final key = entry.key;

      if (key.startsWith('list:')) {
        final listModelName = key.split(':')[1];
        if (!schema.models.containsKey(listModelName)) {
          result.addError("List model '$listModelName' not found in Swagger.");
        }
        continue;
      }

      if (!model.fields.containsKey(key)) {
        result.addError("Field '$key' not found in Swagger model '${model.name}'.");
      }
    }
  }

  static void _validateListMappings(
      Map<String, dynamic>? listMappings,
      SwaggerSchema schema,
      ValidationResult result,
      ) {
    if (listMappings == null) return;

    for (final entry in listMappings.entries) {
      final modelName = entry.key;
      final model = schema.models[modelName];
      if (model == null) {
        result.addError("List mapping references unknown model '$modelName'.");
        continue;
      }

      final listFields = entry.value as Map<String, dynamic>;
      for (final field in listFields.keys) {
        if (!model.fields.containsKey(field)) {
          result.addError("Field '$field' not found in model '$modelName'.");
        }
      }
    }
  }

  static void _validateAdditionalFields(
      Map<String, dynamic>? additionalFields,
      SwaggerSchema schema,
      ValidationResult result,
      ) {
    if (additionalFields == null) return;

    for (final entry in additionalFields.entries) {
      final fieldName = entry.key;
      final modelName = entry.value['type'] as String?;

      if (modelName == null || !schema.models.containsKey(modelName)) {
        result.addError("Additional field '$fieldName' references invalid model '$modelName'.");
      }
    }
  }
}
