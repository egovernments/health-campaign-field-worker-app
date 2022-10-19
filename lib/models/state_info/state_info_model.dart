// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_info_model.freezed.dart';
part 'state_info_model.g.dart';

@freezed
class StateInfoModel with _$StateInfoModel {
  @JsonSerializable(explicitToJson: true)
  const factory StateInfoModel({
    required String name,
    required String code,
    required String qrCodeURL,
    required String bannerUrl,
    required String logoUrl,
    required String stateLogoURL,
    String? selectedCode,
    required bool hasLocalisation,
    required bool enableWhatsApp,
    required List<LanguagesModel> languases,
  }) = _StateInfoModel;

  factory StateInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StateInfoModelFromJson(json);
}

@freezed
class LanguagesModel with _$LanguagesModel {
  @JsonSerializable(explicitToJson: true)
  const factory LanguagesModel({
    required String label,
    required String value,
    @Default(false) bool isSelected,
  }) = _LanguagesModel;

  factory LanguagesModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesModelFromJson(json);
}
