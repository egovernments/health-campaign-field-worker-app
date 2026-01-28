import 'package:flutter/foundation.dart';

import '../core/log_entry.dart';
import '../formatters/compact_formatter.dart';
import '../formatters/log_formatter.dart';
import 'log_target.dart';

/// Log target that writes to the debug console.
///
/// Uses [debugPrint] for output, which handles rate limiting and works
/// across all platforms. The output format is controlled by the [formatter].
class ConsoleTarget extends LogTarget {
  /// Formatter for log entries.
  final LogFormatter formatter;

  /// Creates a console target with the specified formatter.
  ///
  /// Defaults to [CompactFormatter] if not specified.
  ConsoleTarget({
    LogFormatter? formatter,
  }) : formatter = formatter ?? const CompactFormatter();

  @override
  Future<void> write(LogEntry entry) async {
    final formatted = formatter.format(entry);

    // Split multi-line output for proper debugPrint handling
    final lines = formatted.split('\n');
    for (final line in lines) {
      debugPrint(line);
    }
  }

  @override
  Future<void> writeBatch(List<LogEntry> entries) async {
    for (final entry in entries) {
      await write(entry);
    }
  }
}
