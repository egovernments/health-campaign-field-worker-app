/// Registry to store transient form values that need to be accessible
/// by the transformer but are not part of the form schema.
///
/// This is useful for storing computed values (like project facility IDs)
/// that need to be passed to the transformer via __context: prefix.
class TransientFormValueRegistry {
  static final TransientFormValueRegistry _instance =
      TransientFormValueRegistry._internal();

  TransientFormValueRegistry._internal();

  factory TransientFormValueRegistry() => _instance;

  final Map<String, dynamic> _values = {};

  /// Set a value in the registry
  void set(String key, dynamic value) {
    _values[key] = value;
  }

  /// Get a value from the registry
  dynamic get(String key) => _values[key];

  /// Remove a value from the registry
  void remove(String key) => _values.remove(key);

  /// Clear all values from the registry
  void clear() => _values.clear();

  /// Get all values as an unmodifiable map
  Map<String, dynamic> get all => Map.unmodifiable(_values);
}
