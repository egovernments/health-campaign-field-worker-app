import 'dart:convert';
import 'dart:io';

import 'models/swagger_model.dart';

class SwaggerParser {
  static Future<SwaggerSchema> parse(String filePath) async {
    final fileContent = await File(filePath).readAsString();
    final json = jsonDecode(fileContent) as Map<String, dynamic>;

    final definitions = json['definitions'] as Map<String, dynamic>? ?? {};

    final models = <String, SwaggerModel>{};

    for (final entry in definitions.entries) {
      final modelName = entry.key;
      final schema = entry.value as Map<String, dynamic>;
      final properties = schema['properties'] as Map<String, dynamic>? ?? {};

      final fields = <String, SwaggerField>{};
      for (final propEntry in properties.entries) {
        final propName = propEntry.key;
        final propSchema = propEntry.value as Map<String, dynamic>;

        fields[propName] = SwaggerField.fromJson(propSchema);
      }

      models[modelName] = SwaggerModel(name: modelName, fields: fields);
    }

    return SwaggerSchema(models: models);
  }
}
