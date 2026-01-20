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

    // Get initial value from state for the stateful wrapper
    dynamic initialValue;
    if (key != null && screenKey != null) {
      final currentState = FlowCrudStateRegistry().get(screenKey);
      final formData = currentState?.formData ?? {};
      final widgetData = currentState?.widgetData ?? {};

      if (widgetData.containsKey(key)) {
        initialValue = widgetData[key];
      } else {
        initialValue = resolveValue('{{$key}}', itemStateData);
        if (initialValue == '{{$key}}' || initialValue == null) {
          initialValue = formData[key];
        }
      }
    }

    // Use stateful wrapper to maintain controller and handle external updates
    return _ReactiveTextInput(
      key: ValueKey('${screenKey}_$key'),
      screenKey: screenKey,
      fieldKey: key,
      initialValue: initialValue?.toString() ?? '',
      localizedLabel: localizedLabel,
      isRequired: isRequired,
      isReadOnly: isReadOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      json: json,
      onAction: onAction,
      itemStateData: itemStateData,
    );
  }
}

/// Stateful wrapper for text input that maintains controller state
/// and only updates from external changes (not from user's own input)
class _ReactiveTextInput extends StatefulWidget {
  final String? screenKey;
  final String? fieldKey;
  final String initialValue;
  final String localizedLabel;
  final bool isRequired;
  final bool isReadOnly;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Map<String, dynamic> json;
  final void Function(ActionConfig) onAction;
  final Map<String, dynamic>? itemStateData;

  const _ReactiveTextInput({
    super.key,
    required this.screenKey,
    required this.fieldKey,
    required this.initialValue,
    required this.localizedLabel,
    required this.isRequired,
    required this.isReadOnly,
    required this.keyboardType,
    required this.inputFormatters,
    required this.maxLength,
    required this.json,
    required this.onAction,
    required this.itemStateData,
  });

  @override
  State<_ReactiveTextInput> createState() => _ReactiveTextInputState();
}

class _ReactiveTextInputState extends State<_ReactiveTextInput> {
  late TextEditingController _controller;
  String _lastKnownValue = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _lastKnownValue = widget.initialValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenKey = widget.screenKey;
    final key = widget.fieldKey;

    // If no screenKey, just build without listening
    if (screenKey == null) {
      return _buildInput(context);
    }

    // Listen for external state changes
    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(screenKey),
      builder: (context, flowState, child) {
        final widgetData = flowState?.widgetData ?? {};
        final formData = flowState?.formData ?? {};

        // Get the current value from state
        dynamic externalValue;
        if (key != null) {
          if (widgetData.containsKey(key)) {
            externalValue = widgetData[key];
          } else {
            externalValue = resolveValue('{{$key}}', widget.itemStateData);
            if (externalValue == '{{$key}}' || externalValue == null) {
              externalValue = formData[key];
            }
          }
        }

        final externalValueStr = externalValue?.toString() ?? '';

        // Only update controller if the external value differs from what we last set
        // AND differs from current controller text (to detect external changes)
        if (externalValueStr != _lastKnownValue &&
            externalValueStr != _controller.text) {
          // This is an external change - update the controller
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _controller.text != externalValueStr) {
              _controller.text = externalValueStr;
              _lastKnownValue = externalValueStr;
            }
          });
        }

        return _buildInput(context);
      },
    );
  }

  Widget _buildInput(BuildContext context) {
    return Builder(
      builder: (builderContext) {
        final crudContextForCallback = CrudItemContext.of(builderContext);
        final screenKeyForCallback =
            crudContextForCallback?.screenKey ?? getScreenKeyFromArgs(builderContext);

        return LabeledField(
          label: widget.localizedLabel,
          isRequired: widget.isRequired,
          child: DigitTextFormInput(
            controller: _controller,
            readOnly: widget.isReadOnly,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            onChange: (value) {
              // Track the value we're setting
              _lastKnownValue = value;

              if (widget.fieldKey != null && screenKeyForCallback != null) {
                final currentState =
                    FlowCrudStateRegistry().get(screenKeyForCallback);
                final currentWidgetData =
                    Map<String, dynamic>.from(currentState?.widgetData ?? {});

                currentWidgetData[widget.fieldKey!] = value;

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

              if (widget.fieldKey != null && widget.json['onChange'] != null) {
                final actionsList =
                    List<Map<String, dynamic>>.from(widget.json['onChange']);

                for (var actionJson in actionsList) {
                  var action = ActionConfig.fromJson(actionJson);

                  final enhancedProperties = {
                    ...action.properties,
                    widget.fieldKey!: value,
                    '${widget.fieldKey}Value': value,
                  };

                  action = ActionConfig(
                    action: action.action,
                    actionType: action.actionType,
                    properties: enhancedProperties,
                    condition: action.condition,
                    actions: action.actions,
                  );

                  widget.onAction(action);
                }
              }
            },
          ),
        );
      },
    );
  }
}
