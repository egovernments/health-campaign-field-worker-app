import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';
import 'model_factory_registory.dart';

class FormEntityMapper {
  final Map<String, dynamic> config;
  final Map<String, Map<String, dynamic>> generatedValues = {};
  final Set<String> usedPaths = {};

  FormEntityMapper({required this.config});

  List<EntityModel> mapFormToEntities({
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelsConfig,
    required Map<String, dynamic> context,
    String? fallbackFormDataString,
  }) {
    final List<EntityModel> entities = [];
    usedPaths.clear();

    modelsConfig.forEach((modelName, modelConfig) {
      try {
        final model = _mapModel(modelName, formValues, modelConfig, context);
        entities.add(model);
      } catch (e) {
        throw Exception('Error mapping model $modelName: $e');
      }
    });

    // Get unmapped form fields
    final unmapped = _getUnmappedFields(formValues);

    // Map unmapped fields if fallback string and config present
    if (fallbackFormDataString != null && unmapped.isNotEmpty) {
      final fallbackModelName = fallbackFormDataString;
      final factory = modelFactoryRegistry[fallbackModelName];

      if (factory != null) {
        try {
          final existingIndex = entities
              .indexWhere((e) => e.runtimeType.toString() == fallbackModelName);

          if (existingIndex != -1) {
            final existingModel = entities[existingIndex];

            final existingModelData = existingModel.toMap();

            final mergedData = mergeAdditionalFields(
                existingModelData, unmapped, fallbackModelName);

            final updatedModel = factory(mergedData);

            entities[existingIndex] = updatedModel;
          } else {
            // TODO: need to write logic if fallback model does not exist in entities
            final fallbackModel = factory(unmapped);
            entities.add(fallbackModel);
          }
        } catch (e) {
          throw Exception(
              'Error mapping fallback model $fallbackModelName: $e');
        }
      } else {
        if (kDebugMode) {
          print(
              'Warning: fallback model factory not found for $fallbackModelName');
        }
      }
    }

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

      if (targetKey == 'additionalFields' &&
          sourcePath is Map<String, dynamic>) {
        /// Treat as additional fields
        mapped[targetKey] =
            _mapAdditionalFields(sourcePath, formValues, modelName, context);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        /// Treat as nested object mapping
        mapped[targetKey] =
            _mapNestedObject(sourcePath, formValues, targetKey, context);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        /// Treat as list
        mapped[targetKey] = _mapListModel(
            sourcePath, formValues, modelName, modelConfig, context);
        continue;
      }

      /// Treat as normal mapping
      final value =
          getValueFromMapping(sourcePath, formValues, modelName, context);
      mapped[targetKey] =
          value is DateTime ? value.millisecondsSinceEpoch : value;
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
      throw Exception(
          'Missing listMappings config for $listModelName in $parentModel');
    }

    final mappings = listConfig['mappings'] as Map<String, dynamic>;

    final newItem = <String, dynamic>{};

    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      if (targetKey == 'additionalFields' &&
          sourcePath is Map<String, dynamic>) {
        newItem[targetKey] = _mapAdditionalFields(
            sourcePath, formValues, listModelName, context);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        newItem[targetKey] =
            _mapNestedObject(sourcePath, formValues, targetKey, context);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        newItem[targetKey] = _mapListModel(
            sourcePath, formValues, listModelName, listConfig, context);
        continue;
      }

      final value =
          getValueFromMapping(sourcePath, formValues, listModelName, context);
      newItem[targetKey] =
          value is DateTime ? value.millisecondsSinceEpoch : value;
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
      if (value != null && value.toString().trim().isNotEmpty) {
        fieldsList.add({'key': customKey, 'value': value.toString()});
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

      if (targetKey == 'additionalFields' &&
          sourcePath is Map<String, dynamic>) {
        result[targetKey] =
            _mapAdditionalFields(sourcePath, formValues, modelName, context);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        result[targetKey] = _mapListModel(sourcePath, formValues, modelName,
            {'listMappings': nestedMappings}, context);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        // Handle deeply nested object
        result[targetKey] =
            _mapNestedObject(sourcePath, formValues, targetKey, context);
        continue;
      }

      final value =
          getValueFromMapping(sourcePath, formValues, modelName, context);
      result[targetKey] =
          value is DateTime ? value.millisecondsSinceEpoch : value;
    }

