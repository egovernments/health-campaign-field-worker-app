import 'package:flutter/material.dart';

class WidgetApp extends StatelessWidget {
  final Widget child;
  const WidgetApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(body: child),
      );
}
