// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => _AuthModel(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
  refreshToken: json['refresh_token'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
  userRequestModel: UserRequestModel.fromJson(
    json['UserRequest'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AuthModelToJson(_AuthModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'UserRequest': instance.userRequestModel,
    };

_ValidateResponseModel _$ValidateResponseModelFromJson(
  Map<String, dynamic> json,
) => _ValidateResponseModel(
  isDuplicateLogin: json['isDuplicateLogin'] as bool,
  existingDeviceToken: json['existingDeviceToken'] as String?,
);

Map<String, dynamic> _$ValidateResponseModelToJson(
  _ValidateResponseModel instance,
) => <String, dynamic>{
  'isDuplicateLogin': instance.isDuplicateLogin,
  'existingDeviceToken': instance.existingDeviceToken,
};

_LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => _LoginModel(
  username: json['username'] as String,
  password: json['password'] as String,
  userType: json['userType'] as String? ?? 'EMPLOYEE',
  tenantId: json['tenantId'] as String,
  scope: json['scope'] as String? ?? 'read',
  grantType: json['grant_type'] as String? ?? 'password',
);

Map<String, dynamic> _$LoginModelToJson(_LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'userType': instance.userType,
      'tenantId': instance.tenantId,
      'scope': instance.scope,
      'grant_type': instance.grantType,
    };

_UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) =>
    _UserRequestModel(
      id: (json['id'] as num?)?.toInt(),
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
      roles:
          (json['roles'] as List<dynamic>?)
              ?.map((e) => UserRoleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserRequestModelToJson(_UserRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
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

_UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) =>
    _UserRoleModel(
      name: json['name'] as String? ?? '',
      code: json['code'] as String,
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$UserRoleModelToJson(_UserRoleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'tenantId': instance.tenantId,
    };
