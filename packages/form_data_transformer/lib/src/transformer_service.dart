import 'dart:convert';

import 'package:digit_data_model/data_model.dart';

import 'model_factory_registory.dart';

class FormEntityMapper {
  final Map<String, dynamic> config;

  FormEntityMapper({required this.config});

  EntityModel mapFormToEntity({
    required String modelName,
    required Map<String, dynamic> formValues,
  }) {
    final modelConfig = config[modelName];
    if (modelConfig == null) {
      throw Exception("Model config not found for: $modelName");
    }

    final Map<String, dynamic> mapped = {};

    // Handle scalar mappings
    final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};
    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;
      mapped[targetKey] = _getValueFromPath(formValues, sourcePath);
    }

    // Handle list mappings (for nested sub-models)
    final listMappings = modelConfig['listMappings'] as Map<String, dynamic>? ?? {};
    for (final entry in listMappings.entries) {
      final targetKey = entry.key;
      final listPath = entry.value['path'];
      final subModel = entry.value['model'];

      final List<dynamic> subList = _getValueFromPath(formValues, listPath) ?? [];
      mapped[targetKey] = subList
          .whereType<Map<String, dynamic>>()
          .map((item) => mapFormToEntity(modelName: subModel, formValues: item))
          .toList();
    }

    final modelFactory = modelFactoryRegistry[modelName];
    if (modelFactory == null) {
      throw Exception("No model factory found for $modelName");
    }

    return modelFactory(mapped);
  }

  dynamic _getValueFromPath(Map<String, dynamic> data, String path) {
    final parts = path.split('.');
    dynamic current = data;
    for (final part in parts) {
      if (current is Map<String, dynamic> && current.containsKey(part)) {
        current = current[part];
      } else {
        return null;
      }
    }
    return current;
  }
}
