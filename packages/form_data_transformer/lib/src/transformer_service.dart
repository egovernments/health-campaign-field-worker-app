import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';
import 'model_factory_registory.dart';

class FormEntityMapper {
  final Map<String, dynamic> config;
  final Map<String, Map<String, dynamic>> generatedValues = {};

  FormEntityMapper({required this.config});

  List<EntityModel> mapFormToEntities({
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelsConfig,
    required Map<String, dynamic> context,
  }) {
    final List<EntityModel> entities = [];

    modelsConfig.forEach((modelName, modelConfig) {
      try {
        final model = _mapModel(modelName, formValues, modelConfig, context);
        entities.add(model);
      } catch (e) {
        throw Exception('Error mapping model $modelName: $e');
      }
    });

    return entities;
  }

  EntityModel _mapModel(
      String modelName,
      Map<String, dynamic> formValues,
      Map<String, dynamic> modelConfig,
      Map<String, dynamic> context,
      ) {
    final mapped = <String, dynamic>{};
    final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};

    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      if (targetKey == 'additionalFields' && sourcePath is Map<String, dynamic>) {
        /// Treat as additional fields
        mapped[targetKey] = _mapAdditionalFields(sourcePath, formValues, modelName, context);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        /// Treat as nested object mapping
        mapped[targetKey] = _mapNestedObject(sourcePath, formValues, targetKey, context);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        /// Treat as list
        mapped[targetKey] = _mapListModel(sourcePath, formValues, modelName, modelConfig, context);
        continue;
      }

      /// Treat as normal mapping
      final value = getValueFromMapping(sourcePath, formValues, modelName, context);
      mapped[targetKey] = value is DateTime ? value.millisecondsSinceEpoch : value;
    }

    final factory = modelFactoryRegistry[modelName];
    if (factory == null) throw Exception('No model factory for $modelName');

    return factory(mapped);
  }

  List<Map<String, dynamic>> _mapListModel(
      String sourcePath,
      Map<String, dynamic> formValues,
      String parentModel,
      Map<String, dynamic> modelConfig,
      Map<String, dynamic> context,
      ) {
    final listModelName = sourcePath.split(':').last;
    final listConfig = modelConfig['listMappings']?[listModelName];

    if (listConfig == null) {
      throw Exception('Missing listMappings config for $listModelName in $parentModel');
    }

    final mappings = listConfig['mappings'] as Map<String, dynamic>;

    final newItem = <String, dynamic>{};

    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      if (targetKey == 'additionalFields' && sourcePath is Map<String, dynamic>) {
        newItem[targetKey] = _mapAdditionalFields(sourcePath, formValues, listModelName, context);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        newItem[targetKey] = _mapNestedObject(sourcePath, formValues, targetKey, context);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        newItem[targetKey] = _mapListModel(sourcePath, formValues, listModelName, listConfig, context);
        continue;
      }

      final value = getValueFromMapping(sourcePath, formValues, listModelName, context);
      newItem[targetKey] = value is DateTime ? value.millisecondsSinceEpoch : value;
    }

    return newItem.isNotEmpty ? [newItem] : [];
  }

  Map<String, dynamic>? _mapAdditionalFields(
      Map<String, dynamic> fieldsMap,
      Map<String, dynamic> formValues,
      String modelName,
      Map<String, dynamic> context,
      ) {
    final fieldsList = <Map<String, dynamic>>[];

    fieldsMap.forEach((customKey, path) {
      final value = getValueFromMapping(path, formValues, path, context);
      if (value != null) {
        fieldsList.add({'key': customKey, 'value': value});
      }
    });

    if (fieldsList.isEmpty) return null;

    return {
      'schema': modelName.replaceAll('Model', ''),
      'version': 1,
      'fields': fieldsList,
    };
  }

  Map<String, dynamic>? _mapNestedObject(
      Map<String, dynamic> nestedMappings,
      Map<String, dynamic> formValues,
      String modelName,
      Map<String, dynamic> context,
      ) {
    final result = <String, dynamic>{};

    for (final entry in nestedMappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      if (targetKey == 'additionalFields' && sourcePath is Map<String, dynamic>) {
        result[targetKey] = _mapAdditionalFields(sourcePath, formValues, modelName, context);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        result[targetKey] = _mapListModel(sourcePath, formValues, modelName, {'listMappings': nestedMappings}, context);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        // Handle deeply nested object
        result[targetKey] = _mapNestedObject(sourcePath, formValues, targetKey, context);
        continue;
      }

      final value = getValueFromMapping(sourcePath, formValues, modelName, context);
      result[targetKey] = value is DateTime ? value.millisecondsSinceEpoch : value;
    }

    return result.isNotEmpty ? result : null;
  }


  dynamic getValueFromMapping(String instruction, Map<String, dynamic> data, String currentModel, Map<String, dynamic> context,) {
    if (instruction == '__generate:uuid') {
      final uuid = IdGen.i.identifier;
      generatedValues.putIfAbsent(currentModel, () => {})['clientReferenceId'] = uuid;
      return uuid;
    }

    if (instruction.startsWith('__ref:')) {
      final parts = instruction.replaceFirst('__ref:', '').split('.');
      if (parts.length != 2) {
        throw Exception('Invalid __ref: format for instruction: $instruction');
      }
      final modelName = parts[0];
      final field = parts[1];
      final refValue = generatedValues[modelName]?[field];
      if (refValue == null) {
        throw Exception('Reference not found for $instruction');
      }
      return refValue;
    }

    if (instruction.startsWith('__context:')) {
      final path = instruction.replaceFirst('__context:', '');
      return _getValueFromPath(context, path);
    }

    return _getValueFromPath(data, instruction);
  }

  dynamic _getValueFromPath(Map<String, dynamic> data, String path) {
    return path.split('.').fold<dynamic>(data, (value, key) {
      if (value is Map<String, dynamic> && value.containsKey(key)) {
        return value[key];
      }
      if (kDebugMode) {
        print('Warning: Key "$key" not found while resolving path "$path".');
      }
      return null;
    });
  }
}

