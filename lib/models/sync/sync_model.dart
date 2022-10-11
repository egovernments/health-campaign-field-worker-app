// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_model.freezed.dart';
part 'sync_model.g.dart';

@freezed
class SyncDataModel with _$SyncDataModel {
  const factory SyncDataModel({
    required List<SyncObjectModel> syncUpData,
  }) = _SyncDataModel;

  factory SyncDataModel.fromJson(Map<String, dynamic> json) =>
      _$SyncDataModelFromJson(json);
}

@freezed
@JsonSerializable(genericArgumentFactories: true)
class SyncObjectModel<T> with _$SyncObjectModel<T> {
  const SyncObjectModel._();

  const factory SyncObjectModel({
    required List<T> items,
  }) = _SyncObjectModel<T>;

  factory SyncObjectModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$SyncObjectModelFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return _$SyncObjectModelToJson(this, toJsonT);
  }
}

enum SyncObjectModelType {
  @JsonValue('REGISTRATION')
  registration,
  @JsonValue('DELIVERY')
  delivery;
}

enum ApiMode {
  @JsonValue('CREATE')
  create,
  @JsonValue('UPDATE')
  update,
  @JsonValue('DELETE')
  delete;
}
