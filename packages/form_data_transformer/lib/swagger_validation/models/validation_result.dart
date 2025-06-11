class ValidationResult {
  final List<String> errors;
  final List<String> warnings;

  ValidationResult({
    List<String>? errors,
    List<String>? warnings,
  })  : errors = errors ?? [],
        warnings = warnings ?? [];

  bool get hasErrors => errors.isNotEmpty;
  bool get hasWarnings => warnings.isNotEmpty;

  void addError(String message) => errors.add(message);
  void addWarning(String message) => warnings.add(message);
}
