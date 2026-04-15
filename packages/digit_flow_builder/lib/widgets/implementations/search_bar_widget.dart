import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class SearchBarWidget extends ResolvedFlowWidget {
  @override
  String get format => 'searchBar';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final hintText = json['label'] ?? '';
    final localizedHint = localization?.translate(hintText) ?? hintText;
    final fieldName = (json['fieldName'] ?? 'searchBar') as String;
    final compositeKey = resolved.compositeKey ?? resolved.screenKey;

    final validations = json['validations'] as List<dynamic>? ?? [];
    int minSearchChars = 1;

    for (final validation in validations) {
      if (validation is Map<String, dynamic> &&
          validation['type'] == 'minSearchChars') {
        final value = validation['value'];
        if (value is int) {
          minSearchChars = value;
        } else if (value is String) {
          minSearchChars = int.tryParse(value) ?? 1;
        }
      }
    }

    final initialValue =
        compositeKey != null
            ? (FlowCrudStateRegistry().get(compositeKey)?.widgetData?[fieldName]
                    ?.toString() ??
                '')
            : '';

    return _ReactiveSearchBar(
      key: ValueKey('${compositeKey}_$fieldName'),
      json: json,
      hintText: localizedHint,
      fieldName: fieldName,
      compositeKey: compositeKey,
      minSearchChars: minSearchChars,
      initialValue: initialValue,
      onAction: onAction,
      resolved: resolved,
    );
  }
}

class _ReactiveSearchBar extends StatefulWidget {
  final Map<String, dynamic> json;
  final String hintText;
  final String fieldName;
  final String? compositeKey;
  final int minSearchChars;
  final String initialValue;
  final void Function(ActionConfig) onAction;
  final ResolvedWidgetContext resolved;

  const _ReactiveSearchBar({
    super.key,
    required this.json,
    required this.hintText,
    required this.fieldName,
    required this.compositeKey,
    required this.minSearchChars,
    required this.initialValue,
    required this.onAction,
    required this.resolved,
  });

  @override
  State<_ReactiveSearchBar> createState() => _ReactiveSearchBarState();
}

