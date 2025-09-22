/// Error types for DIGIT Flow Builder
enum FlowErrorType {
  // JSON and Configuration Errors
  jsonParsing,           // Malformed JSON, syntax errors
  jsonValidation,        // Missing required fields, type mismatches
  configurationSchema,   // Invalid configuration structure

  // Widget and UI Errors
  widgetBuild,          // Widget creation failures
  widgetUnknown,        // Unknown widget format
  widgetProperty,       // Invalid widget properties

  // Action System Errors
  actionExecution,      // Action handler failures
  actionUnknown,        // Unknown action type
  actionConfiguration,  // Invalid action properties

  // State Management Errors
  stateUpdate,          // State update failures
  stateAccess,          // State access errors
  stateCorruption,      // State integrity issues

  // Form Processing Errors
  formValidation,       // Form validation failures
  formSubmission,       // Form submission errors
  formSchema,           // Schema validation errors

  // Data Operation Errors
  dataTransformation,   // Data mapping failures
  dataPersistence,      // CRUD operation errors
  dataRetrieval,        // Search/fetch errors

  // Navigation Errors
  navigationRoute,      // Route resolution failures
  navigationParams,     // Invalid navigation parameters

  // Template and Interpolation Errors
  interpolation,        // Template interpolation failures
  templateSyntax,       // Invalid template syntax

  // System Level Errors
  initialization,       // Initialization failures
  dependency,          // Missing dependencies
  network,             // Network operation errors
  unknown,             // Uncategorized errors
}

/// Error severity levels
enum ErrorSeverity {
  critical,    // System crash, data loss risk, app unusable
  high,        // Feature completely broken, user blocked
  medium,      // Feature partially working, degraded experience
  low,         // Minor issues, workarounds available
  info,        // Non-critical information, logging purposes
  warning,     // Potential issues, preventive information
}

/// Error categories for grouping
enum ErrorCategory {
  userFacing,     // Errors that directly affect user experience
  developer,      // Errors requiring developer intervention
  configuration,  // Configuration-related errors
  system,         // System-level errors
  data,          // Data-related errors
  ui,            // UI rendering errors
}

/// Recovery action types
enum RecoveryActionType {
  retry,              // Retry the failed operation
  refresh,            // Refresh/reload current screen
  navigate,           // Navigate to different screen
  reset,              // Reset state/form
  fallback,          // Use fallback configuration
  contact,           // Contact support
  ignore,            // Ignore and continue
  reload,            // Reload entire app
}