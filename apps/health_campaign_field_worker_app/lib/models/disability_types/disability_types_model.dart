import 'package:freezed_annotation/freezed_annotation.dart';

part 'disability_types_model.freezed.dart';
part 'disability_types_model.g.dart';

@freezed
class DisabilityTypesWrapperModel with _$DisabilityTypesWrapperModel {
  const factory DisabilityTypesWrapperModel({
    @JsonKey(name: 'disabilityTypes')
    List<DisabilityTypes>? disabilityTypesList,
  }) = _DisabilityTypesWrapperModel;

  factory DisabilityTypesWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DisabilityTypesWrapperModelFromJson(json);
}

@freezed
class DisabilityTypes with _$DisabilityTypes {
  const factory DisabilityTypes({
    required String code,
    required String name,
    required bool active,
  }) = _DisabilityTypes;

  factory DisabilityTypes.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DisabilityTypesFromJson(json);
}
