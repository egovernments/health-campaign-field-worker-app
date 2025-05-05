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
  }) {
    final List<EntityModel> entities = [];

    modelsConfig.forEach((modelName, modelConfig) {
      try {
        final model = _mapModel(modelName, formValues, modelConfig);
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
      ) {
    final mapped = <String, dynamic>{};
    final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};

    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      if (targetKey == 'additionalFields' && sourcePath is Map<String, dynamic>) {
        mapped[targetKey] = _mapAdditionalFields(sourcePath, formValues, modelName);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        mapped[targetKey] = _mapListModel(sourcePath, formValues, modelName, modelConfig);
        continue;
      }

      final value = getValueFromMapping(sourcePath, formValues, modelName);
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
        newItem[targetKey] = _mapAdditionalFields(sourcePath, formValues, listModelName);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        newItem[targetKey] = _mapListModel(sourcePath, formValues, listModelName, listConfig);
        continue;
      }

      final value = getValueFromMapping(sourcePath, formValues, listModelName);
      newItem[targetKey] = value is DateTime ? value.millisecondsSinceEpoch : value;
    }

    return newItem.isNotEmpty ? [newItem] : [];
  }

  Map<String, dynamic>? _mapAdditionalFields(
      Map<String, dynamic> fieldsMap,
      Map<String, dynamic> formValues,
      String modelName,
      ) {
    final fieldsList = <Map<String, dynamic>>[];

    fieldsMap.forEach((customKey, path) {
      final value = getValueFromMapping(path, formValues, path);
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

  dynamic getValueFromMapping(String instruction, Map<String, dynamic> data, String currentModel) {
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

