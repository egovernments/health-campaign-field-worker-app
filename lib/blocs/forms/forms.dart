import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:forms_engine/models/schema_object/schema_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/data/fake_schema.dart';
import 'package:health_campaigns_flutter/models/registration_delivery/registration_delivery.dart';
import 'package:health_campaigns_flutter/utils/utils.dart';

part 'forms.freezed.dart';

typedef FormsStateEmitter = Emitter<FormsState>;

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState()) {
    on<FormsLoadEvent>(_handleLoadForm);
    on<FormsUpdateEvent>(_handleUpdateForm);
    on<FormsCreateMappingEvent>(_handleCreateMapping);
  }

  FutureOr<void> _handleLoadForm(FormsLoadEvent event, FormsStateEmitter emit) {
    final schema = SchemaObject.fromJson(json.decode(fakeSchema));
    emit(state.copyWith(schema: schema));
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

    if (propertiesMap == null) {
      throw AppException('Invalid schema output. Data should not be empty');
    }

    final dataMap = Map.fromEntries(propertiesMap);
    final mapperModel = RegistrationDeliveryMapperModel.fromJson(dataMap);
    debugPrint('print: ${mapperModel.toJson()}');
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
  const factory FormsState({SchemaObject? schema}) = _FormsState;
}
