// Main test file that exports all tests
// Run with: flutter test

import 'core/log_sanitizer_test.dart' as sanitizer_test;
import 'core/logger_test.dart' as logger_test;
import 'correlation_test.dart' as correlation_test;
import 'formatters/formatter_test.dart' as formatter_test;

void main() {
  logger_test.main();
  sanitizer_test.main();
  formatter_test.main();
  correlation_test.main();
}
