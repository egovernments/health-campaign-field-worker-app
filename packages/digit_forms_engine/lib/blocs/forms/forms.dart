import 'dart:convert';

import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/models/schema_object/schema_object.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forms.freezed.dart';

typedef FormsStateEmitter = Emitter<FormsState>;

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState()) {
    on<FormsLoadEvent>(_onLoad);
    on<FormsUpdateFieldEvent>(_onUpdateField);
    on<FormsUpdateEvent>(_handleUpdateForm);
    on<FormsClearFieldEvent>(_onClearField);
    on<FormsClearPageEvent>(_onClearPage);
    on<FormsClearFormEvent>(_onClearForm);
    on<FormsSubmitEvent>(_onSubmit);
  }

  /// Load and preprocess schemas from raw JSON strings
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

  void _handleUpdateForm(FormsUpdateEvent event, FormsStateEmitter emit) {
    final updatedSchemas = Map<String, SchemaObject>.from(state.cachedSchemas);
    updatedSchemas[event.schemaKey] = event.schema;

    emit(state.copyWith(
      cachedSchemas: updatedSchemas,
      initialSchemas: state.initialSchemas,
    ));
  }

  void _onClearField(FormsClearFieldEvent event, FormsStateEmitter emit) {
    add(FormsUpdateFieldEvent(
      schemaKey: event.schemaKey,
      key: event.key,
      value: null,
    ));
  }

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

@freezed
class FormsEvent with _$FormsEvent {
  /// Load list of schema JSON strings
  const factory FormsEvent.load({
    required List<String> schemas,
  }) = FormsLoadEvent;

  /// Update a single field's value in the schema
  const factory FormsEvent.updateField({
    required String schemaKey,
    required String key,
    required dynamic value,
  }) = FormsUpdateFieldEvent;

  /// Updates the entire schema directly
  const factory FormsEvent.update({
    required SchemaObject schema,
    required String schemaKey,
  }) = FormsUpdateEvent;

  /// Clear a specific field (sets value to null)
  const factory FormsEvent.clearField({
    required String schemaKey,
    required String key,
  }) = FormsClearFieldEvent;

  /// Clear all fields on a single page
  const factory FormsEvent.clearPage({
    required String schemaKey,
    required String pageKey,
  }) = FormsClearPageEvent;

  /// Reset the entire form schema to its initial state
  const factory FormsEvent.clearForm({
    required String schemaKey,
  }) = FormsClearFormEvent;

  /// Submit the form, emitting a summary output of collected form data
  const factory FormsEvent.submit({
    required String schemaKey,
    @Default(false) bool isEdit,
  }) = FormsSubmitEvent;
}

@freezed
class FormsState with _$FormsState {
  const factory FormsState({
    @Default({}) Map<String, SchemaObject> cachedSchemas,
    @Default({}) Map<String, SchemaObject> initialSchemas,
    String? activeSchemaKey,
  }) = _FormsState;

  const factory FormsState.formSubmitted({
    required SchemaObject schema,
    required Map<String, Map<String, dynamic>> formData,
    required Map<String, SchemaObject> cachedSchemas,
    required Map<String, SchemaObject> initialSchemas,
    required bool isEdit,
    String? activeSchemaKey,
  }) = FormsSubmittedState;
}
