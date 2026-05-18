import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';
import 'condition_evaluator.dart';
import 'computed_evaluator.dart';
import 'field_evaluator.dart';
import 'field_transformations.dart';
import 'value_resolver.dart';

/// Processes computed fields by evaluating conditions, reducing lists,
/// and resolving field maps with ordering support.
class ComputedFieldProcessor {
  static Map<String, dynamic> applyComputed(
    Map<String, dynamic> wrapperData,
    Map<String, dynamic> config,
    FieldEvaluator fieldEvaluator,
    IValueResolver resolver,
  ) {
    final computed = config['computed'] as Map<String, dynamic>? ?? {};
    final results = <String, dynamic>{};

    // Create combined context once and reuse, updating as we go
    final context = <String, dynamic>{...wrapperData};

    // Sort computed entries by `order`
    final sortedEntries = computed.entries.toList()
      ..sort((a, b) {
        final ao = (a.value as Map<String, dynamic>)['order'] ?? 999999;
        final bo = (b.value as Map<String, dynamic>)['order'] ?? 999999;
        return ao.compareTo(bo);
      });

    for (final entry in sortedEntries) {
      final key = entry.key;
      final conf = entry.value as Map<String, dynamic>;

      if (conf.containsKey('condition')) {
        results[key] =
            ConditionEvaluator.evaluate(context, conf['condition']) ??
                conf['fallback'];
      } else if (conf.containsKey('from') &&
          conf.containsKey('evaluateCondition')) {
        results[key] =
            evaluateWithCondition(context, conf) ?? conf['fallback'];
      } else if (conf.containsKey('from') && conf.containsKey('reduce')) {
        results[key] = ComputedEvaluator.reduce(context, conf) ??
            conf['reduce']['fallback'];
      } else if (conf.containsKey('from')) {
        // Use evaluateFieldMap if query operators are present
        final hasQueryOps = conf.keys.any((k) => [
              'where',
              'map',
              'select',
              'takeFirst',
              'takeLast',
              'default'
            ].contains(k));
        if (hasQueryOps) {
          results[key] = fieldEvaluator.evaluateFieldMap(
            Map<String, dynamic>.from(conf),
            context[config['rootEntity']] ?? wrapperData[config['rootEntity']],
            context,
          );
        } else {
          results[key] =
              resolveValueRaw(conf['from'], context) ?? conf['fallback'];
        }
      } else {
        results[key] = conf['fallback'];
      }

      // Add to context for subsequent computed fields to reference
      context[key] = results[key];
    }

    return results;
  }

  /// Evaluates list items with condition parsing using formula parser.
  static dynamic evaluateWithCondition(
    Map<String, dynamic> wrapperData,
    Map<String, dynamic> conf,
  ) {
    final list = resolveValueRaw(conf['from'], wrapperData);
    if (list is! Iterable) return null;

    final evaluateConfig = conf['evaluateCondition'] as Map<String, dynamic>?;
    if (evaluateConfig == null) return null;

    // Build context map from context list - completely generic
    final contextMap = <String, dynamic>{};
    final contextList = evaluateConfig['context'] as List<dynamic>? ?? [];

    for (int i = 0; i < contextList.length; i++) {
      final contextValue = resolveValueRaw(contextList[i], wrapperData);
      contextMap['context$i'] = contextValue;
    }

    final selectField = conf['select']?.toString();
    final takeLast = conf['takeLast'] == true;
    dynamic lastResult;

    // Evaluate each item
    for (final item in list) {
      if (item is! Map) continue;

      final condition = resolveValueRaw(
              evaluateConfig['condition'], {'item': item, ...wrapperData})
          ?.toString();
      if (condition == null || condition.isEmpty) continue;

      // Prepare flat context for formula parser with transformations
      final transformations =
          evaluateConfig['transformations'] as Map<String, dynamic>?;
      final flatContext =
          FieldTransformations.flattenContextForFormulaParser(
        {...contextMap, 'item': item, ...wrapperData},
        transformations: transformations,
      );

      try {
        // TODO: Fix condition format in configuration files - replace 'and' with '&&' for proper formula parser syntax
        final sanitizedCondition =
            condition.replaceAll(' and ', ' && ').replaceAll('and', '&&');
        final parser = FormulaParser(sanitizedCondition, flatContext);
        final result = parser.parse;

        if (result['isSuccess'] && result['value'] == true) {
          final itemResult = selectField != null
              ? resolveValueRaw(selectField, {'item': item, ...wrapperData})
              : item;

          if (takeLast) {
            lastResult = itemResult;
          } else {
            return itemResult;
          }
        }
      } catch (e) {
        debugPrint('Formula evaluation error: $e');
        // Continue to next item on error
      }
    }

    return takeLast ? lastResult : null;
  }
}
