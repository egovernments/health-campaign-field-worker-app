// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RolesWrapperModelImpl _$$RolesWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RolesWrapperModelImpl(
      tenantId: json['tenantId'] as String,
      moduleName: json['moduleName'] as String,
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => RolesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RolesWrapperModelImplToJson(
        _$RolesWrapperModelImpl instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'moduleName': instance.moduleName,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
    };

_$RolesModelImpl _$$RolesModelImplFromJson(Map<String, dynamic> json) =>
    _$RolesModelImpl(
      code: $enumDecode(_$CodeEnumMap, json['code']),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$RolesModelImplToJson(_$RolesModelImpl instance) =>
    <String, dynamic>{
      'code': _$CodeEnumMap[instance.code]!,
      'name': instance.name,
      'description': instance.description,
    };

const _$CodeEnumMap = {
  Code.employee: 'EMPLOYEE',
};
