import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:flutter/material.dart';

import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../flow_widget_interface.dart';

class SearchBarWidget implements FlowWidget {
  @override
  String get format => 'searchBar';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final hintText = json['label'] ?? '';
    final localizedHint = localization?.translate(hintText) ?? hintText;
    final fieldName = (json['fieldName'] ?? 'searchBar') as String;

    // Get screenKey for storing widget data
    final crudCtx = CrudItemContext.of(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    // Get validation rules
    final validations = json['validation'] as List<dynamic>? ?? [];
    int minSearchChars = 1; // Default: trigger on any input

    // Parse validation rules
    for (final validation in validations) {
      if (validation is Map<String, dynamic>) {
        final key = validation['key'];
        if (key == 'minSearchChars') {
          final value = validation['value'];
          if (value is int) {
            minSearchChars = value;
          } else if (value is String) {
            minSearchChars = int.tryParse(value) ?? 1;
          }
        }
      }
    }

    return DigitSearchBar(
      hintText: localizedHint,
      onChanged: (value) {
        // Store the searchBar value in widgetData for WrapperBuilder to access
        if (screenKey != null) {
          final currentState = FlowCrudStateRegistry().get(screenKey);
          final currentWidgetData =
              currentState?.widgetData ?? <String, dynamic>{};
          final Map<String, dynamic> updatedWidgetData = {
            ...currentWidgetData,
            fieldName: value,
          };
          if (currentState != null) {
            FlowCrudStateRegistry().update(
              screenKey,
              currentState.copyWith(widgetData: updatedWidgetData),
            );
          }
        }

        // Only trigger onAction if value meets minimum character requirement
        if (value.length >= minSearchChars) {
          if (json['onAction'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);

            for (var raw in actionsList) {
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
          }
        } else if (value.isEmpty) {
          FlowCrudStateRegistry().clearAll();
        }
      },
    );
  }
}
