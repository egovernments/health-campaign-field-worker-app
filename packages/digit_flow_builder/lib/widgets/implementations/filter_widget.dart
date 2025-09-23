import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../flow_widget_interface.dart';

class FilterWidget implements FlowWidget {
  @override
  String get format => 'filter';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    return DigitButton(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      label: json['label'] ?? '',
      onPressed: () async {
        // trigger configured actions if any
        if (json['onAction'] != null) {
          final actionsList = json['onAction'] is List
              ? List<Map<String, dynamic>>.from(json['onAction'])
              : [Map<String, dynamic>.from(json['onAction'])];

          for (var raw in actionsList) {
            final action = ActionConfig.fromJson(raw);
            onAction(action);
          }
        }

        // call separate dialog function
        final filters =
            await showFilterPopup(context, json['label'] ?? 'Filters');

        if (filters != null && filters.isNotEmpty) {
          debugPrint("Selected filters: $filters");
          // update state or trigger action here
        } else {
          debugPrint("No filters selected, reset applied");
        }
      },
      type: DigitButtonType.tertiary,
      size: DigitButtonSize.large,
      suffixIcon: Icons.filter_alt_sharp,
    );
  }
}

/// separate function to show popup
dynamic showFilterPopup(BuildContext context, String title) {
  return showCustomPopup(
    context: context,
    builder: (ctx) => Popup(
      title: title,
      titleIcon: Icon(
        Icons.filter_alt_sharp,
        color: DigitTheme.instance.colorScheme.primary,
      ),
      onCrossTap: () {
        Navigator.of(ctx, rootNavigator: true).pop();
      },
      additionalWidgets: const [
        // Replace with your custom filter widget
        // StatusFilter(
        //   selectedFilters: [],
        // ),
      ],
    ),
  );
}
