import '../../utils/utils.dart';

/// Performs reduce operations (max, min) on lists of values.
class ComputedEvaluator {
  static dynamic reduce(
      Map<String, dynamic> context, Map<String, dynamic> conf) {
    final list = resolveValueRaw(conf['from'], context);
    if (list is! Iterable) return conf['reduce']['fallback'];

    final field = conf['reduce']['field'] as String?;
    final operation = conf['reduce']['operation'];

    final values =
        list.map((item) => resolveValueRaw(field, item)).whereType<num>();

    if (values.isEmpty) return conf['reduce']['fallback'];

    switch (operation) {
      case 'max':
        return values.reduce((a, b) => a > b ? a : b);
      case 'min':
        return values.reduce((a, b) => a < b ? a : b);
      default:
        return conf['reduce']['fallback'];
    }
  }
}
