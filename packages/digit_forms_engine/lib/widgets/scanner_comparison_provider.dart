import 'package:flutter/widgets.dart';

/// Singleton registry that stores the duplicate check callback.
/// This survives across route pushes (unlike InheritedWidget).
class ScannerComparisonRegistry {
  static final ScannerComparisonRegistry _instance =
      ScannerComparisonRegistry._internal();
  factory ScannerComparisonRegistry() => _instance;
  ScannerComparisonRegistry._internal();

  Future<bool> Function(
    String fieldName,
    String scannedValue,
    Map<String, dynamic> formValues,
  )? duplicateCheckFn;

  String? Function(String fieldName)? duplicateErrorMessage;

  void clear() {
    duplicateCheckFn = null;
    duplicateErrorMessage = null;
  }
}

/// InheritedWidget that provides per-scan duplicate checking for scanner fields.
/// Also registers callbacks in [ScannerComparisonRegistry] so they are
/// accessible from child routes pushed via auto_route.
class ScannerComparisonProvider extends InheritedWidget {
  /// Per-scan duplicate check callback.
  /// Takes (fieldName, scannedValue, formValues).
  /// Returns true if the scanned value is a duplicate.
  final Future<bool> Function(
    String fieldName,
    String scannedValue,
    Map<String, dynamic> formValues,
  )? duplicateCheckFn;

  /// Error message for duplicate detection (localization key)
  final String? Function(String fieldName)? duplicateErrorMessage;

  ScannerComparisonProvider({
    super.key,
    required super.child,
    this.duplicateCheckFn,
    this.duplicateErrorMessage,
  }) {
    // Register in singleton so child routes can access it
    ScannerComparisonRegistry().duplicateCheckFn = duplicateCheckFn;
    ScannerComparisonRegistry().duplicateErrorMessage = duplicateErrorMessage;
  }

  /// Looks up the provider from InheritedWidget tree first,
  /// falls back to the singleton registry.
  static ScannerComparisonProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ScannerComparisonProvider>();
  }

  @override
  bool updateShouldNotify(ScannerComparisonProvider oldWidget) {
    return duplicateCheckFn != oldWidget.duplicateCheckFn ||
        duplicateErrorMessage != oldWidget.duplicateErrorMessage;
  }
}
