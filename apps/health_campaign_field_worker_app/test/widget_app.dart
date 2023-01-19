import 'package:flutter/material.dart';

class WidgetApp extends StatelessWidget {
  final Widget child;
  final List<LocalizationsDelegate>? localizationDelegates;
  final NavigatorObserver? navigatorObserver;

  const WidgetApp({
    super.key,
    required this.child,
    this.localizationDelegates,
    this.navigatorObserver,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: localizationDelegates,
        navigatorObservers: [if (navigatorObserver != null) navigatorObserver!],
        home: Scaffold(body: child),
      );
}
