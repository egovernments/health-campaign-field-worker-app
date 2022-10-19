// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'walkthrough_model.freezed.dart';
part 'walkthrough_model.g.dart';

@freezed
class WalkthrougWrapperModel with _$WalkthrougWrapperModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory WalkthrougWrapperModel({
    @JsonKey(name: 'walkthrough')
    @Default([])
        List<WalkthroughModel> walkthrough,
  }) = _WalkthrougWrapperModel;

  factory WalkthrougWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$WalkthrougWrapperModelFromJson(json);
}

@freezed
class WalkthroughModel with _$WalkthroughModel {
  @JsonSerializable(explicitToJson: true)
  const factory WalkthroughModel({
    required String title,
    required String subtitle,
    required String widgetKey,
    required dynamic callback,
    @JsonKey(name: 'icon') required int icon,
  }) = _WalkthroughModel;

  factory WalkthroughModel.fromJson(Map<String, dynamic> json) =>
      _$WalkthroughModelFromJson(json);
}
