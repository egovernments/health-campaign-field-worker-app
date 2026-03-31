import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_date_form_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../resolved_flow_widget.dart';

/// A date picker widget for TEMPLATE screens.
///
/// JSON Config:
/// ```json
/// {
///   "type": "template",
///   "format": "date",
///   "fieldKey": "selectedDate",
///   "label": "SELECT_DATE",
///   "innerLabel": "Select date",
///   "startDate": "2026-02-14",  // or epoch milliseconds
///   "endDate": "2026-02-28",    // or epoch milliseconds
///   "readOnly": false,
///   "onAction": []  // Optional actions to execute on date change
/// }
/// ```
///
/// The widget stores date state as a structured object:
/// ```json
/// {
///   "date": "2026-02-14T00:00:00.000",  // ISO 8601 string
///   "entryTime": 1739491200000,          // Start of day (epoch ms)
///   "exitTime": 1739577599999            // End of day (epoch ms)
/// }
/// ```
/// Access via: `{{widgetData.selectedDate.entryTime}}`, `{{widgetData.selectedDate.exitTime}}`
class DateWidget extends ResolvedFlowWidget {
  @override
  String get format => 'date';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    void triggerAction() async {
      // Process onAction array from config (if present)
      if (json['onAction'] != null && json['onAction'] is List) {
        final actionsList = List<Map<String, dynamic>>.from(json['onAction']);
        if (actionsList.isNotEmpty) {
          await resolved.executeActions(actionsList, context);
        }
      }
    }

    return WidgetStateContext.reactive(context, (ctx, state) {
      final fieldKey = json['fieldKey'] as String? ?? 'selectedDate';
      final label = json['label'] as String?;
      final innerLabel = json['innerLabel'] as String?;
      final helpText = json['helpText'] as String?;
      final readOnly = json['readOnly'] as bool? ?? false;

      // Parse start date
      DateTime? startDate;
      String startDateRaw = resolved.resolveText(json['startDate']);
      int? startDateRawInt = int.tryParse(startDateRaw);
      if (startDateRawInt != null) {
        startDate = DateTime.fromMillisecondsSinceEpoch(startDateRawInt);
      }
      // Parse end date
      DateTime? endDate;
      String endDateRaw = resolved.resolveText(json['endDate']);
      int? endDateRawInt = int.tryParse(endDateRaw);
      if (endDateRawInt != null) {
        endDate = DateTime.fromMillisecondsSinceEpoch(endDateRawInt);
      }

      // Current Date
      DateTime currentDate = DateTime.now();
      final currentDateRaw = resolved.resolveText(json['currentDate']);
      final currentDateRawInt = int.tryParse(currentDateRaw);
      if (currentDateRawInt != null) {
        currentDate = DateTime.fromMillisecondsSinceEpoch(currentDateRawInt);
      }

      // Initialize widgetData with today's date on first render
      if (state.widgetData[fieldKey] == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.updateWidgetData(fieldKey, currentDate.millisecondsSinceEpoch);
        });
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
            Text(
              resolved.resolveText(label),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
          ],
          DigitDateFormInput(
            controller: TextEditingController(
                text: DateFormat("dd MMM yyyy").format(currentDate)),
            firstDate: startDate,
            lastDate: endDate,
            helpText: helpText,
            readOnly: readOnly,
            innerLabel: innerLabel,
            initialDate: currentDate,
            onChange: (value) async {
              DateTime? parsedDate;
              try {
                final currentLocale =
                    Localizations.localeOf(context).toString();
                parsedDate =
                    DateFormat("dd MMM yyyy", currentLocale).parseStrict(value);
              } catch (e) {
                parsedDate = null;
              }

              if (parsedDate == null) return;

              state.updateWidgetData(
                  fieldKey, parsedDate.millisecondsSinceEpoch);

              // Dispatch selectDate action for internal handling
              onAction(ActionConfig(
                action: 'selectDate',
                actionType: 'widgetData',
                properties: {
                  'key': fieldKey,
                  'value': parsedDate.millisecondsSinceEpoch,
                },
              ));

              // Process onAction array from config (if present)
              triggerAction();
            },
          ),
        ],
      );
    });
  }
}