class _ReactiveSearchBarState extends State<_ReactiveSearchBar> {
  late final TextEditingController _controller;
  String _lastHandledValue = '';
  bool _syncingExternalValue = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _lastHandledValue = widget.initialValue;
    _controller.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChange);
    _controller.dispose();
    super.dispose();
  }

  void _handleControllerChange() {
    if (_syncingExternalValue) {
      return;
    }

    final value = _controller.text;
    if (value == _lastHandledValue) {
      return;
    }

    _lastHandledValue = value;
    _updateWidgetData(value);

    if (value.length >= widget.minSearchChars) {
      _executeSearchActions(value);
    } else {
      _executeClearActions(value);
    }
  }

  void _updateWidgetData(String value) {
    final compositeKey = widget.compositeKey;
    if (compositeKey == null) {
      return;
    }

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final updatedWidgetData = <String, dynamic>{
      ...?currentState?.widgetData,
      widget.fieldName: value,
    };

    final updatedState =
        (currentState ?? const FlowCrudState()).copyWith(
          widgetData: updatedWidgetData,
        );

    FlowCrudStateRegistry().update(compositeKey, updatedState);
  }

  void _executeSearchActions(String value) {
    if (widget.json['onAction'] == null) {
      return;
    }

    final actionsList = List<Map<String, dynamic>>.from(widget.json['onAction']);
    final currentEvalContext = widget.resolved.getFreshEvalContext();

    for (final raw in actionsList) {
      if (raw.containsKey('condition')) {
        final condition = raw['condition'] as Map<String, dynamic>?;
        final expression = condition?['expression'] as String?;

        bool conditionMet = false;
        if (expression == null || expression == 'DEFAULT') {
          conditionMet = true;
        } else {
          conditionMet = ConditionalEvaluator.evaluateExpression(
            expression,
            currentEvalContext,
          );
        }

        if (conditionMet) {
          final subActions = raw['actions'] as List<dynamic>? ?? [];
          for (final subActionJson in subActions) {
            final processedAction = _processAction(
              subActionJson as Map<String, dynamic>,
              value,
            );
            widget.onAction(processedAction);
          }
          break;
        }
      } else {
        final processedAction = _processAction(raw, value);
        widget.onAction(processedAction);
      }
    }
  }

  void _executeClearActions(String value) {
    if (widget.json['onAction'] == null) {
      return;
    }

    final actionsList = List<Map<String, dynamic>>.from(widget.json['onAction']);
    final currentEvalContext = widget.resolved.getFreshEvalContext();

    for (final raw in actionsList) {
      if (raw.containsKey('condition')) {
        final condition = raw['condition'] as Map<String, dynamic>?;
        final expression = condition?['expression'] as String?;

        bool conditionMet = false;
        if (expression == null || expression == 'DEFAULT') {
          conditionMet = true;
        } else {
          conditionMet = ConditionalEvaluator.evaluateExpression(
            expression,
            currentEvalContext,
          );
        }

        if (conditionMet) {
          final subActions = raw['actions'] as List<dynamic>? ?? [];
          _executeClearForActions(subActions, clearWidgetKey: value.isEmpty);
          break;
        }
      } else {
        _executeClearForSingleAction(raw, clearWidgetKey: value.isEmpty);
      }
    }
  }

  void _executeClearForActions(
    List<dynamic> actions, {
    required bool clearWidgetKey,
  }) {
    final searchBarFilterKeys = <String>[];
    String searchName = 'default';

    for (final action in actions) {
      if (action is! Map<String, dynamic>) continue;

      searchName = (action['properties']?['name'] as String?) ?? searchName;
      final data = action['properties']?['data'] as List?;
      if (data != null) {
        for (final item in data) {
          if (item is Map && item['key'] != null) {
            searchBarFilterKeys.add(item['key'].toString());
          }
        }
      }
    }

    if (searchBarFilterKeys.isNotEmpty) {
      widget.onAction(
        ActionConfig.fromJson({
          'actionType': 'CLEAR_STATE',
          'properties': {
            'type': 'CLEAR_STATE',
            'name': searchName,
            'filterKeys': searchBarFilterKeys,
            if (clearWidgetKey) 'widgetKeys': [widget.fieldName],
            'triggerSearch': true,
          },
        }),
      );
    }
  }

  void _executeClearForSingleAction(
    Map<String, dynamic> raw, {
    required bool clearWidgetKey,
  }) {
    final searchBarFilterKeys = <String>[];
    String searchName = 'default';

    searchName = (raw['properties']?['name'] as String?) ?? searchName;
    final data = raw['properties']?['data'] as List?;
    if (data != null) {
      for (final item in data) {
        if (item is Map && item['key'] != null) {
          searchBarFilterKeys.add(item['key'].toString());
        }
      }
    }

    if (searchBarFilterKeys.isNotEmpty) {
      widget.onAction(
        ActionConfig.fromJson({
          'actionType': 'CLEAR_STATE',
          'properties': {
            'type': 'CLEAR_STATE',
            'name': searchName,
            'filterKeys': searchBarFilterKeys,
            if (clearWidgetKey) 'widgetKeys': [widget.fieldName],
            'triggerSearch': true,
          },
        }),
      );
    }
  }

  ActionConfig _processAction(Map<String, dynamic> raw, String searchValue) {
    final actionJson = Map<String, dynamic>.from(raw);
    actionJson['properties'] ??= {};
    final data = actionJson['properties']['data'];

    if (data is List && data.isNotEmpty && data[0] is Map<String, dynamic>) {
      data[0]['value'] = searchValue;
    }

    return ActionConfig.fromJson(actionJson);
  }

  @override
  Widget build(BuildContext context) {
    final compositeKey = widget.compositeKey;
    if (compositeKey == null) {
      return DigitSearchBar(
        hintText: widget.hintText,
        controller: _controller,
      );
    }

    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, child) {
        final externalValue =
            flowState?.widgetData?[widget.fieldName]?.toString() ?? '';

        if (externalValue != _controller.text) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || _controller.text == externalValue) {
              return;
            }

            _syncingExternalValue = true;
            _controller.value = TextEditingValue(
              text: externalValue,
              selection: TextSelection.collapsed(offset: externalValue.length),
            );
            _lastHandledValue = externalValue;
            _syncingExternalValue = false;
          });
        }

        return DigitSearchBar(
          hintText: widget.hintText,
          controller: _controller,
        );
      },
    );
  }
}
