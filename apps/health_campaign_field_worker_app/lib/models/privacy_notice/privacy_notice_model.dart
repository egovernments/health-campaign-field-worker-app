import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_notice_model.freezed.dart';
part 'privacy_notice_model.g.dart';

@freezed
class PrivacyPolicy with _$PrivacyPolicy {
  const factory PrivacyPolicy({
    required String header,
    required String module,
    required List<Content> contents,
  }) = _PrivacyPolicy;

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) => _$PrivacyPolicyFromJson(json);
}

@freezed
class Content with _$Content {
  const factory Content({
    required String header,
    required List<Description> descriptions,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@freezed
class Description with _$Description {
  const factory Description({
    required String text,
    String? type,
    required bool isBold,
    List<SubDescription>? subDescriptions,
  }) = _Description;

  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);
}

@freezed
class SubDescription with _$SubDescription {
  const factory SubDescription({
    required String text,
    String? type,
    required bool isBold,
    required bool isSpaceRequired,
  }) = _SubDescription;

  factory SubDescription.fromJson(Map<String, dynamic> json) => _$SubDescriptionFromJson(json);
}
