import 'dart:async';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:flutter/widgets.dart';

/// Callback type for form submission handlers
typedef FormSubmissionCallback = Future<void> Function(
  Map<String, dynamic> formData,
);

/// Centralized registry for managing form submissions.
///
/// This singleton ensures that:
/// 1. Only ONE listener handles form submissions for each schema key
/// 2. Prevents duplicate handling when pages are pushed multiple times
/// 3. Provides clean registration/unregistration lifecycle
class FormSubmissionRegistry {
  static final FormSubmissionRegistry _instance =
      FormSubmissionRegistry._internal();

  FormSubmissionRegistry._internal();

  factory FormSubmissionRegistry() => _instance;

  /// Map of schema key to submission handler
  final Map<String, FormSubmissionCallback> _handlers = {};

  /// Map of schema key to registered screen instance ID
  final Map<String, String> _registeredInstances = {};

  /// Stream subscription for the FormsBloc
  StreamSubscription<FormsState>? _subscription;

  /// Reference to FormsBloc
  FormsBloc? _formsBloc;

  /// Whether the registry is initialized
  bool _isInitialized = false;

  /// Initialize the registry with a FormsBloc.
  /// Should be called once at app startup, typically in a top-level widget.
  void initialize(FormsBloc formsBloc) {
    if (_isInitialized && _formsBloc == formsBloc) {
      return; // Already initialized with same bloc
    }

    // Clean up previous subscription if exists
    _subscription?.cancel();

    _formsBloc = formsBloc;
    _subscription = formsBloc.stream.listen(_onFormStateChanged);
    _isInitialized = true;
  }

  /// Handle form state changes
  void _onFormStateChanged(FormsState state) async {
    if (state is FormsSubmittedState) {
      final schemaKey = state.activeSchemaKey;
      final handler = _handlers[schemaKey];

      if (handler != null) {
        await handler(state.formData);
      }
    }
  }

  /// Register a handler for a specific schema key.
  ///
  /// [schemaKey] - The form schema key (e.g., 'registration_form')
  /// [instanceId] - Unique ID for this screen instance (to prevent duplicates)
  /// [handler] - Callback to execute when form is submitted
  ///
  /// Returns true if registration was successful, false if already registered
  /// by a different instance.
  bool register({
    required String schemaKey,
    required String instanceId,
    required FormSubmissionCallback handler,
  }) {
    final existingInstance = _registeredInstances[schemaKey];

    // If already registered by different instance, don't override
    if (existingInstance != null && existingInstance != instanceId) {
      return false;
    }

    _handlers[schemaKey] = handler;
    _registeredInstances[schemaKey] = instanceId;
    return true;
  }

  /// Unregister a handler for a specific schema key.
  ///
  /// Only unregisters if the instanceId matches the registered instance.
  void unregister({
    required String schemaKey,
    required String instanceId,
  }) {
    final existingInstance = _registeredInstances[schemaKey];

    if (existingInstance == instanceId) {
      _handlers.remove(schemaKey);
      _registeredInstances.remove(schemaKey);
    }
  }

  /// Check if a schema key has a registered handler
  bool hasHandler(String schemaKey) => _handlers.containsKey(schemaKey);

  /// Get the instance ID that registered a handler for a schema key
  String? getRegisteredInstance(String schemaKey) =>
      _registeredInstances[schemaKey];

  /// Clear form state for a schema key via the FormsBloc
  void clearForm(String schemaKey) {
    _formsBloc?.add(FormsEvent.clearForm(schemaKey: schemaKey));
  }

  /// Dispose of the registry (call on app shutdown)
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _formsBloc = null;
    _handlers.clear();
    _registeredInstances.clear();
    _isInitialized = false;
  }

  /// Clear all handlers (useful for testing or flow reset)
  void clearAll() {
    _handlers.clear();
    _registeredInstances.clear();
  }
}

/// Mixin to help widgets manage form submission registration.
///
/// Use this in StatefulWidgets that need to handle form submissions:
///
/// ```dart
/// class _MyFormPageState extends State<MyFormPage>
///     with FormSubmissionRegistrationMixin {
///
///   @override
///   String get schemaKey => 'my_form';
///
///   @override
///   Future<void> onFormSubmitted(Map<String, dynamic> formData) async {
///     // Handle submission
///   }
///
///   @override
///   void initState() {
///     super.initState();
///     registerFormHandler();
///   }
///
///   @override
///   void dispose() {
///     unregisterFormHandler();
///     super.dispose();
///   }
/// }
/// ```
mixin FormSubmissionRegistrationMixin<T extends StatefulWidget> on State<T> {
  /// Unique instance ID for this widget instance
  late final String _instanceId;

  /// The schema key this widget handles
  String get schemaKey;

  /// Called when form is submitted
  Future<void> onFormSubmitted(Map<String, dynamic> formData);

  /// Whether this instance successfully registered
  bool _isRegistered = false;

  @override
  void initState() {
    super.initState();
    _instanceId = '${schemaKey}_${hashCode}_${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Register this widget's form handler
  void registerFormHandler() {
    _isRegistered = FormSubmissionRegistry().register(
      schemaKey: schemaKey,
      instanceId: _instanceId,
      handler: onFormSubmitted,
    );
  }

  /// Unregister this widget's form handler
  void unregisterFormHandler() {
    if (_isRegistered) {
      FormSubmissionRegistry().unregister(
        schemaKey: schemaKey,
        instanceId: _instanceId,
      );
      _isRegistered = false;
    }
  }

  /// Check if this instance is the active handler
  bool get isActiveHandler =>
      FormSubmissionRegistry().getRegisteredInstance(schemaKey) == _instanceId;
}
