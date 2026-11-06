import 'package:flutter/material.dart';
import '../blocs/app_localization.dart';

/// Provides FlowBuilderLocalization down the widget tree
class LocalizationContext extends InheritedWidget {
  final FlowBuilderLocalization localization;

  const LocalizationContext({
    super.key,
    required this.localization,
    required super.child,
  });

  static FlowBuilderLocalization? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LocalizationContext>()
        ?.localization;
  }

  static FlowBuilderLocalization of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No LocalizationContext found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LocalizationContext oldWidget) {
    return localization != oldWidget.localization;
  }
}
