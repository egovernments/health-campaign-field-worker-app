import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/utils.dart';
import '../resolved_flow_widget.dart';

class TextInputWidget extends ResolvedFlowWidget {
  @override
  String get format => 'textInput';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final key = (json['key'] ?? json['fieldName']) as String?;
    final localizedLabel = resolved.resolvedLabel ?? '';

    final placeholder = json['placeholder'] as String? ?? '';
    final localizedPlaceholder = resolved.resolveText(placeholder);

    final isRequired = json['required'] == true;
    final isReadOnly = json['readOnly'] == true;
    final maxLength = json['maxLength'] as int?;
    final minLength = json['minLength'] as int?;
    final inputType = json['inputType'] as String? ?? 'text';

    // Determine keyboard type based on inputType
    TextInputType keyboardType;
    List<TextInputFormatter> inputFormatters = [];

    final noEmojiFilter = FilteringTextInputFormatter.allow(
      RegExp(r'[\x00-\x7F]'),
    );

    switch (inputType.toLowerCase()) {
      case 'number':
        keyboardType = TextInputType.number;
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case 'decimal':
        keyboardType = const TextInputType.numberWithOptions(decimal: true);
        inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ];
        break;
      case 'email':
        keyboardType = TextInputType.emailAddress;
        inputFormatters = [noEmojiFilter];
        break;
      case 'phone':
        keyboardType = TextInputType.phone;
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case 'multiline':
        keyboardType = TextInputType.multiline;
        inputFormatters = [noEmojiFilter];
        break;
      default:
        keyboardType = TextInputType.text;
        inputFormatters = [noEmojiFilter];
    }

    // Use compositeKey for registry operations
    final compositeKey = resolved.compositeKey;

    // Get initial value from state
    dynamic initialValue;
    if (key != null && compositeKey != null) {
      if (resolved.widgetData.containsKey(key)) {
        initialValue = resolved.widgetData[key];
      } else {
        initialValue =
            resolveValue('{{$key}}', resolved.evalContext);
        if (initialValue == '{{$key}}' || initialValue == null) {
          initialValue = resolved.formData[key];
        }
      }
    }

    return _ReactiveTextInput(
      key: ValueKey('${compositeKey}_$key'),
      compositeKey: compositeKey,
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
      evalContext: resolved.evalContext,
    );
  }
}

/// Stateful wrapper for text input that maintains controller state
/// and only updates from external changes (not from user's own input)
class _ReactiveTextInput extends StatefulWidget {
  final String? compositeKey;
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
  final Map<String, dynamic> evalContext;

  const _ReactiveTextInput({
    super.key,
    required this.compositeKey,
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
    required this.evalContext,
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
    final compositeKey = widget.compositeKey;
    final key = widget.fieldKey;

    if (compositeKey == null) {
      return _buildInput(context);
    }

    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, child) {
        final widgetData = flowState?.widgetData ?? {};
        final formData = flowState?.formData ?? {};

        dynamic externalValue;
        if (key != null) {
          if (widgetData.containsKey(key)) {
            externalValue = widgetData[key];
          } else {
            externalValue =
                resolveValue('{{$key}}', widget.evalContext);
            if (externalValue == '{{$key}}' || externalValue == null) {
              externalValue = formData[key];
            }
          }
        }

        final externalValueStr = externalValue?.toString() ?? '';

        if (externalValueStr != _lastKnownValue &&
            externalValueStr != _controller.text) {
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
        final compositeKeyForCallback = widget.compositeKey;

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
              _lastKnownValue = value;

              if (widget.fieldKey != null &&
                  compositeKeyForCallback != null) {
                final currentState =
                    FlowCrudStateRegistry().get(compositeKeyForCallback);
                final currentWidgetData = Map<String, dynamic>.from(
                    currentState?.widgetData ?? {});

                currentWidgetData[widget.fieldKey!] = value;

                if (currentState != null) {
                  final updatedState = currentState.copyWith(
                    widgetData: currentWidgetData,
                  );
                  FlowCrudStateRegistry()
                      .update(compositeKeyForCallback, updatedState);
                } else {
                  final newState = FlowCrudState(
                    widgetData: currentWidgetData,
                  );
                  FlowCrudStateRegistry()
                      .update(compositeKeyForCallback, newState);
                }
              }

              if (widget.fieldKey != null &&
                  widget.json['onChange'] != null) {
                final actionsList = List<Map<String, dynamic>>.from(
                    widget.json['onChange']);

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
