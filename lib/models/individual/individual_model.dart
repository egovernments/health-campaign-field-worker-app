// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/models/audit/audit_model.dart';

part 'individual_model.freezed.dart';
part 'individual_model.g.dart';

@freezed
class IndividualModel with _$IndividualModel {
  @JsonSerializable(explicitToJson: true)
  const factory IndividualModel({
    String? additionalFields,
    String? addressId,
    AuditDetailsModel? auditDetails,

    /// [dateOfBirth] in yyyyMMDD format
    required String dateOfBirth,
    required Gender gender,
    required List<IndividualIdentifierModel> identifiers,
    String? individualId,

    /// [isHead] will be true if this individual is the head of a family
    @Default(false) bool isHead,
    required String givenName,
    String? familyName,
    String? additionalName,
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
