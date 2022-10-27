// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_model.freezed.dart';
part 'localization_model.g.dart';

@freezed
class LocalizationModel with _$LocalizationModel {
  @JsonSerializable(explicitToJson: true)
  const factory LocalizationModel({
    @Default([]) List<MessagesModel> messages,
  }) = _LocalizationModel;

  factory LocalizationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizationModelFromJson(json);
}

@freezed
class MessagesModel with _$MessagesModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory MessagesModel({
    required String code,
    required String message,
    required String module,
    required String locale,
  }) = _MessagesModel;

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);
}
