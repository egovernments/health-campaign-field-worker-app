import 'value_resolver.dart';

/// Evaluates field configurations using the from/where/select/map pipeline,
/// and handles inline condition evaluation for where clauses.
class FieldEvaluator {
  final IValueResolver _resolver;

  FieldEvaluator(this._resolver);

  /// Evaluates a field map configuration with pipeline operators:
  /// from, map, where, select, takeLast, takeFirst, default.
  dynamic evaluateFieldMap(
    Map<String, dynamic> fieldConfig,
    dynamic root,
    Map<String, dynamic> wrapperData,
  ) {
    var list = _resolver.resolveValue(fieldConfig['from'], root, wrapperData);

    if (list == null) {
      list = [];
    } else if (list is! Iterable) {
      list = [list]; // wrap single object into a list
    }

    // map
    if (fieldConfig.containsKey('map')) {
      final mapExpr = fieldConfig['map'];
      list = list.map(
          (item) => _resolver.resolveValue(mapExpr, item, wrapperData));
    }

    // where - supports both single condition and multiple conditions
    if (fieldConfig.containsKey('where')) {
      final whereConf = fieldConfig['where'];

      // Handle multiple where conditions (array of conditions)
      if (whereConf is List) {
        list = list.where((item) {
          return whereConf
              .every((condition) => evaluateCondition(condition, item, wrapperData));
        });
      }
      // Handle single where condition (legacy support)
      else if (whereConf is Map) {
        list = list.where((item) {
          return evaluateCondition(whereConf, item, wrapperData);
        });
      }
    }

    // select
    if (fieldConfig.containsKey('select')) {
      final sel = fieldConfig['select'];
      list = list
          .map((item) => _resolver.resolveValue(sel, item, wrapperData));
    }

    list = list.toList();

    // takeLast
    if (fieldConfig['takeLast'] == true && list.isNotEmpty) {
      list = [list.last];
    }

    // takeFirst
    if (fieldConfig['takeFirst'] == true && list.isNotEmpty) {
      list = [list.first];
    }

    // default
    if (list.isEmpty && fieldConfig.containsKey('default')) {
      return fieldConfig['default'];
    }

    // collapse single-item lists
    if (list.length == 1) return list.first;

    return list;
  }

  /// Evaluates a single condition for where clauses using operator-based comparison.
  bool evaluateCondition(
    dynamic condition,
    dynamic item,
    Map<String, dynamic> wrapperData,
  ) {
    if (condition is Map<String, dynamic>) {
      final rawLeft = condition['left'];
      final rawRight = condition['right'];

      // left always goes through resolver (because usually template)
      final left = _resolver.resolveValue(rawLeft, item, wrapperData);

      // right: only resolve if template
      dynamic right;
      if (rawRight is String &&
          rawRight.startsWith('{{') &&
          rawRight.endsWith('}}')) {
        right = _resolver.resolveValue(rawRight, item, wrapperData);
      } else {
        right = rawRight; // literal value
      }

      // helper to coerce values into int if possible
      int? toInt(dynamic v) {
        if (v == null) return null;
        if (v is int) return v;
        if (v is String) return int.tryParse(v);
        return null;
      }

      final lNum = toInt(left);
      final rNum = toInt(right);

      switch (condition['operator']) {
        case 'eq':
        case 'equals':
          if (lNum != null && rNum != null) {
            return lNum == rNum;
          }
          return left == right;
        case 'neq':
        case 'notEquals':
          if (lNum != null && rNum != null) {
            return lNum != rNum;
          }
          return left != right;
        case 'lt':
          return (lNum != null && rNum != null)
              ? lNum < rNum
              : left.toString().compareTo(right.toString()) < 0;
        case 'lte':
          return (lNum != null && rNum != null)
              ? lNum <= rNum
              : left.toString().compareTo(right.toString()) <= 0;
        case 'gt':
          return (lNum != null && rNum != null)
              ? lNum > rNum
              : left.toString().compareTo(right.toString()) > 0;
        case 'gte':
          return (lNum != null && rNum != null)
              ? lNum >= rNum
              : left.toString().compareTo(right.toString()) >= 0;
        case 'contains':
          return left is String && right is String
              ? left.contains(right)
              : false;
        case 'in':
          return right is List ? right.contains(left) : false;
        default:
          return false;
      }
    }
    return false;
  }
}
