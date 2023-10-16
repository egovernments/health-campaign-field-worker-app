// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestInfoMapperModel _$$_RequestInfoMapperModelFromJson(
        Map<String, dynamic> json) =>
    _$_RequestInfoMapperModel(
      requestInfo: json['requestInfo'] == null
          ? null
          : RequestInfoModel.fromJson(
              json['requestInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RequestInfoMapperModelToJson(
        _$_RequestInfoMapperModel instance) =>
    <String, dynamic>{
      'requestInfo': instance.requestInfo,
    };

_$_RequestInfoModel _$$_RequestInfoModelFromJson(Map<String, dynamic> json) =>
    _$_RequestInfoModel(
      apiId: json['apiId'] as String?,
      ver: json['ver'] as String?,
      ts: json['ts'] as num?,
      action: json['action'] as String?,
      did: json['did'] as String?,
      key: json['key'] as String?,
      msgId: json['msgId'] as String?,
      authToken: json['authToken'] as String?,
    );

Map<String, dynamic> _$$_RequestInfoModelToJson(_$_RequestInfoModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiId', instance.apiId);
  writeNotNull('ver', instance.ver);
  writeNotNull('ts', instance.ts);
  writeNotNull('action', instance.action);
  writeNotNull('did', instance.did);
  writeNotNull('key', instance.key);
  writeNotNull('msgId', instance.msgId);
  writeNotNull('authToken', instance.authToken);
  return val;
}
