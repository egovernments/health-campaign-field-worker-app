import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class TextInputWidget implements FlowWidget {
  @override
  String get format => 'textInput';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;
    final localization = LocalizationContext.maybeOf(context);

    // Get screen key for storing form data
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    // Get form data and widget data from registry to check for stored values
    final currentState =
        screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
    final formData = currentState?.formData ?? {};
    final widgetData = currentState?.widgetData ?? {};

    // For resolving item-specific fields, we use the current item or first item
    final itemStateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    final key = (json['key'] ?? json['fieldName']) as String?;
    final label = resolveTemplate(json['label'], itemStateData) ?? '';
    final localizedLabel = localization?.translate(label) ?? label;

    final placeholder = json['placeholder'] as String? ?? '';
    final localizedPlaceholder =
        localization?.translate(placeholder) ?? placeholder;

    final isRequired = json['required'] == true;
    final isReadOnly = json['readOnly'] == true;
    final maxLength = json['maxLength'] as int?;
    final minLength = json['minLength'] as int?;
    final inputType = json['inputType'] as String? ?? 'text';

    // Check visibility condition
    final visible = json['visible'] == null ||
        (json['visible'] is bool && json['visible'] == true) ||
        (json['visible'] is String &&
            resolveValue(json['visible'], itemStateData) == true);

    if (!visible) {
      return const SizedBox.shrink();
    }

    // Get current value from state
    // Priority: widgetData (persisted input) > itemStateData (entity data) > formData
    dynamic currentValue;
    if (key != null) {
      // First check widgetData for persisted input value
      if (widgetData.containsKey(key)) {
        currentValue = widgetData[key];
      } else {
        // Then try itemStateData
        currentValue = resolveValue('{{$key}}', itemStateData);
        // If not found in itemStateData, check formData directly
        if (currentValue == '{{$key}}' || currentValue == null) {
          currentValue = formData[key];
        }
      }
    }

    // Create TextEditingController with initial value
    final controller = TextEditingController(
      text: currentValue?.toString() ?? '',
    );

    // Determine keyboard type based on inputType
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;

    switch (inputType.toLowerCase()) {
      case 'number':
        keyboardType = TextInputType.number;
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case 'decimal':
        keyboardType = const TextInputType.numberWithOptions(decimal: true);
        inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
        ];
        break;
      case 'email':
        keyboardType = TextInputType.emailAddress;
        break;
      case 'phone':
        keyboardType = TextInputType.phone;
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case 'multiline':
        keyboardType = TextInputType.multiline;
        break;
      default:
        keyboardType = TextInputType.text;
    }

    // Use Builder to access the correct context where CrudItemContext is available
    // This ensures screenKey is captured after the widget tree is built (important for popups)
    return Builder(
      builder: (builderContext) {
        // Get screen key from the builder context (after CrudItemContext wrapper)
        // Fall back to route args for non-popup usage
        final crudContextForCallback = CrudItemContext.of(builderContext);
        final screenKeyForCallback =
            crudContextForCallback?.screenKey ?? getScreenKeyFromArgs(builderContext);

        return LabeledField(
          label: localizedLabel,
          isRequired: isRequired,
          child: DigitTextFormInput(
            controller: controller,
            readOnly: isReadOnly,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            onChange: (value) {
              if (key != null && screenKeyForCallback != null) {
                // Store the value in widgetData (same as SelectionCardWidget)
                final currentState =
                    FlowCrudStateRegistry().get(screenKeyForCallback);
                final currentWidgetData =
                    Map<String, dynamic>.from(currentState?.widgetData ?? {});

                // Update widget data with the input value
                currentWidgetData[key] = value;

                // Update the registry
                if (currentState != null) {
                  final updatedState = currentState.copyWith(
                    widgetData: currentWidgetData,
                  );
                  FlowCrudStateRegistry().update(screenKeyForCallback, updatedState);
                } else {
                  final newState = FlowCrudState(
                    widgetData: currentWidgetData,
                  );
                  FlowCrudStateRegistry().update(screenKeyForCallback, newState);
                }
              }

              // Trigger onChange actions if defined (even if screenKey is null)
              if (key != null && json['onChange'] != null) {
                final actionsList =
                    List<Map<String, dynamic>>.from(json['onChange']);

                for (var actionJson in actionsList) {
                  var action = ActionConfig.fromJson(actionJson);

                  // Add input value to action context
                  final enhancedProperties = {
                    ...action.properties,
                    key: value,
                    '${key}Value': value,
                  };

                  action = ActionConfig(
                    action: action.action,
                    actionType: action.actionType,
                    properties: enhancedProperties,
                    condition: action.condition,
                    actions: action.actions,
                  );

                  onAction(action);
                }
              }
            },
          ),
        );
      },
    );
  }
}
