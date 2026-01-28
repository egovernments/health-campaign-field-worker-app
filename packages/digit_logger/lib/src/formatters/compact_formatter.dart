import 'dart:convert';

import '../core/log_entry.dart';
import 'log_formatter.dart';

/// Compact formatter for production/CI output.
///
/// Produces single-line output suitable for log aggregation:
/// ```
/// 2024-01-15T10:30:45.123Z DBG [TRF] [corr:abc-123] Field mapped {path:household.address.locality}
/// ```
///
/// Format:
/// - Timestamp: ISO 8601 UTC
/// - Level: 3-letter code
/// - Category: 3-letter code in brackets
/// - Correlation ID: [corr:xxx] (omitted if null)
/// - Message: Human-readable text
/// - Context: Inline JSON (truncated if too long)
class CompactFormatter extends LogFormatter {
  /// Maximum length of context JSON in output.
  final int maxContextLength;

  /// Maximum total line length.
  final int maxLineLength;

  const CompactFormatter({
    this.maxContextLength = 100,
    this.maxLineLength = 500,
  });

  @override
  String format(LogEntry entry) {
    final buffer = StringBuffer();

    // Timestamp in ISO 8601 UTC
    buffer.write(entry.timestamp.toIso8601String());
    buffer.write(' ');

    // Level (3 chars)
    buffer.write(entry.level.code);
    buffer.write(' ');

    // Category in brackets
    buffer.write('[${entry.category.code}]');
    buffer.write(' ');

    // Correlation ID if present
    if (entry.correlationId != null) {
      buffer.write('[corr:${_truncateId(entry.correlationId!)}]');
      buffer.write(' ');
    }

    // Message
    buffer.write(entry.message);

    // Context as inline JSON
    if (entry.context != null && entry.context!.isNotEmpty) {
      buffer.write(' ');
      buffer.write(_formatContext(entry.context!));
    }

    // Error if present
    if (entry.error != null) {
      buffer.write(' error=${entry.error.runtimeType}');
    }

    // Truncate total line length
    final result = buffer.toString();
    if (result.length > maxLineLength) {
      return '${result.substring(0, maxLineLength - 3)}...';
    }
    return result;
  }

  /// Truncates a UUID to show just the first segment.
  String _truncateId(String id) {
    if (id.length <= 8) return id;
    return id.substring(0, 8);
  }

  /// Formats context as compact JSON.
  String _formatContext(Map<String, dynamic> context) {
    try {
      final json = jsonEncode(context);
      if (json.length <= maxContextLength) {
        return json;
      }
      // Truncate long context
      return '${json.substring(0, maxContextLength - 3)}...';
    } catch (e) {
      return '{context: serialization failed}';
    }
  }
}