    return result.isNotEmpty ? result : null;
  }

  dynamic getValueFromMapping(
    String instruction,
    Map<String, dynamic> data,
    String currentModel,
    Map<String, dynamic> context,
  ) {
    if (instruction == '__generate:uuid') {
      final uuid = IdGen.i.identifier;
      generatedValues.putIfAbsent(currentModel, () => {})['clientReferenceId'] =
          uuid;
      return uuid;
    }

    if (instruction.startsWith('__value:')) {
      final valueStr = instruction.replaceFirst('__value:', '').trim();

      // Try to convert to bool, int, double, or null
      if (valueStr == 'true') return true;
      if (valueStr == 'false') return false;
      if (valueStr == 'null') return null;
      final intVal = int.tryParse(valueStr);
      if (intVal != null) return intVal;
      final doubleVal = double.tryParse(valueStr);
      if (doubleVal != null) return doubleVal;

      return valueStr; // fallback to string
    }

    if (instruction == '__generate:clientAudit') {
      final now = DateTime.now().millisecondsSinceEpoch;
      return {
        "createdBy": context['userUUID'],
        "createdTime": now,
        "lastModifiedBy": context['userUUID'],
        "lastModifiedTime": now,
      };
    }

    if (instruction == '__generate:audit') {
      final now = DateTime.now().millisecondsSinceEpoch;
      return {
        "createdBy": context['userUUID'],
        "createdTime": now,
      };
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

    if (instruction.startsWith('__switch:')) {
      final switchContent = instruction.replaceFirst('__switch:', '');

      // Correct way: split before the first `{`
      final braceIndex = switchContent.indexOf('{');
      if (braceIndex == -1) {
        throw Exception('Invalid __switch format, missing "{" for mapping block.');
      }

      final rawKeyInstruction = switchContent.substring(0, braceIndex).trim();
      final keyInstruction = rawKeyInstruction.endsWith(':')
          ? rawKeyInstruction.substring(0, rawKeyInstruction.length - 1)
          : rawKeyInstruction;
      final mappingString = switchContent.substring(braceIndex).trim();

      // Recursively resolve key — handles __context:, __ref:, etc.
      final keyValue = getValueFromMapping(keyInstruction, data, currentModel, context);
      if (keyValue == null) {
        throw Exception('Key value "$keyInstruction" resolved to null in __switch');
      }

      final mapping = _parseSwitchMapping(mappingString);
      final resolvedInstruction = mapping[keyValue.toString()] ?? mapping['default'];

      if (resolvedInstruction == null) {
        throw Exception('No switch case found for "$keyValue" in instruction "$instruction"');
      }

      return getValueFromMapping(resolvedInstruction, data, currentModel, context);
    }

    if (instruction.startsWith('__context:')) {
      final path = instruction.replaceFirst('__context:', '');
      return _getValueFromPath(context, path);
    }

    return _getValueFromPath(data, instruction);
  }

  Map<String, String> _parseSwitchMapping(String raw) {
    final map = <String, String>{};
    final pattern = RegExp(r'(\w+):([^,{}]+)');
    for (final match in pattern.allMatches(raw)) {
      final key = match.group(1)?.trim();
      final value = match.group(2)?.trim();
      if (key != null && value != null) {
        map[key] = value;
      }
    }
    return map;
  }

  dynamic resolveDynamicPath(String path, Map<String, dynamic> data, Map<String, dynamic> context) {
    if (path.startsWith('__context:')) {
      return _getValueFromPath(context, path.replaceFirst('__context:', ''));
    } else if (path.startsWith('formData:')) {
      return _getValueFromPath(data, path.replaceFirst('formData:', ''));
    } else {
      // Default to context for backward compatibility
      return _getValueFromPath(context, path);
    }
  }

  dynamic _getValueFromPath(Map<String, dynamic> data, String path) {
    final regex = RegExp(r'([^\[\].]+)(?:\[(\d+)\])?');

    dynamic current = data;
    for (final match in regex.allMatches(path)) {
      final key = match.group(1);
      final indexStr = match.group(2);

      if (current is Map<String, dynamic> && key != null && current.containsKey(key)) {
        current = current[key];
      } else if (current is List &&
          current.length == 1 &&
          current.first is Map<String, dynamic> &&
          key != null &&
          (current.first as Map<String, dynamic>).containsKey(key)) {
        current = (current.first as Map<String, dynamic>)[key];
      } else {
        if (kDebugMode) {
          print('Warning: Key "$key" not found while resolving path "$path".');
        }
        return null;
      }

      // Handle [0], [1] if current is a string with comma separation
      if (indexStr != null && current is String) {
        final index = int.tryParse(indexStr);
        final parts = current.split(',');
        if (index != null && index >= 0 && index < parts.length) {
          current = parts[index].trim();
        } else {
          return null;
        }
      }
    }

    usedPaths.add(path.split('.').last.split('[').first); // to track used path
    return current;
  }

  Map<String, dynamic> _getUnmappedFields(Map<String, dynamic> formData) {
    final unmapped = <String, dynamic>{};

    void extractUnmapped(Map<String, dynamic> data) {
      data.forEach((key, value) {
        if (value is Map<String, dynamic>) {
          extractUnmapped(value);
        } else {
          if (!usedPaths.contains(key)) {
            unmapped[key] = value;
          }
        }
      });
    }

    extractUnmapped(formData);
    return unmapped;
  }

  Map<String, dynamic> mergeAdditionalFields(
      Map<String, dynamic> existingModelData,
      Map<String, dynamic> newFields,
      String modelName,
      ) {
    // Clone existing data to avoid mutation
    final mergedData = Map<String, dynamic>.from(existingModelData);

    final existingAdditionalFields =
    mergedData['additionalFields'] as Map<String, dynamic>?;

    // Filter out empty string values
    final filteredNewFields = newFields.entries
        .where((e) => e.value != null && e.value.toString().trim().isNotEmpty)
        .toList();

    final newAdditionalFieldsList = filteredNewFields
        .map((e) => {'key': e.key, 'value': e.value.toString()})
        .toList();

    if (existingAdditionalFields != null) {
      // Merge existing additional fields list with new ones, avoid duplicate keys
      final existingFieldsList =
      (existingAdditionalFields['fields'] as List<dynamic>? ?? [])
          .cast<Map<String, dynamic>>();

      final existingKeys = existingFieldsList.map((f) => f['key']).toSet();

      final mergedFields = [
        ...existingFieldsList,
        ...newAdditionalFieldsList
            .where((nf) => !existingKeys.contains(nf['key'])),
      ];

      mergedData['additionalFields'] = {
        'schema': modelName.replaceAll('Model', ''),
        'version': 1,
        'fields': mergedFields,
      };
    } else {
      // No existing additionalFields, create new
      mergedData['additionalFields'] = {
        'schema': modelName.replaceAll('Model', ''),
        'version': 1,
        'fields': newAdditionalFieldsList,
      };
    }

    return mergedData;
  }
}
