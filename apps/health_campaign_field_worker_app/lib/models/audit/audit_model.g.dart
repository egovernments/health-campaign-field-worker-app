// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditDetailsModel _$AuditDetailsModelFromJson(Map<String, dynamic> json) =>
    _AuditDetailsModel(
      createdBy: json['createdBy'] as String,
      createdTime: (json['createdTime'] as num).toInt(),
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModifiedTime: json['lastModifiedTime'] as String?,
    );

Map<String, dynamic> _$AuditDetailsModelToJson(_AuditDetailsModel instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdTime': instance.createdTime,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedTime': instance.lastModifiedTime,
    };
