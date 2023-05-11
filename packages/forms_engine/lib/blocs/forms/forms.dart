import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../forms_engine.dart';
import '../../models/schema_object/schema_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forms.freezed.dart';

typedef FormsStateEmitter = Emitter<FormsState>;

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  final String schema;

  FormsBloc(this.schema) : super(const FormsState()) {
    on<FormsLoadEvent>(_handleLoadForm);
    on<FormsUpdateEvent>(_handleUpdateForm);
    on<FormsCreateMappingEvent>(_handleCreateMapping);
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
}

@freezed
class FormsEvent with _$FormsEvent {
  const factory FormsEvent.load() = FormsLoadEvent;

  const factory FormsEvent.createMapping() = FormsCreateMappingEvent;

  const factory FormsEvent.update(SchemaObject object) = FormsUpdateEvent;
}

@freezed
class FormsState with _$FormsState {
  const factory FormsState({
    SchemaObject? schema,
    Map<String, dynamic>? savedProperties,
  }) = _FormsState;
}
