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
    on<FormsCreateMappingEvent>(_handleCreateMapping);
    on<FormsUpdateFieldEvent>(_handleUpdateField);
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
    emit(state.copyWith(savedProperties: dataMap));
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


}

@freezed
class FormsEvent with _$FormsEvent {
  const factory FormsEvent.load() = FormsLoadEvent;

  const factory FormsEvent.createMapping() = FormsCreateMappingEvent;

  const factory FormsEvent.update(SchemaObject object) = FormsUpdateEvent;

  const factory FormsEvent.updateField({required String key, required dynamic value}) = FormsUpdateFieldEvent;

}

@freezed
class FormsState with _$FormsState {
  const factory FormsState({
    SchemaObject? schema,
    Map<String, dynamic>? savedProperties,
  }) = _FormsState;
}
