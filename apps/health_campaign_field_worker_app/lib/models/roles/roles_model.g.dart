// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RolesWrapperModel _$$_RolesWrapperModelFromJson(Map<String, dynamic> json) =>
    _$_RolesWrapperModel(
      tenantId: json['tenantId'] as String,
      moduleName: json['moduleName'] as String,
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => RolesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RolesWrapperModelToJson(
        _$_RolesWrapperModel instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'moduleName': instance.moduleName,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
    };

_$_RolesModel _$$_RolesModelFromJson(Map<String, dynamic> json) =>
    _$_RolesModel(
      code: $enumDecode(_$CodeEnumMap, json['code']),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_RolesModelToJson(_$_RolesModel instance) =>
    <String, dynamic>{
      'code': _$CodeEnumMap[instance.code]!,
      'name': instance.name,
      'description': instance.description,
    };

const _$CodeEnumMap = {
  Code.employee: 'EMPLOYEE',
};
