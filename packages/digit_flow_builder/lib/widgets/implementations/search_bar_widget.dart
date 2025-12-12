import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

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
