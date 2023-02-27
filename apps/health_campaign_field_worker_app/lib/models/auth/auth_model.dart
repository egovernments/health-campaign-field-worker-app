import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'UserRequest') required UserRequestModel userRequestModel,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    required String username,
    required String password,
    @Default('EMPLOYEE') String userType,
    required String tenantId,
    @Default('read') String scope,
    @JsonKey(name: 'grant_type') @Default('password') String grantType,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
class UserRequestModel with _$UserRequestModel {
  const factory UserRequestModel({
    @JsonKey(name: 'uuid') required String uuid,
  }) = _UserRequestModel;

  factory UserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRequestModelFromJson(json);
}
