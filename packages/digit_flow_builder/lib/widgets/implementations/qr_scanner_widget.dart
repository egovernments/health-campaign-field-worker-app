import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../action_handler/action_handler.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../resolved_flow_widget.dart';

/// Scanner Button Widget
///
/// A button that opens the scanner page and waits for scan results.
/// When user returns after scanning, it processes the scanned data and executes onChange actions.
///
/// This ensures onChange actions only execute AFTER returning from the scanner page.
class QRScannerWidget extends ResolvedFlowWidget {
  @override
  String get format => 'qrScanner';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    // Visibility and disabled already checked by base class
    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    // Extract validations from config to override OPEN_SCANNER properties
    final validations = json['validations'] as List<dynamic>?;

    return DigitButton(
      label: resolved.resolvedLabel ?? (json['label'] ?? ''),
      isDisabled: resolved.isDisabled,
      onPressed: () async {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          // Pre-resolve navigation data for all actions and apply validation overrides
          final resolvedActionsList = actionsList.map((actionJson) {
            var action = ActionConfig.fromJson(actionJson);
            Map<String, dynamic> updatedProperties = {...action.properties};

            // Apply validation overrides for OPEN_SCANNER action
            // Check if validation type matches any property key and override it
            if (action.actionType == 'OPEN_SCANNER' && validations != null) {
              for (final validation in validations) {
                if (validation is Map<String, dynamic>) {
                  final validationType = validation['type'] as String?;
                  final validationValue = validation['value'];

                  // If the validation type matches a property key, override it
                  if (validationType != null &&
                      validationValue != null &&
                      updatedProperties.containsKey(validationType)) {
                    updatedProperties[validationType] = validationValue;
                  }
                }
              }
            }

            // Resolve navigation data if present
            final navData = updatedProperties['data'] as List<dynamic>?;

            if (navData != null) {
              final resolvedData = navData.map((entry) {
                final key = entry['key'] as String;
                final rawValue = entry['value'];

                // Resolve using evalContext which contains all data sources
                dynamic resolvedValue = resolveValue(rawValue, resolved.evalContext);
                if (resolvedValue == rawValue) {
                  resolvedValue = rawValue;
                }

                return {
                  "key": key,
                  "value": resolvedValue,
                };
              }).toList();

              return {
                ...actionJson,
                'properties': {
                  ...updatedProperties,
                  'data': resolvedData,
                },
              };
            }

            return {
              ...actionJson,
              'properties': updatedProperties,
            };
          }).toList();

          // Build initial context data from current state using evalContext
          final initialContextData = <String, dynamic>{
            'wrappers': const [],
            ...resolved.evalContext,
          };

          // Use ActionHandler.executeActions to chain actions with shared contextData
          // This ensures that REVERSE_TRANSFORM's formData flows to NAVIGATION
          await ActionHandler.executeActions(
            resolvedActionsList,
            context,
            initialContextData,
          );
        }
      },
      type: WidgetParsers.parseButtonType(props['type']),
      size: WidgetParsers.parseButtonSize(props['size']),
      mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment:
      WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
      suffixIcon: json['suffixIcon'] != null
          ? DigitIconMapping.getIcon(json['suffixIcon'])
          : null,
      prefixIcon: json['prefixIcon'] != null
          ? DigitIconMapping.getIcon(json['prefixIcon'])
          : null,
    );
  }
}
