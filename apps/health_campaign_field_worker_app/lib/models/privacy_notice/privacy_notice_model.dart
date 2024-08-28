import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_notice_model.freezed.dart';
part 'privacy_notice_model.g.dart';

@freezed
class PrivacyPolicyModel with _$PrivacyPolicyModel {
  const factory PrivacyPolicyModel({
    required String header,
    required String module,
    bool? active,
    List<ContentModel>? contents,
  }) = _PrivacyPolicyModel;

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) => _$PrivacyPolicyModelFromJson(json);
}

@freezed
class ContentModel with _$ContentModel {
  const factory ContentModel({
     String? header,
     List<DescriptionModel>? descriptions,
  }) = _ContentModel;

  factory ContentModel.fromJson(Map<String, dynamic> json) => _$ContentModelFromJson(json);
}

@freezed
class DescriptionModel with _$DescriptionModel {
  const factory DescriptionModel({
    String? text,
    String? type,
    bool? isBold,
    List<SubDescriptionModel>? subDescriptions,
  }) = _DescriptionModel;

  factory DescriptionModel.fromJson(Map<String, dynamic> json) => _$DescriptionModelFromJson(json);
}

@freezed
class SubDescriptionModel with _$SubDescriptionModel {
  const factory SubDescriptionModel({
    String? text,
    String? type,
    bool? isBold,
    bool? isSpaceRequired,
  }) = _SubDescriptionModel;

  factory SubDescriptionModel.fromJson(Map<String, dynamic> json) => _$SubDescriptionModelFromJson(json);
}
