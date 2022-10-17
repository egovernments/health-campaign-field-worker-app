import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/models/schema_object/schema_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/data/fake_schema.dart';

part 'forms.freezed.dart';

typedef FormsStateEmitter = Emitter<FormsState>;

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState()) {
    on<FormsLoadEvent>(_loadForm);
    on<FormsUpdateEvent>(_updateForm);
  }

  FutureOr<void> _loadForm(FormsLoadEvent event, FormsStateEmitter emit) {
    final schema = SchemaObject.fromJson(json.decode(fakeSchema));
    emit(state.copyWith(schema: schema));
  }

  void _updateForm(FormsUpdateEvent event, FormsStateEmitter emit) {
    emit(state.copyWith(schema: event.object));
  }
}

@freezed
class FormsEvent with _$FormsEvent {
  const factory FormsEvent.load() = FormsLoadEvent;

  const factory FormsEvent.update(SchemaObject object) = FormsUpdateEvent;
}

@freezed
class FormsState with _$FormsState {
  const factory FormsState({SchemaObject? schema}) = _FormsState;
}
