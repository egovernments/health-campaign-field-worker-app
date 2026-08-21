import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class ProximitySearchWidget extends ResolvedFlowWidget {
  @override
  String get format => 'proximitySearch';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    return WidgetStateContext.reactive(context, (ctx, state) {
      final fieldKey = json['fieldName'] as String? ?? 'proximitySearch';
      return _ProximitySearchStateful(
        json: json,
        onAction: onAction,
        externalValue: state.widgetData[fieldKey] as bool? ?? false,
        onUpdateWidgetData: state.updateWidgetData,
      );
    });
  }
}

class _ProximitySearchStateful extends StatefulWidget {
  final Map<String, dynamic> json;
  final void Function(ActionConfig) onAction;
  final bool externalValue;
  final void Function(String key, dynamic value) onUpdateWidgetData;

  const _ProximitySearchStateful({
    required this.json,
    required this.onAction,
    required this.externalValue,
    required this.onUpdateWidgetData,
  });

  @override
  State<_ProximitySearchStateful> createState() =>
      _ProximitySearchStatefulState();
}

class _ProximitySearchStatefulState extends State<_ProximitySearchStateful> {
  bool _value = false;

  String? _lat;
  String? _long;
  double? _accuracy;

  @override
  void initState() {
    super.initState();

    /// Restore persisted widgetData value (e.g. popup reopened) so this
    /// behaves like the plain switch widget; fall back to config default.
    _value = widget.externalValue || widget.json['defaultValue'] == true;

    /// Fetch location immediately after mount (no dialog / no delay)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationBloc>().add(const LoadLocationEvent());
    });
  }

  @override
  void didUpdateWidget(_ProximitySearchStateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Respond to external reset — e.g. Clear button cleared widgetData
    if (!widget.externalValue && oldWidget.externalValue && _value) {
      setState(() => _value = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationContext.maybeOf(context);

    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state.latitude != null && _lat == null) {
          setState(() {
            _lat = state.latitude?.toString();
            _long = state.longitude?.toString();
            _accuracy = state.accuracy;
          });
        }
      },
      builder: (context, state) {
        final locationReady = _lat != null && _long != null;

        return DigitSwitch(
          label: localization?.translate(widget.json['label'] ?? ''),
          value: _value,
          disabled: !locationReady,
          onChanged: (newValue) {
            setState(() => _value = newValue);
            final fieldKey =
                widget.json['fieldName'] as String? ?? 'proximitySearch';
            widget.onUpdateWidgetData(fieldKey, newValue);
            _triggerActions(newValue);
          },
        );
      },
    );
  }

  String resolveDynamicType(String expression, bool fieldValue) {
    // Replace field.value with actual value (true/false)
    final replaced =
        expression.replaceAll("field.value", fieldValue.toString());

    // Example expression after replacement:
    //   "true ? SEARCH_EVENT : CLEAR_EVENT"

    // Split only after parser evaluates the condition part
    // Extract condition and outcomes
    if (!replaced.contains("?") || !replaced.contains(":")) {
      return replaced; // No ternary expression -> return as-is
    }

    final condition = replaced.split("?")[0].trim();
    final outcomes = replaced.split("?")[1].split(":");

    final trueResult = outcomes[0].trim();
    final falseResult = outcomes[1].trim();

    /// ---- Evaluate using your formula parser ----
    final parser = FormulaParser(condition, {'dummy': {}});

    debugPrint("CONDITION_EVAL: parsed=${parser.parsedExpression}");

    final parsed = parser.parse;
    final isTrue = parsed["isSuccess"] && parsed["value"] == true;

    return isTrue ? trueResult : falseResult;
  }

  void _triggerActions(bool value) {
    final json = widget.json;
    final onActionList = json['onAction'] ?? [];
    final validations = json['validations'] ?? [];

    // Validation lookup
    final radiusValidation = validations.firstWhere(
      (v) => v['key'] == "proximityRadius",
      orElse: () => null,
    );
    final radius = radiusValidation?['value'];

    final bool isProximityDisabled = !value;

    for (var raw in onActionList) {
      // When proximity is disabled, remove only this filter (not the entire state)
      if (isProximityDisabled) {
        final searchName = raw['properties']?['name'] as String? ?? 'default';
        final filterKeys = <String>[];

        final rawData = raw['properties']?['filterKeys'] as List?;
        if (rawData != null) {
          for (final item in rawData) {
            final key = item?.toString();
            if (key != null && key.isNotEmpty) {
              filterKeys.add(key);
            }
          }
        }

        final fieldName = json['fieldName'] as String?;
        if (fieldName != null && fieldName.isNotEmpty) {
          filterKeys.add(fieldName);
        }

        if (filterKeys.isEmpty) {
          continue;
        }

        widget.onAction(ActionConfig.fromJson({
          'actionType': 'CLEAR_STATE',
          'properties': {
            'type': 'CLEAR_STATE',
            'name': searchName,
            'filterKeys': filterKeys.toSet().toList(),
            'triggerSearch': true,
          },
        }));

        // The targeted CLEAR_STATE above already removes the proximity-owned
        // filters. Falling through to the resolved-action path would also fire
        // the configured false-branch action (typically `CLEAR_STATE` with no
        // filterKeys), which hits ClearStateExecutor's "clear everything"
        // branch and wipes widgetData + sibling filters (e.g. the name search).
        continue;
      }

      final updated = Map<String, dynamic>.from(raw);
      updated['properties'] ??= {};

      // Evaluate actionType from config dynamically
      final rawType = raw['actionType'] ?? "";
      final resolvedActionType = resolveDynamicType(rawType, value);

      updated['actionType'] = resolvedActionType;
      updated['properties']['type'] = resolvedActionType;

      // Override proximity data only for enabled state.
      // For disabled state, let configured false-path action run as-is.
      if (value) {
        final existingData = raw['properties']?['data'] ?? [];
        updated['properties']['data'] = existingData.map((item) {
          return {
            "key": json['fieldName'],
            if (radius != null) "value": radius,
            "lat": _lat,
            "long": _long,
            "accuracy": _accuracy,
            "operation": "within"
          };
        }).toList();
      }

      widget.onAction(ActionConfig.fromJson(updated));
    }
  }
}
