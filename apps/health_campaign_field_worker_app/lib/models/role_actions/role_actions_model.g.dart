// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_actions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoleActionsWrapperModel _$$_RoleActionsWrapperModelFromJson(
        Map<String, dynamic> json) =>
    _$_RoleActionsWrapperModel(
      tenantId: json['tenantId'] as String,
      moduleName: json['moduleName'] as String,
      roleActions: (json['roleactions'] as List<dynamic>?)
              ?.map((e) => RoleActionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RoleActionsWrapperModelToJson(
        _$_RoleActionsWrapperModel instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'moduleName': instance.moduleName,
      'roleactions': instance.roleActions.map((e) => e.toJson()).toList(),
    };

_$_RoleActionsModel _$$_RoleActionsModelFromJson(Map<String, dynamic> json) =>
    _$_RoleActionsModel(
      roleCode: $enumDecode(_$RoleCodeEnumMap, json['rolecode']),
      actionCode: json['actioncode'] as String,
      actionId: json['actionid'] as int,
      tenantId: json['tenantId'] as String,
    );

Map<String, dynamic> _$$_RoleActionsModelToJson(_$_RoleActionsModel instance) =>
    <String, dynamic>{
      'rolecode': _$RoleCodeEnumMap[instance.roleCode]!,
      'actioncode': instance.actionCode,
      'actionid': instance.actionId,
      'tenantId': instance.tenantId,
    };

const _$RoleCodeEnumMap = {
  RoleCode.employee: 'EMPLOYEE',
};
