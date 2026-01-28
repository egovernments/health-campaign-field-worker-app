/// Extensible log category for classifying log entries.
///
/// Categories are string-based (not enums) to allow packages to define
/// their own custom categories while using the built-in ones.
///
/// Example of creating a custom category:
/// ```dart
/// static const flowExecution = LogCategory('flowExecution', 'FLW');
/// ```
class LogCategory {
  /// Full name of the category.
  final String name;

  /// Short code (3 characters) for compact output.
  final String code;

  const LogCategory(this.name, this.code);

  // Built-in categories

  /// JSON schema parsing and validation.
  static const schema = LogCategory('schema', 'SCH');

  /// Form rendering, validation, value extraction.
  static const form = LogCategory('form', 'FRM');

  /// Data transformation and mapping.
  static const transform = LogCategory('transform', 'TRF');

  /// Conditional expression evaluation.
  static const condition = LogCategory('condition', 'CND');

  /// State management operations.
  static const state = LogCategory('state', 'STA');

  /// Navigation and routing.
  static const navigation = LogCategory('navigation', 'NAV');

  /// API calls and responses.
  static const network = LogCategory('network', 'NET');

  /// Data synchronization.
  static const sync = LogCategory('sync', 'SYN');

  /// Local storage operations.
  static const storage = LogCategory('storage', 'STR');

  /// App lifecycle events.
  static const lifecycle = LogCategory('lifecycle', 'LCY');

  /// General/uncategorized logs.
  static const general = LogCategory('general', 'GEN');

  /// List of all built-in categories.
  static const List<LogCategory> builtInCategories = [
    schema,
    form,
    transform,
    condition,
    state,
    navigation,
    network,
    sync,
    storage,
    lifecycle,
    general,
  ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogCategory &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          code == other.code;

  @override
  int get hashCode => name.hashCode ^ code.hashCode;

  @override
  String toString() => 'LogCategory($name, $code)';
}
