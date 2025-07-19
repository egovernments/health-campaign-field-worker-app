import 'dart:convert';

import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/models/schema_object/schema_object.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forms.freezed.dart';

/// Type alias for the emitter function used in BLoC event handlers.
typedef FormsStateEmitter = Emitter<FormsState>;

/// A BLoC that manages form state and operations for dynamic forms.
/// 
/// This BLoC handles loading form schemas, updating field values, clearing forms,
/// and submitting form data. It maintains both the current form state and the initial
/// state for reset operations.
/// 
/// ## Usage
/// 
/// ```dart
/// // Create and provide the BLoC
/// BlocProvider(
///   create: (context) => FormsBloc(),
///   child: YourFormWidget(),
/// )
/// 
/// // Load a form schema
/// context.read<FormsBloc>().add(
///   FormsEvent.load(schemas: [schemaJson]),
/// );
/// 
/// // Update a field value
/// context.read<FormsBloc>().add(
///   FormsEvent.updateField(
///     schemaKey: 'userRegistration',
///     key: 'name',
///     value: 'John Doe',
///   ),
/// );
/// 
/// // Submit the form
/// context.read<FormsBloc>().add(
///   FormsEvent.submit(schemaKey: 'userRegistration'),
/// );
/// ```
/// 
/// ## Events
/// 
/// - [FormsLoadEvent]: Load form schemas from JSON strings
/// - [FormsUpdateFieldEvent]: Update a single field's value
/// - [FormsUpdateEvent]: Update the entire schema
/// - [FormsClearFieldEvent]: Clear a specific field
/// - [FormsClearPageEvent]: Clear all fields on a page
/// - [FormsClearFormEvent]: Reset form to initial state
/// - [FormsSubmitEvent]: Submit the form and collect data
/// 
/// ## States
/// 
/// - [FormsState]: Default state with cached schemas
/// - [FormsSubmittedState]: Emitted when form is submitted
class FormsBloc extends Bloc<FormsEvent, FormsState> {
  /// Creates a new FormsBloc instance.
  FormsBloc() : super(const FormsState()) {
    on<FormsLoadEvent>(_onLoad);
    on<FormsUpdateFieldEvent>(_onUpdateField);
    on<FormsUpdateEvent>(_handleUpdateForm);
    on<FormsClearFieldEvent>(_onClearField);
    on<FormsClearPageEvent>(_onClearPage);
    on<FormsClearFormEvent>(_onClearForm);
    on<FormsSubmitEvent>(_onSubmit);
  }

  /// Load and preprocess schemas from raw JSON strings.
  /// 
  /// This method:
  /// - Parses JSON strings into SchemaObject instances
  /// - Sorts pages and properties by their order
  /// - Filters out pages where all fields are hidden
  /// - Stores both current and initial schemas
  void _onLoad(FormsLoadEvent event, FormsStateEmitter emit) {
    final newSchemas = <String, SchemaObject>{};
    final newInitials = <String, SchemaObject>{};

    for (final schemaStr in event.schemas) {
      final raw = json.decode(schemaStr);
      final schema = SchemaObject.fromJson(raw);

      final filteredPages = Map.fromEntries(
        schema.pages.entries.toList()
          ..sort((a, b) => (a.value.order ?? 0).compareTo(b.value.order ?? 0)),
      ).map((key, page) {
        final sortedProperties = page.properties == null
            ? null
            : Map.fromEntries(
                page.properties!.entries.toList()
                  ..sort((a, b) =>
                      (a.value.order ?? 0).compareTo(b.value.order ?? 0)),
              );

        return MapEntry(key, page.copyWith(properties: sortedProperties));
      });

      filteredPages.removeWhere((_, page) {
        final props = page.properties;
        return props == null || props.values.every((p) => p.hidden == true);
      });

      final finalSchema = schema.copyWith(pages: filteredPages);
      newSchemas[schema.name] = finalSchema;
      newInitials[schema.name] = finalSchema;
    }

    emit(state.copyWith(
      cachedSchemas: newSchemas,
      initialSchemas: newInitials,
    ));
  }

