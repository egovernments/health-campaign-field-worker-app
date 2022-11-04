// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'digit_icon_card_model.freezed.dart';
part 'digit_icon_card_model.g.dart';

@freezed
class DigitIconCardWrapperModel with _$DigitIconCardWrapperModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory DigitIconCardWrapperModel({
    @JsonKey(name: 'digiticoncards')
    @Default([])
        List<DigitIconCardModel> digiticoncards,
  }) = _DigitIconCardWrapperModel;

  factory DigitIconCardWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$DigitIconCardWrapperModelFromJson(json);
}

@freezed
class DigitIconCardModel with _$DigitIconCardModel {
  @JsonSerializable(explicitToJson: true)
  const factory DigitIconCardModel({
    required String title,
    required String subtitle,
    required String widgetKey,
    required dynamic callback,
    @JsonKey(name: 'icon') required int icon,
  }) = _DigitIconCardModel;

  factory DigitIconCardModel.fromJson(Map<String, dynamic> json) =>
      _$DigitIconCardModelFromJson(json);
}
