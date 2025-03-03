import 'package:flutter/material.dart';

import '../widgets/error_screen.dart';

class ErrorBoundary extends StatefulWidget {
  final Widget Function(BuildContext context, Object? error) builder;

  const ErrorBoundary({super.key, required this.builder});

  @override
  _ErrorBoundaryState createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  static bool _hasDisplayedError = false; // Ensures only one error per page
  Object? _error;
  StackTrace? _stackTrace;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resetError();
  }

  void _resetError() {
    setState(() {
      _error = null;
      _stackTrace = null;
      // Reset only when moving to a new screen
      _hasDisplayedError = false;
    });
  }

  void _handleError(Object error, StackTrace stackTrace) {
    if (!_hasDisplayedError) { // Only trigger error once per page
      setState(() {
        _error = error;
        _stackTrace = stackTrace;
        _hasDisplayedError = true;
      });

      FlutterError.reportError(
        FlutterErrorDetails(exception: error, stack: stackTrace),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return const ErrorScreen(); // Show full-screen error once
    }

    return _ErrorCatcher(
      onError: _handleError,
      child: Builder(
        builder: (context) => widget.builder(context, _error),
      ),
    );
  }
}

class _ErrorCatcher extends StatelessWidget {
  final Widget child;
  final void Function(Object, StackTrace) onError;

  const _ErrorCatcher({Key? key, required this.child, required this.onError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

// Set ErrorWidget.builder globally once at app startup
void setupErrorWidget() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const ErrorScreen();
  };
}

