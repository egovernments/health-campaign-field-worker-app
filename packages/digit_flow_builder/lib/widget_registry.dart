import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import 'action_handler/action_config.dart';
import 'blocs/flow_crud_bloc.dart';
import 'layout_renderer.dart';

typedef WidgetBuilderFn = Widget Function(
  Map<String, dynamic>,
  BuildContext,
  void Function(ActionConfig),
);

class WidgetRegistry {
  static final _builders = <String, WidgetBuilderFn>{};

  static void register(String format, WidgetBuilderFn builder) {
    _builders[format] = builder;
  }

  static Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final format = json['format'] as String? ?? '';
    final builder = _builders[format];
    if (builder != null) {
      return builder(json, context, onAction);
    }
    return Text('Unknown widget format: $format');
  }

  void initializeDefaultWidgetRegistry() {
    WidgetRegistry.register('button', (json, context, onAction) {
      final props = Map<String, dynamic>.from(json['properties'] ?? {});

      return DigitButton(
        label: json['label'] ?? '',
        onPressed: () {
          if (json['onAction'] != null) {
            final action = ActionConfig.fromJson(
              Map<String, dynamic>.from(json['onAction']),
            );
            onAction(action);
          }
        },
        type: _parseButtonType(props['type']),
        size: _parseButtonSize(props['size']),
        mainAxisSize: _parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment: _parseMainAxisAlignment(props['mainAxisAlignment']),
        suffixIcon:
            json['suffixIcon'] != null ? _parseIcon(json['suffixIcon']) : null,
      );
    });

    WidgetRegistry.register('searchBar', (json, context, onAction) {
      return DigitSearchBar(
        hintText: json['label'] ?? '',
        onChanged: (value) {
          if (json['onAction'] != null) {
            final raw = Map<String, dynamic>.from(json['onAction']);
            raw['properties'] ??= {};

            final data = raw['properties']['data'];
            if (data is List &&
                data.isNotEmpty &&
                data[0] is Map<String, dynamic>) {
              data[0]['value'] = value;
            }
            final action = ActionConfig.fromJson(raw);
            onAction(action);
          }
        },
      );
    });

    WidgetRegistry.register('card', (json, context, onAction) {
      return DigitCard(
        cardType: parseCardType(json['type'] as String? ?? 'primary'),
        children: (json['children'] as List)
            .map<Widget>(
                (childJson) => LayoutMapper.map(childJson, context, onAction))
            .toList(),
      );
    });

    WidgetRegistry.register('filter', (json, context, onAction) {
      return DigitButton(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        label: json['label'] ?? '',
        onPressed: () {
          if (json['onAction'] != null) {
            final action = ActionConfig.fromJson(
                Map<String, dynamic>.from(json['onAction']));
            onAction(action);
          }
        },
        type: DigitButtonType.tertiary,
        size: DigitButtonSize.large,
        suffixIcon: Icons.filter_alt_sharp,
      );
    });

    WidgetRegistry.register('infoCard', (json, context, onAction) {
      return InfoCard(
        type: InfoType.info,
        title: json['label'] ?? '',
        description: json['description'] ?? '',
      );
    });

    WidgetRegistry.register('column', (json, context, onAction) {
      final children = (json['children'] as List)
          .map<Widget>(
              (childJson) => LayoutMapper.map(childJson, context, onAction))
          .expand((widget) => [
                widget,
                const SizedBox(height: 16),
              ])
          .toList();

      if (children.isNotEmpty) {
        children.removeLast(); // Remove trailing SizedBox
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    });

    WidgetRegistry.register('row', (json, context, onAction) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: (json['children'] as List)
            .map<Widget>(
                (childJson) => LayoutMapper.map(childJson, context, onAction))
            .toList(),
      );
    });

    WidgetRegistry.register('text', (json, context, onAction) {
      final value = json['value'] ?? '';

      String? pageName;
      final stack = context.router.stackData;
      if (stack.length >= 2) {
        final prevRouteData = stack[stack.length - 1];
        final prevArgs = prevRouteData.args;
        if (prevArgs is FlowBuilderHomeRouteArgs) {
          pageName = prevArgs.pageName;
        }
      }

      var finalText = value;
      if (pageName != null) {
        final stateData = extractCrudStateData(pageName);

        // Get index if present
        final index =
            json['__listIndex'] is int ? json['__listIndex'] as int : null;

        finalText = interpolateWithCrudStates(
          template: value,
          stateData: stateData,
          listIndex: index, // 👈 tell interpolation which row we’re in
        );
      }

      return Text(finalText ?? value);
    });

    WidgetRegistry.register('switch', (json, context, onAction) {
      return DigitSwitch(
        label: json['label'] ?? '',
        value: false, // Add state linkage if needed
        mainAxisAlignment: MainAxisAlignment.start,
        onChanged: (value) {
          if (json['onAction'] != null) {
            final raw = Map<String, dynamic>.from(json['onAction']);
            raw['properties'] ??= {};
            raw['properties']['data'] = [
              {
                'key': json['fieldName'] ?? 'switch',
                'value': value,
              }
            ];
            final action = ActionConfig.fromJson(raw);
            onAction(action);
          }
        },
      );
    });

    WidgetRegistry.register('tag', (json, context, onAction) {
      return Tag(
        label: json['label'] ?? '',
        type: TagType.error,
      );
    });

    WidgetRegistry.register('listView', (json, context, onAction) {
      final screenKey =
          getScreenKeyFromArgs(context) ?? context.router.currentPath;

      final crudData = extractCrudStateData(screenKey);

      final items = crudData.rawState;
      if (items.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final safeItem = (item is Map)
              ? item.map((k, v) => MapEntry(k.toString(), v))
              : {};

          final childJson = Map<String, dynamic>.from(json['child']);
          childJson['item'] = safeItem;
          childJson['__listIndex'] = index; // 👈 pass the index

          return LayoutMapper.map(childJson, context, onAction);
        }).expand((widget) => [widget, const SizedBox(height: 8)]).toList()
          ..removeLast(),
      );
    });
  }

  DigitButtonType _parseButtonType(String? type) {
    switch (type) {
      case 'primary':
        return DigitButtonType.primary;
      case 'secondary':
        return DigitButtonType.secondary;
      case 'tertiary':
        return DigitButtonType.tertiary;
      default:
        return DigitButtonType.primary;
    }
  }

  DigitButtonSize _parseButtonSize(String? size) {
    switch (size) {
      case 'small':
        return DigitButtonSize.small;
      case 'medium':
        return DigitButtonSize.medium;
      case 'large':
        return DigitButtonSize.large;
      default:
        return DigitButtonSize.large;
    }
  }

  MainAxisSize? _parseMainAxisSize(String? size) {
    switch (size) {
      case 'max':
        return MainAxisSize.max;
      case 'min':
        return MainAxisSize.min;
      default:
        return null;
    }
  }

  MainAxisAlignment? _parseMainAxisAlignment(String? alignment) {
    switch (alignment) {
      case 'start':
        return MainAxisAlignment.start;
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      default:
        return null;
    }
  }

  IconData? _parseIcon(String? iconName) {
    // Add more mappings if needed
    switch (iconName) {
      case 'filter':
        return Icons.filter_alt_sharp;
      case 'edit':
        return Icons.edit;
      default:
        return null;
    }
  }

  CardType parseCardType(String? raw) {
    switch ((raw ?? '').toLowerCase()) {
      case 'primary':
        return CardType.primary;
      case 'secondary':
        return CardType.secondary;
      default:
        return CardType.primary; // fallback
    }
  }

  /// Recursively walks a dynamic structure (Map, List, String, etc.)
  /// and applies [transform] to every String value.
  dynamic deepMapStrings(dynamic input, String Function(String) transform) {
    if (input is String) {
      return transform(input);
    } else if (input is Map) {
      return input.map((key, value) => MapEntry(
            key,
            deepMapStrings(value, transform),
          ));
    } else if (input is List) {
      return input.map((value) => deepMapStrings(value, transform)).toList();
    }
    return input;
  }
}

class CrudStateData {
  final Map<String, List<Map<String, dynamic>>> modelMap;
  final List<dynamic> rawState;

  CrudStateData(this.modelMap, this.rawState);
}

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

String interpolateWithCrudStates({
  required String template,
  required CrudStateData stateData,
  int? listIndex,
  Map<String, dynamic>? item,
}) {
  final regex = RegExp(
    r'\{\{\s*(context|item)\.([A-Za-z_][\w]*)'
    r'(?:\[(\d+)\])?'
    r'(?:\.([\w.]+))?\s*\}\}',
  );

  return template.replaceAllMapped(regex, (match) {
    final source = match.group(1); // context or item
    final modelNameOrKey = match.group(2);
    final indexStr = match.group(3);
    final fieldPath = match.group(4);

    if (source == 'context') {
      final models = stateData.modelMap[modelNameOrKey] ?? [];
      final index = indexStr != null ? int.parse(indexStr) : (listIndex ?? 0);

      if (index < 0 || index >= models.length) return '';
      dynamic value = models[index];

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
