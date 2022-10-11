// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuditDetailsModel _$$_AuditDetailsModelFromJson(Map<String, dynamic> json) =>
    _$_AuditDetailsModel(
      createdBy: json['createdBy'] as String,
      createdTime: json['createdTime'] as int,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModifiedTime: json['lastModifiedTime'] as String?,
    );

Map<String, dynamic> _$$_AuditDetailsModelToJson(
        _$_AuditDetailsModel instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdTime': instance.createdTime,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedTime': instance.lastModifiedTime,
    };
