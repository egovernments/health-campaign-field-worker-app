// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthModel _$$_AuthModelFromJson(Map<String, dynamic> json) => _$_AuthModel(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: json['expires_in'] as int,
      userRequestModel: UserRequestModel.fromJson(
          json['UserRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthModelToJson(_$_AuthModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'UserRequest': instance.userRequestModel,
    };

_$_LoginModel _$$_LoginModelFromJson(Map<String, dynamic> json) =>
    _$_LoginModel(
      username: json['username'] as String,
      password: json['password'] as String,
      userType: json['userType'] as String? ?? 'EMPLOYEE',
      tenantId: json['tenantId'] as String,
      scope: json['scope'] as String? ?? 'read',
      grantType: json['grant_type'] as String? ?? 'password',
    );

Map<String, dynamic> _$$_LoginModelToJson(_$_LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'userType': instance.userType,
      'tenantId': instance.tenantId,
      'scope': instance.scope,
      'grant_type': instance.grantType,
    };

_$_UserRequestModel _$$_UserRequestModelFromJson(Map<String, dynamic> json) =>
    _$_UserRequestModel(
      uuid: json['uuid'] as String,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      emailId: json['emailId'] as String?,
      locale: json['locale'] as String?,
      active: json['active'] as bool?,
      tenantId: json['tenantId'] as String?,
      permanentCity: json['permanentCity'] as String?,
      gender: json['gender'] as String?,
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => UserRoleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserRequestModelToJson(_$_UserRequestModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'userName': instance.userName,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'emailId': instance.emailId,
      'locale': instance.locale,
      'active': instance.active,
      'tenantId': instance.tenantId,
      'permanentCity': instance.permanentCity,
      'gender': instance.gender,
      'roles': instance.roles,
    };

_$_UserRoleModel _$$_UserRoleModelFromJson(Map<String, dynamic> json) =>
    _$_UserRoleModel(
      name: json['name'] as String,
      code: $enumDecode(_$UserRoleCodeEnumEnumMap, json['code']),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$$_UserRoleModelToJson(_$_UserRoleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': _$UserRoleCodeEnumEnumMap[instance.code]!,
      'tenantId': instance.tenantId,
    };

const _$UserRoleCodeEnumEnumMap = {
  UserRoleCodeEnum.registrar: 'REGISTRAR',
  UserRoleCodeEnum.warehouseManager: 'WAREHOUSE_MANAGER',
  UserRoleCodeEnum.systemAdministrator: 'SYSTEM_ADMINISTRATOR',
  UserRoleCodeEnum.supervisor: 'SUPERVISOR',
  UserRoleCodeEnum.distributor: 'DISTRIBUTOR',
  UserRoleCodeEnum.nationalSupervisor: 'NATIONAL_SUPERVISOR',
  UserRoleCodeEnum.provincialSupervisor: 'PROVINCIAL_SUPERVISOR',
  UserRoleCodeEnum.districtSupervisor: 'DISTRICT_SUPERVISOR',
  UserRoleCodeEnum.fieldSupervisor: 'FIELD_SUPERVISOR',
};
