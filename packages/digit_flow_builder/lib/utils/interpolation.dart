import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../blocs/flow_crud_bloc.dart';
import '../router/flow_builder_routes.gm.dart';

/// Recursively walks a dynamic structure (Map, List, String, etc.)
/// and applies [transform] to every String value.
Map<String, dynamic> deepMapStrings(
  Map<String, dynamic> input,
  String Function(String) transform,
) {
  return input.map((key, value) {
    if (value is String) {
      return MapEntry(key, transform(value));
    } else if (value is Map<String, dynamic>) {
      return MapEntry(key, deepMapStrings(value, transform));
    } else if (value is List) {
      return MapEntry(
        key,
        value.map((e) {
          if (e is String) return transform(e);
          if (e is Map<String, dynamic>) return deepMapStrings(e, transform);
          return e;
        }).toList(),
      );
    } else {
      return MapEntry(key, value);
    }
  });
}

/// Holds normalized CRUD state data for templating and lookups
class CrudStateData {
  final Map<String, List<Map<String, dynamic>>> modelMap;
  final List<dynamic> rawState;

  CrudStateData(this.modelMap, this.rawState);
}

/// Try to extract the screenKey from Navigator args
String? getScreenKeyFromArgs(BuildContext context) {
  final args = ModalRoute.of(context)?.settings.arguments;

  if (args is Map<String, dynamic>) {
    return args['screenKey']?.toString();
  }

  if (args is FlowBuilderHomeRouteArgs) {
    return args.pageName; // this is your pageName param
  }

  return null;
}

/// Extracts model maps + raw state from the FlowCrudStateRegistry
CrudStateData extractCrudStateData(String screenKey) {
  final crudState = FlowCrudStateRegistry().get(screenKey);
  final List<dynamic>? state =
      crudState is FlowCrudState ? crudState.stateWrapper : null;

  final Map<String, List<Map<String, dynamic>>> modelMap = {};

  void addEntity(dynamic entity, {String? overrideKey}) {
    final typeKey = overrideKey ?? getEntityKey(entity);
    Map<String, dynamic>? map;
    if (entity is Map<String, dynamic>) {
      map = entity;
    } else if (entity is EntityModel) {
      map = entity.toMap();
    }
    if (map != null) {
      modelMap.putIfAbsent(typeKey, () => []).add(map);
      for (final entry in map.entries) {
        if (entry.value is List) {
          for (final item in entry.value) {
            addEntity(item, overrideKey: entry.key);
          }
        }
      }
    }
  }

  if (state != null) {
    for (final entity in state) {
      addEntity(entity);
    }
  }

  return CrudStateData(modelMap, state ?? []);
}

/// String interpolation helper for {{context.field}} and {{item.field}}
String interpolateWithCrudStates({
  required String template,
  required CrudStateData stateData,
  int? listIndex,
  Map<String, dynamic>? item,
}) {
  final regex = RegExp(
    r'\{\{\s*(context|item)\.([A-Za-z_][\w]*)'
    r'(?:\.([\w.]+))?\s*\}\}',
  );

  return template.replaceAllMapped(regex, (match) {
    final source = match.group(1); // context or item
    final modelNameOrKey = match.group(2);
    final fieldPath = match.group(3);

    if (source == 'context') {
      final models = stateData.modelMap[modelNameOrKey] ?? [];

      // Avoid RangeError
      if (models.isEmpty ||
          (listIndex != null &&
              (listIndex < 0 || listIndex >= models.length))) {
        return '';
      }

      dynamic value = models[listIndex ?? 0];
      if (fieldPath != null) {
        for (final part in fieldPath.split('.')) {
          if (value is Map<String, dynamic> && value.containsKey(part)) {
            value = value[part];
          } else {
            return '';
          }
        }
      }
      return value?.toString() ?? '';
    } else if (source == 'item' && item != null) {
      dynamic value = item[modelNameOrKey];
      if (fieldPath != null) {
        for (final part in fieldPath.split('.')) {
          if (value is Map && value.containsKey(part)) {
            value = value[part];
          } else {
            return '';
          }
        }
      }
      return value?.toString() ?? '';
    }

    return '';
  });
}

String getEntityKey(dynamic entity) {
  if (entity is EntityModel) {
    return entity.runtimeType
        .toString()
        .replaceAll(RegExp(r'^_+\$?'), '')
        .replaceAll(RegExp(r'Impl$'), '');
  }
  if (entity is Map<String, dynamic> && entity.containsKey('type')) {
    return entity['type'].toString();
  }
  return entity.runtimeType.toString();
}

Map<String, dynamic> preprocessConfigWithState(
  Map<String, dynamic> config,
  CrudStateData stateData, {
  int? listIndex,
  Map<String, dynamic>? item,
}) {
  return config;
}
