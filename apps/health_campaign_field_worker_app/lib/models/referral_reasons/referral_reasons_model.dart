import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_reasons_model.freezed.dart';
part 'referral_reasons_model.g.dart';

@freezed
class ReferralReasonsWrapperModel with _$ReferralReasonsWrapperModel {
  const factory ReferralReasonsWrapperModel({
    @JsonKey(name: 'referralReasons')
        List<ReferralReasonType>? referralReasonList,
  }) = _ReferralReasonsWrapperModel;

  factory ReferralReasonsWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReferralReasonsWrapperModelFromJson(json);
}

@freezed
class ReferralReasonType with _$ReferralReasonType {
  const factory ReferralReasonType({
    required String code,
    required String name,
    required bool active,
  }) = _ReferralReasonType;

  factory ReferralReasonType.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReferralReasonTypeFromJson(json);
}
