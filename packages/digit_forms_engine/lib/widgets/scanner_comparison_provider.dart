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

/// Provides per-scan duplicate checking for scanner fields.
///
/// Registers callbacks in [ScannerComparisonRegistry] on mount so they are
/// accessible from child routes pushed via auto_route (where the InheritedWidget
/// is not in the ancestor tree). Clears the registry on dispose to prevent
/// stale callbacks from leaking into later scanner sessions.
class ScannerComparisonProvider extends StatefulWidget {
  final Future<bool> Function(
    String fieldName,
    String scannedValue,
    Map<String, dynamic> formValues,
  )? duplicateCheckFn;

  final String? Function(String fieldName)? duplicateErrorMessage;

  final Widget child;

  const ScannerComparisonProvider({
    super.key,
    required this.child,
    this.duplicateCheckFn,
    this.duplicateErrorMessage,
  });

  /// Looks up the inherited data from the widget tree.
  static ScannerComparisonData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ScannerComparisonData>();
  }

  @override
  State<ScannerComparisonProvider> createState() =>
      _ScannerComparisonProviderState();
}

class _ScannerComparisonProviderState extends State<ScannerComparisonProvider> {
  @override
  void initState() {
    super.initState();
    _registerCallbacks();
  }

  @override
  void didUpdateWidget(ScannerComparisonProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duplicateCheckFn != oldWidget.duplicateCheckFn ||
        widget.duplicateErrorMessage != oldWidget.duplicateErrorMessage) {
      _registerCallbacks();
    }
  }

  void _registerCallbacks() {
    ScannerComparisonRegistry().duplicateCheckFn = widget.duplicateCheckFn;
    ScannerComparisonRegistry().duplicateErrorMessage =
        widget.duplicateErrorMessage;
  }

  @override
  void dispose() {
    ScannerComparisonRegistry().clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScannerComparisonData(
      duplicateCheckFn: widget.duplicateCheckFn,
      duplicateErrorMessage: widget.duplicateErrorMessage,
      child: widget.child,
    );
  }
}

/// InheritedWidget that holds the callback data for widget tree lookups.
/// Used internally by [ScannerComparisonProvider] and returned by its [of] method.
class ScannerComparisonData extends InheritedWidget {
  final Future<bool> Function(
    String fieldName,
    String scannedValue,
    Map<String, dynamic> formValues,
  )? duplicateCheckFn;

  final String? Function(String fieldName)? duplicateErrorMessage;

  const ScannerComparisonData({
    super.key,
    required super.child,
    this.duplicateCheckFn,
    this.duplicateErrorMessage,
  });

  @override
  bool updateShouldNotify(ScannerComparisonData oldWidget) {
    return duplicateCheckFn != oldWidget.duplicateCheckFn ||
        duplicateErrorMessage != oldWidget.duplicateErrorMessage;
  }
}
