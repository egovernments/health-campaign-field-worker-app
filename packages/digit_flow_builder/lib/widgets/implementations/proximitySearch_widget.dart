import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../action_handler/action_config.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class ProximitySearchWidget implements FlowWidget {
  @override
  String get format => 'proximitySearch';

  @override
  Widget build(
      Map<String, dynamic> json,
      BuildContext context,
      void Function(ActionConfig) onAction,
      ) {
    return _ProximitySearchStateful(
      json: json,
      onAction: onAction,
    );
  }
}

class _ProximitySearchStateful extends StatefulWidget {
  final Map<String, dynamic> json;
  final void Function(ActionConfig) onAction;

  const _ProximitySearchStateful({
    required this.json,
    required this.onAction,
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

    /// Read default value from config
    _value = widget.json['defaultValue'] == true;

    /// Fetch location immediately after mount (no dialog / no delay)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationBloc>().add(const LoadLocationEvent());
    });
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
        /// Don't show switch unless we have location
        if (_lat == null || _long == null) {
          return const SizedBox.shrink();
        }

        return DigitSwitch(
          label: localization?.translate(widget.json['label'] ?? ''),
          value: _value,
          onChanged: (newValue) {
            setState(() => _value = newValue);

            _triggerActions(newValue);
          },
        );
      },
    );
  }

  String resolveDynamicType(
      String expression,
      bool fieldValue
      ) {
    // Replace field.value with actual value (true/false)
    final replaced = expression.replaceAll("field.value", fieldValue.toString());

    // Example expression after replacement:
    //   "true ? SEARCH_EVENT : CLEAR_EVENT"

    // Split only after parser evaluates the condition part
    // Extract condition and outcomes
    if (!replaced.contains("?") || !replaced.contains(":")) {
      return replaced; // No ternary expression → return as-is
    }

    final condition = replaced.split("?")[0].trim();
    final outcomes = replaced.split("?")[1].split(":");

    final trueResult = outcomes[0].trim();
    final falseResult = outcomes[1].trim();

    /// ---- Evaluate using your formula parser ----
    final parser = FormulaParser(
      condition,
      {'dummy': {}}
    );

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

    for (var raw in onActionList) {
      final updated = Map<String, dynamic>.from(raw);

      updated['properties'] ??= {};

      // ✨ NEW: Evaluate actionType from config dynamically
      final rawType = raw['actionType'] ?? "";
      final dynamicType = resolveDynamicType(rawType, value);

      updated['actionType'] = dynamicType;
      updated['properties']['type'] = dynamicType;

      // Data override
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

      widget.onAction(ActionConfig.fromJson(updated));
    }
  }

}

