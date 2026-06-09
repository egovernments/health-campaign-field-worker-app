// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalizationModel _$LocalizationModelFromJson(Map<String, dynamic> json) =>
    _LocalizationModel(
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map(
                (e) => LocalizationMessageModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LocalizationModelToJson(_LocalizationModel instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

_LocalizationMessageModel _$LocalizationMessageModelFromJson(
  Map<String, dynamic> json,
) => _LocalizationMessageModel(
  code: json['code'] as String,
  message: json['message'] as String,
  module: json['module'] as String,
  locale: json['locale'] as String,
);

Map<String, dynamic> _$LocalizationMessageModelToJson(
  _LocalizationMessageModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'module': instance.module,
  'locale': instance.locale,
};
