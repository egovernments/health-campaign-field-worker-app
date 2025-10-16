import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

import '../utils/utils.dart';

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
        // Check if model has listSource for bulk creation
        final listSourcePath = modelConfig['listSource'] as String?;

        if (listSourcePath != null) {
          // Fetch list from context
          final listData = getValueFromMapping(
              listSourcePath, formValues, modelName, context);

          if (listData is List && listData.isNotEmpty) {
            // Create one model instance for each item in the list
            for (int index = 0; index < listData.length; index++) {
              final model = _mapModel(
                modelName,
                formValues,
                modelConfig,
                context,
                listItemIndex: index,
              );
              entities.add(model);
            }
          } else {
            // If list is empty or null, skip model creation
            if (kDebugMode) {
              print(
                  'Warning: listSource "$listSourcePath" returned empty or null for $modelName');
            }
          }
        } else {
          // Normal single model creation
          final model = _mapModel(modelName, formValues, modelConfig, context);
          entities.add(model);
        }
      } catch (e) {
        throw Exception('Error mapping model $modelName: $e');
      }
    });

    // Get unmapped form fields
    final unmapped = _getUnmappedFields(formValues);

    // Map unmapped fields if fallback string and config present
    if (fallbackFormDataString != null && unmapped.isNotEmpty) {
      final fallbackModelName = fallbackFormDataString;
      final factory = DataConverterSingleton()
          .dynamicEntityModelListener
          ?.modelFactoryRegistry[fallbackModelName];

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

  List<EntityModel> updateEntitiesFromForm({
    required List<EntityModel> existingModels,
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelsConfig,
    required Map<String, dynamic> context,
  }) {
    final List<EntityModel> updatedModels = [];
    final Set<String> existingModelTypes =
        existingModels.map((model) => model.runtimeType.toString()).toSet();

    prepopulateGeneratedValuesFromExisting(existingModels, modelsConfig);

    // Update existing models if config exists, else keep unchanged
    for (final model in existingModels) {
      final modelType = model.runtimeType.toString();
      final modelConfig = modelsConfig[modelType];

      if (modelConfig == null) {
        updatedModels.add(model);
        continue;
      }

      final updatedModel = updateModelFromForm(
        existingModel: model,
        formValues: formValues,
        modelConfig: modelConfig,
        context: context,
      );

      updatedModels.add(updatedModel);
    }

    // Create missing models from modelsConfig
    for (final modelName in modelsConfig.keys) {
      if (!existingModelTypes.contains(modelName)) {
        try {
          final modelConfig = modelsConfig[modelName];
          final newModel =
              _mapModel(modelName, formValues, modelConfig, context);
          updatedModels.add(newModel);
        } catch (e) {
          throw Exception('Error creating missing model $modelName: $e');
        }
      }
    }

    return updatedModels;
  }

  void prepopulateGeneratedValuesFromExisting(
    List<EntityModel> existingModels,
    Map<String, dynamic> modelsConfig,
  ) {
    for (final model in existingModels) {
      final modelName = model.runtimeType.toString();
      final modelConfig = modelsConfig[modelName];
      if (modelConfig == null) continue;

      final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};
      final modelMap = model.toMap();

      for (final entry in mappings.entries) {
        final targetKey = entry.key;
        final sourcePath = entry.value;
        if (sourcePath is String && sourcePath.startsWith('__generate:')) {
          generatedValues.putIfAbsent(modelName, () => {})[targetKey] =
              modelMap[targetKey];
        }
      }
    }
  }

  EntityModel updateModelFromForm({
    required EntityModel existingModel,
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelConfig,
    required Map<String, dynamic> context,
  }) {
    final modelType = existingModel.runtimeType.toString();
    final factory = DataConverterSingleton()
        .dynamicEntityModelListener
        ?.modelFactoryRegistry[modelType];

    if (factory == null) {
      throw Exception('Factory not found for $modelType');
    }

    final existingMap = Map<String, dynamic>.from(existingModel.toMap());
    final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};

    void applyUpdate(
      Map<String, dynamic> target,
      Map<String, dynamic> formData,
      Map<String, dynamic> mapping,
      String parentPath,
    ) {
      for (final entry in mapping.entries) {
        final targetKey = entry.key;
        final sourcePath = entry.value;

        final fullPath =
            parentPath.isEmpty ? targetKey : '$parentPath.$targetKey';

        if (targetKey == 'additionalFields' &&
            sourcePath is Map<String, dynamic>) {
          final existingAdditional =
              target['additionalFields'] as Map<String, dynamic>? ?? {};

          final updatedAdditional = _updateAdditionalFieldsFromMapping(
            existingAdditionalFields: existingAdditional,
            updateMapping: sourcePath,
            formValues: formValues,
            modelName: modelType,
          );

          if (updatedAdditional != null) {
            target['additionalFields'] = updatedAdditional;
          }

          continue;
        } else if (sourcePath is Map<String, dynamic>) {
          if (target[targetKey] is Map<String, dynamic>) {
            final nestedTarget = Map<String, dynamic>.from(target[targetKey]);
            applyUpdate(nestedTarget, formData, sourcePath, fullPath);
            target[targetKey] = nestedTarget;
          } else if (target[targetKey] is List) {
            // 🔥 handle structured list logic
            final modelList = target[targetKey] as List;

            final listMappingConfig = modelConfig['listMappings']?[targetKey];
            if (listMappingConfig is Map<String, dynamic>) {
              final updatedList = _updateListWithMatchingStrategy(
                originalList: target[targetKey] as List? ?? [],
                listMapping: listMappingConfig,
                formValues: formValues,
                context: context,
                modelType: targetKey,
              );
              target[targetKey] = updatedList;
            }
          }
        } else if (sourcePath is String) {
          final formValue =
              getStrictValueFromFormDataOnly(sourcePath, formData);

          if (formValue != null) {
            target[targetKey] = formValue is DateTime
                ? formValue.millisecondsSinceEpoch
                : formValue;
          }
        }
      }
    }

    applyUpdate(existingMap, formValues, mappings, '');

    return factory(existingMap);
  }

  List<Map<String, dynamic>> _updateListWithMatchingStrategy({
    required List<dynamic> originalList,
    required Map<String, dynamic> listMapping,
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> context,
    required String modelType,
  }) {
    final updatedList = <Map<String, dynamic>>[];

    final mappings = listMapping['mappings'] as Map<String, dynamic>? ?? {};
    final listSourcePath = listMapping['listSource'] as String?;

    if (listSourcePath == null) {
      debugPrint('listSource missing in listMapping');
      return originalList.cast<Map<String, dynamic>>();
    }

    final listSourceValue =
        getStrictValueFromFormDataOnly(listSourcePath, formValues);

    if (listSourceValue == null) {
      return originalList.cast<Map<String, dynamic>>();
    }

    bool matched = false;

    for (final existingItem in originalList.cast<Map<String, dynamic>>()) {
      if (existingItem.values.contains(listSourceValue.toString())) {
        // Match found — update only values that match from form
        final updated = Map<String, dynamic>.from(existingItem);
        for (final entry in mappings.entries) {
          final modelField = entry.key;
          final mappingPath = entry.value;

          if (mappingPath is String) {
            final formValue =
                getStrictValueFromFormDataOnly(mappingPath, formValues);
            if (formValue != null) {
              updated[modelField] = formValue;
            }
          }
        }
        updatedList.add(updated);
        matched = true;
      } else {
        // No match — keep original
        updatedList.add(existingItem);
      }
    }

    if (!matched) {
      // Add new entry based on mappings
      final newEntry = _mapListModel(
          listSourcePath, formValues, modelType, listMapping, context);

      if (newEntry.isNotEmpty) {
        updatedList.add(newEntry.first);
      }
    }

    return updatedList;
  }

  Map<String, dynamic>? _updateAdditionalFieldsFromMapping({
    required Map<String, dynamic> existingAdditionalFields,
    required Map<String, dynamic> updateMapping,
    required Map<String, dynamic> formValues,
    required String modelName,
  }) {
    final updatedFields = <String, String>{};

    updateMapping.forEach((customKey, path) {
      final value = getStrictValueFromFormDataOnly(path, formValues);

      if (value != null && value.toString().trim().isNotEmpty) {
        updatedFields[customKey] = value.toString();
      }
    });

    if (updatedFields.isEmpty) return null;

    final existingFields = <String, String>{};
    if (existingAdditionalFields['fields'] is List) {
      for (final field in existingAdditionalFields['fields']) {
        if (field['key'] != null && field['value'] != null) {
          existingFields[field['key']] = field['value'];
        }
      }
    }

    // merge updates into existing
    updatedFields.forEach((key, value) {
      existingFields[key] = value;
    });

    final mergedFields = existingFields.entries
        .map((e) => {'key': e.key, 'value': e.value})
        .toList();

    return {
      'schema': existingAdditionalFields['schema'] ?? modelName,
      'version': existingAdditionalFields['version'] ?? 1,
      'fields': mergedFields,
    };
  }

  dynamic getStrictValueFromFormDataOnly(
      String path, Map<String, dynamic> formValues) {
    final regex = RegExp(r'([^\[\].]+)(?:\[(\d+)\])?');

    dynamic current = formValues;
    for (final match in regex.allMatches(path)) {
      final key = match.group(1);
      final indexStr = match.group(2);

      if (current is Map<String, dynamic> &&
          key != null &&
          current.containsKey(key)) {
        current = current[key];
      } else if (current is List &&
          current.length == 1 &&
          current.first is Map<String, dynamic> &&
          key != null &&
          (current.first as Map<String, dynamic>).containsKey(key)) {
        current = (current.first as Map<String, dynamic>)[key];
      } else {
        return null;
      }

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

    return current;
  }

  EntityModel _mapModel(
    String modelName,
    Map<String, dynamic> formValues,
    Map<String, dynamic> modelConfig,
    Map<String, dynamic> context, {
    int? listItemIndex,
  }) {
    final mapped = <String, dynamic>{};
    final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};
    final listSourcePath = modelConfig['listSource'] as String?;

    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      if (targetKey == 'additionalFields' &&
          sourcePath is Map<String, dynamic>) {
        /// Treat as additional fields
        mapped[targetKey] = _mapAdditionalFields(
            sourcePath, formValues, modelName, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        /// Treat as nested object mapping
        mapped[targetKey] = _mapNestedObject(
            sourcePath, formValues, targetKey, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        /// Treat as list
        mapped[targetKey] = _mapListModel(
            sourcePath, formValues, modelName, modelConfig, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('collect:')) {
        /// Treat as field collection from list
        mapped[targetKey] = _collectFieldFromList(
            sourcePath, formValues, modelName, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      /// Treat as normal mapping
      final value = getValueFromMapping(
          sourcePath, formValues, modelName, context,
          listItemIndex: listItemIndex, listSourcePath: listSourcePath);
      mapped[targetKey] =
          value is DateTime ? value.millisecondsSinceEpoch : value;
    }

    final factory = DataConverterSingleton()
        .dynamicEntityModelListener
        ?.modelFactoryRegistry[modelName];
    if (factory == null) throw Exception('No model factory for $modelName');

    return factory(mapped);
  }

  /// Collects field values from a list or splits comma-separated strings
  /// Always returns a List<String>
  ///
  /// Examples:
  /// - "collect:referralDetails.comments" where comments is "Fever" → ["Fever"]
  /// - "collect:referralDetails.comments" where comments is "Fever, Cough" → ["Fever", "Cough"]
  /// - "collect:referralDetails.comments" where comments is ["Fever", "Cough"] → ["Fever", "Cough"]
  /// - "collect:referralDetails.comments" where referralDetails is [{comments: "Fever"}, {comments: "Cough"}] → ["Fever", "Cough"]
  List<String> _collectFieldFromList(
    String sourcePath,
    Map<String, dynamic> formValues,
    String modelName,
    Map<String, dynamic> context, {
    int? listItemIndex,
    String? listSourcePath,
  }) {
    // Remove "collect:" prefix
    final pathWithoutPrefix = sourcePath.replaceFirst('collect:', '');

    if (kDebugMode) {
      print('🔍 _collectFieldFromList called with path: "$pathWithoutPrefix"');
    }

    // Resolve the full path to get the value
    final resolvedValue = getValueFromMapping(
      pathWithoutPrefix,
      formValues,
      modelName,
      context,
      listItemIndex: listItemIndex,
      listSourcePath: listSourcePath,
    );

    if (kDebugMode) {
      print('   Resolved value type: ${resolvedValue.runtimeType}');
      print('   Resolved value: $resolvedValue');
    }

    // If null, return empty list
    if (resolvedValue == null) {
      return [];
    }

    final result = <String>[];

    // Case 1: Value is already a List
    if (resolvedValue is List) {
      for (final item in resolvedValue) {
        if (item is String) {
          // If list contains strings, split each by comma and flatten
          final parts = item.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty);
          result.addAll(parts);
        } else if (item is Map<String, dynamic>) {
          // If list contains objects, this shouldn't happen in collect context
          // but just in case, convert to string
          result.add(item.toString());
        } else {
          // For other types, convert to string
          result.add(item.toString());
        }
      }
    }
    // Case 2: Value is a String (split by comma)
    else if (resolvedValue is String) {
      final parts = resolvedValue.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty);
      result.addAll(parts);
    }
    // Case 3: Other types, convert to string and wrap in list
    else {
      result.add(resolvedValue.toString());
    }

    if (kDebugMode) {
      print('   Final collected list: $result');
    }

    return result;
  }

  List<Map<String, dynamic>> _mapListModel(
    String sourcePath,
    Map<String, dynamic> formValues,
    String parentModel,
    Map<String, dynamic> modelConfig,
    Map<String, dynamic> context, {
    int? listItemIndex,
    String? listSourcePath,
  }) {
    final listModelName = sourcePath.split(':').last;
    final listConfig = modelConfig['listMappings']?[listModelName];

    if (listConfig == null) {
      throw Exception(
          'Missing listMappings config for $listModelName in $parentModel');
    }

    // If listSource is defined, use it to fetch a list and map each item
    final nestedListSourcePath = listConfig['listSource'] as String?;
    if (nestedListSourcePath != null) {
      if (kDebugMode) {
        print('🔍 Resolving nestedListSourcePath: "$nestedListSourcePath"');
        print('   listItemIndex: $listItemIndex');
        print('   listSourcePath: $listSourcePath');
        print('   formValues keys: ${formValues.keys}');
        print('   context keys: ${context.keys}');
      }
      final listData = getValueFromMapping(
          nestedListSourcePath, formValues, listModelName, context,
          listItemIndex: listItemIndex, listSourcePath: listSourcePath);
      if (kDebugMode) {
        print('   listData result: ${listData?.runtimeType} = $listData');
      }
      if (listData is List) {
        final mappings = listConfig['mappings'] as Map<String, dynamic>;
        final items = <Map<String, dynamic>>[];
        for (final item in listData) {
          // Convert item to Map if it has toMap method (handle Dart objects)
          final itemMap = item is Map<String, dynamic>
              ? item
              : (item.runtimeType.toString().contains('Mappable') &&
                      item is dynamic &&
                      item.toMap != null)
                  ? item.toMap() as Map<String, dynamic>
                  : <String, dynamic>{};

          final newItem = <String, dynamic>{};
          for (final entry in mappings.entries) {
            final targetKey = entry.key;
            final sourcePath = entry.value;
            if (sourcePath is String) {
              // If the mapping path starts with the nestedListSourcePath + '.', resolve relative to the item
              if (sourcePath.startsWith(nestedListSourcePath + '.')) {
                final relativePath = sourcePath
                    .substring(nestedListSourcePath.length + 1); // skip the dot
                newItem[targetKey] = getValueFromMapping(
                    relativePath, itemMap, listModelName, context,
                    listItemIndex: listItemIndex,
                    listSourcePath: listSourcePath);
              } else {
                newItem[targetKey] = getValueFromMapping(
                    sourcePath, itemMap, listModelName, context,
                    listItemIndex: listItemIndex,
                    listSourcePath: listSourcePath);
              }
            }
            if (targetKey == 'additionalFields' &&
                sourcePath is Map<String, dynamic>) {
              newItem[targetKey] = _mapAdditionalFields(
                  sourcePath, formValues, listModelName, context,
                  listItemIndex: listItemIndex, listSourcePath: listSourcePath);
              continue;
            }
            if (sourcePath is Map<String, dynamic>) {
              newItem[targetKey] = _mapNestedObject(
                  sourcePath, formValues, targetKey, context,
                  listItemIndex: listItemIndex, listSourcePath: listSourcePath);
              continue;
            }
            if (sourcePath is String && sourcePath.startsWith('list:')) {
              newItem[targetKey] = _mapListModel(
                  sourcePath, formValues, listModelName, listConfig, context,
                  listItemIndex: listItemIndex, listSourcePath: listSourcePath);
              continue;
            }
          }
          items.add(newItem);
        }
        return items;
      }
    }

    // Fallback to current logic (single item mapping)
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
    Map<String, dynamic> context, {
    int? listItemIndex,
    String? listSourcePath,
  }) {
    final fieldsList = <Map<String, dynamic>>[];

    fieldsMap.forEach((customKey, path) {
      final value = getValueFromMapping(path, formValues, path, context,
          listItemIndex: listItemIndex, listSourcePath: listSourcePath);
      if (value != null && value.toString().trim().isNotEmpty) {
        fieldsList.add({
          'key': customKey,
          'value': value is DateTime ? value.millisecondsSinceEpoch : value
        });
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
    Map<String, dynamic> context, {
    int? listItemIndex,
    String? listSourcePath,
  }) {
    final result = <String, dynamic>{};

    for (final entry in nestedMappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      if (targetKey == 'additionalFields' &&
          sourcePath is Map<String, dynamic>) {
        result[targetKey] = _mapAdditionalFields(
            sourcePath, formValues, modelName, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('list:')) {
        result[targetKey] = _mapListModel(sourcePath, formValues, modelName,
            {'listMappings': nestedMappings}, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      if (sourcePath is String && sourcePath.startsWith('collect:')) {
        result[targetKey] = _collectFieldFromList(
            sourcePath, formValues, modelName, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      if (sourcePath is Map<String, dynamic>) {
        // Handle deeply nested object
        result[targetKey] = _mapNestedObject(
            sourcePath, formValues, targetKey, context,
            listItemIndex: listItemIndex, listSourcePath: listSourcePath);
        continue;
      }

      final value = getValueFromMapping(
          sourcePath, formValues, modelName, context,
          listItemIndex: listItemIndex, listSourcePath: listSourcePath);
      result[targetKey] =
          value is DateTime ? value.millisecondsSinceEpoch : value;
    }

    return result.isNotEmpty ? result : null;
  }

  dynamic getValueFromMapping(String instruction, Map<String, dynamic> data,
      String currentModel, Map<String, dynamic> context,
      {updateMapping = false, int? listItemIndex, String? listSourcePath}) {
    // Handle __listItemIndex to get the current list item index
    if (instruction == '__listItemIndex') {
      if (listItemIndex == null) {
        throw Exception(
            '__listItemIndex can only be used when model has listSource defined');
      }
      return listItemIndex;
    }

    // Handle __listItem: prefix for model-level list iteration
    if (instruction.startsWith('__listItem:')) {
      if (listItemIndex == null || listSourcePath == null) {
        throw Exception(
            '__listItem: can only be used when model has listSource defined');
      }

      final fieldPath = instruction.replaceFirst('__listItem:', '');

      // Resolve the listSource path to get the list
      final contextPath = listSourcePath.startsWith('__context:')
          ? listSourcePath.replaceFirst('__context:', '')
          : listSourcePath;

      // Construct path: listSourcePath[index].fieldPath
      final fullPath = '$contextPath[$listItemIndex].$fieldPath';

      return _getValueFromPath(context, fullPath);
    }

    // IMPLICIT LIST ITEM CONTEXT: If we're in a list context (listItemIndex != null)
    // and the instruction doesn't start with special prefixes (__context:, __generate:, etc.)
    // try to resolve it relative to current list item first
    if (listItemIndex != null &&
        listSourcePath != null &&
        !instruction.startsWith('__')) {
      if (kDebugMode) {
        print('🔎 IMPLICIT LIST CONTEXT for instruction: "$instruction"');
        print(
            '   listItemIndex: $listItemIndex, listSourcePath: "$listSourcePath"');
      }
      // Check if it's not found in form data first
      final formValue = _getValueFromPath(data, instruction);
      if (kDebugMode) {
        print('   formValue from data: $formValue');
      }
      if (formValue == null) {
        // Try to resolve relative to current list item in context
        final contextPath = listSourcePath.startsWith('__context:')
            ? listSourcePath.replaceFirst('__context:', '')
            : listSourcePath;
        final fullPath = '$contextPath[$listItemIndex].$instruction';
        if (kDebugMode) {
          print('   Trying context path: "$fullPath"');
        }
        final value = _getValueFromPath(context, fullPath);
        if (kDebugMode) {
          print('   value from context: $value');
        }
        if (value != null) {
          return value;
        }
      }
      // If found in form data or not found anywhere, fall through to normal resolution
    }

    if (instruction == '__generate:uuid' && updateMapping == false) {
      final uuid = IdGen.i.identifier;
      // Store with list index suffix if in list context
      final storageKey = listItemIndex != null
          ? '${currentModel}_$listItemIndex'
          : currentModel;
      generatedValues.putIfAbsent(storageKey, () => {})['clientReferenceId'] =
          uuid;
      return uuid;
    }

    if (instruction.startsWith('__value:')) {
      final valueStr = instruction.replaceFirst('__value:', '').trim();

      if (valueStr == 'DATETIME.NOW') {
        return DateTime.now().millisecondsSinceEpoch;
      }

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

    if (instruction == '__generate:clientAudit' && updateMapping == false) {
      final now = DateTime.now().millisecondsSinceEpoch;
      return {
        "createdBy": context['userUUID'],
        "createdTime": now,
        "lastModifiedBy": context['userUUID'],
        "lastModifiedTime": now,
      };
    }

    if (instruction == '__generate:audit' && updateMapping == false) {
      final now = DateTime.now().millisecondsSinceEpoch;
      return {
        "createdBy": context['userUUID'],
        "createdTime": now,
      };
    }

    if (instruction.startsWith('__ref:') && updateMapping == false) {
      final parts = instruction.replaceFirst('__ref:', '').split('.');
      if (parts.length != 2) {
        throw Exception('Invalid __ref: format for instruction: $instruction');
      }
      final modelName = parts[0];
      final field = parts[1];

      // Try to get reference with list index first (for nested list contexts)
      final storageKey =
          listItemIndex != null ? '${modelName}_$listItemIndex' : modelName;

      var refValue = generatedValues[storageKey]?[field];

      // Fallback to non-indexed key if not found
      if (refValue == null && listItemIndex != null) {
        refValue = generatedValues[modelName]?[field];
      }

      if (refValue == null) {
        if (kDebugMode) {
          print('⚠️ Reference not found for $instruction');
          print('   Tried keys: $storageKey, $modelName');
          print(
              '   Available keys in generatedValues: ${generatedValues.keys}');
        }
        throw Exception('Reference not found for $instruction');
      }
      return refValue;
    }

    if (instruction.startsWith('__switch:') && updateMapping == false) {
      final switchContent = instruction.replaceFirst('__switch:', '');

      // Correct way: split before the first `{`
      final braceIndex = switchContent.indexOf('{');
      if (braceIndex == -1) {
        throw Exception(
            'Invalid __switch format, missing "{" for mapping block.');
      }

      final rawKeyInstruction = switchContent.substring(0, braceIndex).trim();
      final keyInstruction = rawKeyInstruction.endsWith(':')
          ? rawKeyInstruction.substring(0, rawKeyInstruction.length - 1)
          : rawKeyInstruction;
      final mappingString = switchContent.substring(braceIndex).trim();

      // Recursively resolve key — handles __context:, __ref:, etc.
      final keyValue = getValueFromMapping(
          keyInstruction, data, currentModel, context,
          listItemIndex: listItemIndex, listSourcePath: listSourcePath);
      if (keyValue == null) {
        throw Exception(
            'Key value "$keyInstruction" resolved to null in __switch');
      }

      final mapping = _parseSwitchMapping(mappingString);
      final resolvedInstruction =
          mapping[keyValue.toString()] ?? mapping['default'];

      if (resolvedInstruction == null) {
        throw Exception(
            'No switch case found for "$keyValue" in instruction "$instruction"');
      }

      return getValueFromMapping(
          resolvedInstruction, data, currentModel, context,
          listItemIndex: listItemIndex, listSourcePath: listSourcePath);
    }

    if (instruction.startsWith('__pad:')) {
      // Format: __pad:minLength,padChar:actualPath
      // Example: __pad:2,0:__context:currentCycleId
      final padContent = instruction.replaceFirst('__pad:', '');
      final parts = padContent.split(':');

      if (parts.length < 2) {
        throw Exception('Invalid __pad format. Expected: __pad:minLength,padChar:path');
      }

      final params = parts[0].split(',');
      final minLength = int.tryParse(params[0]) ?? 2;
      final padChar = params.length > 1 ? params[1] : '0';
      final valuePath = parts.sublist(1).join(':'); // Rejoin in case path contains ':'

      // Recursively resolve the actual value
      final value = getValueFromMapping(valuePath, data, currentModel, context,
          listItemIndex: listItemIndex, listSourcePath: listSourcePath);

      if (value == null) return null;

      final valueStr = value.toString();
      if (valueStr.length >= minLength) {
        return valueStr;
      } else {
        return valueStr.padLeft(minLength, padChar);
      }
    }

    if (instruction.startsWith('__context:')) {
      final path = instruction.replaceFirst('__context:', '');
      return _getValueFromPath(context, path);
    }

    return _getValueFromPath(data, instruction);
  }

  Map<String, String> _parseSwitchMapping(String raw) {
    final map = <String, String>{};
    // Enhanced pattern to support keys with spaces and special characters
    // Matches: "key:value" or "key with spaces:value"
    final pattern = RegExp(r'([^:,{}]+):([^,{}]+)');
    for (final match in pattern.allMatches(raw)) {
      final key = match.group(1)?.trim();
      final value = match.group(2)?.trim();
      if (key != null && value != null) {
        map[key] = value;
      }
    }
    return map;
  }

  dynamic resolveDynamicPath(
      String path, Map<String, dynamic> data, Map<String, dynamic> context) {
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
    if (kDebugMode) {
      print('📍 _getValueFromPath called with path: "$path"');
      print('   data keys: ${data.keys}');
    }
    final regex = RegExp(r'([^\[\].]+)(?:\[(\d+)\])?');

    dynamic current = data;
    for (final match in regex.allMatches(path)) {
      final key = match.group(1);
      final indexStr = match.group(2);

      if (kDebugMode) {
        print('   Processing key: "$key", indexStr: $indexStr');
        print('   current type: ${current.runtimeType}');
      }

      // Convert Dart object to Map if needed before accessing keys
      if (current is! Map<String, dynamic> && current is! List) {
        try {
          // Try to call toMap() if it exists
          final toMapMethod = (current as dynamic).toMap;
          if (toMapMethod != null) {
            if (kDebugMode) {
              print(
                  '   Converting ${current.runtimeType} to Map before accessing key');
            }
            current = toMapMethod() as Map<String, dynamic>;
            if (kDebugMode) {
              print(
                  '   Converted successfully, new type: ${current.runtimeType}');
              print('   Keys in converted Map: ${(current as Map).keys}');
            }
          }
        } catch (e) {
          // Object doesn't have toMap method, continue
          if (kDebugMode) {
            print(
                '   Object ${current.runtimeType} does not have toMap method');
          }
        }
      }

      if (current is Map<String, dynamic> &&
          key != null &&
          current.containsKey(key)) {
        current = current[key];
        if (kDebugMode) {
          print('   Found in Map, new current type: ${current.runtimeType}');
        }
      } else if (current is List &&
          current.length == 1 &&
          current.first is Map<String, dynamic> &&
          key != null &&
          (current.first as Map<String, dynamic>).containsKey(key)) {
        current = (current.first as Map<String, dynamic>)[key];
        if (kDebugMode) {
          print(
              '   Found in single-item List, new current type: ${current.runtimeType}');
        }
      } else {
        if (kDebugMode) {
          print(
              '⚠️ Warning: Key "$key" not found while resolving path "$path".');
          if (current is Map) {
            print('   Available keys in current Map: ${(current as Map).keys}');
          }
        }
        return null;
      }

      // Handle array indexing for both List objects and comma-separated strings
      if (indexStr != null) {
        final index = int.tryParse(indexStr);
        if (index == null) {
          return null;
        }

        if (current is List) {
          // Handle List objects with proper array indexing
          if (index >= 0 && index < current.length) {
            current = current[index];
            // Convert Dart object to Map if it has toMap method
            if (current is! Map<String, dynamic> &&
                current.runtimeType.toString().contains('Mappable') &&
                current is dynamic &&
                current.toMap != null) {
              current = current.toMap() as Map<String, dynamic>;
            }
          } else {
            if (kDebugMode) {
              print(
                  'Warning: Index $index out of bounds for list of length ${current.length} in path "$path".');
            }
            return null;
          }
        } else if (current is String) {
          // Handle comma-separated strings
          final parts = current.split(',');
          if (index >= 0 && index < parts.length) {
            current = parts[index].trim();
          } else {
            return null;
          }
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
