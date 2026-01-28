# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2024-01-28

### Added

- Initial release implementing Phase 1 (MVP) of the design document
- Core logging functionality
  - Six log levels: trace, debug, info, warn, error, fatal
  - Compile-time stripping of trace/debug in release builds
  - Pre-init buffering for logs created before initialization
- Log categories
  - 11 built-in categories (schema, form, transform, etc.)
  - Extensible string-based categories for custom packages
- PII sanitization
  - Automatic redaction of phone numbers, Aadhaar, PAN, passwords
  - Configurable sensitive key detection
  - User ID hashing option
- Formatters
  - PrettyFormatter for development console output
  - CompactFormatter for production/CI output
- Log targets
  - ConsoleTarget using debugPrint
  - MemoryTarget for testing
  - Abstract LogTarget interface for custom implementations
- Storage
  - Abstract LogStorage interface
  - MemoryStorage for testing
- Session management
  - Automatic session ID generation
  - Session boundary tracking
- Correlation context
  - Zone-based correlation ID propagation
  - ScopedLogger for operation tracing
- Error capture helpers
  - runGuarded() for zone-based error capture
  - captureFlutterErrors() for Flutter framework errors
  - DigitBlocObserver for BLoC error capture
  - Future.logged() extension for automatic error logging
- Health check API
- Configuration presets
  - LogConfig.development()
  - LogConfig.production()
  - LogConfig.test()
- Comprehensive test suite
