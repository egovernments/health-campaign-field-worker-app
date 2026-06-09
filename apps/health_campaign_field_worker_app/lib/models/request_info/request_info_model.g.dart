// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestInfoMapperModel _$RequestInfoMapperModelFromJson(
  Map<String, dynamic> json,
) => _RequestInfoMapperModel(
  requestInfo: json['requestInfo'] == null
      ? null
      : RequestInfoModel.fromJson(json['requestInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RequestInfoMapperModelToJson(
  _RequestInfoMapperModel instance,
) => <String, dynamic>{'requestInfo': instance.requestInfo};

_RequestInfoModel _$RequestInfoModelFromJson(Map<String, dynamic> json) =>
    _RequestInfoModel(
      apiId: json['apiId'] as String?,
      ver: json['ver'] as String?,
      ts: json['ts'] as num?,
      action: json['action'] as String?,
      did: json['did'] as String?,
      key: json['key'] as String?,
      msgId: json['msgId'] as String?,
      authToken: json['authToken'] as String?,
      userInfo: json['userInfo'] == null
          ? null
          : UserRequestModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$RequestInfoModelToJson(_RequestInfoModel instance) =>
    <String, dynamic>{
      'apiId': ?instance.apiId,
      'ver': ?instance.ver,
      'ts': ?instance.ts,
      'action': ?instance.action,
      'did': ?instance.did,
      'key': ?instance.key,
      'msgId': ?instance.msgId,
      'authToken': ?instance.authToken,
      'userInfo': ?instance.userInfo,
      'tenantId': ?instance.tenantId,
    };
