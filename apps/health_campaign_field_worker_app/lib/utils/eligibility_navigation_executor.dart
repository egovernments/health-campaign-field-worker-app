import 'package:collection/collection.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/action_handler/executors/navigation_executor.dart';
import 'package:digit_flow_builder/blocs/wrapper/computed_list_evaluator.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

/// Fully config-driven action executor that checks dose criteria eligibility
/// before navigating.
///
/// ## Configuration (in `action.properties`):
///
/// ```json
/// {
///   "actionType": "CHECK_ELIGIBILITY_AND_NAVIGATE",
///   "properties": {
///     "failedMessage": "BENEFICIARY_NOT_ELIGIBLE",
///     "failedToastType": "warning",
///     "eligibilityParams": [
///       { "conditionVar": "age",    "navKey": "selectedIndividualAgeInMonths", "type": "int" },
///       { "conditionVar": "height", "navKey": "selectedIndividualHeight",      "type": "double" },
///       { "conditionVar": "weight", "navKey": "selectedIndividualWeight",      "type": "double" }
///     ],
///     "data": [ ... ],
///     "name": "REDOSE",
///     "type": "FORM"
///   }
/// }
/// ```
///
/// ### `eligibilityParams` entries:
/// - `conditionVar` – variable name used in dose criteria condition strings
///                    (e.g. `age`, `height`, `weight`, `gender`)
/// - `navKey`       – the key in `data[]` that holds the resolved value
/// - `type`         – cast type: `int`, `double`, `string`, `bool`
///                    (default: `string`)
/// - `default`      – fallback value when the individual has no recorded value
///                    (default: `0` for int/double, `false` for bool, `''` for string)
///
/// Only variables that actually appear in a dose criteria condition string
/// are included in the evaluation context.  Variables referenced in the
/// condition but not recorded for the individual fall back to `default`.
class EligibilityNavigationExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) =>
      actionType == 'CHECK_ELIGIBILITY_AND_NAVIGATE';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    debugPrint('[ELIGIBILITY] Executor triggered');

    // ── 1. Config-driven properties ──────────────────────────────────
    final failedMessage = action.properties['failedMessage']?.toString() ??
        'BENEFICIARY_NOT_ELIGIBLE';
    final failedToastTypeStr =
        action.properties['failedToastType']?.toString() ?? 'warning';

    debugPrint(
      '[ELIGIBILITY] Config: failedMessage=$failedMessage, '
      'target=${action.properties['name']}',
    );

    // ── 2. Build nav-data lookup ─────────────────────────────────────
    final navData = action.properties['data'] as List<dynamic>? ?? [];
    final navMap = <String, dynamic>{};
    for (final entry in navData) {
      final key = entry['key']?.toString();
      if (key != null) navMap[key] = entry['value'];
    }

    // ── 3. Read eligibilityParams from config ────────────────────────
    final eligibilityParams =
        action.properties['eligibilityParams'] as List<dynamic>? ?? [];

    // Build a map: conditionVar → {parsed value, default value}
    final availableVars = <String, dynamic>{};
    final defaultValues = <String, dynamic>{};

    for (final param in eligibilityParams) {
      final conditionVar = param['conditionVar']?.toString();
      final navKey = param['navKey']?.toString();
      final type = param['type']?.toString() ?? 'string';
      final configDefault = param['default'];

      if (conditionVar == null || navKey == null) continue;

      final rawValue = navMap[navKey];
      final parsed = _castValue(rawValue, type);
      availableVars[conditionVar] = parsed;
      defaultValues[conditionVar] = configDefault ?? _typeDefault(type);

      debugPrint(
        '[ELIGIBILITY] Param: $conditionVar (navKey=$navKey, type=$type) '
        '→ raw=$rawValue, parsed=$parsed, default=${defaultValues[conditionVar]}',
      );
    }

    // ── 4. Get cycleIndex from nav data ──────────────────────────────
    final cycleIndex = navMap['cycleIndex']?.toString();

    debugPrint('[ELIGIBILITY] cycleIndex=$cycleIndex');

    // ── 5. Get project type & matching cycle ─────────────────────────
    final projectType = FlowBuilderSingleton().projectType;
    final cycles = projectType?.cycles;

    final currentCycle = cycles?.firstWhereOrNull(
      (c) => c.id.toString() == cycleIndex?.toString(),
    );

    debugPrint(
      '[ELIGIBILITY] projectType=${projectType?.code}, '
      'currentCycle id=${currentCycle?.id}, '
      'deliveries count=${currentCycle?.deliveries?.length}',
    );

    // ── 6. Evaluate dose criteria ────────────────────────────────────
    final firstDelivery = currentCycle?.deliveries?.firstOrNull;
    final matchingCriteria = <Map<String, dynamic>>[];

    if (firstDelivery?.doseCriteria != null) {
      for (final dc in firstDelivery!.doseCriteria!) {
        if (dc.condition != null && dc.condition!.isNotEmpty) {
          // Extract variable names from the RAW condition (before sanitization)
          // because extractKeys splits on `and`/`or`/`not` keywords, which
          // sanitizeCondition replaces with `&&`/`||`.
          final requiredKeys =
              ComputedListEvaluator.extractKeys(dc.condition!);

          final sanitized =
              ComputedListEvaluator.sanitizeCondition(dc.condition!);

          // Build eval context with only required variables.
          // If a required variable IS referenced but value is null → use
          // the configured default (or 0).
          final evalContext = <String, dynamic>{};
          for (final key in requiredKeys) {
            if (availableVars.containsKey(key)) {
              evalContext[key] =
                  availableVars[key] ?? defaultValues[key] ?? 0;
            }
          }

          debugPrint(
            '[ELIGIBILITY] Condition: "${dc.condition}" '
            '→ sanitized: "$sanitized" '
            '| requiredKeys: $requiredKeys '
            '| evalContext: $evalContext',
          );

          try {
            final parser = FormulaParser(sanitized, evalContext);
            final result = parser.parse;
            debugPrint('[ELIGIBILITY] FormulaParser result: $result');

            if (result['isSuccess'] == true && result['value'] == true) {
              matchingCriteria.add(dc.toMap());
              debugPrint('[ELIGIBILITY] MATCHED');
            } else {
              debugPrint('[ELIGIBILITY] did NOT match');
            }
          } catch (e) {
            debugPrint('[ELIGIBILITY] Condition eval error: $e');
          }
        } else {
          // No condition — include by default
          matchingCriteria.add(dc.toMap());
          debugPrint(
            '[ELIGIBILITY] No condition on doseCriteria, included by default',
          );
        }
      }
    } else {
      debugPrint('[ELIGIBILITY] No doseCriteria found on first delivery');
    }

    debugPrint(
      '[ELIGIBILITY] Total matching criteria: ${matchingCriteria.length}',
    );

    // ── 7. Navigate or show toast (config-driven) ────────────────────
    if (matchingCriteria.isNotEmpty) {
      debugPrint(
        '[ELIGIBILITY] ELIGIBLE → navigating to ${action.properties['name']}',
      );

      // Add eligibleProductVariants to nav data
      final updatedNavData = List<dynamic>.from(navData);
      updatedNavData.add({
        'key': 'eligibleProductVariants',
        'value': matchingCriteria,
      });

      // Delegate to NavigationExecutor with updated data
      final navAction = ActionConfig(
        action: '',
        actionType: 'NAVIGATION',
        properties: {
          ...Map<String, dynamic>.from(action.properties),
          'data': updatedNavData,
        },
      );

      return await NavigationExecutor()
          .execute(navAction, context, contextData);
    } else {
      debugPrint(
        '[ELIGIBILITY] NOT ELIGIBLE → toast "$failedMessage", blocking nav',
      );

      final ToastType toastType;
      switch (failedToastTypeStr) {
        case 'success':
          toastType = ToastType.success;
          break;
        case 'info':
          toastType = ToastType.info;
          break;
        case 'error':
          toastType = ToastType.error;
          break;
        default:
          toastType = ToastType.warning;
      }

      Toast.showToast(context, message: failedMessage, type: toastType);
      return contextData;
    }
  }

  // ── Helpers ──────────────────────────────────────────────────────────

  /// Casts [rawValue] to the requested [type].
  /// Returns `null` when parsing fails or the value is absent.
  static dynamic _castValue(dynamic rawValue, String type) {
    if (rawValue == null) return null;
    final str = rawValue.toString();
    if (str.isEmpty) return null;

    switch (type) {
      case 'int':
        return int.tryParse(str);
      case 'double':
        return double.tryParse(str);
      case 'bool':
        return str.toLowerCase() == 'true' || str == '1';
      case 'string':
      default:
        return str;
    }
  }

  /// Returns a sensible default for a given [type] when the value is missing.
  static dynamic _typeDefault(String type) {
    switch (type) {
      case 'int':
        return 0;
      case 'double':
        return 0.0;
      case 'bool':
        return false;
      case 'string':
      default:
        return '';
    }
  }
}
