// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserRequest')
  UserRequestModel get userRequestModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expires_in') int expiresIn,
      @JsonKey(name: 'UserRequest') UserRequestModel userRequestModel});

  $UserRequestModelCopyWith<$Res> get userRequestModel;
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? userRequestModel = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      userRequestModel: null == userRequestModel
          ? _value.userRequestModel
          : userRequestModel // ignore: cast_nullable_to_non_nullable
              as UserRequestModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRequestModelCopyWith<$Res> get userRequestModel {
    return $UserRequestModelCopyWith<$Res>(_value.userRequestModel, (value) {
      return _then(_value.copyWith(userRequestModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthModelCopyWith<$Res> implements $AuthModelCopyWith<$Res> {
  factory _$$_AuthModelCopyWith(
          _$_AuthModel value, $Res Function(_$_AuthModel) then) =
      __$$_AuthModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expires_in') int expiresIn,
      @JsonKey(name: 'UserRequest') UserRequestModel userRequestModel});

  @override
  $UserRequestModelCopyWith<$Res> get userRequestModel;
}

/// @nodoc
class __$$_AuthModelCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$_AuthModel>
    implements _$$_AuthModelCopyWith<$Res> {
  __$$_AuthModelCopyWithImpl(
      _$_AuthModel _value, $Res Function(_$_AuthModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? userRequestModel = null,
  }) {
    return _then(_$_AuthModel(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      userRequestModel: null == userRequestModel
          ? _value.userRequestModel
          : userRequestModel // ignore: cast_nullable_to_non_nullable
              as UserRequestModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthModel implements _AuthModel {
  const _$_AuthModel(
      {@JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'token_type') required this.tokenType,
      @JsonKey(name: 'refresh_token') required this.refreshToken,
      @JsonKey(name: 'expires_in') required this.expiresIn,
      @JsonKey(name: 'UserRequest') required this.userRequestModel});

  factory _$_AuthModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthModelFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @override
  @JsonKey(name: 'UserRequest')
  final UserRequestModel userRequestModel;

  @override
  String toString() {
    return 'AuthModel(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken, expiresIn: $expiresIn, userRequestModel: $userRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.userRequestModel, userRequestModel) ||
                other.userRequestModel == userRequestModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType,
      refreshToken, expiresIn, userRequestModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      __$$_AuthModelCopyWithImpl<_$_AuthModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthModelToJson(
      this,
    );
  }
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel(
      {@JsonKey(name: 'access_token')
          required final String accessToken,
      @JsonKey(name: 'token_type')
          required final String tokenType,
      @JsonKey(name: 'refresh_token')
          required final String refreshToken,
      @JsonKey(name: 'expires_in')
          required final int expiresIn,
      @JsonKey(name: 'UserRequest')
          required final UserRequestModel userRequestModel}) = _$_AuthModel;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$_AuthModel.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  int get expiresIn;
  @override
  @JsonKey(name: 'UserRequest')
  UserRequestModel get userRequestModel;
  @override
  @JsonKey(ignore: true)
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return _LoginModel.fromJson(json);
}

/// @nodoc
mixin _$LoginModel {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  @JsonKey(name: 'grant_type')
  String get grantType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginModelCopyWith<LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModelCopyWith<$Res> {
  factory $LoginModelCopyWith(
          LoginModel value, $Res Function(LoginModel) then) =
      _$LoginModelCopyWithImpl<$Res, LoginModel>;
  @useResult
  $Res call(
      {String username,
      String password,
      String userType,
      String tenantId,
      String scope,
      @JsonKey(name: 'grant_type') String grantType});
}

/// @nodoc
class _$LoginModelCopyWithImpl<$Res, $Val extends LoginModel>
    implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? userType = null,
    Object? tenantId = null,
    Object? scope = null,
    Object? grantType = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginModelCopyWith<$Res>
    implements $LoginModelCopyWith<$Res> {
  factory _$$_LoginModelCopyWith(
          _$_LoginModel value, $Res Function(_$_LoginModel) then) =
      __$$_LoginModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String password,
      String userType,
      String tenantId,
      String scope,
      @JsonKey(name: 'grant_type') String grantType});
}

/// @nodoc
class __$$_LoginModelCopyWithImpl<$Res>
    extends _$LoginModelCopyWithImpl<$Res, _$_LoginModel>
    implements _$$_LoginModelCopyWith<$Res> {
  __$$_LoginModelCopyWithImpl(
      _$_LoginModel _value, $Res Function(_$_LoginModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? userType = null,
    Object? tenantId = null,
    Object? scope = null,
    Object? grantType = null,
  }) {
    return _then(_$_LoginModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginModel implements _LoginModel {
  const _$_LoginModel(
      {required this.username,
      required this.password,
      this.userType = 'EMPLOYEE',
      required this.tenantId,
      this.scope = 'read',
      @JsonKey(name: 'grant_type') this.grantType = 'password'});

  factory _$_LoginModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginModelFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  @JsonKey()
  final String userType;
  @override
  final String tenantId;
  @override
  @JsonKey()
  final String scope;
  @override
  @JsonKey(name: 'grant_type')
  final String grantType;

  @override
  String toString() {
    return 'LoginModel(username: $username, password: $password, userType: $userType, tenantId: $tenantId, scope: $scope, grantType: $grantType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, password, userType, tenantId, scope, grantType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginModelCopyWith<_$_LoginModel> get copyWith =>
      __$$_LoginModelCopyWithImpl<_$_LoginModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginModelToJson(
      this,
    );
  }
}

abstract class _LoginModel implements LoginModel {
  const factory _LoginModel(
      {required final String username,
      required final String password,
      final String userType,
      required final String tenantId,
      final String scope,
      @JsonKey(name: 'grant_type') final String grantType}) = _$_LoginModel;

  factory _LoginModel.fromJson(Map<String, dynamic> json) =
      _$_LoginModel.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String get userType;
  @override
  String get tenantId;
  @override
  String get scope;
  @override
  @JsonKey(name: 'grant_type')
  String get grantType;
  @override
  @JsonKey(ignore: true)
  _$$_LoginModelCopyWith<_$_LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) {
  return _UserRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserRequestModel {
  String get uuid => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get emailId => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;
  String? get permanentCity => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  List<UserRoleModel> get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestModelCopyWith<UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestModelCopyWith<$Res> {
  factory $UserRequestModelCopyWith(
          UserRequestModel value, $Res Function(UserRequestModel) then) =
      _$UserRequestModelCopyWithImpl<$Res, UserRequestModel>;
  @useResult
  $Res call(
      {String uuid,
      String? userName,
      String? name,
      String? mobileNumber,
      String? emailId,
      String? locale,
      bool? active,
      String? tenantId,
      String? permanentCity,
      String? gender,
      List<UserRoleModel> roles});
}

/// @nodoc
class _$UserRequestModelCopyWithImpl<$Res, $Val extends UserRequestModel>
    implements $UserRequestModelCopyWith<$Res> {
  _$UserRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? userName = freezed,
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? locale = freezed,
    Object? active = freezed,
    Object? tenantId = freezed,
    Object? permanentCity = freezed,
    Object? gender = freezed,
    Object? roles = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentCity: freezed == permanentCity
          ? _value.permanentCity
          : permanentCity // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRequestModelCopyWith<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  factory _$$_UserRequestModelCopyWith(
          _$_UserRequestModel value, $Res Function(_$_UserRequestModel) then) =
      __$$_UserRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String? userName,
      String? name,
      String? mobileNumber,
      String? emailId,
      String? locale,
      bool? active,
      String? tenantId,
      String? permanentCity,
      String? gender,
      List<UserRoleModel> roles});
}

/// @nodoc
class __$$_UserRequestModelCopyWithImpl<$Res>
    extends _$UserRequestModelCopyWithImpl<$Res, _$_UserRequestModel>
    implements _$$_UserRequestModelCopyWith<$Res> {
  __$$_UserRequestModelCopyWithImpl(
      _$_UserRequestModel _value, $Res Function(_$_UserRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? userName = freezed,
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? locale = freezed,
    Object? active = freezed,
    Object? tenantId = freezed,
    Object? permanentCity = freezed,
    Object? gender = freezed,
    Object? roles = null,
  }) {
    return _then(_$_UserRequestModel(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentCity: freezed == permanentCity
          ? _value.permanentCity
          : permanentCity // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRequestModel implements _UserRequestModel {
  const _$_UserRequestModel(
      {required this.uuid,
      this.userName,
      this.name,
      this.mobileNumber,
      this.emailId,
      this.locale,
      this.active,
      this.tenantId,
      this.permanentCity,
      this.gender,
      final List<UserRoleModel> roles = const []})
      : _roles = roles;

  factory _$_UserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserRequestModelFromJson(json);

  @override
  final String uuid;
  @override
  final String? userName;
  @override
  final String? name;
  @override
  final String? mobileNumber;
  @override
  final String? emailId;
  @override
  final String? locale;
  @override
  final bool? active;
  @override
  final String? tenantId;
  @override
  final String? permanentCity;
  @override
  final String? gender;
  final List<UserRoleModel> _roles;
  @override
  @JsonKey()
  List<UserRoleModel> get roles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'UserRequestModel(uuid: $uuid, userName: $userName, name: $name, mobileNumber: $mobileNumber, emailId: $emailId, locale: $locale, active: $active, tenantId: $tenantId, permanentCity: $permanentCity, gender: $gender, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRequestModel &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.permanentCity, permanentCity) ||
                other.permanentCity == permanentCity) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      userName,
      name,
      mobileNumber,
      emailId,
      locale,
      active,
      tenantId,
      permanentCity,
      gender,
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRequestModelCopyWith<_$_UserRequestModel> get copyWith =>
      __$$_UserRequestModelCopyWithImpl<_$_UserRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRequestModelToJson(
      this,
    );
  }
}

abstract class _UserRequestModel implements UserRequestModel {
  const factory _UserRequestModel(
      {required final String uuid,
      final String? userName,
      final String? name,
      final String? mobileNumber,
      final String? emailId,
      final String? locale,
      final bool? active,
      final String? tenantId,
      final String? permanentCity,
      final String? gender,
      final List<UserRoleModel> roles}) = _$_UserRequestModel;

  factory _UserRequestModel.fromJson(Map<String, dynamic> json) =
      _$_UserRequestModel.fromJson;

  @override
  String get uuid;
  @override
  String? get userName;
  @override
  String? get name;
  @override
  String? get mobileNumber;
  @override
  String? get emailId;
  @override
  String? get locale;
  @override
  bool? get active;
  @override
  String? get tenantId;
  @override
  String? get permanentCity;
  @override
  String? get gender;
  @override
  List<UserRoleModel> get roles;
  @override
  @JsonKey(ignore: true)
  _$$_UserRequestModelCopyWith<_$_UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) {
  return _UserRoleModel.fromJson(json);
}

/// @nodoc
mixin _$UserRoleModel {
  String get name => throw _privateConstructorUsedError;
  UserRoleCodeEnum get code => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleModelCopyWith<UserRoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleModelCopyWith<$Res> {
  factory $UserRoleModelCopyWith(
          UserRoleModel value, $Res Function(UserRoleModel) then) =
      _$UserRoleModelCopyWithImpl<$Res, UserRoleModel>;
  @useResult
  $Res call({String name, UserRoleCodeEnum code, String? tenantId});
}

/// @nodoc
class _$UserRoleModelCopyWithImpl<$Res, $Val extends UserRoleModel>
    implements $UserRoleModelCopyWith<$Res> {
  _$UserRoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? tenantId = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as UserRoleCodeEnum,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRoleModelCopyWith<$Res>
    implements $UserRoleModelCopyWith<$Res> {
  factory _$$_UserRoleModelCopyWith(
          _$_UserRoleModel value, $Res Function(_$_UserRoleModel) then) =
      __$$_UserRoleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, UserRoleCodeEnum code, String? tenantId});
}

/// @nodoc
class __$$_UserRoleModelCopyWithImpl<$Res>
    extends _$UserRoleModelCopyWithImpl<$Res, _$_UserRoleModel>
    implements _$$_UserRoleModelCopyWith<$Res> {
  __$$_UserRoleModelCopyWithImpl(
      _$_UserRoleModel _value, $Res Function(_$_UserRoleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? tenantId = freezed,
  }) {
    return _then(_$_UserRoleModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as UserRoleCodeEnum,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRoleModel implements _UserRoleModel {
  const _$_UserRoleModel(
      {required this.name, required this.code, this.tenantId});

  factory _$_UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleModelFromJson(json);

  @override
  final String name;
  @override
  final UserRoleCodeEnum code;
  @override
  final String? tenantId;

  @override
  String toString() {
    return 'UserRoleModel(name: $name, code: $code, tenantId: $tenantId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRoleModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRoleModelCopyWith<_$_UserRoleModel> get copyWith =>
      __$$_UserRoleModelCopyWithImpl<_$_UserRoleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleModelToJson(
      this,
    );
  }
}

abstract class _UserRoleModel implements UserRoleModel {
  const factory _UserRoleModel(
      {required final String name,
      required final UserRoleCodeEnum code,
      final String? tenantId}) = _$_UserRoleModel;

  factory _UserRoleModel.fromJson(Map<String, dynamic> json) =
      _$_UserRoleModel.fromJson;

  @override
  String get name;
  @override
  UserRoleCodeEnum get code;
  @override
  String? get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleModelCopyWith<_$_UserRoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
