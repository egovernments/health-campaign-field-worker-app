import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:forms_engine/models/schema_object/schema_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forms.freezed.dart';

typedef FormsStateEmitter = Emitter<FormsState>;

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  final String schema;

  FormsBloc(this.schema) : super(const FormsState()) {
    on<FormsLoadEvent>(_handleLoadForm);
    on<FormsUpdateEvent>(_handleUpdateForm);
    on<FormsSubmitEvent>(_handleSubmitForm);
    on<FormsCreateMappingEvent>(_handleCreateMapping);
    on<FormsUpdateFieldEvent>(_handleUpdateField);
    on<FormsClearFieldEvent>(_handleClearField);
    on<FormsClearPageEvent>(_handleClearPage);
    on<FormsClearFormEvent>(_handleClearForm);
  }

  FutureOr<void> _handleLoadForm(FormsLoadEvent event, FormsStateEmitter emit) {
    final schemaObject = SchemaObject.fromJson(json.decode(schema));
    emit(state.copyWith(schema: schemaObject));
  }

  void _handleUpdateForm(FormsUpdateEvent event, FormsStateEmitter emit) {
    emit(state.copyWith(schema: event.object));
  }

  void _handleCreateMapping(
    FormsCreateMappingEvent event,
    FormsStateEmitter emit,
  ) {
    final propertiesMap = state.schema?.pages.entries
        .map((e) => e.value)
        .map((e) => e.properties)
        .whereNotNull()
        .expand(
          (element) =>
              element.entries.map((e) => MapEntry(e.key, e.value.value)),
        );

    if (propertiesMap == null || propertiesMap.isEmpty) {
      throw Exception('Invalid schema output. Data should not be empty');
    }

    final dataMap = Map.fromEntries(propertiesMap);
    emit(state.copyWith(formData: dataMap));
  }

  void _handleUpdateField(FormsUpdateFieldEvent event, FormsStateEmitter emit) {
    final schemaCopy = state.schema;
    if (schemaCopy == null) return;

    final updatedPages = {
      for (final page in schemaCopy.pages.entries)
        page.key: page.value.copyWith(
          properties: page.value.properties == null
              ? null
              : {
            for (final prop in page.value.properties!.entries)
              prop.key: prop.key == event.key
                  ? prop.value.copyWith(value: event.value)
                  : prop.value,
          },
        ),
    };

    final updatedSchema = schemaCopy.copyWith(pages: updatedPages);
    emit(state.copyWith(schema: updatedSchema));
  }

  /// Handles the clearing of a specific field on the form.
  ///
  /// This function takes the key of the field to clear as an argument and
  /// iterates over each page and its properties in the current form schema,
  /// resetting the value of the specified field to `null`. After clearing
  /// the field, it emits a new state with the updated schema.
  ///
  /// [event] The `FormsClearFieldEvent` containing the key of the field to clear.
  /// [emit] The function to emit the new state with cleared field data.
  void _handleClearField(FormsClearFieldEvent event, FormsStateEmitter emit) {
    final schemaCopy = state.schema;
    if (schemaCopy == null) return;

    final updatedPages = {
      for (final page in schemaCopy.pages.entries)
        page.key: page.value.copyWith(
          properties: page.value.properties == null
              ? null
              : {
            for (final prop in page.value.properties!.entries)
              prop.key: prop.key == event.key
                  ? prop.value.copyWith(value: null)
                  : prop.value,
          },
        ),
    };

    emit(state.copyWith(schema: schemaCopy.copyWith(pages: updatedPages)));
  }

  /// Handles the clearing of all fields on a specific page in the form schema.
  ///
  /// This function takes the key of the page to clear as an argument and
  /// iterates over each property on the specified page, resetting the values
  /// of all properties to `null`. After clearing the fields on the page, it
  /// emits a new state with the updated schema and the same saved properties.
  ///
  /// [event] The `FormsClearPageEvent` containing the key of the page to clear.
  /// [emit] The function to emit the new state with cleared page data.
  void _handleClearPage(FormsClearPageEvent event, FormsStateEmitter emit) {
    final schemaCopy = state.schema;
    if (schemaCopy == null) return;

    final page = schemaCopy.pages[event.pageKey];
    if (page == null || page.properties == null) return;

    final clearedProperties = {
      for (final prop in page.properties!.entries)
        prop.key: prop.value.copyWith(value: null),
    };

    final updatedPages = Map.of(schemaCopy.pages);
    updatedPages[event.pageKey] = page.copyWith(properties: clearedProperties);

    emit(state.copyWith(schema: schemaCopy.copyWith(pages: updatedPages)));
  }

  /// Handles the clearing of all fields across all pages in the form schema.
  ///
  /// This function iterates over each page and its properties in the current
  /// form schema, resetting the values of all properties to `null`. After
  /// clearing the fields, it emits a new state with the updated schema and
  /// an empty map for saved properties.
  ///
  /// [event] The `FormsClearFormEvent` containing any additional data needed
  /// for the operation (not used in this implementation).
  /// [emit] The function to emit the new state with cleared form data.
  void _handleClearForm(FormsClearFormEvent event, FormsStateEmitter emit) {
    final schemaCopy = state.schema;
    if (schemaCopy == null) return;

    final clearedPages = {
      for (final page in schemaCopy.pages.entries)
        page.key: page.value.copyWith(
          properties: page.value.properties == null
              ? null
              : {
            for (final prop in page.value.properties!.entries)
              prop.key: prop.value.copyWith(value: null),
          },
        ),
    };

    emit(state.copyWith(
      schema: schemaCopy.copyWith(pages: clearedPages),
      formData: {},
    ));
  }

  void _handleSubmitForm(FormsSubmitEvent event, FormsStateEmitter emit) {
    final schemaObject = state.schema;
    if (schemaObject == null) return;

    final formData = <String, Map<String, dynamic>>{};

    for (final pageEntry in schemaObject.pages.entries) {
      final pageName = pageEntry.key;
      final page = pageEntry.value;

      if (page.properties == null) continue;

      final pageValues = <String, dynamic>{};

      for (final propEntry in page.properties!.entries) {
        final key = propEntry.key;
        final value = propEntry.value.value;

        pageValues[key] = value;

      }

      if (pageValues.isNotEmpty) {
        formData[pageName] = pageValues;
      }
    }

    emit(FormsState.formSubmitted(schema: state.schema, formData: formData));
  }


}

@freezed
class FormsEvent with _$FormsEvent {
  const factory FormsEvent.load() = FormsLoadEvent;

  const factory FormsEvent.createMapping() = FormsCreateMappingEvent;

  const factory FormsEvent.update(SchemaObject object) = FormsUpdateEvent;

  const factory FormsEvent.updateField({required String key, required dynamic value}) = FormsUpdateFieldEvent;

  const factory FormsEvent.clearField({required String key}) = FormsClearFieldEvent;

  const factory FormsEvent.clearPage({required String pageKey}) = FormsClearPageEvent;

  const factory FormsEvent.clearForm() = FormsClearFormEvent;

  const factory FormsEvent.submit(SchemaObject object) = FormsSubmitEvent;


}

@freezed
class FormsState with _$FormsState {
  const factory FormsState({
    SchemaObject? schema,
    Map<String, dynamic>? formData,
  }) = _FormsState;

  const factory FormsState.formSubmitted({
    SchemaObject? schema,
    required Map<String, dynamic> formData,
  }) = FormsSubmittedState;
}
