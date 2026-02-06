import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:flutter/material.dart';

import '../../flow_builder.dart';
import '../../utils/flow_widget_state.dart';
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
    final flowState = WidgetStateContext.of(context);
    final localization = LocalizationContext.maybeOf(context);
    final hintText = json['label'] ?? '';
    final localizedHint = localization?.translate(hintText) ?? hintText;
    final fieldName = (json['fieldName'] ?? 'searchBar') as String;

    // Use compositeKey for registry operations (includes instanceId for proper isolation)
    final compositeKey = flowState.compositeKey ?? flowState.screenKey;

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
        if (compositeKey != null) {
          final currentState = FlowCrudStateRegistry().get(compositeKey);
          final currentWidgetData =
              currentState?.widgetData ?? <String, dynamic>{};
          final Map<String, dynamic> updatedWidgetData = {
            ...currentWidgetData,
            fieldName: value,
          };
          if (currentState != null) {
            FlowCrudStateRegistry().update(
              compositeKey,
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
        } else if (json['onAction'] != null) {
          // Below minimum chars — remove only this search bar's filter (not the entire state)
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          final searchBarFilterKeys = <String>[];
          String searchName = 'default';

          for (var raw in actionsList) {
            searchName = (raw['properties']?['name'] as String?) ?? searchName;
            final data = raw['properties']?['data'] as List?;
            if (data != null) {
              for (var item in data) {
                if (item is Map && item['key'] != null) {
                  searchBarFilterKeys.add(item['key'].toString());
                }
              }
            }
          }

          if (searchBarFilterKeys.isNotEmpty) {
            onAction(ActionConfig.fromJson({
              'actionType': 'CLEAR_STATE',
              'properties': {
                'type': 'CLEAR_STATE',
                'name': searchName,
                'filterKeys': searchBarFilterKeys,
                'widgetKeys': [fieldName],
                'triggerSearch': true,
              },
            }));
          }
        }
      },
    );
  }
}
