import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../blocs/flow_crud_bloc.dart';
import '../router/flow_builder_routes.gm.dart';
import 'function_registry.dart';

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

/// String interpolation helper for {{context.*}}, {{item.*}}, and {{navigation.*}}
String interpolateWithCrudStates({
  required String template,
  required CrudStateData stateData,
  int? listIndex,
  Map<String, dynamic>? item,
  Map<String, dynamic>? navigationParams,
  Map<String, dynamic>? rowItem, // row-level override (for table rows)
}) {
  // TODO: update row and interpolation to consider row index to render table content

  dynamic traverse(dynamic start, String? path) {
    if (path == null || path.isEmpty) return start;
    var value = start;
    for (final part in path.split('.')) {
      if (value is Map && value.containsKey(part)) {
        value = value[part];
      } else {
        return null;
      }
    }
    return value;
  }

  // --- Function resolution first: {{fn:someFunc(arg1, arg2)}}
  final fnRegex = RegExp(r'\{\{\s*fn:(\w+)\((.*?)\)\s*\}\}');
  template = template.replaceAllMapped(fnRegex, (match) {
    final fnName = match.group(1)!;
    final argsExpr = match.group(2) ?? '';

    final resolvedArgs = argsExpr.trim().isEmpty
        ? <dynamic>[]
        : argsExpr.split(',').map((rawArg) {
            final trimmed = rawArg.trim();
            final placeholder = '{{ $trimmed }}';
            return interpolateWithCrudStates(
              template: placeholder,
              stateData: stateData,
              listIndex: listIndex,
              item: item,
              navigationParams: navigationParams,
              rowItem: rowItem,
            );
          }).toList();

    return FunctionRegistry.call(fnName, resolvedArgs, stateData)?.toString() ??
        '';
  });

  // --- Normal placeholder resolution ---
  final regex = RegExp(
    r'\{\{\s*(context|item|navigation)\.([A-Za-z_][\w]*)'
    r'(?:\.([\w.]+))?\s*\}\}',
  );

  return template.replaceAllMapped(regex, (match) {
    final source = match.group(1);
    final modelNameOrKey = match.group(2);
    final fieldPath = match.group(3);

    // 1) Row-level data (highest priority)
    if (rowItem != null) {
      // Try rowItem directly as the model instance
      if (rowItem.containsKey(modelNameOrKey)) {
        final v = traverse(rowItem[modelNameOrKey], fieldPath);
        return v?.toString() ?? '';
      }
      // Or maybe rowItem itself is the model instance
      final v = traverse(rowItem, fieldPath ?? modelNameOrKey);
      if (v != null) return v.toString();
    }

    // 2) Item-level (from parent list view)
    if (source == 'item' && item != null) {
      dynamic val = item[modelNameOrKey];
      final resolved = traverse(val, fieldPath);
      return resolved?.toString() ?? '';
    }

    // 3) Context-level (global models)
    if (source == 'context') {
      final models = stateData.modelMap[modelNameOrKey];

      if (models == null) return '';

      if (models is List) {
        // ✅ IMPORTANT CHANGE:
        // If rowItem exists, IGNORE listIndex (use rowItem only)
        if (rowItem != null) return '';
        final idx = listIndex ?? 0;
        if (idx < 0 || idx >= models.length) return '';
        final resolved = traverse(models[idx], fieldPath);
        return resolved?.toString() ?? '';
      } else {
        final resolved = traverse(models, fieldPath);
        return resolved?.toString() ?? '';
      }
    }

    // 4) Navigation params
    if (source == 'navigation' && navigationParams != null) {
      final resolved = traverse(navigationParams[modelNameOrKey], fieldPath);
      return resolved?.toString() ?? '';
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
  Map<String, dynamic> walk(Map<String, dynamic> node, {bool skipActions = false}) {
    final result = <String, dynamic>{};

    node.forEach((key, value) {
      // Skip processing onAction blocks - they should be lazy evaluated on click
      if (key == "onAction") {
        result[key] = value; // Keep onAction as-is, don't process
        return;
      }

      if (key == "actionType" && value == "NAVIGATION" && !skipActions) {
        final props = node["properties"];
        if (props is Map<String, dynamic> && props["data"] is List) {
          final params = <String, dynamic>{};

          for (final entry in (props["data"] as List)) {
            final k = entry["key"]?.toString();
            final rawValue = entry["value"]?.toString();

            if (k != null && rawValue != null) {
              final resolved = interpolateWithCrudStates(
                template: "{{$rawValue}}",
                stateData: stateData,
                listIndex: listIndex,
                item: item,
              );
              params[k] = resolved;
            }
          }

          if (params.isNotEmpty) {
            final screenKey = props["name"]?.toString() ?? "";
            if (screenKey.isNotEmpty) {
              FlowCrudStateRegistry().updateNavigationParams(screenKey, params);
            }
          }
        }

        result[key] = value; // keep actionType as is
      } else if (value is Map<String, dynamic>) {
        result[key] = walk(value, skipActions: skipActions);
      } else if (value is List) {
        result[key] = value.map((e) {
          if (e is Map<String, dynamic>) return walk(e, skipActions: skipActions);
          return e;
        }).toList();
      } else {
        result[key] = value;
      }
    });

    return result;
  }

  return walk(config);
}
