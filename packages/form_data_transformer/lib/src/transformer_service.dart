import 'dart:convert';

import 'package:digit_data_model/data_model.dart';

import 'model_factory_registory.dart';

import 'dart:convert';

import 'package:digit_data_model/data_model.dart';

import 'model_factory_registory.dart';

class FormEntityMapper {
  final Map<String, dynamic> config;

  FormEntityMapper({required this.config});

  // Method to return a list of models based on the form data and dynamic config
  List<EntityModel> mapFormToEntities({
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelsConfig, // Pass models config dynamically
  }) {
    final List<EntityModel> entities = [];

    // Iterate through each model configuration in the dynamic modelsConfig
    modelsConfig.forEach((modelName, modelConfig) {
      try {
        final model = mapFormToEntity(
          modelName: modelName,
          formValues: formValues,
          modelConfig: modelConfig,
        );
        entities.add(model);
      } catch (e) {
        print('Error mapping model $modelName: $e');
      }
    });

    return entities;
  }

  // Method to map form data to a single entity model
  EntityModel mapFormToEntity({
    required String modelName,
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelConfig, // Pass model config dynamically
  }) {
    if (modelConfig == null) {
      throw Exception("Model config not found for: $modelName");
    }

    final Map<String, dynamic> mapped = {};

    // Handle scalar mappings
    final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};
    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;
      final value = _getValueFromPath(formValues, sourcePath);
      mapped[targetKey] = value; // leave as null if missing or invalid
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
          .map((item) => mapFormToEntity(
          modelName: subModel, formValues: item, modelConfig: modelConfig))
          .toList();
    }

    // Check if model factory exists for the given modelName
    final modelFactory = modelFactoryRegistry[modelName];
    if (modelFactory == null) {
      throw Exception("No model factory found for $modelName");
    }

    // Return the created model
    return modelFactory(mapped);
  }

  dynamic _getValueFromPath(Map<String, dynamic> data, String path) {
    final parts = path.split('.');
    dynamic current = data;
    for (final part in parts) {
      if (current is Map<String, dynamic> && current.containsKey(part)) {
        current = current[part];
      } else {
        return null; // Return null if path is invalid or missing
      }
    }
    return current;
  }
}


