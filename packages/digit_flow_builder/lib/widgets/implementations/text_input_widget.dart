import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../action_handler/action_config.dart';
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

    // For resolving item-specific fields, we use the current item or first item
    final itemStateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    final key = json['key'] as String?;
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
    final currentValue =
        key != null ? resolveValue('{{$key}}', itemStateData) : null;

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
          if (key != null) {
            // Trigger onChange actions if defined
            if (json['onChange'] != null) {
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
          }
        },
      ),
    );
  }
}