  /// Update a single field's value in the schema.
  /// 
  /// This method finds the field in the specified schema and updates its value.
  /// The field is identified by the key parameter and can be in any page of the schema.
  void _onUpdateField(FormsUpdateFieldEvent event, FormsStateEmitter emit) {
    final schema = state.cachedSchemas[event.schemaKey];
    if (schema == null) return;

    final updatedPages = {
      for (final entry in schema.pages.entries)
        entry.key: entry.value.copyWith(
          properties: entry.value.properties == null
              ? null
              : {
                  for (final prop in entry.value.properties!.entries)
                    prop.key: prop.key == event.key
                        ? prop.value.copyWith(value: event.value)
                        : prop.value,
                },
        )
    };

    final updatedSchema = schema.copyWith(pages: updatedPages);

    final updatedSchemas = Map.of(state.cachedSchemas);
    updatedSchemas[event.schemaKey] = updatedSchema;

    emit(state.copyWith(
      cachedSchemas: updatedSchemas,
    ));
  }

  /// Update the entire schema directly.
  /// 
  /// This method replaces the entire schema for the specified schema key.
  void _handleUpdateForm(FormsUpdateEvent event, FormsStateEmitter emit) {
    final updatedSchemas = Map<String, SchemaObject>.from(state.cachedSchemas);
    updatedSchemas[event.schemaKey] = event.schema;

    emit(state.copyWith(
      cachedSchemas: updatedSchemas,
      initialSchemas: state.initialSchemas,
    ));
  }

  /// Clear a specific field by setting its value to null.
  /// 
  /// This method delegates to _onUpdateField with a null value.
  void _onClearField(FormsClearFieldEvent event, FormsStateEmitter emit) {
    add(FormsUpdateFieldEvent(
      schemaKey: event.schemaKey,
      key: event.key,
      value: null,
    ));
  }

  /// Clear all fields on a single page by setting their values to null.
  /// 
  /// This method finds the specified page and clears all field values in that page.
  void _onClearPage(FormsClearPageEvent event, FormsStateEmitter emit) {
    final schema = state.cachedSchemas[event.schemaKey];
    if (schema == null) return;

    final page = schema.pages[event.pageKey];
    if (page == null || page.properties == null) return;

    final clearedProps = {
      for (final prop in page.properties!.entries)
        prop.key: prop.value.copyWith(value: null),
    };

    final updatedPages = Map.of(schema.pages);
    updatedPages[event.pageKey] = page.copyWith(properties: clearedProps);

    final updatedSchema = schema.copyWith(pages: updatedPages);
    final updatedSchemas = Map.of(state.cachedSchemas);
    updatedSchemas[event.schemaKey] = updatedSchema;

    emit(state.copyWith(
      cachedSchemas: updatedSchemas,
    ));
  }

  /// Reset the entire form schema to its initial state.
  /// 
  /// This method restores the schema to its original state when it was first loaded.
  void _onClearForm(FormsClearFormEvent event, FormsStateEmitter emit) {
    final initialSchema = state.initialSchemas[event.schemaKey];
    if (initialSchema == null) return;

    final updatedSchemas = Map.of(state.cachedSchemas);
    updatedSchemas[event.schemaKey] = initialSchema;

    emit(FormsState(
      cachedSchemas: state.initialSchemas,
      initialSchemas: state.initialSchemas,
    )); // Reset after submit
  }

