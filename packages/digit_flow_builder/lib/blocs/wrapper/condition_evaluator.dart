import '../../utils/utils.dart';

/// Evaluates conditional expressions: if-then-else logic and comparison operators.
class ConditionEvaluator {
  static dynamic evaluate(
      Map<String, dynamic> context, Map<String, dynamic> conf) {
    // Handle conditional operations (if-then-else)
    if (conf.containsKey('if') && conf.containsKey('then')) {
      final ifCondition = conf['if'];
      // If 'if' is a comparison object, evaluate it recursively
      dynamic conditionResult;
      if (ifCondition is Map<String, dynamic> &&
          ifCondition.containsKey('operator')) {
        conditionResult = evaluate(context, ifCondition);
      } else {
        conditionResult = resolve(context, ifCondition);
      }
      final isTruthy = _isTruthy(conditionResult);

      if (isTruthy) {
        return _processOperation(context, conf['then']);
      } else if (conf.containsKey('else')) {
        return _processOperation(context, conf['else']);
      }
      return null;
    }

    // Handle comparison operations
    // Use _processOperation to handle increment/decrement operations in left/right
    final left = _processOperation(context, conf['left']);
    final right = _processOperation(context, conf['right']);

    switch (conf['operator']) {
      case 'equals':
        return left.toString() == right.toString();
      case 'notEquals':
        return left.toString() != right;
      case 'lt':
        final leftInt = int.tryParse(left.toString()) ?? 0;
        final rightInt = int.tryParse(right.toString()) ?? 0;
        return leftInt < rightInt;
      case 'lte':
        final leftInt = int.tryParse(left.toString()) ?? 0;
        final rightInt = int.tryParse(right.toString()) ?? 0;
        return leftInt <= rightInt;
      case 'gt':
        final leftInt = int.tryParse(left.toString()) ?? 0;
        final rightInt = int.tryParse(right.toString()) ?? 0;
        return leftInt > rightInt;
      case 'gte':
        final leftInt = int.tryParse(left.toString()) ?? 0;
        final rightInt = int.tryParse(right.toString()) ?? 0;
        return leftInt >= rightInt;
      default:
        return null;
    }
  }

  static bool _isTruthy(dynamic value) {
    if (value is bool) return value;
    if (value is String)
      return value.isNotEmpty && value.toLowerCase() != 'false';
    if (value is num) return value != 0;
    if (value is List) return value.isNotEmpty;
    return value != null;
  }

  static dynamic _processOperation(
      Map<String, dynamic> context, dynamic value) {
    if (value is Map<String, dynamic>) {
      // Handle increment operation
      if (value['operation'] == 'increment') {
        final baseValue = resolve(context, value['value']);
        if (baseValue is num) {
          return baseValue + 1;
        } else if (baseValue is List) {
          if (baseValue.isEmpty) {
            return 1; // fallback for empty list
          }
          final lastItem = baseValue.last;
          if (lastItem is num) {
            return lastItem + 1;
          }
          return int.parse(lastItem.toString()) + 1;
        } else {
          return int.parse(baseValue.toString()) + 1;
        }
      }
      // Handle other nested operations
      return evaluate(context, value);
    }
    return resolve(context, value);
  }

  static dynamic resolve(Map<String, dynamic> ctx, dynamic expr) {
    if (expr == null) return null;
    return resolveValueRaw(expr, ctx);
  }
}
