import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_notice_model.freezed.dart';
part 'privacy_notice_model.g.dart';

@freezed
class PrivacyNoticeModel with _$PrivacyNoticeModel {
  const factory PrivacyNoticeModel({
    required String header,
    required String module,
    bool? active,
    List<ContentNoticeModel>? contents,
  }) = _PrivacyNoticeModel;

  factory PrivacyNoticeModel.fromJson(Map<String, dynamic> json) => _$PrivacyNoticeModelFromJson(json);
}

@freezed
class ContentNoticeModel with _$ContentNoticeModel {
  const factory ContentNoticeModel({
    String? header,
    List<DescriptionNoticeModel>? descriptions,
  }) = _ContentNoticeModel;

  factory ContentNoticeModel.fromJson(Map<String, dynamic> json) => _$ContentNoticeModelFromJson(json);
}

@freezed
class DescriptionNoticeModel with _$DescriptionNoticeModel {
  const factory DescriptionNoticeModel({
    String? text,
    String? type,
    bool? isBold,
    List<SubDescriptionNoticeModel>? subDescriptions,
  }) = _DescriptionNoticeModel;

  factory DescriptionNoticeModel.fromJson(Map<String, dynamic> json) => _$DescriptionNoticeModelFromJson(json);
}

@freezed
class SubDescriptionNoticeModel with _$SubDescriptionNoticeModel {
  const factory SubDescriptionNoticeModel({
    String? text,
    String? type,
    bool? isBold,
    bool? isSpaceRequired,
  }) = _SubDescriptionNoticeModel;

  factory SubDescriptionNoticeModel.fromJson(Map<String, dynamic> json) => _$SubDescriptionNoticeModelFromJson(json);
}
