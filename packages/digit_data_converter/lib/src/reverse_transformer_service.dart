import 'dart:collection';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';

class ReverseFormMapper {
  final Map<String, dynamic> formConfig;
  final List<EntityModel> modelInstances;

  ReverseFormMapper({
    required this.formConfig,
    required this.modelInstances,
  });

  Map<String, dynamic> buildFormData() {
    final Map<String, dynamic> formData = {};

    for (final modelEntry in formConfig['models'].entries) {
      final modelName = modelEntry.key;
      final modelConfig = modelEntry.value;

      EntityModel? instance;
      for (final model in modelInstances) {
        if (model.runtimeType.toString() == modelName) {
          instance = model;
          break;
        }
      }

      if (instance != null) {
        final modelMap = instance.toMap();

        // Apply normal mappings
        _applyMappings(formData, modelMap, modelConfig['mappings'] ?? {});

        // Apply list (repeat group) mappings
        if (modelConfig.containsKey('listMappings')) {
          _applyListMappings(formData, modelMap, modelConfig['listMappings']);
        }
      }
    }

    return _flattenFormData(formData); // ✅ auto-flattened
  }

  Map<String, dynamic> _flattenFormData(Map<String, dynamic> nestedMap) {
    final flatMap = <String, dynamic>{};

    void recurse(dynamic value, String currentPath) {
      if (value is Map) {
        value.forEach((k, v) {
          final newPath = currentPath.isEmpty ? k : '$currentPath.$k';
          recurse(v, newPath);
        });
      } else if (value is List) {
        for (int i = 0; i < value.length; i++) {
          final newPath = '$currentPath[$i]';
          recurse(value[i], newPath);
        }
      } else {
        flatMap[currentPath] = value;
      }
    }

    nestedMap.forEach((key, value) {
      recurse(value, key);
    });

    // Group fields like latLng[0], latLng[1] and identifiers[0], identifiers[1]
    final grouped = <String, SplayTreeMap<int, dynamic>>{};
    final otherFields = <String, dynamic>{};

    flatMap.forEach((path, value) {
      final match = RegExp(r'^(.*)\[(\d+)\]$').firstMatch(path);
      if (match != null) {
        final baseKey = match.group(1)!;
        final index = int.parse(match.group(2)!);
        grouped.putIfAbsent(
            baseKey, () => SplayTreeMap<int, dynamic>())[index] = value;
      } else {
        final lastKey = path.split('.').last;
        otherFields[lastKey] = value;
      }
    });

    // Combine grouped indexed fields
    grouped.forEach((baseKey, entries) {
      final combined = entries.values.join(',');
      final lastSegment = baseKey.split('.').last;
      otherFields[lastSegment] = combined;
    });

    return otherFields;
  }

  void _applyMappings(
    Map<String, dynamic> formData,
    Map<String, dynamic> modelInstance,
    Map mappings,
  ) {
    for (final entry in mappings.entries) {
      final modelField = entry.key;
      final formFieldPath = entry.value;

      final modelValue = modelInstance[modelField];
      if (modelValue == null) continue;

      if (formFieldPath is String) {
        // Skip special constant mappings like __value, __uuid, __context
        if (formFieldPath.startsWith('__')) continue;

        _setNestedValue(formData, formFieldPath, modelValue);
      } else if (formFieldPath is Map<String, dynamic>) {
        // Special mapping: additionalFields
        if (modelField == 'additionalFields' && modelValue is Map) {
          final fields = modelValue['fields'];
          if (fields is List) {
            for (final field in fields) {
              if (field is Map &&
                  field.containsKey('key') &&
                  field.containsKey('value')) {
                final key = field['key'];
                final value = field['value'];
                if (key is String) {
                  formData[key] = value;
                }
              }
            }
          }
          continue;
        }

        // Nested mapping: recurse into object
        if (modelValue is Map<String, dynamic>) {
          _applyMappings(formData, modelValue, formFieldPath);
        }
      } else {
        // Unsupported format
        debugPrint(
            'Unsupported formFieldPath type: ${formFieldPath.runtimeType}');
      }
    }
  }

  void _applyListMappings(
    Map<String, dynamic> formData,
    Map<String, dynamic> modelInstance,
    Map listMappings,
  ) {
    for (final listModelEntry in listMappings.entries) {
      final listKey = listModelEntry.key; // e.g., "HouseholdMember"
      final listModelConfig = listModelEntry.value;
      final mappings = listModelConfig['mappings'] ?? {};

      // You may override the key used to extract items from model if defined in config
      final listFieldName = listModelConfig['field'] ??
          listKey[0].toLowerCase() + listKey.substring(1);
      final List<dynamic> listItems = modelInstance[listFieldName] ?? [];

      for (int index = 0; index < listItems.length; index++) {
        final item = listItems[index];
        if (item is! Map<String, dynamic>) continue;

        for (final entry in mappings.entries) {
          final modelField = entry.key;
          final formFieldPathTemplate = entry.value;

          if (formFieldPathTemplate is! String ||
              formFieldPathTemplate.startsWith('__')) continue;

          final formFieldPath = formFieldPathTemplate.replaceAllMapped(
            RegExp(r'\[(\d*)\]\$'),
            (match) => '[${index}]\$',
          );

          final modelValue = item[modelField];
          if (modelValue == null) continue;

          _setNestedValue(formData, formFieldPath, modelValue);
        }
      }
    }
  }

  void _setNestedValue(Map<String, dynamic> map, String path, dynamic value) {
    final parts = path.split('.');
    dynamic current = map;

    for (int i = 0; i < parts.length - 1; i++) {
      final part = parts[i];
      final match = RegExp(r'^(.*)\[(\d+)\]\$$').firstMatch(part);

      if (match != null) {
        final key = match.group(1)!;
        final index = int.parse(match.group(2)!);

        current[key] ??= [];
        List list = current[key];

        while (list.length <= index) {
          list.add({});
        }

        current = list[index];
      } else {
        current[part] ??= {};
        current = current[part];
      }
    }

    final lastPart = parts.last;
    final lastMatch = RegExp(r'^(.*)\[(\d+)\]\$$').firstMatch(lastPart);
    if (lastMatch != null) {
      final key = lastMatch.group(1)!;
      final index = int.parse(lastMatch.group(2)!);

      current[key] ??= [];
      List list = current[key];

      while (list.length <= index) {
        list.add(null);
      }

      list[index] = value;
    } else {
      current[lastPart] = value;
    }
  }
}
