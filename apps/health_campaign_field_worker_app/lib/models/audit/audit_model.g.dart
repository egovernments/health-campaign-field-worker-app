// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditDetailsModelImpl _$$AuditDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuditDetailsModelImpl(
      createdBy: json['createdBy'] as String,
      createdTime: json['createdTime'] as int,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModifiedTime: json['lastModifiedTime'] as String?,
    );

Map<String, dynamic> _$$AuditDetailsModelImplToJson(
        _$AuditDetailsModelImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdTime': instance.createdTime,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedTime': instance.lastModifiedTime,
    };
