import 'package:digit_data_model/data_model.dart';

import '../../utils/utils.dart';

/// Performs reduce operations (max, min) on lists of values.
class ComputedEvaluator {
  /// Wraps a bare path (`children`, `clientAuditDetails.createdTime`) in
  /// `{{...}}` so `resolveValueRaw` treats it as a template. Passed-through
  /// values already wrapped stay untouched.
  static String _asTemplate(dynamic path) {
    final str = path?.toString() ?? '';
    if (str.startsWith('{{') && str.endsWith('}}')) return str;
    return '{{$str}}';
  }

  /// Converts an [EntityModel] item to a `Map<String, dynamic>` so
  /// `resolveValueRaw`'s path walker (which only steps through Maps/Lists)
  /// can descend into it. Non-entity items are returned unchanged.
  static dynamic _asContext(dynamic item) {
    if (item is EntityModel) {
      try {
        return item.toMap();
      } catch (_) {
        return item;
      }
    }
    return item;
  }

  static dynamic reduce(
      Map<String, dynamic> context, Map<String, dynamic> conf) {
    final list = resolveValueRaw(_asTemplate(conf['from']), context);
    if (list is! Iterable) return conf['reduce']['fallback'];

    final field = conf['reduce']['field'] as String?;
    final operation = conf['reduce']['operation'];
    if (field == null || field.isEmpty) return conf['reduce']['fallback'];
    final fieldTemplate = _asTemplate(field);

    final values = list
        .map((item) => resolveValueRaw(fieldTemplate, _asContext(item)))
        .whereType<num>();

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
