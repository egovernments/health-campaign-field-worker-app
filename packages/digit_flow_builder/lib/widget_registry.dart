import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import 'action_handler/action_config.dart';
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
        onPressed: () {
          if (json['onAction'] != null) {
            final action = ActionConfig.fromJson(
                Map<String, dynamic>.from(json['onAction']));
            onAction(action);
          }
        },
        type: DigitButtonType.primary,
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
      return DigitCard(children: [
        LayoutMapper.map(json['child'], context, onAction),
      ]);
    });

    WidgetRegistry.register('column', (json, context, onAction) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (json['children'] as List)
            .map<Widget>(
                (childJson) => LayoutMapper.map(childJson, context, onAction))
            .toList(),
      );
    });

    WidgetRegistry.register('row', (json, context, onAction) {
      return Row(
        children: (json['children'] as List)
            .map<Widget>(
                (childJson) => LayoutMapper.map(childJson, context, onAction))
            .toList(),
      );
    });

    WidgetRegistry.register('text', (json, context, onAction) {
      return Text(json['value'] ?? '');
    });

    WidgetRegistry.register('switch', (json, context, onAction) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(json['label'] ?? ''),
          Switch(
            value: false, // Add state linkage if needed
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
          )
        ],
      );
    });
  }
}
