import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../action_handler/action_config.dart';
import '../../action_handler/action_handler.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

/// Scanner Button Widget
///
/// A button that opens the scanner page and waits for scan results.
/// When user returns after scanning, it processes the scanned data and executes onChange actions.
///
/// This ensures onChange actions only execute AFTER returning from the scanner page.
class QRScannerWidget implements FlowWidget {
  @override
  String get format => 'qrScanner';

  @override
  Widget build(
      Map<String, dynamic> json,
      BuildContext context,
      void Function(ActionConfig) onAction,
      ) {
    final crudCtx = CrudItemContext.of(context);
    final crudStateData = crudCtx?.stateData;
    final stateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
        crudCtx!.stateData!.rawState.isNotEmpty
        ? crudCtx.stateData?.rawState.first
        : null;

    // Get form data from registry for resolving form field values
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final formData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.formData
        : null;

    // Create evaluation context
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
      ...crudStateData?.modelMap ?? {},
    };

    // Check visibility condition
    if (json['visible'] != null) {
      final visible = ConditionalEvaluator.evaluate(
        json['visible'],
        evalContext,
        stateData: crudStateData,
      );
      if (visible == false) {
        return const SizedBox.shrink();
      }
    }

    // Check disabled condition
    bool isDisabled = false;
    if (json['disabled'] != null) {
      final disabledResult = ConditionalEvaluator.evaluate(
        json['disabled'],
        evalContext,
        stateData: crudStateData,
      );
      isDisabled = disabledResult == true;
    }

    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final localization = LocalizationContext.maybeOf(context);

    // Localize first, then resolve template
    final labelText = json['label'] ?? '';
    final localizedLabel = localization?.translate(labelText) ?? labelText;

    // Use interpolateWithCrudStates for proper contextData resolution
    String resolvedLabel = localizedLabel;
    if (crudStateData != null && localizedLabel.contains('{{')) {
      resolvedLabel = interpolateWithCrudStates(
        template: localizedLabel,
        stateData: crudStateData,
        item: crudCtx?.item,
      );
    } else if (stateData != null) {
      resolvedLabel = resolveTemplate(localizedLabel, stateData) ?? localizedLabel;
    }

    // Extract validations from config to override OPEN_SCANNER properties
    final validations = json['validations'] as List<dynamic>?;

    return DigitButton(
      label: resolvedLabel,
      isDisabled: isDisabled,
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

                // Try to resolve from stateData first, then fallback to formData
                dynamic resolvedValue = stateData != null
                    ? resolveValue(rawValue, stateData)
                    : rawValue;

                if (resolvedValue == rawValue && formData != null) {
                  // If not resolved from stateData, try formData
                  resolvedValue = resolveValue(rawValue, formData);
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

          // Build initial context data from current state
          final initialContextData = <String, dynamic>{
            'wrappers': const [],
            if (stateData != null) ...{
              'item': crudCtx?.item,
              'contextData': stateData,
            },
            if (formData != null) 'formData': formData,
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
