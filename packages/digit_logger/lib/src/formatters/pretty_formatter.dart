import 'dart:convert';

import '../core/log_entry.dart';
import '../core/log_level.dart';
import 'log_formatter.dart';

/// Pretty formatter for development console output.
///
/// Produces multi-line output with box-drawing characters for readability:
/// ```
/// ┌─────────────────────────────────────────────────────────────────
/// │ 10:30:45.123 [DEBUG] [TRF] Field mapped successfully
/// │ correlationId: abc-123 | seq: 42 | session: xyz-789
/// ├─────────────────────────────────────────────────────────────────
/// │ source: transformer_executor.dart:156
/// │ context:
/// │   path: household.address.locality
/// │   value: "Bangalore"
/// └─────────────────────────────────────────────────────────────────
/// ```
class PrettyFormatter extends LogFormatter {
  /// Width of the box in characters.
  final int width;

  /// Whether to use ANSI colors.
  final bool useColors;

  const PrettyFormatter({
    this.width = 70,
    this.useColors = true,
  });

  @override
  String format(LogEntry entry) {
    final buffer = StringBuffer();
    final line = '─' * (width - 1);

    // Top border
    buffer.writeln('┌$line');

    // Main log line with level color
    final time = _formatTime(entry.timestamp);
    final level = entry.level.code;
    final category = entry.category.code;
    final levelColored = useColors ? _colorize(level, entry.level) : level;

    buffer.writeln('│ $time [$levelColored] [$category] ${entry.message}');

    // Correlation/session info
    final meta = <String>[];
    if (entry.correlationId != null) {
      meta.add('correlationId: ${entry.correlationId}');
    }
    meta.add('seq: ${entry.sequenceNumber}');
    meta.add('session: ${_truncateId(entry.sessionId)}');
    buffer.writeln('│ ${meta.join(' | ')}');

    // Separator if we have additional info
    final hasSource = entry.source != null;
    final hasContext = entry.context != null && entry.context!.isNotEmpty;
    final hasStack = entry.stackTrace != null;
    final hasError = entry.error != null;

    if (hasSource || hasContext || hasStack || hasError) {
      buffer.writeln('├$line');
    }

    // Source location
    if (hasSource) {
      buffer.writeln('│ source: ${entry.source}');
    }

    // Error info
    if (hasError) {
      buffer.writeln('│ error: ${entry.error}');
    }

    // Context
    if (hasContext) {
      buffer.writeln('│ context:');
      _formatContext(entry.context!, buffer, indent: 2);
    }

    // Stack trace
    if (hasStack) {
      buffer.writeln('│ stackTrace:');
      for (final line in entry.stackTrace!.split('\n').take(10)) {
        if (line.trim().isNotEmpty) {
          buffer.writeln('│   $line');
        }
      }
    }

    // Bottom border
    buffer.write('└$line');

    return buffer.toString();
  }

  /// Formats time as HH:MM:SS.mmm in local time.
  String _formatTime(DateTime timestamp) {
    final local = timestamp.toLocal();
    final h = local.hour.toString().padLeft(2, '0');
    final m = local.minute.toString().padLeft(2, '0');
    final s = local.second.toString().padLeft(2, '0');
    final ms = local.millisecond.toString().padLeft(3, '0');
    return '$h:$m:$s.$ms';
  }

  /// Truncates a UUID to show just the first segment.
  String _truncateId(String id) {
    if (id.length <= 8) return id;
    return '${id.substring(0, 8)}...';
  }

  /// Applies ANSI color codes based on log level.
  String _colorize(String text, LogLevel level) {
    const reset = '\x1B[0m';
    final color = switch (level) {
      LogLevel.trace => '\x1B[90m', // Gray
      LogLevel.debug => '\x1B[34m', // Blue
      LogLevel.info => '\x1B[32m', // Green
      LogLevel.warn => '\x1B[33m', // Yellow
      LogLevel.error => '\x1B[31m', // Red
      LogLevel.fatal => '\x1B[1;31m', // Bold Red
    };
    return '$color$text$reset';
  }

  /// Formats context map with indentation.
  void _formatContext(
    Map<String, dynamic> context,
    StringBuffer buffer, {
    int indent = 0,
  }) {
    final prefix = '│${'  ' * indent}';
    for (final entry in context.entries) {
      final value = entry.value;
      if (value is Map) {
        buffer.writeln('$prefix${entry.key}:');
        _formatContext(
          value.map((k, v) => MapEntry(k.toString(), v)),
          buffer,
          indent: indent + 1,
        );
      } else if (value is List) {
        buffer.writeln('$prefix${entry.key}: ${_formatList(value)}');
      } else if (value is String) {
        buffer.writeln('$prefix${entry.key}: "${_truncateValue(value)}"');
      } else {
        buffer.writeln('$prefix${entry.key}: $value');
      }
    }
  }

  /// Formats a list for display.
  String _formatList(List list) {
    if (list.isEmpty) return '[]';
    if (list.length <= 3) {
      return jsonEncode(list);
    }
    return '[${list.take(3).map((e) => jsonEncode(e)).join(', ')}, ... ${list.length - 3} more]';
  }

  /// Truncates long values for display.
  String _truncateValue(String value) {
    if (value.length <= 50) return value;
    return '${value.substring(0, 47)}...';
  }
}