  /// Submit the form and collect all form data.
  /// 
  /// This method:
  /// - Collects all field values from all pages
  /// - Filters out hidden fields (unless includeInForm is true)
  /// - Converts empty strings to null
  /// - Emits a FormsSubmittedState with the collected data
  void _onSubmit(FormsSubmitEvent event, FormsStateEmitter emit) {
    final schema = state.cachedSchemas[event.schemaKey];
    if (schema == null) return;

    final outputData = <String, Map<String, dynamic>>{};

    for (final entry in schema.pages.entries) {
      final props = entry.value.properties;
      if (props == null) continue;

      final pageValues = <String, dynamic>{};
      for (final propEntry in props.entries) {
        final prop = propEntry.value;
        final rawValue = prop.value;

        if (prop.hidden == true && prop.includeInForm != true) continue;

        pageValues[propEntry.key] =
            (rawValue is String && rawValue.trim().isEmpty) ? null : rawValue;
      }

      if (pageValues.isNotEmpty) {
        outputData[entry.key] = pageValues;
      }
    }

    emit(FormsSubmittedState(
      schema: schema,
      formData: outputData,
      cachedSchemas: state.cachedSchemas,
      initialSchemas: state.initialSchemas,
      isEdit: event.isEdit,
      activeSchemaKey: event.schemaKey,
    ));
  }
}

/// Events that can be dispatched to the FormsBloc.
/// 
/// These events represent all possible actions that can be performed on forms,
/// from loading schemas to submitting form data.
@freezed
class FormsEvent with _$FormsEvent {
  /// Load list of schema JSON strings.
  /// 
  /// This event parses the provided JSON strings into SchemaObject instances
  /// and stores them in the bloc's state. The schemas are preprocessed to
  /// sort pages and properties by order, and filter out pages where all
  /// fields are hidden.
  const factory FormsEvent.load({
    required List<String> schemas,
  }) = FormsLoadEvent;

  /// Update a single field's value in the schema.
  /// 
  /// This event updates the value of a specific field identified by the key.
  /// The field can be in any page of the specified schema.
  const factory FormsEvent.updateField({
    required String schemaKey,
    required String key,
    required dynamic value,
  }) = FormsUpdateFieldEvent;

  /// Updates the entire schema directly.
  /// 
  /// This event replaces the entire schema for the specified schema key.
  /// Use this when you need to update the schema structure itself.
  const factory FormsEvent.update({
    required SchemaObject schema,
    required String schemaKey,
  }) = FormsUpdateEvent;

  /// Clear a specific field (sets value to null).
  /// 
  /// This event clears the value of a specific field by setting it to null.
  const factory FormsEvent.clearField({
    required String schemaKey,
    required String key,
  }) = FormsClearFieldEvent;

  /// Clear all fields on a single page.
  /// 
  /// This event clears all field values on the specified page by setting
  /// them to null.
  const factory FormsEvent.clearPage({
    required String schemaKey,
    required String pageKey,
  }) = FormsClearPageEvent;

  /// Reset the entire form schema to its initial state.
  /// 
  /// This event restores the schema to its original state when it was
  /// first loaded, effectively resetting all form data.
  const factory FormsEvent.clearForm({
    required String schemaKey,
  }) = FormsClearFormEvent;

  /// Submit the form, emitting a summary output of collected form data.
  /// 
  /// This event collects all form data from all pages, filters out hidden
  /// fields (unless includeInForm is true), and emits a FormsSubmittedState
  /// with the collected data.
  const factory FormsEvent.submit({
    required String schemaKey,
    @Default(false) bool isEdit,
  }) = FormsSubmitEvent;
}

/// States that can be emitted by the FormsBloc.
/// 
/// These states represent the different states of the form system,
/// from the default state with cached schemas to the submitted state
/// with collected form data.
@freezed
class FormsState with _$FormsState {
  /// Default state with cached schemas.
  /// 
  /// This state contains the current form schemas and their data.
  /// It is the normal operating state of the form system.
  const factory FormsState({
    @Default({}) Map<String, SchemaObject> cachedSchemas,
    @Default({}) Map<String, SchemaObject> initialSchemas,
    String? activeSchemaKey,
  }) = _FormsState;

  /// State emitted when a form is submitted.
  /// 
  /// This state contains the submitted form data along with the schema
  /// and other state information. It is emitted when a form is successfully
  /// submitted.
  const factory FormsState.formSubmitted({
    required SchemaObject schema,
    required Map<String, Map<String, dynamic>> formData,
    required Map<String, SchemaObject> cachedSchemas,
    required Map<String, SchemaObject> initialSchemas,
    required bool isEdit,
    String? activeSchemaKey,
  }) = FormsSubmittedState;
}
