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
      if (validation is Map<String, dynamic>) {
        final type = validation['type'];
        if (type == 'minSearchChars') {
          final value = validation['value'];
          if (value is int) {
            minSearchChars = value;
          } else if (value is String) {
            minSearchChars = int.tryParse(value) ?? 1;
          }
        }
      }
    }

    return DigitSearchBar(
      hintText: localizedHint,
      onChanged: (value) {
        if (compositeKey != null) {
          final currentState = FlowCrudStateRegistry().get(compositeKey);
          final currentWidgetData =
              currentState?.widgetData ?? <String, dynamic>{};
          final Map<String, dynamic> updatedWidgetData = {
            ...currentWidgetData,
            fieldName: value,
          };
          if (currentState != null) {
            FlowCrudStateRegistry().update(
              compositeKey,
              currentState.copyWith(widgetData: updatedWidgetData),
            );
          }
        }

        if (value.length >= minSearchChars) {
          if (json['onAction'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);

            final currentEvalContext = resolved.getFreshEvalContext();

            for (var raw in actionsList) {
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
                  for (var subActionJson in subActions) {
                    final processedAction = _processAction(
                      subActionJson as Map<String, dynamic>,
                      value,
                    );
                    onAction(processedAction);
                  }
                  break;
                }
              } else {
                final processedAction = _processAction(raw, value);
                onAction(processedAction);
              }
            }
          }
        } else if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);
          final currentEvalContext = resolved.getFreshEvalContext();

          for (var raw in actionsList) {
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
                _executeClearForActions(subActions, fieldName, onAction);
                break;
              }
            } else {
              _executeClearForSingleAction(raw, fieldName, onAction);
            }
          }
        }
      },
    );
  }

  void _executeClearForActions(
    List<dynamic> actions,
    String fieldName,
    void Function(ActionConfig) onAction,
  ) {
    final searchBarFilterKeys = <String>[];
    String searchName = 'default';

    for (var action in actions) {
      if (action is! Map<String, dynamic>) continue;

      searchName = (action['properties']?['name'] as String?) ?? searchName;
      final data = action['properties']?['data'] as List?;
      if (data != null) {
        for (var item in data) {
          if (item is Map && item['key'] != null) {
            searchBarFilterKeys.add(item['key'].toString());
          }
        }
      }
    }

    if (searchBarFilterKeys.isNotEmpty) {
      onAction(ActionConfig.fromJson({
        'actionType': 'CLEAR_STATE',
        'properties': {
          'type': 'CLEAR_STATE',
          'name': searchName,
          'filterKeys': searchBarFilterKeys,
          'widgetKeys': [fieldName],
          'triggerSearch': true,
        },
      }));
    }
  }

  void _executeClearForSingleAction(
    Map<String, dynamic> raw,
    String fieldName,
    void Function(ActionConfig) onAction,
  ) {
    final searchBarFilterKeys = <String>[];
    String searchName = 'default';

    searchName = (raw['properties']?['name'] as String?) ?? searchName;
    final data = raw['properties']?['data'] as List?;
    if (data != null) {
      for (var item in data) {
        if (item is Map && item['key'] != null) {
          searchBarFilterKeys.add(item['key'].toString());
        }
      }
    }

    if (searchBarFilterKeys.isNotEmpty) {
      onAction(ActionConfig.fromJson({
        'actionType': 'CLEAR_STATE',
        'properties': {
          'type': 'CLEAR_STATE',
          'name': searchName,
          'filterKeys': searchBarFilterKeys,
          'widgetKeys': [fieldName],
          'triggerSearch': true,
        },
      }));
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
}
