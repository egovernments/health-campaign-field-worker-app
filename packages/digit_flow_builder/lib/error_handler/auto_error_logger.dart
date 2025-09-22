import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Simple centralized auto error logger that captures and logs all errors
/// with detailed context without changing any UI
class AutoErrorLogger {
  static bool _initialized = false;

  /// Initialize auto error logging
  static void initialize() {
    if (_initialized) return;

    // Capture all Flutter errors
    FlutterError.onError = (details) {
      debugPrint('🔍 Flutter error caught: ${details.exception}');
      _logError(
        error: details.exception,
        stackTrace: details.stack,
        source: 'Flutter Framework',
        context: details.context?.toString(),
      );
    };

    // Capture async errors
    PlatformDispatcher.instance.onError = (error, stack) {
      _logError(
        error: error,
        stackTrace: stack,
        source: 'Async Operation',
      );
      return true;
    };

    _initialized = true;
    debugPrint('🔧 AutoErrorLogger initialized - listening for errors');

    // Test the logger immediately
    _testLogger();
  }

  /// Test function to verify logger is working
  static void _testLogger() {
    debugPrint('🧪 Testing AutoErrorLogger...');
    _logError(
      error: Exception('Test: Unknown widget format: testWidget'),
      stackTrace: StackTrace.current,
      source: 'Test',
      context: 'Testing auto error logger functionality',
    );
  }

