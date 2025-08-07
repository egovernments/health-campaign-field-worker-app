import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
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
      return DigitButton(
        label: json['label'] ?? '',
        type: parseButtonType(json['type'] as String?),
        onPressed: () {
          if (json['onAction'] != null) {
            final action = ActionConfig.fromJson(
                Map<String, dynamic>.from(json['onAction']));
            onAction(action);
          }
        },
        mainAxisSize: MainAxisSize.min,
        size: DigitButtonSize.large,
      );
    });

    WidgetRegistry.register('searchBar', (json, context, onAction) {
      return DigitSearchBar(
        hintText: json['label'] ?? '',
        onChanged: (value) {
          if (json['onAction'] != null) {
            final raw = Map<String, dynamic>.from(json['onAction']);
            raw['properties'] ??= {};
            raw['properties']['data'] = [
              {
                'key': json['fieldName'] ?? 'search',
                'value': value,
                'operation': 'contains',
              }
            ];
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
      const watchedKeys = 'FORM::HOUSEHOLD';

      final crudState = FlowCrudStateRegistry().get(watchedKeys);

      final interpolated = _interpolateWithCrudStates(value, crudState);
      return Text(interpolated);
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
      // Resolve the data source
      dynamic dataSource = json['data'];

      /// TODO: WILL UPDATE THE DATA SOURCE LOGIC LATER FOR NOW TAKING DUMMY VALUE
      // If it's a variable reference like '{{members}}', resolve from context/state
      // if (dataSource is String && dataSource.startsWith('{{') && dataSource.endsWith('}}')) {
      //   final variableName = dataSource.substring(2, dataSource.length - 2).trim();
      //   // For demo: try to get from ModalRoute or InheritedWidget, or fallback to empty list
      //   // In real app, wire this to your state management solution
      //   dataSource = ModalRoute.of(context)?.settings.arguments != null &&
      //           (ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?)?.containsKey(variableName) == true
      //       ? (ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>)[variableName]
      //       : [];
      // }
      // if (dataSource == null) dataSource = [];
      dataSource = [
        {
          "name": "HEADDF",
          "gender": "Female",
          "age": 35,
          "months": 0,
          "status": "Not visited",
          "childrenCount": 3,
          "id": "1"
        }
      ];

      return Column(
        children: (dataSource as List)
            .map<Widget>((item) {
              final childJson = Map<String, dynamic>.from(json['child']);
              childJson['item'] = item;
              return LayoutMapper.map(childJson, context, onAction);
            })
            .expand((widget) => [widget, const SizedBox(height: 16)])
            .toList()
          ..removeLast(), // removes trailing SizedBox
      );
    });
  }

  DigitButtonType parseButtonType(String? raw) {
    switch ((raw ?? '').toLowerCase()) {
      case 'primary':
        return DigitButtonType.primary;
      case 'secondary':
        return DigitButtonType.secondary;
      case 'tertiary':
        return DigitButtonType.tertiary;
      default:
        return DigitButtonType.primary; // fallback
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

  String _interpolateWithCrudStates(
    String template,
    CrudState? states,
  ) {
    if (states == null) return template;

    if (states is CrudStatePersisted) {
      final regex =
          RegExp(r'\{\{\s*context\.([A-Za-z_][\w]*)\.([\w.]+)\s*\}\}');
      final modelMap = <String, Map<String, dynamic>>{};

      for (final entity in states.entities) {
        final type = entity.runtimeType.toString();
        modelMap[type] = entity.toMap();
      }

      return template.replaceAllMapped(regex, (match) {
        final modelName = match.group(1);
        final fieldPath = match.group(2); // could be 'name.givenName'

        if (modelName == null || fieldPath == null) return match.group(0)!;

        final model = modelMap[modelName];
        if (model == null) return '';

        // Traverse nested fields
        dynamic value = model;
        for (final part in fieldPath.split('.')) {
          if (value is Map<String, dynamic> && value.containsKey(part)) {
            value = value[part];
          } else {
            return ''; // invalid path
          }
        }

        return value?.toString() ?? '';
      });
    }

    return template;
  }
}
