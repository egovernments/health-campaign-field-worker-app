// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_fields_model.freezed.dart';
part 'additional_fields_model.g.dart';

@freezed
class AdditionalFieldsModel with _$AdditionalFieldsModel {
  @JsonSerializable(explicitToJson: true)
  const factory AdditionalFieldsModel({
    required String schema,
    required int version,
    required List<AdditionalFieldsObjectModel> fields,
  }) = _AdditionalFieldsModel;

  factory AdditionalFieldsModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFieldsModelFromJson(json);
}

@freezed
class AdditionalFieldsObjectModel with _$AdditionalFieldsObjectModel {
  const factory AdditionalFieldsObjectModel({
    required String key,
    required String value,
  }) = _AdditionalFieldsObjectModel;

  factory AdditionalFieldsObjectModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFieldsObjectModelFromJson(json);
}