  /// Log error with full context details
  static void _logError({
    required Object error,
    required StackTrace? stackTrace,
    required String source,
    String? context,
    Map<String, dynamic>? metadata,
  }) {
    final errorString = error.toString();
    final now = DateTime.now();

    debugPrint('🔍 Checking error: $errorString');

    // Check if this is a flow builder related error
    if (!_isFlowBuilderError(errorString)) {
      debugPrint('❌ Not a flow builder error, skipping');
      return;
    }

    debugPrint('✅ Flow builder error detected, logging...');

    // Create detailed error log
    final buffer = StringBuffer();

    // Header
    buffer.writeln('\n' + '=' * 80);
    buffer.writeln('🚨 DIGIT FLOW BUILDER ERROR DETECTED');
    buffer.writeln('=' * 80);

    // Basic Info
    buffer.writeln('⏰ Time: ${now.toIso8601String()}');
    buffer.writeln('📍 Source: $source');
    buffer.writeln('🎯 Error Type: ${_getErrorType(errorString)}');
    buffer.writeln('💥 Message: $errorString');

    // Context Info
    if (context != null) {
      buffer.writeln('\n📋 Context:');
      buffer.writeln(context);
    }

    // JSON Path Analysis
    final jsonInfo = _extractJsonInfo(errorString);
    if (jsonInfo.isNotEmpty) {
      buffer.writeln('\n📄 JSON Analysis:');
      jsonInfo.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    // Widget Info
    final widgetInfo = _extractWidgetInfo(errorString, context);
    if (widgetInfo.isNotEmpty) {
      buffer.writeln('\n🧩 Widget Analysis:');
      widgetInfo.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    // Action Info
    final actionInfo = _extractActionInfo(errorString);
    if (actionInfo.isNotEmpty) {
      buffer.writeln('\n⚡ Action Analysis:');
      actionInfo.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    // Stack Trace (first 10 lines)
    if (stackTrace != null) {
      buffer.writeln('\n📚 Stack Trace (Top 10):');
      final lines = stackTrace.toString().split('\n');
      for (int i = 0; i < lines.length && i < 10; i++) {
        if (lines[i].trim().isNotEmpty) {
          buffer.writeln('  ${i + 1}. ${lines[i]}');
        }
      }
    }

    // Recovery Suggestions
    buffer.writeln('\n🔧 Suggested Actions:');
    _getSuggestions(errorString).forEach((suggestion) {
      buffer.writeln('  • $suggestion');
    });

    buffer.writeln('=' * 80);

    // Print to console
    debugPrint(buffer.toString());
  }

  /// Check if error is flow builder related
  static bool _isFlowBuilderError(String error) {
    final patterns = [
      'unknown widget',
      'widget format',
      'unknown action',
      'action type',
      'interpolat',
      'template',
      'flow',
      'digit_flow_builder',
      'json',
      'parse',
      'navigation',
      'route',
    ];

    final lowerError = error.toLowerCase();
    return patterns.any((pattern) => lowerError.contains(pattern));
  }

  /// Get error type
  static String _getErrorType(String error) {
    final lowerError = error.toLowerCase();

    if (lowerError.contains('unknown widget') || lowerError.contains('widget format')) {
      return 'Unknown Widget';
    } else if (lowerError.contains('widget') && lowerError.contains('build')) {
      return 'Widget Build Error';
    } else if (lowerError.contains('unknown action') || lowerError.contains('action type')) {
      return 'Unknown Action';
    } else if (lowerError.contains('action')) {
      return 'Action Execution Error';
    } else if (lowerError.contains('interpolat') || lowerError.contains('template')) {
      return 'Template Interpolation Error';
    } else if (lowerError.contains('json') || lowerError.contains('parse')) {
      return 'JSON Parsing Error';
    } else if (lowerError.contains('navigation') || lowerError.contains('route')) {
      return 'Navigation Error';
    } else {
      return 'General Flow Builder Error';
    }
  }

  /// Extract JSON related info from error
  static Map<String, String> _extractJsonInfo(String error) {
    final info = <String, String>{};

    // Extract JSON path
    final pathRegex = RegExp(r'path[:\s]+([^\s,]+)');
    final pathMatch = pathRegex.firstMatch(error);
    if (pathMatch != null) {
      info['JSON Path'] = pathMatch.group(1)!;
    }

    // Extract invalid value
    final valueRegex = RegExp(r'invalid[:\s]+([^\s,]+)');
    final valueMatch = valueRegex.firstMatch(error);
    if (valueMatch != null) {
      info['Invalid Value'] = valueMatch.group(1)!;
    }

    return info;
  }

  /// Extract widget related info
  static Map<String, String> _extractWidgetInfo(String error, String? context) {
    final info = <String, String>{};

    // Extract widget format
    final formatRegex = RegExp(r'format[:\s]+([^\s,]+)');
    final formatMatch = formatRegex.firstMatch(error);
    if (formatMatch != null) {
      info['Widget Format'] = formatMatch.group(1)!;
    }

    // Extract widget type from context
    if (context != null) {
      final typeRegex = RegExp(r'(\w+Widget)');
      final typeMatch = typeRegex.firstMatch(context);
      if (typeMatch != null) {
        info['Widget Type'] = typeMatch.group(1)!;
      }
    }

    return info;
  }

  /// Extract action related info
  static Map<String, String> _extractActionInfo(String error) {
    final info = <String, String>{};

    // Extract action type
    final typeRegex = RegExp(r'action[:\s]+([^\s,]+)');
    final typeMatch = typeRegex.firstMatch(error);
    if (typeMatch != null) {
      info['Action Type'] = typeMatch.group(1)!;
    }

    return info;
  }

  /// Get recovery suggestions based on error type
  static List<String> _getSuggestions(String error) {
    final lowerError = error.toLowerCase();
    final suggestions = <String>[];

    if (lowerError.contains('unknown widget')) {
      suggestions.addAll([
        'Check if widget format is registered in WidgetRegistration',
        'Verify widget format spelling in JSON config',
        'Add widget to FlowWidgetFactory if it\'s a new widget type',
      ]);
    }

    if (lowerError.contains('unknown action')) {
      suggestions.addAll([
        'Check if action type is supported in ActionHandler',
        'Verify action type spelling in JSON config',
        'Add action handler for new action types',
      ]);
    }

    if (lowerError.contains('interpolat') || lowerError.contains('template')) {
      suggestions.addAll([
        'Check template syntax for missing closing braces',
        'Verify context data availability',
        'Check variable path spelling',
      ]);
    }

    if (lowerError.contains('json') || lowerError.contains('parse')) {
      suggestions.addAll([
        'Validate JSON structure',
        'Check for missing required fields',
        'Verify field types match expected types',
      ]);
    }

    if (suggestions.isEmpty) {
      suggestions.add('Check console logs for more details');
    }

    return suggestions;
  }
}