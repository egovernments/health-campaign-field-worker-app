import 'computed_list_evaluator.dart';

/// Processes computed list fields from config with ordering support.
class ComputedListProcessor {
  static Map<String, dynamic> applyComputedList(
    Map<String, dynamic> wrapperData,
    Map<String, dynamic> config,
  ) {
    final computedList =
        config['computedList'] as Map<String, dynamic>? ?? {};
    final results = <String, dynamic>{};

    // Create combined context once and reuse
    final context = <String, dynamic>{...wrapperData};

    // Sort computed entries by `order`
    final sortedEntries = computedList.entries.toList()
      ..sort((a, b) {
        final ao = (a.value as Map<String, dynamic>)['order'] ?? 999999;
        final bo = (b.value as Map<String, dynamic>)['order'] ?? 999999;
        return ao.compareTo(bo);
      });

    for (final entry in sortedEntries) {
      final key = entry.key;
      final conf = entry.value as Map<String, dynamic>;

      results[key] = ComputedListEvaluator.evaluate(context, conf);

      // Add to context for subsequent computed lists to reference
      context[key] = results[key];
    }

    return results;
  }
}
