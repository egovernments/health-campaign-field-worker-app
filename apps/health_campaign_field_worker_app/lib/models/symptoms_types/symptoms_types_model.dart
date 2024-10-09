import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptoms_types_model.freezed.dart';
part 'symptoms_types_model.g.dart';

@freezed
class SymptomsTypesPrimaryWrapperModel with _$SymptomsTypesPrimaryWrapperModel {
  const factory SymptomsTypesPrimaryWrapperModel({
    @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
    final SymptomsTypesSecondaryWrapperModel? symptomsTypes,
  }) = _SymptomsTypesPrimaryWrapperModel;

  factory SymptomsTypesPrimaryWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SymptomsTypesPrimaryWrapperModelFromJson(json);
}

@freezed
class SymptomsTypesSecondaryWrapperModel
    with _$SymptomsTypesSecondaryWrapperModel {
  const factory SymptomsTypesSecondaryWrapperModel({
    @JsonKey(name: 'symptomsTypes') List<SymptomsType>? symptomsTypeList,
  }) = _SymptomsTypesSecondaryWrapperModel;

  factory SymptomsTypesSecondaryWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SymptomsTypesSecondaryWrapperModelFromJson(json);
}

@freezed
class SymptomsTypesSecondaryWrapperModelSchisto
    with _$SymptomsTypesSecondaryWrapperModelSchisto {
  const factory SymptomsTypesSecondaryWrapperModelSchisto({
    @JsonKey(name: 'symptomsTypesSchisto')
    List<SymptomsType>? symptomsTypeSchistoList,
  }) = _SymptomsTypesSecondaryWrapperModelSchisto;

  factory SymptomsTypesSecondaryWrapperModelSchisto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SymptomsTypesSecondaryWrapperModelSchistoFromJson(json);
}

@freezed
class SymptomsType with _$SymptomsType {
  const factory SymptomsType({
    required String code,
    required String name,
    required bool active,
  }) = _SymptomsType;

  factory SymptomsType.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SymptomsTypeFromJson(json);
}
