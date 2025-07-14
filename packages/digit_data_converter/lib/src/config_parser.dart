class ConfigParser {
  final Map<String, dynamic> _rawConfig;

  ConfigParser(this._rawConfig);

  /// Returns all defined model names in the config
  List<String> get availableModels => _rawConfig.keys.toList();

  /// Returns mapping config for a model (flat field mapping)
  Map<String, String> getFieldMappings(String modelName) {
    final model = _rawConfig[modelName];
    if (model == null || model['mappings'] == null) return {};
    return Map<String, String>.from(model['mappings']);
  }

  /// Returns list mapping config for a model (nested model lists)
  Map<String, Map<String, String>> getListMappings(String modelName) {
    final model = _rawConfig[modelName];
    if (model == null || model['listMappings'] == null) return {};
    final rawListMappings = model['listMappings'] as Map<String, dynamic>;
    return rawListMappings.map((key, value) {
      return MapEntry(key, Map<String, String>.from(value));
    });
  }

  /// Validates the config for basic correctness
  bool isValid() {
    return _rawConfig.entries.every((entry) {
      final value = entry.value;
      return value is Map<String, dynamic> &&
          (value.containsKey('mappings') || value.containsKey('listMappings'));
    });
  }

  Map<String, dynamic> get raw => _rawConfig;
}
