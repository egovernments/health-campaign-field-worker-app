import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
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
    return DigitSearchBar(
      hintText: json['label'] ?? '',
      onChanged: (value) {
        if (value.isNotEmpty) {
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
        } else {
          FlowCrudStateRegistry().clearAll();
        }
      },
    );
  }
}
