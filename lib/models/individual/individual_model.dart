// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../dynamic_forms/additional_fields/additional_fields_model.dart';

part 'individual_model.freezed.dart';
part 'individual_model.g.dart';

@freezed
class IndividualModel with _$IndividualModel {
  @JsonSerializable(explicitToJson: true)
  const factory IndividualModel({
    required String name,

    /// Date of birth in YYYYMMDD format
    required String dateOfBirth,
    required Gender gender,

    /// [isHead] will be true if this individual is the head of a family
    @Default(false) bool isHead,
    required List<IndividualIdentifierModel> identifiers,
    AdditionalFieldsModel? additionalFields,
  }) = _IndividualModel;

  factory IndividualModel.fromJson(Map<String, dynamic> json) =>
      _$IndividualModelFromJson(json);
}

@freezed
class IndividualIdentifierModel with _$IndividualIdentifierModel {
  @JsonSerializable(explicitToJson: true)
  const factory IndividualIdentifierModel({
    required IndividualIdentifierType type,
    required String identifierId,
  }) = _IndividualIdentifierModel;

  factory IndividualIdentifierModel.fromJson(Map<String, dynamic> json) =>
      _$IndividualIdentifierModelFromJson(json);
}

enum IndividualIdentifierType {
  @JsonValue('NATIONAL_ID')
  nationalId,
  @JsonValue('TAX_ID')
  taxId,
  @JsonValue('SYSTEM_GENERATED')
  systemGenerated;
}

enum Gender {
  @JsonValue('MALE')
  male,
  @JsonValue('FEMALE')
  female,
  @JsonValue('OTHER')
  other;
}
