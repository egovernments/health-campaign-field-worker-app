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
  FormsBloc() : super(const FormsState()) {
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
    final rawSchema = json.decode(event.schema);
    final schemaObject = SchemaObject.fromJson(rawSchema);

    // Sort pages by order
    final sortedPages = Map.fromEntries(
      schemaObject.pages.entries.toList()
        ..sort((a, b) {
          // If either order is null, keep the original order (do not sort)
          if (a.value.order == null || b.value.order == null) return 0;
          return a.value.order!.compareTo(b.value.order!);
        }),
    ).map((pageKey, pageValue) {
      // Sort properties inside the page
      final sortedProperties = pageValue.properties == null
          ? null
          : Map.fromEntries(
        pageValue.properties!.entries.toList()
          ..sort((a, b) {
            if (a.value.order == null || b.value.order == null) return 0;
            return a.value.order!.compareTo(b.value.order!);
          }),
      );

      // Return updated page
      return MapEntry(
        pageKey,
        pageValue.copyWith(properties: sortedProperties),
      );
    });

    final sortedSchema = schemaObject.copyWith(pages: sortedPages);
    emit(FormsState(schema: sortedSchema, initialSchema: sortedSchema));
  }

  void _handleUpdateForm(FormsUpdateEvent event, FormsStateEmitter emit) {
    emit(FormsState(schema: event.object, initialSchema:state.initialSchema));
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
          (element) => element.entries.map((e) => MapEntry(e.key, e.value.value)),
    );

    if (propertiesMap == null || propertiesMap.isEmpty) {
      throw Exception('Invalid schema output. Data should not be empty');
    }

    final dataMap = Map.fromEntries(propertiesMap);
    emit(FormsState(schema: state.schema, formData: dataMap, initialSchema: state.initialSchema));
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
    emit(FormsState(schema: updatedSchema, initialSchema: state.initialSchema));
  }

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

    emit(FormsState(schema: schemaCopy.copyWith(pages: updatedPages), initialSchema: state.initialSchema));
  }

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

    emit(FormsState(schema: schemaCopy.copyWith(pages: updatedPages), initialSchema: state.initialSchema));
  }

  void _handleClearForm(FormsClearFormEvent event, FormsStateEmitter emit) {
    final schemaJson = state.initialSchema;
    if (schemaJson == null) return;

    emit(FormsState(schema: schemaJson, initialSchema: schemaJson));
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

    emit(FormsSubmittedState(schema: schemaObject, formData: formData, initialSchema: state.initialSchema));
    emit(FormsState(schema: schemaObject, initialSchema: state.initialSchema)); // Reset after submit
  }
}


@freezed
class FormsEvent with _$FormsEvent {
  const factory FormsEvent.load({required String schema}) = FormsLoadEvent;

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
    SchemaObject? initialSchema, // Default json to reload the form
  }) = _FormsState;

  const factory FormsState.formSubmitted({
    SchemaObject? schema,
    required Map<String, dynamic> formData,
    SchemaObject? initialSchema,
  }) = FormsSubmittedState;
}
