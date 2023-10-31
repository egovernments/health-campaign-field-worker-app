// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MdmsRequestModel _$MdmsRequestModelFromJson(Map<String, dynamic> json) {
  return _MdmsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsRequestModel {
  @JsonKey(name: 'MdmsCriteria')
  MdmsCriteriaModel get mdmsCriteria => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsRequestModelCopyWith<MdmsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsRequestModelCopyWith<$Res> {
  factory $MdmsRequestModelCopyWith(
          MdmsRequestModel value, $Res Function(MdmsRequestModel) then) =
      _$MdmsRequestModelCopyWithImpl<$Res, MdmsRequestModel>;
  @useResult
  $Res call({@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel mdmsCriteria});

  $MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria;
}

/// @nodoc
class _$MdmsRequestModelCopyWithImpl<$Res, $Val extends MdmsRequestModel>
    implements $MdmsRequestModelCopyWith<$Res> {
  _$MdmsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdmsCriteria = null,
  }) {
    return _then(_value.copyWith(
      mdmsCriteria: null == mdmsCriteria
          ? _value.mdmsCriteria
          : mdmsCriteria // ignore: cast_nullable_to_non_nullable
              as MdmsCriteriaModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria {
    return $MdmsCriteriaModelCopyWith<$Res>(_value.mdmsCriteria, (value) {
      return _then(_value.copyWith(mdmsCriteria: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MdmsRequestModelCopyWith<$Res>
    implements $MdmsRequestModelCopyWith<$Res> {
  factory _$$_MdmsRequestModelCopyWith(
          _$_MdmsRequestModel value, $Res Function(_$_MdmsRequestModel) then) =
      __$$_MdmsRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel mdmsCriteria});

  @override
  $MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria;
}

/// @nodoc
class __$$_MdmsRequestModelCopyWithImpl<$Res>
    extends _$MdmsRequestModelCopyWithImpl<$Res, _$_MdmsRequestModel>
    implements _$$_MdmsRequestModelCopyWith<$Res> {
  __$$_MdmsRequestModelCopyWithImpl(
      _$_MdmsRequestModel _value, $Res Function(_$_MdmsRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdmsCriteria = null,
  }) {
    return _then(_$_MdmsRequestModel(
      mdmsCriteria: null == mdmsCriteria
          ? _value.mdmsCriteria
          : mdmsCriteria // ignore: cast_nullable_to_non_nullable
              as MdmsCriteriaModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MdmsRequestModel implements _MdmsRequestModel {
  const _$_MdmsRequestModel(
      {@JsonKey(name: 'MdmsCriteria') required this.mdmsCriteria});

  factory _$_MdmsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_MdmsRequestModelFromJson(json);

  @override
  @JsonKey(name: 'MdmsCriteria')
  final MdmsCriteriaModel mdmsCriteria;

  @override
  String toString() {
    return 'MdmsRequestModel(mdmsCriteria: $mdmsCriteria)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MdmsRequestModel &&
            (identical(other.mdmsCriteria, mdmsCriteria) ||
                other.mdmsCriteria == mdmsCriteria));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mdmsCriteria);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MdmsRequestModelCopyWith<_$_MdmsRequestModel> get copyWith =>
      __$$_MdmsRequestModelCopyWithImpl<_$_MdmsRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MdmsRequestModelToJson(
      this,
    );
  }
}

abstract class _MdmsRequestModel implements MdmsRequestModel {
  const factory _MdmsRequestModel(
      {@JsonKey(name: 'MdmsCriteria')
          required final MdmsCriteriaModel mdmsCriteria}) = _$_MdmsRequestModel;

  factory _MdmsRequestModel.fromJson(Map<String, dynamic> json) =
      _$_MdmsRequestModel.fromJson;

  @override
  @JsonKey(name: 'MdmsCriteria')
  MdmsCriteriaModel get mdmsCriteria;
  @override
  @JsonKey(ignore: true)
  _$$_MdmsRequestModelCopyWith<_$_MdmsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MdmsCriteriaModel _$MdmsCriteriaModelFromJson(Map<String, dynamic> json) {
  return _MdmsCriteriaModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsCriteriaModel {
  String get tenantId => throw _privateConstructorUsedError;
  List<MdmsModuleDetailModel> get moduleDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsCriteriaModelCopyWith<MdmsCriteriaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsCriteriaModelCopyWith<$Res> {
  factory $MdmsCriteriaModelCopyWith(
          MdmsCriteriaModel value, $Res Function(MdmsCriteriaModel) then) =
      _$MdmsCriteriaModelCopyWithImpl<$Res, MdmsCriteriaModel>;
  @useResult
  $Res call({String tenantId, List<MdmsModuleDetailModel> moduleDetails});
}

/// @nodoc
class _$MdmsCriteriaModelCopyWithImpl<$Res, $Val extends MdmsCriteriaModel>
    implements $MdmsCriteriaModelCopyWith<$Res> {
  _$MdmsCriteriaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleDetails = null,
  }) {
    return _then(_value.copyWith(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleDetails: null == moduleDetails
          ? _value.moduleDetails
          : moduleDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsModuleDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MdmsCriteriaModelCopyWith<$Res>
    implements $MdmsCriteriaModelCopyWith<$Res> {
  factory _$$_MdmsCriteriaModelCopyWith(_$_MdmsCriteriaModel value,
          $Res Function(_$_MdmsCriteriaModel) then) =
      __$$_MdmsCriteriaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tenantId, List<MdmsModuleDetailModel> moduleDetails});
}

/// @nodoc
class __$$_MdmsCriteriaModelCopyWithImpl<$Res>
    extends _$MdmsCriteriaModelCopyWithImpl<$Res, _$_MdmsCriteriaModel>
    implements _$$_MdmsCriteriaModelCopyWith<$Res> {
  __$$_MdmsCriteriaModelCopyWithImpl(
      _$_MdmsCriteriaModel _value, $Res Function(_$_MdmsCriteriaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleDetails = null,
  }) {
    return _then(_$_MdmsCriteriaModel(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleDetails: null == moduleDetails
          ? _value._moduleDetails
          : moduleDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsModuleDetailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MdmsCriteriaModel implements _MdmsCriteriaModel {
  const _$_MdmsCriteriaModel(
      {required this.tenantId,
      required final List<MdmsModuleDetailModel> moduleDetails})
      : _moduleDetails = moduleDetails;

  factory _$_MdmsCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$$_MdmsCriteriaModelFromJson(json);

  @override
  final String tenantId;
  final List<MdmsModuleDetailModel> _moduleDetails;
  @override
  List<MdmsModuleDetailModel> get moduleDetails {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moduleDetails);
  }

  @override
  String toString() {
    return 'MdmsCriteriaModel(tenantId: $tenantId, moduleDetails: $moduleDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MdmsCriteriaModel &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            const DeepCollectionEquality()
                .equals(other._moduleDetails, _moduleDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tenantId,
      const DeepCollectionEquality().hash(_moduleDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MdmsCriteriaModelCopyWith<_$_MdmsCriteriaModel> get copyWith =>
      __$$_MdmsCriteriaModelCopyWithImpl<_$_MdmsCriteriaModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MdmsCriteriaModelToJson(
      this,
    );
  }
}

abstract class _MdmsCriteriaModel implements MdmsCriteriaModel {
  const factory _MdmsCriteriaModel(
          {required final String tenantId,
          required final List<MdmsModuleDetailModel> moduleDetails}) =
      _$_MdmsCriteriaModel;

  factory _MdmsCriteriaModel.fromJson(Map<String, dynamic> json) =
      _$_MdmsCriteriaModel.fromJson;

  @override
  String get tenantId;
  @override
  List<MdmsModuleDetailModel> get moduleDetails;
  @override
  @JsonKey(ignore: true)
  _$$_MdmsCriteriaModelCopyWith<_$_MdmsCriteriaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MdmsModuleDetailModel _$MdmsModuleDetailModelFromJson(
    Map<String, dynamic> json) {
  return _MdmsModuleDetailModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsModuleDetailModel {
  String get moduleName => throw _privateConstructorUsedError;
  List<MdmsMasterDetailModel> get masterDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsModuleDetailModelCopyWith<MdmsModuleDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsModuleDetailModelCopyWith<$Res> {
  factory $MdmsModuleDetailModelCopyWith(MdmsModuleDetailModel value,
          $Res Function(MdmsModuleDetailModel) then) =
      _$MdmsModuleDetailModelCopyWithImpl<$Res, MdmsModuleDetailModel>;
  @useResult
  $Res call({String moduleName, List<MdmsMasterDetailModel> masterDetails});
}

/// @nodoc
class _$MdmsModuleDetailModelCopyWithImpl<$Res,
        $Val extends MdmsModuleDetailModel>
    implements $MdmsModuleDetailModelCopyWith<$Res> {
  _$MdmsModuleDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleName = null,
    Object? masterDetails = null,
  }) {
    return _then(_value.copyWith(
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      masterDetails: null == masterDetails
          ? _value.masterDetails
          : masterDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsMasterDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MdmsModuleDetailModelCopyWith<$Res>
    implements $MdmsModuleDetailModelCopyWith<$Res> {
  factory _$$_MdmsModuleDetailModelCopyWith(_$_MdmsModuleDetailModel value,
          $Res Function(_$_MdmsModuleDetailModel) then) =
      __$$_MdmsModuleDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String moduleName, List<MdmsMasterDetailModel> masterDetails});
}

/// @nodoc
class __$$_MdmsModuleDetailModelCopyWithImpl<$Res>
    extends _$MdmsModuleDetailModelCopyWithImpl<$Res, _$_MdmsModuleDetailModel>
    implements _$$_MdmsModuleDetailModelCopyWith<$Res> {
  __$$_MdmsModuleDetailModelCopyWithImpl(_$_MdmsModuleDetailModel _value,
      $Res Function(_$_MdmsModuleDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleName = null,
    Object? masterDetails = null,
  }) {
    return _then(_$_MdmsModuleDetailModel(
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      masterDetails: null == masterDetails
          ? _value._masterDetails
          : masterDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsMasterDetailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MdmsModuleDetailModel implements _MdmsModuleDetailModel {
  const _$_MdmsModuleDetailModel(
      {required this.moduleName,
      required final List<MdmsMasterDetailModel> masterDetails})
      : _masterDetails = masterDetails;

  factory _$_MdmsModuleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_MdmsModuleDetailModelFromJson(json);

  @override
  final String moduleName;
  final List<MdmsMasterDetailModel> _masterDetails;
  @override
  List<MdmsMasterDetailModel> get masterDetails {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_masterDetails);
  }

  @override
  String toString() {
    return 'MdmsModuleDetailModel(moduleName: $moduleName, masterDetails: $masterDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MdmsModuleDetailModel &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            const DeepCollectionEquality()
                .equals(other._masterDetails, _masterDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, moduleName,
      const DeepCollectionEquality().hash(_masterDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MdmsModuleDetailModelCopyWith<_$_MdmsModuleDetailModel> get copyWith =>
      __$$_MdmsModuleDetailModelCopyWithImpl<_$_MdmsModuleDetailModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MdmsModuleDetailModelToJson(
      this,
    );
  }
}

abstract class _MdmsModuleDetailModel implements MdmsModuleDetailModel {
  const factory _MdmsModuleDetailModel(
          {required final String moduleName,
          required final List<MdmsMasterDetailModel> masterDetails}) =
      _$_MdmsModuleDetailModel;

  factory _MdmsModuleDetailModel.fromJson(Map<String, dynamic> json) =
      _$_MdmsModuleDetailModel.fromJson;

  @override
  String get moduleName;
  @override
  List<MdmsMasterDetailModel> get masterDetails;
  @override
  @JsonKey(ignore: true)
  _$$_MdmsModuleDetailModelCopyWith<_$_MdmsModuleDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MdmsMasterDetailModel _$MdmsMasterDetailModelFromJson(
    Map<String, dynamic> json) {
  return _MdmsMasterDetailModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsMasterDetailModel {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsMasterDetailModelCopyWith<MdmsMasterDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsMasterDetailModelCopyWith<$Res> {
  factory $MdmsMasterDetailModelCopyWith(MdmsMasterDetailModel value,
          $Res Function(MdmsMasterDetailModel) then) =
      _$MdmsMasterDetailModelCopyWithImpl<$Res, MdmsMasterDetailModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$MdmsMasterDetailModelCopyWithImpl<$Res,
        $Val extends MdmsMasterDetailModel>
    implements $MdmsMasterDetailModelCopyWith<$Res> {
  _$MdmsMasterDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MdmsMasterDetailModelCopyWith<$Res>
    implements $MdmsMasterDetailModelCopyWith<$Res> {
  factory _$$_MdmsMasterDetailModelCopyWith(_$_MdmsMasterDetailModel value,
          $Res Function(_$_MdmsMasterDetailModel) then) =
      __$$_MdmsMasterDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_MdmsMasterDetailModelCopyWithImpl<$Res>
    extends _$MdmsMasterDetailModelCopyWithImpl<$Res, _$_MdmsMasterDetailModel>
    implements _$$_MdmsMasterDetailModelCopyWith<$Res> {
  __$$_MdmsMasterDetailModelCopyWithImpl(_$_MdmsMasterDetailModel _value,
      $Res Function(_$_MdmsMasterDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_MdmsMasterDetailModel(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MdmsMasterDetailModel implements _MdmsMasterDetailModel {
  const _$_MdmsMasterDetailModel(this.name);

  factory _$_MdmsMasterDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_MdmsMasterDetailModelFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'MdmsMasterDetailModel(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MdmsMasterDetailModel &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MdmsMasterDetailModelCopyWith<_$_MdmsMasterDetailModel> get copyWith =>
      __$$_MdmsMasterDetailModelCopyWithImpl<_$_MdmsMasterDetailModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MdmsMasterDetailModelToJson(
      this,
    );
  }
}

abstract class _MdmsMasterDetailModel implements MdmsMasterDetailModel {
  const factory _MdmsMasterDetailModel(final String name) =
      _$_MdmsMasterDetailModel;

  factory _MdmsMasterDetailModel.fromJson(Map<String, dynamic> json) =
      _$_MdmsMasterDetailModel.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_MdmsMasterDetailModelCopyWith<_$_MdmsMasterDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AppConfigPrimaryWrapperModel _$AppConfigPrimaryWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _AppConfigPrimaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$AppConfigPrimaryWrapperModel {
  @JsonKey(name: 'HCM-FIELD-APP-CONFIG')
  AppConfigSecondaryWrapperModel? get appConfig =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'module-version')
  RowVersionWrapperModel? get rowVersions => throw _privateConstructorUsedError;
  @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
  SymptomsTypesSecondaryWrapperModel? get symptomsTypes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'HCM-REFERRAL-REASONS')
  ReferralReasonsWrapperModel? get referralReasons =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigPrimaryWrapperModelCopyWith<AppConfigPrimaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigPrimaryWrapperModelCopyWith<$Res> {
  factory $AppConfigPrimaryWrapperModelCopyWith(
          AppConfigPrimaryWrapperModel value,
          $Res Function(AppConfigPrimaryWrapperModel) then) =
      _$AppConfigPrimaryWrapperModelCopyWithImpl<$Res,
          AppConfigPrimaryWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-FIELD-APP-CONFIG')
          AppConfigSecondaryWrapperModel? appConfig,
      @JsonKey(name: 'module-version')
          RowVersionWrapperModel? rowVersions,
      @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
          SymptomsTypesSecondaryWrapperModel? symptomsTypes,
      @JsonKey(name: 'HCM-REFERRAL-REASONS')
          ReferralReasonsWrapperModel? referralReasons});

  $AppConfigSecondaryWrapperModelCopyWith<$Res>? get appConfig;
  $RowVersionWrapperModelCopyWith<$Res>? get rowVersions;
  $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes;
  $ReferralReasonsWrapperModelCopyWith<$Res>? get referralReasons;
}

/// @nodoc
class _$AppConfigPrimaryWrapperModelCopyWithImpl<$Res,
        $Val extends AppConfigPrimaryWrapperModel>
    implements $AppConfigPrimaryWrapperModelCopyWith<$Res> {
  _$AppConfigPrimaryWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = freezed,
    Object? rowVersions = freezed,
    Object? symptomsTypes = freezed,
    Object? referralReasons = freezed,
  }) {
    return _then(_value.copyWith(
      appConfig: freezed == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfigSecondaryWrapperModel?,
      rowVersions: freezed == rowVersions
          ? _value.rowVersions
          : rowVersions // ignore: cast_nullable_to_non_nullable
              as RowVersionWrapperModel?,
      symptomsTypes: freezed == symptomsTypes
          ? _value.symptomsTypes
          : symptomsTypes // ignore: cast_nullable_to_non_nullable
              as SymptomsTypesSecondaryWrapperModel?,
      referralReasons: freezed == referralReasons
          ? _value.referralReasons
          : referralReasons // ignore: cast_nullable_to_non_nullable
              as ReferralReasonsWrapperModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppConfigSecondaryWrapperModelCopyWith<$Res>? get appConfig {
    if (_value.appConfig == null) {
      return null;
    }

    return $AppConfigSecondaryWrapperModelCopyWith<$Res>(_value.appConfig!,
        (value) {
      return _then(_value.copyWith(appConfig: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RowVersionWrapperModelCopyWith<$Res>? get rowVersions {
    if (_value.rowVersions == null) {
      return null;
    }

    return $RowVersionWrapperModelCopyWith<$Res>(_value.rowVersions!, (value) {
      return _then(_value.copyWith(rowVersions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes {
    if (_value.symptomsTypes == null) {
      return null;
    }

    return $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>(
        _value.symptomsTypes!, (value) {
      return _then(_value.copyWith(symptomsTypes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferralReasonsWrapperModelCopyWith<$Res>? get referralReasons {
    if (_value.referralReasons == null) {
      return null;
    }

    return $ReferralReasonsWrapperModelCopyWith<$Res>(_value.referralReasons!,
        (value) {
      return _then(_value.copyWith(referralReasons: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppConfigPrimaryWrapperModelCopyWith<$Res>
    implements $AppConfigPrimaryWrapperModelCopyWith<$Res> {
  factory _$$_AppConfigPrimaryWrapperModelCopyWith(
          _$_AppConfigPrimaryWrapperModel value,
          $Res Function(_$_AppConfigPrimaryWrapperModel) then) =
      __$$_AppConfigPrimaryWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-FIELD-APP-CONFIG')
          AppConfigSecondaryWrapperModel? appConfig,
      @JsonKey(name: 'module-version')
          RowVersionWrapperModel? rowVersions,
      @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
          SymptomsTypesSecondaryWrapperModel? symptomsTypes,
      @JsonKey(name: 'HCM-REFERRAL-REASONS')
          ReferralReasonsWrapperModel? referralReasons});

  @override
  $AppConfigSecondaryWrapperModelCopyWith<$Res>? get appConfig;
  @override
  $RowVersionWrapperModelCopyWith<$Res>? get rowVersions;
  @override
  $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes;
  @override
  $ReferralReasonsWrapperModelCopyWith<$Res>? get referralReasons;
}

/// @nodoc
class __$$_AppConfigPrimaryWrapperModelCopyWithImpl<$Res>
    extends _$AppConfigPrimaryWrapperModelCopyWithImpl<$Res,
        _$_AppConfigPrimaryWrapperModel>
    implements _$$_AppConfigPrimaryWrapperModelCopyWith<$Res> {
  __$$_AppConfigPrimaryWrapperModelCopyWithImpl(
      _$_AppConfigPrimaryWrapperModel _value,
      $Res Function(_$_AppConfigPrimaryWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = freezed,
    Object? rowVersions = freezed,
    Object? symptomsTypes = freezed,
    Object? referralReasons = freezed,
  }) {
    return _then(_$_AppConfigPrimaryWrapperModel(
      appConfig: freezed == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfigSecondaryWrapperModel?,
      rowVersions: freezed == rowVersions
          ? _value.rowVersions
          : rowVersions // ignore: cast_nullable_to_non_nullable
              as RowVersionWrapperModel?,
      symptomsTypes: freezed == symptomsTypes
          ? _value.symptomsTypes
          : symptomsTypes // ignore: cast_nullable_to_non_nullable
              as SymptomsTypesSecondaryWrapperModel?,
      referralReasons: freezed == referralReasons
          ? _value.referralReasons
          : referralReasons // ignore: cast_nullable_to_non_nullable
              as ReferralReasonsWrapperModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppConfigPrimaryWrapperModel implements _AppConfigPrimaryWrapperModel {
  const _$_AppConfigPrimaryWrapperModel(
      {@JsonKey(name: 'HCM-FIELD-APP-CONFIG') this.appConfig,
      @JsonKey(name: 'module-version') this.rowVersions,
      @JsonKey(name: 'HCM-SYMPTOMS-TYPES') this.symptomsTypes,
      @JsonKey(name: 'HCM-REFERRAL-REASONS') this.referralReasons});

  factory _$_AppConfigPrimaryWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppConfigPrimaryWrapperModelFromJson(json);

  @override
  @JsonKey(name: 'HCM-FIELD-APP-CONFIG')
  final AppConfigSecondaryWrapperModel? appConfig;
  @override
  @JsonKey(name: 'module-version')
  final RowVersionWrapperModel? rowVersions;
  @override
  @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
  final SymptomsTypesSecondaryWrapperModel? symptomsTypes;
  @override
  @JsonKey(name: 'HCM-REFERRAL-REASONS')
  final ReferralReasonsWrapperModel? referralReasons;

  @override
  String toString() {
    return 'AppConfigPrimaryWrapperModel(appConfig: $appConfig, rowVersions: $rowVersions, symptomsTypes: $symptomsTypes, referralReasons: $referralReasons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppConfigPrimaryWrapperModel &&
            (identical(other.appConfig, appConfig) ||
                other.appConfig == appConfig) &&
            (identical(other.rowVersions, rowVersions) ||
                other.rowVersions == rowVersions) &&
            (identical(other.symptomsTypes, symptomsTypes) ||
                other.symptomsTypes == symptomsTypes) &&
            (identical(other.referralReasons, referralReasons) ||
                other.referralReasons == referralReasons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, appConfig, rowVersions, symptomsTypes, referralReasons);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppConfigPrimaryWrapperModelCopyWith<_$_AppConfigPrimaryWrapperModel>
      get copyWith => __$$_AppConfigPrimaryWrapperModelCopyWithImpl<
          _$_AppConfigPrimaryWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppConfigPrimaryWrapperModelToJson(
      this,
    );
  }
}

abstract class _AppConfigPrimaryWrapperModel
    implements AppConfigPrimaryWrapperModel {
  const factory _AppConfigPrimaryWrapperModel(
          {@JsonKey(name: 'HCM-FIELD-APP-CONFIG')
              final AppConfigSecondaryWrapperModel? appConfig,
          @JsonKey(name: 'module-version')
              final RowVersionWrapperModel? rowVersions,
          @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
              final SymptomsTypesSecondaryWrapperModel? symptomsTypes,
          @JsonKey(name: 'HCM-REFERRAL-REASONS')
              final ReferralReasonsWrapperModel? referralReasons}) =
      _$_AppConfigPrimaryWrapperModel;

  factory _AppConfigPrimaryWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_AppConfigPrimaryWrapperModel.fromJson;

  @override
  @JsonKey(name: 'HCM-FIELD-APP-CONFIG')
  AppConfigSecondaryWrapperModel? get appConfig;
  @override
  @JsonKey(name: 'module-version')
  RowVersionWrapperModel? get rowVersions;
  @override
  @JsonKey(name: 'HCM-SYMPTOMS-TYPES')
  SymptomsTypesSecondaryWrapperModel? get symptomsTypes;
  @override
  @JsonKey(name: 'HCM-REFERRAL-REASONS')
  ReferralReasonsWrapperModel? get referralReasons;
  @override
  @JsonKey(ignore: true)
  _$$_AppConfigPrimaryWrapperModelCopyWith<_$_AppConfigPrimaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

AppConfigSecondaryWrapperModel _$AppConfigSecondaryWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _AppConfigSecondaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$AppConfigSecondaryWrapperModel {
  @JsonKey(name: 'appConfig')
  List<AppConfig>? get appConfiglist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigSecondaryWrapperModelCopyWith<AppConfigSecondaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigSecondaryWrapperModelCopyWith<$Res> {
  factory $AppConfigSecondaryWrapperModelCopyWith(
          AppConfigSecondaryWrapperModel value,
          $Res Function(AppConfigSecondaryWrapperModel) then) =
      _$AppConfigSecondaryWrapperModelCopyWithImpl<$Res,
          AppConfigSecondaryWrapperModel>;
  @useResult
  $Res call({@JsonKey(name: 'appConfig') List<AppConfig>? appConfiglist});
}

/// @nodoc
class _$AppConfigSecondaryWrapperModelCopyWithImpl<$Res,
        $Val extends AppConfigSecondaryWrapperModel>
    implements $AppConfigSecondaryWrapperModelCopyWith<$Res> {
  _$AppConfigSecondaryWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiglist = freezed,
  }) {
    return _then(_value.copyWith(
      appConfiglist: freezed == appConfiglist
          ? _value.appConfiglist
          : appConfiglist // ignore: cast_nullable_to_non_nullable
              as List<AppConfig>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppConfigSecondaryWrapperModelCopyWith<$Res>
    implements $AppConfigSecondaryWrapperModelCopyWith<$Res> {
  factory _$$_AppConfigSecondaryWrapperModelCopyWith(
          _$_AppConfigSecondaryWrapperModel value,
          $Res Function(_$_AppConfigSecondaryWrapperModel) then) =
      __$$_AppConfigSecondaryWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'appConfig') List<AppConfig>? appConfiglist});
}

/// @nodoc
class __$$_AppConfigSecondaryWrapperModelCopyWithImpl<$Res>
    extends _$AppConfigSecondaryWrapperModelCopyWithImpl<$Res,
        _$_AppConfigSecondaryWrapperModel>
    implements _$$_AppConfigSecondaryWrapperModelCopyWith<$Res> {
  __$$_AppConfigSecondaryWrapperModelCopyWithImpl(
      _$_AppConfigSecondaryWrapperModel _value,
      $Res Function(_$_AppConfigSecondaryWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiglist = freezed,
  }) {
    return _then(_$_AppConfigSecondaryWrapperModel(
      appConfiglist: freezed == appConfiglist
          ? _value._appConfiglist
          : appConfiglist // ignore: cast_nullable_to_non_nullable
              as List<AppConfig>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppConfigSecondaryWrapperModel
    implements _AppConfigSecondaryWrapperModel {
  const _$_AppConfigSecondaryWrapperModel(
      {@JsonKey(name: 'appConfig') final List<AppConfig>? appConfiglist})
      : _appConfiglist = appConfiglist;

  factory _$_AppConfigSecondaryWrapperModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_AppConfigSecondaryWrapperModelFromJson(json);

  final List<AppConfig>? _appConfiglist;
  @override
  @JsonKey(name: 'appConfig')
  List<AppConfig>? get appConfiglist {
    final value = _appConfiglist;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppConfigSecondaryWrapperModel(appConfiglist: $appConfiglist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppConfigSecondaryWrapperModel &&
            const DeepCollectionEquality()
                .equals(other._appConfiglist, _appConfiglist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_appConfiglist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppConfigSecondaryWrapperModelCopyWith<_$_AppConfigSecondaryWrapperModel>
      get copyWith => __$$_AppConfigSecondaryWrapperModelCopyWithImpl<
          _$_AppConfigSecondaryWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppConfigSecondaryWrapperModelToJson(
      this,
    );
  }
}

abstract class _AppConfigSecondaryWrapperModel
    implements AppConfigSecondaryWrapperModel {
  const factory _AppConfigSecondaryWrapperModel(
          {@JsonKey(name: 'appConfig') final List<AppConfig>? appConfiglist}) =
      _$_AppConfigSecondaryWrapperModel;

  factory _AppConfigSecondaryWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_AppConfigSecondaryWrapperModel.fromJson;

  @override
  @JsonKey(name: 'appConfig')
  List<AppConfig>? get appConfiglist;
  @override
  @JsonKey(ignore: true)
  _$$_AppConfigSecondaryWrapperModelCopyWith<_$_AppConfigSecondaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

RowVersionWrapperModel _$RowVersionWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _RowVersionWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$RowVersionWrapperModel {
  @JsonKey(name: 'ROW_VERSIONS')
  List<RowVersions>? get rowVersionslist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RowVersionWrapperModelCopyWith<RowVersionWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowVersionWrapperModelCopyWith<$Res> {
  factory $RowVersionWrapperModelCopyWith(RowVersionWrapperModel value,
          $Res Function(RowVersionWrapperModel) then) =
      _$RowVersionWrapperModelCopyWithImpl<$Res, RowVersionWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? rowVersionslist});
}

/// @nodoc
class _$RowVersionWrapperModelCopyWithImpl<$Res,
        $Val extends RowVersionWrapperModel>
    implements $RowVersionWrapperModelCopyWith<$Res> {
  _$RowVersionWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowVersionslist = freezed,
  }) {
    return _then(_value.copyWith(
      rowVersionslist: freezed == rowVersionslist
          ? _value.rowVersionslist
          : rowVersionslist // ignore: cast_nullable_to_non_nullable
              as List<RowVersions>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RowVersionWrapperModelCopyWith<$Res>
    implements $RowVersionWrapperModelCopyWith<$Res> {
  factory _$$_RowVersionWrapperModelCopyWith(_$_RowVersionWrapperModel value,
          $Res Function(_$_RowVersionWrapperModel) then) =
      __$$_RowVersionWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? rowVersionslist});
}

/// @nodoc
class __$$_RowVersionWrapperModelCopyWithImpl<$Res>
    extends _$RowVersionWrapperModelCopyWithImpl<$Res,
        _$_RowVersionWrapperModel>
    implements _$$_RowVersionWrapperModelCopyWith<$Res> {
  __$$_RowVersionWrapperModelCopyWithImpl(_$_RowVersionWrapperModel _value,
      $Res Function(_$_RowVersionWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowVersionslist = freezed,
  }) {
    return _then(_$_RowVersionWrapperModel(
      rowVersionslist: freezed == rowVersionslist
          ? _value._rowVersionslist
          : rowVersionslist // ignore: cast_nullable_to_non_nullable
              as List<RowVersions>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RowVersionWrapperModel implements _RowVersionWrapperModel {
  const _$_RowVersionWrapperModel(
      {@JsonKey(name: 'ROW_VERSIONS') final List<RowVersions>? rowVersionslist})
      : _rowVersionslist = rowVersionslist;

  factory _$_RowVersionWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$$_RowVersionWrapperModelFromJson(json);

  final List<RowVersions>? _rowVersionslist;
  @override
  @JsonKey(name: 'ROW_VERSIONS')
  List<RowVersions>? get rowVersionslist {
    final value = _rowVersionslist;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RowVersionWrapperModel(rowVersionslist: $rowVersionslist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RowVersionWrapperModel &&
            const DeepCollectionEquality()
                .equals(other._rowVersionslist, _rowVersionslist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rowVersionslist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RowVersionWrapperModelCopyWith<_$_RowVersionWrapperModel> get copyWith =>
      __$$_RowVersionWrapperModelCopyWithImpl<_$_RowVersionWrapperModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RowVersionWrapperModelToJson(
      this,
    );
  }
}

abstract class _RowVersionWrapperModel implements RowVersionWrapperModel {
  const factory _RowVersionWrapperModel(
          {@JsonKey(name: 'ROW_VERSIONS')
              final List<RowVersions>? rowVersionslist}) =
      _$_RowVersionWrapperModel;

  factory _RowVersionWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_RowVersionWrapperModel.fromJson;

  @override
  @JsonKey(name: 'ROW_VERSIONS')
  List<RowVersions>? get rowVersionslist;
  @override
  @JsonKey(ignore: true)
  _$$_RowVersionWrapperModelCopyWith<_$_RowVersionWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  @JsonKey(name: 'NETWORK_DETECTION')
  String get networkDetection => throw _privateConstructorUsedError;
  @JsonKey(name: 'PERSISTENCE_MODE')
  String get persistenceMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'SYNC_METHOD')
  String get syncMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'SYNC_TRIGGER')
  String get syncTrigger => throw _privateConstructorUsedError;
  @JsonKey(name: 'LANGUAGES')
  List<Languages> get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'TENANT_ID')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
  double? get maxRadius => throw _privateConstructorUsedError;
  @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdDeletionReasonOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get bandWidthBatchSize =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
  BackgroundServiceConfig? get backgroundServiceConfig =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdMemberDeletionReasonOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
  List<GenderOptions> get genderOptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'CHECKLIST_TYPES')
  List<CheckListTypes> get checklistTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
  List<IdTypeOptions> get idTypeOptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
  List<DeliveryCommentOptions> get deliveryCommentOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'BACKEND_INTERFACE')
  BackendInterface get backendInterface => throw _privateConstructorUsedError;
  @JsonKey(name: 'CALL_SUPPORT')
  List<CallSupportList>? get callSupportOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'TRANSPORT_TYPES')
  List<TransportTypes> get transportTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: 'NETWORK_DETECTION')
          String networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE')
          String persistenceMode,
      @JsonKey(name: 'SYNC_METHOD')
          String syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER')
          String syncTrigger,
      @JsonKey(name: 'LANGUAGES')
          List<Languages> languages,
      @JsonKey(name: 'TENANT_ID')
          String? tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
          double? maxRadius,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
          List<DeletionReasonOptions> householdDeletionReasonOptions,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
          List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
          BackgroundServiceConfig? backgroundServiceConfig,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
          List<DeletionReasonOptions> householdMemberDeletionReasonOptions,
      @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
          List<GenderOptions> genderOptions,
      @JsonKey(name: 'CHECKLIST_TYPES')
          List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
          List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
          List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
          BackendInterface backendInterface,
      @JsonKey(name: 'CALL_SUPPORT')
          List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES')
          List<TransportTypes> transportTypes});

  $BackgroundServiceConfigCopyWith<$Res>? get backgroundServiceConfig;
  $BackendInterfaceCopyWith<$Res> get backendInterface;
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkDetection = null,
    Object? persistenceMode = null,
    Object? syncMethod = null,
    Object? syncTrigger = null,
    Object? languages = null,
    Object? tenantId = freezed,
    Object? maxRadius = freezed,
    Object? householdDeletionReasonOptions = null,
    Object? bandWidthBatchSize = null,
    Object? backgroundServiceConfig = freezed,
    Object? householdMemberDeletionReasonOptions = null,
    Object? genderOptions = null,
    Object? checklistTypes = null,
    Object? idTypeOptions = null,
    Object? deliveryCommentOptions = null,
    Object? backendInterface = null,
    Object? callSupportOptions = freezed,
    Object? transportTypes = null,
  }) {
    return _then(_value.copyWith(
      networkDetection: null == networkDetection
          ? _value.networkDetection
          : networkDetection // ignore: cast_nullable_to_non_nullable
              as String,
      persistenceMode: null == persistenceMode
          ? _value.persistenceMode
          : persistenceMode // ignore: cast_nullable_to_non_nullable
              as String,
      syncMethod: null == syncMethod
          ? _value.syncMethod
          : syncMethod // ignore: cast_nullable_to_non_nullable
              as String,
      syncTrigger: null == syncTrigger
          ? _value.syncTrigger
          : syncTrigger // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Languages>,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      maxRadius: freezed == maxRadius
          ? _value.maxRadius
          : maxRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      householdDeletionReasonOptions: null == householdDeletionReasonOptions
          ? _value.householdDeletionReasonOptions
          : householdDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      bandWidthBatchSize: null == bandWidthBatchSize
          ? _value.bandWidthBatchSize
          : bandWidthBatchSize // ignore: cast_nullable_to_non_nullable
              as List<BandWidthBatchSize>,
      backgroundServiceConfig: freezed == backgroundServiceConfig
          ? _value.backgroundServiceConfig
          : backgroundServiceConfig // ignore: cast_nullable_to_non_nullable
              as BackgroundServiceConfig?,
      householdMemberDeletionReasonOptions: null ==
              householdMemberDeletionReasonOptions
          ? _value.householdMemberDeletionReasonOptions
          : householdMemberDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      genderOptions: null == genderOptions
          ? _value.genderOptions
          : genderOptions // ignore: cast_nullable_to_non_nullable
              as List<GenderOptions>,
      checklistTypes: null == checklistTypes
          ? _value.checklistTypes
          : checklistTypes // ignore: cast_nullable_to_non_nullable
              as List<CheckListTypes>,
      idTypeOptions: null == idTypeOptions
          ? _value.idTypeOptions
          : idTypeOptions // ignore: cast_nullable_to_non_nullable
              as List<IdTypeOptions>,
      deliveryCommentOptions: null == deliveryCommentOptions
          ? _value.deliveryCommentOptions
          : deliveryCommentOptions // ignore: cast_nullable_to_non_nullable
              as List<DeliveryCommentOptions>,
      backendInterface: null == backendInterface
          ? _value.backendInterface
          : backendInterface // ignore: cast_nullable_to_non_nullable
              as BackendInterface,
      callSupportOptions: freezed == callSupportOptions
          ? _value.callSupportOptions
          : callSupportOptions // ignore: cast_nullable_to_non_nullable
              as List<CallSupportList>?,
      transportTypes: null == transportTypes
          ? _value.transportTypes
          : transportTypes // ignore: cast_nullable_to_non_nullable
              as List<TransportTypes>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BackgroundServiceConfigCopyWith<$Res>? get backgroundServiceConfig {
    if (_value.backgroundServiceConfig == null) {
      return null;
    }

    return $BackgroundServiceConfigCopyWith<$Res>(
        _value.backgroundServiceConfig!, (value) {
      return _then(_value.copyWith(backgroundServiceConfig: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BackendInterfaceCopyWith<$Res> get backendInterface {
    return $BackendInterfaceCopyWith<$Res>(_value.backendInterface, (value) {
      return _then(_value.copyWith(backendInterface: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$$_AppConfigCopyWith(
          _$_AppConfig value, $Res Function(_$_AppConfig) then) =
      __$$_AppConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'NETWORK_DETECTION')
          String networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE')
          String persistenceMode,
      @JsonKey(name: 'SYNC_METHOD')
          String syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER')
          String syncTrigger,
      @JsonKey(name: 'LANGUAGES')
          List<Languages> languages,
      @JsonKey(name: 'TENANT_ID')
          String? tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
          double? maxRadius,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
          List<DeletionReasonOptions> householdDeletionReasonOptions,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
          List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
          BackgroundServiceConfig? backgroundServiceConfig,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
          List<DeletionReasonOptions> householdMemberDeletionReasonOptions,
      @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
          List<GenderOptions> genderOptions,
      @JsonKey(name: 'CHECKLIST_TYPES')
          List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
          List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
          List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
          BackendInterface backendInterface,
      @JsonKey(name: 'CALL_SUPPORT')
          List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES')
          List<TransportTypes> transportTypes});

  @override
  $BackgroundServiceConfigCopyWith<$Res>? get backgroundServiceConfig;
  @override
  $BackendInterfaceCopyWith<$Res> get backendInterface;
}

/// @nodoc
class __$$_AppConfigCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$_AppConfig>
    implements _$$_AppConfigCopyWith<$Res> {
  __$$_AppConfigCopyWithImpl(
      _$_AppConfig _value, $Res Function(_$_AppConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkDetection = null,
    Object? persistenceMode = null,
    Object? syncMethod = null,
    Object? syncTrigger = null,
    Object? languages = null,
    Object? tenantId = freezed,
    Object? maxRadius = freezed,
    Object? householdDeletionReasonOptions = null,
    Object? bandWidthBatchSize = null,
    Object? backgroundServiceConfig = freezed,
    Object? householdMemberDeletionReasonOptions = null,
    Object? genderOptions = null,
    Object? checklistTypes = null,
    Object? idTypeOptions = null,
    Object? deliveryCommentOptions = null,
    Object? backendInterface = null,
    Object? callSupportOptions = freezed,
    Object? transportTypes = null,
  }) {
    return _then(_$_AppConfig(
      networkDetection: null == networkDetection
          ? _value.networkDetection
          : networkDetection // ignore: cast_nullable_to_non_nullable
              as String,
      persistenceMode: null == persistenceMode
          ? _value.persistenceMode
          : persistenceMode // ignore: cast_nullable_to_non_nullable
              as String,
      syncMethod: null == syncMethod
          ? _value.syncMethod
          : syncMethod // ignore: cast_nullable_to_non_nullable
              as String,
      syncTrigger: null == syncTrigger
          ? _value.syncTrigger
          : syncTrigger // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Languages>,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      maxRadius: freezed == maxRadius
          ? _value.maxRadius
          : maxRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      householdDeletionReasonOptions: null == householdDeletionReasonOptions
          ? _value._householdDeletionReasonOptions
          : householdDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      bandWidthBatchSize: null == bandWidthBatchSize
          ? _value._bandWidthBatchSize
          : bandWidthBatchSize // ignore: cast_nullable_to_non_nullable
              as List<BandWidthBatchSize>,
      backgroundServiceConfig: freezed == backgroundServiceConfig
          ? _value.backgroundServiceConfig
          : backgroundServiceConfig // ignore: cast_nullable_to_non_nullable
              as BackgroundServiceConfig?,
      householdMemberDeletionReasonOptions: null ==
              householdMemberDeletionReasonOptions
          ? _value._householdMemberDeletionReasonOptions
          : householdMemberDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      genderOptions: null == genderOptions
          ? _value._genderOptions
          : genderOptions // ignore: cast_nullable_to_non_nullable
              as List<GenderOptions>,
      checklistTypes: null == checklistTypes
          ? _value._checklistTypes
          : checklistTypes // ignore: cast_nullable_to_non_nullable
              as List<CheckListTypes>,
      idTypeOptions: null == idTypeOptions
          ? _value._idTypeOptions
          : idTypeOptions // ignore: cast_nullable_to_non_nullable
              as List<IdTypeOptions>,
      deliveryCommentOptions: null == deliveryCommentOptions
          ? _value._deliveryCommentOptions
          : deliveryCommentOptions // ignore: cast_nullable_to_non_nullable
              as List<DeliveryCommentOptions>,
      backendInterface: null == backendInterface
          ? _value.backendInterface
          : backendInterface // ignore: cast_nullable_to_non_nullable
              as BackendInterface,
      callSupportOptions: freezed == callSupportOptions
          ? _value._callSupportOptions
          : callSupportOptions // ignore: cast_nullable_to_non_nullable
              as List<CallSupportList>?,
      transportTypes: null == transportTypes
          ? _value._transportTypes
          : transportTypes // ignore: cast_nullable_to_non_nullable
              as List<TransportTypes>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppConfig implements _AppConfig {
  _$_AppConfig(
      {@JsonKey(name: 'NETWORK_DETECTION')
          required this.networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE')
          required this.persistenceMode,
      @JsonKey(name: 'SYNC_METHOD')
          required this.syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER')
          required this.syncTrigger,
      @JsonKey(name: 'LANGUAGES')
          required final List<Languages> languages,
      @JsonKey(name: 'TENANT_ID')
          this.tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
          this.maxRadius,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
          required final List<DeletionReasonOptions>
              householdDeletionReasonOptions,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
          required final List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
          this.backgroundServiceConfig,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
          required final List<DeletionReasonOptions>
              householdMemberDeletionReasonOptions,
      @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
          required final List<GenderOptions> genderOptions,
      @JsonKey(name: 'CHECKLIST_TYPES')
          required final List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
          required final List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
          required final List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
          required this.backendInterface,
      @JsonKey(name: 'CALL_SUPPORT')
          required final List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES')
          required final List<TransportTypes> transportTypes})
      : _languages = languages,
        _householdDeletionReasonOptions = householdDeletionReasonOptions,
        _bandWidthBatchSize = bandWidthBatchSize,
        _householdMemberDeletionReasonOptions =
            householdMemberDeletionReasonOptions,
        _genderOptions = genderOptions,
        _checklistTypes = checklistTypes,
        _idTypeOptions = idTypeOptions,
        _deliveryCommentOptions = deliveryCommentOptions,
        _callSupportOptions = callSupportOptions,
        _transportTypes = transportTypes;

  factory _$_AppConfig.fromJson(Map<String, dynamic> json) =>
      _$$_AppConfigFromJson(json);

  @override
  @JsonKey(name: 'NETWORK_DETECTION')
  final String networkDetection;
  @override
  @JsonKey(name: 'PERSISTENCE_MODE')
  final String persistenceMode;
  @override
  @JsonKey(name: 'SYNC_METHOD')
  final String syncMethod;
  @override
  @JsonKey(name: 'SYNC_TRIGGER')
  final String syncTrigger;
  final List<Languages> _languages;
  @override
  @JsonKey(name: 'LANGUAGES')
  List<Languages> get languages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  @JsonKey(name: 'TENANT_ID')
  final String? tenantId;
  @override
  @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
  final double? maxRadius;
  final List<DeletionReasonOptions> _householdDeletionReasonOptions;
  @override
  @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdDeletionReasonOptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdDeletionReasonOptions);
  }

  final List<BandWidthBatchSize> _bandWidthBatchSize;
  @override
  @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get bandWidthBatchSize {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bandWidthBatchSize);
  }

  @override
  @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
  final BackgroundServiceConfig? backgroundServiceConfig;
  final List<DeletionReasonOptions> _householdMemberDeletionReasonOptions;
  @override
  @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdMemberDeletionReasonOptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdMemberDeletionReasonOptions);
  }

  final List<GenderOptions> _genderOptions;
  @override
  @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
  List<GenderOptions> get genderOptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genderOptions);
  }

  final List<CheckListTypes> _checklistTypes;
  @override
  @JsonKey(name: 'CHECKLIST_TYPES')
  List<CheckListTypes> get checklistTypes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checklistTypes);
  }

  final List<IdTypeOptions> _idTypeOptions;
  @override
  @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
  List<IdTypeOptions> get idTypeOptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idTypeOptions);
  }

  final List<DeliveryCommentOptions> _deliveryCommentOptions;
  @override
  @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
  List<DeliveryCommentOptions> get deliveryCommentOptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryCommentOptions);
  }

  @override
  @JsonKey(name: 'BACKEND_INTERFACE')
  final BackendInterface backendInterface;
  final List<CallSupportList>? _callSupportOptions;
  @override
  @JsonKey(name: 'CALL_SUPPORT')
  List<CallSupportList>? get callSupportOptions {
    final value = _callSupportOptions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TransportTypes> _transportTypes;
  @override
  @JsonKey(name: 'TRANSPORT_TYPES')
  List<TransportTypes> get transportTypes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transportTypes);
  }

  @override
  String toString() {
    return 'AppConfig(networkDetection: $networkDetection, persistenceMode: $persistenceMode, syncMethod: $syncMethod, syncTrigger: $syncTrigger, languages: $languages, tenantId: $tenantId, maxRadius: $maxRadius, householdDeletionReasonOptions: $householdDeletionReasonOptions, bandWidthBatchSize: $bandWidthBatchSize, backgroundServiceConfig: $backgroundServiceConfig, householdMemberDeletionReasonOptions: $householdMemberDeletionReasonOptions, genderOptions: $genderOptions, checklistTypes: $checklistTypes, idTypeOptions: $idTypeOptions, deliveryCommentOptions: $deliveryCommentOptions, backendInterface: $backendInterface, callSupportOptions: $callSupportOptions, transportTypes: $transportTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppConfig &&
            (identical(other.networkDetection, networkDetection) ||
                other.networkDetection == networkDetection) &&
            (identical(other.persistenceMode, persistenceMode) ||
                other.persistenceMode == persistenceMode) &&
            (identical(other.syncMethod, syncMethod) ||
                other.syncMethod == syncMethod) &&
            (identical(other.syncTrigger, syncTrigger) ||
                other.syncTrigger == syncTrigger) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.maxRadius, maxRadius) ||
                other.maxRadius == maxRadius) &&
            const DeepCollectionEquality().equals(
                other._householdDeletionReasonOptions,
                _householdDeletionReasonOptions) &&
            const DeepCollectionEquality()
                .equals(other._bandWidthBatchSize, _bandWidthBatchSize) &&
            (identical(
                    other.backgroundServiceConfig, backgroundServiceConfig) ||
                other.backgroundServiceConfig == backgroundServiceConfig) &&
            const DeepCollectionEquality().equals(
                other._householdMemberDeletionReasonOptions,
                _householdMemberDeletionReasonOptions) &&
            const DeepCollectionEquality()
                .equals(other._genderOptions, _genderOptions) &&
            const DeepCollectionEquality()
                .equals(other._checklistTypes, _checklistTypes) &&
            const DeepCollectionEquality()
                .equals(other._idTypeOptions, _idTypeOptions) &&
            const DeepCollectionEquality().equals(
                other._deliveryCommentOptions, _deliveryCommentOptions) &&
            (identical(other.backendInterface, backendInterface) ||
                other.backendInterface == backendInterface) &&
            const DeepCollectionEquality()
                .equals(other._callSupportOptions, _callSupportOptions) &&
            const DeepCollectionEquality()
                .equals(other._transportTypes, _transportTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      networkDetection,
      persistenceMode,
      syncMethod,
      syncTrigger,
      const DeepCollectionEquality().hash(_languages),
      tenantId,
      maxRadius,
      const DeepCollectionEquality().hash(_householdDeletionReasonOptions),
      const DeepCollectionEquality().hash(_bandWidthBatchSize),
      backgroundServiceConfig,
      const DeepCollectionEquality()
          .hash(_householdMemberDeletionReasonOptions),
      const DeepCollectionEquality().hash(_genderOptions),
      const DeepCollectionEquality().hash(_checklistTypes),
      const DeepCollectionEquality().hash(_idTypeOptions),
      const DeepCollectionEquality().hash(_deliveryCommentOptions),
      backendInterface,
      const DeepCollectionEquality().hash(_callSupportOptions),
      const DeepCollectionEquality().hash(_transportTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppConfigCopyWith<_$_AppConfig> get copyWith =>
      __$$_AppConfigCopyWithImpl<_$_AppConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppConfigToJson(
      this,
    );
  }
}

abstract class _AppConfig implements AppConfig {
  factory _AppConfig(
      {@JsonKey(name: 'NETWORK_DETECTION')
          required final String networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE')
          required final String persistenceMode,
      @JsonKey(name: 'SYNC_METHOD')
          required final String syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER')
          required final String syncTrigger,
      @JsonKey(name: 'LANGUAGES')
          required final List<Languages> languages,
      @JsonKey(name: 'TENANT_ID')
          final String? tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
          final double? maxRadius,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
          required final List<DeletionReasonOptions>
              householdDeletionReasonOptions,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
          required final List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
          final BackgroundServiceConfig? backgroundServiceConfig,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
          required final List<DeletionReasonOptions>
              householdMemberDeletionReasonOptions,
      @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
          required final List<GenderOptions> genderOptions,
      @JsonKey(name: 'CHECKLIST_TYPES')
          required final List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
          required final List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
          required final List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
          required final BackendInterface backendInterface,
      @JsonKey(name: 'CALL_SUPPORT')
          required final List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES')
          required final List<TransportTypes> transportTypes}) = _$_AppConfig;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$_AppConfig.fromJson;

  @override
  @JsonKey(name: 'NETWORK_DETECTION')
  String get networkDetection;
  @override
  @JsonKey(name: 'PERSISTENCE_MODE')
  String get persistenceMode;
  @override
  @JsonKey(name: 'SYNC_METHOD')
  String get syncMethod;
  @override
  @JsonKey(name: 'SYNC_TRIGGER')
  String get syncTrigger;
  @override
  @JsonKey(name: 'LANGUAGES')
  List<Languages> get languages;
  @override
  @JsonKey(name: 'TENANT_ID')
  String? get tenantId;
  @override
  @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
  double? get maxRadius;
  @override
  @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdDeletionReasonOptions;
  @override
  @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get bandWidthBatchSize;
  @override
  @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
  BackgroundServiceConfig? get backgroundServiceConfig;
  @override
  @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdMemberDeletionReasonOptions;
  @override
  @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
  List<GenderOptions> get genderOptions;
  @override
  @JsonKey(name: 'CHECKLIST_TYPES')
  List<CheckListTypes> get checklistTypes;
  @override
  @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
  List<IdTypeOptions> get idTypeOptions;
  @override
  @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
  List<DeliveryCommentOptions> get deliveryCommentOptions;
  @override
  @JsonKey(name: 'BACKEND_INTERFACE')
  BackendInterface get backendInterface;
  @override
  @JsonKey(name: 'CALL_SUPPORT')
  List<CallSupportList>? get callSupportOptions;
  @override
  @JsonKey(name: 'TRANSPORT_TYPES')
  List<TransportTypes> get transportTypes;
  @override
  @JsonKey(ignore: true)
  _$$_AppConfigCopyWith<_$_AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

IdTypeOptions _$IdTypeOptionsFromJson(Map<String, dynamic> json) {
  return _IdTypeOptions.fromJson(json);
}

/// @nodoc
mixin _$IdTypeOptions {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdTypeOptionsCopyWith<IdTypeOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdTypeOptionsCopyWith<$Res> {
  factory $IdTypeOptionsCopyWith(
          IdTypeOptions value, $Res Function(IdTypeOptions) then) =
      _$IdTypeOptionsCopyWithImpl<$Res, IdTypeOptions>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$IdTypeOptionsCopyWithImpl<$Res, $Val extends IdTypeOptions>
    implements $IdTypeOptionsCopyWith<$Res> {
  _$IdTypeOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdTypeOptionsCopyWith<$Res>
    implements $IdTypeOptionsCopyWith<$Res> {
  factory _$$_IdTypeOptionsCopyWith(
          _$_IdTypeOptions value, $Res Function(_$_IdTypeOptions) then) =
      __$$_IdTypeOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_IdTypeOptionsCopyWithImpl<$Res>
    extends _$IdTypeOptionsCopyWithImpl<$Res, _$_IdTypeOptions>
    implements _$$_IdTypeOptionsCopyWith<$Res> {
  __$$_IdTypeOptionsCopyWithImpl(
      _$_IdTypeOptions _value, $Res Function(_$_IdTypeOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_IdTypeOptions(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdTypeOptions implements _IdTypeOptions {
  _$_IdTypeOptions({required this.name, required this.code});

  factory _$_IdTypeOptions.fromJson(Map<String, dynamic> json) =>
      _$$_IdTypeOptionsFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'IdTypeOptions(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdTypeOptions &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdTypeOptionsCopyWith<_$_IdTypeOptions> get copyWith =>
      __$$_IdTypeOptionsCopyWithImpl<_$_IdTypeOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdTypeOptionsToJson(
      this,
    );
  }
}

abstract class _IdTypeOptions implements IdTypeOptions {
  factory _IdTypeOptions(
      {required final String name,
      required final String code}) = _$_IdTypeOptions;

  factory _IdTypeOptions.fromJson(Map<String, dynamic> json) =
      _$_IdTypeOptions.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_IdTypeOptionsCopyWith<_$_IdTypeOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

BandWidthBatchSize _$BandWidthBatchSizeFromJson(Map<String, dynamic> json) {
  return _BandWidthBatchSize.fromJson(json);
}

/// @nodoc
mixin _$BandWidthBatchSize {
  @JsonKey(name: 'MIN_RANGE')
  double get minRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'MAX_RANGE')
  double get maxRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'BATCH_SIZE')
  int get batchSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BandWidthBatchSizeCopyWith<BandWidthBatchSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BandWidthBatchSizeCopyWith<$Res> {
  factory $BandWidthBatchSizeCopyWith(
          BandWidthBatchSize value, $Res Function(BandWidthBatchSize) then) =
      _$BandWidthBatchSizeCopyWithImpl<$Res, BandWidthBatchSize>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MIN_RANGE') double minRange,
      @JsonKey(name: 'MAX_RANGE') double maxRange,
      @JsonKey(name: 'BATCH_SIZE') int batchSize});
}

/// @nodoc
class _$BandWidthBatchSizeCopyWithImpl<$Res, $Val extends BandWidthBatchSize>
    implements $BandWidthBatchSizeCopyWith<$Res> {
  _$BandWidthBatchSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minRange = null,
    Object? maxRange = null,
    Object? batchSize = null,
  }) {
    return _then(_value.copyWith(
      minRange: null == minRange
          ? _value.minRange
          : minRange // ignore: cast_nullable_to_non_nullable
              as double,
      maxRange: null == maxRange
          ? _value.maxRange
          : maxRange // ignore: cast_nullable_to_non_nullable
              as double,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BandWidthBatchSizeCopyWith<$Res>
    implements $BandWidthBatchSizeCopyWith<$Res> {
  factory _$$_BandWidthBatchSizeCopyWith(_$_BandWidthBatchSize value,
          $Res Function(_$_BandWidthBatchSize) then) =
      __$$_BandWidthBatchSizeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MIN_RANGE') double minRange,
      @JsonKey(name: 'MAX_RANGE') double maxRange,
      @JsonKey(name: 'BATCH_SIZE') int batchSize});
}

/// @nodoc
class __$$_BandWidthBatchSizeCopyWithImpl<$Res>
    extends _$BandWidthBatchSizeCopyWithImpl<$Res, _$_BandWidthBatchSize>
    implements _$$_BandWidthBatchSizeCopyWith<$Res> {
  __$$_BandWidthBatchSizeCopyWithImpl(
      _$_BandWidthBatchSize _value, $Res Function(_$_BandWidthBatchSize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minRange = null,
    Object? maxRange = null,
    Object? batchSize = null,
  }) {
    return _then(_$_BandWidthBatchSize(
      minRange: null == minRange
          ? _value.minRange
          : minRange // ignore: cast_nullable_to_non_nullable
              as double,
      maxRange: null == maxRange
          ? _value.maxRange
          : maxRange // ignore: cast_nullable_to_non_nullable
              as double,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BandWidthBatchSize implements _BandWidthBatchSize {
  _$_BandWidthBatchSize(
      {@JsonKey(name: 'MIN_RANGE') required this.minRange,
      @JsonKey(name: 'MAX_RANGE') required this.maxRange,
      @JsonKey(name: 'BATCH_SIZE') required this.batchSize});

  factory _$_BandWidthBatchSize.fromJson(Map<String, dynamic> json) =>
      _$$_BandWidthBatchSizeFromJson(json);

  @override
  @JsonKey(name: 'MIN_RANGE')
  final double minRange;
  @override
  @JsonKey(name: 'MAX_RANGE')
  final double maxRange;
  @override
  @JsonKey(name: 'BATCH_SIZE')
  final int batchSize;

  @override
  String toString() {
    return 'BandWidthBatchSize(minRange: $minRange, maxRange: $maxRange, batchSize: $batchSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BandWidthBatchSize &&
            (identical(other.minRange, minRange) ||
                other.minRange == minRange) &&
            (identical(other.maxRange, maxRange) ||
                other.maxRange == maxRange) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minRange, maxRange, batchSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BandWidthBatchSizeCopyWith<_$_BandWidthBatchSize> get copyWith =>
      __$$_BandWidthBatchSizeCopyWithImpl<_$_BandWidthBatchSize>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BandWidthBatchSizeToJson(
      this,
    );
  }
}

abstract class _BandWidthBatchSize implements BandWidthBatchSize {
  factory _BandWidthBatchSize(
          {@JsonKey(name: 'MIN_RANGE') required final double minRange,
          @JsonKey(name: 'MAX_RANGE') required final double maxRange,
          @JsonKey(name: 'BATCH_SIZE') required final int batchSize}) =
      _$_BandWidthBatchSize;

  factory _BandWidthBatchSize.fromJson(Map<String, dynamic> json) =
      _$_BandWidthBatchSize.fromJson;

  @override
  @JsonKey(name: 'MIN_RANGE')
  double get minRange;
  @override
  @JsonKey(name: 'MAX_RANGE')
  double get maxRange;
  @override
  @JsonKey(name: 'BATCH_SIZE')
  int get batchSize;
  @override
  @JsonKey(ignore: true)
  _$$_BandWidthBatchSizeCopyWith<_$_BandWidthBatchSize> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryCommentOptions _$DeliveryCommentOptionsFromJson(
    Map<String, dynamic> json) {
  return _DeliveryCommentOptions.fromJson(json);
}

/// @nodoc
mixin _$DeliveryCommentOptions {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryCommentOptionsCopyWith<DeliveryCommentOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCommentOptionsCopyWith<$Res> {
  factory $DeliveryCommentOptionsCopyWith(DeliveryCommentOptions value,
          $Res Function(DeliveryCommentOptions) then) =
      _$DeliveryCommentOptionsCopyWithImpl<$Res, DeliveryCommentOptions>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$DeliveryCommentOptionsCopyWithImpl<$Res,
        $Val extends DeliveryCommentOptions>
    implements $DeliveryCommentOptionsCopyWith<$Res> {
  _$DeliveryCommentOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryCommentOptionsCopyWith<$Res>
    implements $DeliveryCommentOptionsCopyWith<$Res> {
  factory _$$_DeliveryCommentOptionsCopyWith(_$_DeliveryCommentOptions value,
          $Res Function(_$_DeliveryCommentOptions) then) =
      __$$_DeliveryCommentOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_DeliveryCommentOptionsCopyWithImpl<$Res>
    extends _$DeliveryCommentOptionsCopyWithImpl<$Res,
        _$_DeliveryCommentOptions>
    implements _$$_DeliveryCommentOptionsCopyWith<$Res> {
  __$$_DeliveryCommentOptionsCopyWithImpl(_$_DeliveryCommentOptions _value,
      $Res Function(_$_DeliveryCommentOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_DeliveryCommentOptions(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryCommentOptions implements _DeliveryCommentOptions {
  _$_DeliveryCommentOptions({required this.name, required this.code});

  factory _$_DeliveryCommentOptions.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryCommentOptionsFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'DeliveryCommentOptions(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryCommentOptions &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryCommentOptionsCopyWith<_$_DeliveryCommentOptions> get copyWith =>
      __$$_DeliveryCommentOptionsCopyWithImpl<_$_DeliveryCommentOptions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryCommentOptionsToJson(
      this,
    );
  }
}

abstract class _DeliveryCommentOptions implements DeliveryCommentOptions {
  factory _DeliveryCommentOptions(
      {required final String name,
      required final String code}) = _$_DeliveryCommentOptions;

  factory _DeliveryCommentOptions.fromJson(Map<String, dynamic> json) =
      _$_DeliveryCommentOptions.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryCommentOptionsCopyWith<_$_DeliveryCommentOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

DeletionReasonOptions _$DeletionReasonOptionsFromJson(
    Map<String, dynamic> json) {
  return _DeletionReasonOptions.fromJson(json);
}

/// @nodoc
mixin _$DeletionReasonOptions {
  String get value => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeletionReasonOptionsCopyWith<DeletionReasonOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletionReasonOptionsCopyWith<$Res> {
  factory $DeletionReasonOptionsCopyWith(DeletionReasonOptions value,
          $Res Function(DeletionReasonOptions) then) =
      _$DeletionReasonOptionsCopyWithImpl<$Res, DeletionReasonOptions>;
  @useResult
  $Res call({String value, String code});
}

/// @nodoc
class _$DeletionReasonOptionsCopyWithImpl<$Res,
        $Val extends DeletionReasonOptions>
    implements $DeletionReasonOptionsCopyWith<$Res> {
  _$DeletionReasonOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeletionReasonOptionsCopyWith<$Res>
    implements $DeletionReasonOptionsCopyWith<$Res> {
  factory _$$_DeletionReasonOptionsCopyWith(_$_DeletionReasonOptions value,
          $Res Function(_$_DeletionReasonOptions) then) =
      __$$_DeletionReasonOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String code});
}

/// @nodoc
class __$$_DeletionReasonOptionsCopyWithImpl<$Res>
    extends _$DeletionReasonOptionsCopyWithImpl<$Res, _$_DeletionReasonOptions>
    implements _$$_DeletionReasonOptionsCopyWith<$Res> {
  __$$_DeletionReasonOptionsCopyWithImpl(_$_DeletionReasonOptions _value,
      $Res Function(_$_DeletionReasonOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? code = null,
  }) {
    return _then(_$_DeletionReasonOptions(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeletionReasonOptions implements _DeletionReasonOptions {
  _$_DeletionReasonOptions({required this.value, required this.code});

  factory _$_DeletionReasonOptions.fromJson(Map<String, dynamic> json) =>
      _$$_DeletionReasonOptionsFromJson(json);

  @override
  final String value;
  @override
  final String code;

  @override
  String toString() {
    return 'DeletionReasonOptions(value: $value, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeletionReasonOptions &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletionReasonOptionsCopyWith<_$_DeletionReasonOptions> get copyWith =>
      __$$_DeletionReasonOptionsCopyWithImpl<_$_DeletionReasonOptions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeletionReasonOptionsToJson(
      this,
    );
  }
}

abstract class _DeletionReasonOptions implements DeletionReasonOptions {
  factory _DeletionReasonOptions(
      {required final String value,
      required final String code}) = _$_DeletionReasonOptions;

  factory _DeletionReasonOptions.fromJson(Map<String, dynamic> json) =
      _$_DeletionReasonOptions.fromJson;

  @override
  String get value;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_DeletionReasonOptionsCopyWith<_$_DeletionReasonOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

GenderOptions _$GenderOptionsFromJson(Map<String, dynamic> json) {
  return _GenderOptions.fromJson(json);
}

/// @nodoc
mixin _$GenderOptions {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenderOptionsCopyWith<GenderOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderOptionsCopyWith<$Res> {
  factory $GenderOptionsCopyWith(
          GenderOptions value, $Res Function(GenderOptions) then) =
      _$GenderOptionsCopyWithImpl<$Res, GenderOptions>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$GenderOptionsCopyWithImpl<$Res, $Val extends GenderOptions>
    implements $GenderOptionsCopyWith<$Res> {
  _$GenderOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenderOptionsCopyWith<$Res>
    implements $GenderOptionsCopyWith<$Res> {
  factory _$$_GenderOptionsCopyWith(
          _$_GenderOptions value, $Res Function(_$_GenderOptions) then) =
      __$$_GenderOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_GenderOptionsCopyWithImpl<$Res>
    extends _$GenderOptionsCopyWithImpl<$Res, _$_GenderOptions>
    implements _$$_GenderOptionsCopyWith<$Res> {
  __$$_GenderOptionsCopyWithImpl(
      _$_GenderOptions _value, $Res Function(_$_GenderOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_GenderOptions(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenderOptions implements _GenderOptions {
  _$_GenderOptions({required this.name, required this.code});

  factory _$_GenderOptions.fromJson(Map<String, dynamic> json) =>
      _$$_GenderOptionsFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'GenderOptions(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenderOptions &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenderOptionsCopyWith<_$_GenderOptions> get copyWith =>
      __$$_GenderOptionsCopyWithImpl<_$_GenderOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenderOptionsToJson(
      this,
    );
  }
}

abstract class _GenderOptions implements GenderOptions {
  factory _GenderOptions(
      {required final String name,
      required final String code}) = _$_GenderOptions;

  factory _GenderOptions.fromJson(Map<String, dynamic> json) =
      _$_GenderOptions.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_GenderOptionsCopyWith<_$_GenderOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

BackgroundServiceConfig _$BackgroundServiceConfigFromJson(
    Map<String, dynamic> json) {
  return _BackgroundServiceConfig.fromJson(json);
}

/// @nodoc
mixin _$BackgroundServiceConfig {
  @JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')
  int get batteryPercentCutOff => throw _privateConstructorUsedError;
  @JsonKey(name: 'SERVICE_INTERVAL')
  int get serviceInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'API_CONCURRENCY')
  int get apiConcurrency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackgroundServiceConfigCopyWith<BackgroundServiceConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackgroundServiceConfigCopyWith<$Res> {
  factory $BackgroundServiceConfigCopyWith(BackgroundServiceConfig value,
          $Res Function(BackgroundServiceConfig) then) =
      _$BackgroundServiceConfigCopyWithImpl<$Res, BackgroundServiceConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') int batteryPercentCutOff,
      @JsonKey(name: 'SERVICE_INTERVAL') int serviceInterval,
      @JsonKey(name: 'API_CONCURRENCY') int apiConcurrency});
}

/// @nodoc
class _$BackgroundServiceConfigCopyWithImpl<$Res,
        $Val extends BackgroundServiceConfig>
    implements $BackgroundServiceConfigCopyWith<$Res> {
  _$BackgroundServiceConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batteryPercentCutOff = null,
    Object? serviceInterval = null,
    Object? apiConcurrency = null,
  }) {
    return _then(_value.copyWith(
      batteryPercentCutOff: null == batteryPercentCutOff
          ? _value.batteryPercentCutOff
          : batteryPercentCutOff // ignore: cast_nullable_to_non_nullable
              as int,
      serviceInterval: null == serviceInterval
          ? _value.serviceInterval
          : serviceInterval // ignore: cast_nullable_to_non_nullable
              as int,
      apiConcurrency: null == apiConcurrency
          ? _value.apiConcurrency
          : apiConcurrency // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BackgroundServiceConfigCopyWith<$Res>
    implements $BackgroundServiceConfigCopyWith<$Res> {
  factory _$$_BackgroundServiceConfigCopyWith(_$_BackgroundServiceConfig value,
          $Res Function(_$_BackgroundServiceConfig) then) =
      __$$_BackgroundServiceConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') int batteryPercentCutOff,
      @JsonKey(name: 'SERVICE_INTERVAL') int serviceInterval,
      @JsonKey(name: 'API_CONCURRENCY') int apiConcurrency});
}

/// @nodoc
class __$$_BackgroundServiceConfigCopyWithImpl<$Res>
    extends _$BackgroundServiceConfigCopyWithImpl<$Res,
        _$_BackgroundServiceConfig>
    implements _$$_BackgroundServiceConfigCopyWith<$Res> {
  __$$_BackgroundServiceConfigCopyWithImpl(_$_BackgroundServiceConfig _value,
      $Res Function(_$_BackgroundServiceConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batteryPercentCutOff = null,
    Object? serviceInterval = null,
    Object? apiConcurrency = null,
  }) {
    return _then(_$_BackgroundServiceConfig(
      batteryPercentCutOff: null == batteryPercentCutOff
          ? _value.batteryPercentCutOff
          : batteryPercentCutOff // ignore: cast_nullable_to_non_nullable
              as int,
      serviceInterval: null == serviceInterval
          ? _value.serviceInterval
          : serviceInterval // ignore: cast_nullable_to_non_nullable
              as int,
      apiConcurrency: null == apiConcurrency
          ? _value.apiConcurrency
          : apiConcurrency // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BackgroundServiceConfig implements _BackgroundServiceConfig {
  _$_BackgroundServiceConfig(
      {@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')
          required this.batteryPercentCutOff,
      @JsonKey(name: 'SERVICE_INTERVAL')
          required this.serviceInterval,
      @JsonKey(name: 'API_CONCURRENCY')
          required this.apiConcurrency});

  factory _$_BackgroundServiceConfig.fromJson(Map<String, dynamic> json) =>
      _$$_BackgroundServiceConfigFromJson(json);

  @override
  @JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')
  final int batteryPercentCutOff;
  @override
  @JsonKey(name: 'SERVICE_INTERVAL')
  final int serviceInterval;
  @override
  @JsonKey(name: 'API_CONCURRENCY')
  final int apiConcurrency;

  @override
  String toString() {
    return 'BackgroundServiceConfig(batteryPercentCutOff: $batteryPercentCutOff, serviceInterval: $serviceInterval, apiConcurrency: $apiConcurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackgroundServiceConfig &&
            (identical(other.batteryPercentCutOff, batteryPercentCutOff) ||
                other.batteryPercentCutOff == batteryPercentCutOff) &&
            (identical(other.serviceInterval, serviceInterval) ||
                other.serviceInterval == serviceInterval) &&
            (identical(other.apiConcurrency, apiConcurrency) ||
                other.apiConcurrency == apiConcurrency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, batteryPercentCutOff, serviceInterval, apiConcurrency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BackgroundServiceConfigCopyWith<_$_BackgroundServiceConfig>
      get copyWith =>
          __$$_BackgroundServiceConfigCopyWithImpl<_$_BackgroundServiceConfig>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BackgroundServiceConfigToJson(
      this,
    );
  }
}

abstract class _BackgroundServiceConfig implements BackgroundServiceConfig {
  factory _BackgroundServiceConfig(
      {@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')
          required final int batteryPercentCutOff,
      @JsonKey(name: 'SERVICE_INTERVAL')
          required final int serviceInterval,
      @JsonKey(name: 'API_CONCURRENCY')
          required final int apiConcurrency}) = _$_BackgroundServiceConfig;

  factory _BackgroundServiceConfig.fromJson(Map<String, dynamic> json) =
      _$_BackgroundServiceConfig.fromJson;

  @override
  @JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')
  int get batteryPercentCutOff;
  @override
  @JsonKey(name: 'SERVICE_INTERVAL')
  int get serviceInterval;
  @override
  @JsonKey(name: 'API_CONCURRENCY')
  int get apiConcurrency;
  @override
  @JsonKey(ignore: true)
  _$$_BackgroundServiceConfigCopyWith<_$_BackgroundServiceConfig>
      get copyWith => throw _privateConstructorUsedError;
}

BackendInterface _$BackendInterfaceFromJson(Map<String, dynamic> json) {
  return _BackendInterface.fromJson(json);
}

/// @nodoc
mixin _$BackendInterface {
  @JsonKey(name: 'interfaces')
  List<Interfaces> get interface => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackendInterfaceCopyWith<BackendInterface> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendInterfaceCopyWith<$Res> {
  factory $BackendInterfaceCopyWith(
          BackendInterface value, $Res Function(BackendInterface) then) =
      _$BackendInterfaceCopyWithImpl<$Res, BackendInterface>;
  @useResult
  $Res call({@JsonKey(name: 'interfaces') List<Interfaces> interface});
}

/// @nodoc
class _$BackendInterfaceCopyWithImpl<$Res, $Val extends BackendInterface>
    implements $BackendInterfaceCopyWith<$Res> {
  _$BackendInterfaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interface = null,
  }) {
    return _then(_value.copyWith(
      interface: null == interface
          ? _value.interface
          : interface // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BackendInterfaceCopyWith<$Res>
    implements $BackendInterfaceCopyWith<$Res> {
  factory _$$_BackendInterfaceCopyWith(
          _$_BackendInterface value, $Res Function(_$_BackendInterface) then) =
      __$$_BackendInterfaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'interfaces') List<Interfaces> interface});
}

/// @nodoc
class __$$_BackendInterfaceCopyWithImpl<$Res>
    extends _$BackendInterfaceCopyWithImpl<$Res, _$_BackendInterface>
    implements _$$_BackendInterfaceCopyWith<$Res> {
  __$$_BackendInterfaceCopyWithImpl(
      _$_BackendInterface _value, $Res Function(_$_BackendInterface) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interface = null,
  }) {
    return _then(_$_BackendInterface(
      interface: null == interface
          ? _value._interface
          : interface // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BackendInterface implements _BackendInterface {
  _$_BackendInterface(
      {@JsonKey(name: 'interfaces') required final List<Interfaces> interface})
      : _interface = interface;

  factory _$_BackendInterface.fromJson(Map<String, dynamic> json) =>
      _$$_BackendInterfaceFromJson(json);

  final List<Interfaces> _interface;
  @override
  @JsonKey(name: 'interfaces')
  List<Interfaces> get interface {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interface);
  }

  @override
  String toString() {
    return 'BackendInterface(interface: $interface)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackendInterface &&
            const DeepCollectionEquality()
                .equals(other._interface, _interface));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_interface));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BackendInterfaceCopyWith<_$_BackendInterface> get copyWith =>
      __$$_BackendInterfaceCopyWithImpl<_$_BackendInterface>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BackendInterfaceToJson(
      this,
    );
  }
}

abstract class _BackendInterface implements BackendInterface {
  factory _BackendInterface(
      {@JsonKey(name: 'interfaces')
          required final List<Interfaces> interface}) = _$_BackendInterface;

  factory _BackendInterface.fromJson(Map<String, dynamic> json) =
      _$_BackendInterface.fromJson;

  @override
  @JsonKey(name: 'interfaces')
  List<Interfaces> get interface;
  @override
  @JsonKey(ignore: true)
  _$$_BackendInterfaceCopyWith<_$_BackendInterface> get copyWith =>
      throw _privateConstructorUsedError;
}

InterfacesWrapper _$InterfacesWrapperFromJson(Map<String, dynamic> json) {
  return _InterfacesWrapper.fromJson(json);
}

/// @nodoc
mixin _$InterfacesWrapper {
  List<Interfaces> get interface => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterfacesWrapperCopyWith<InterfacesWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterfacesWrapperCopyWith<$Res> {
  factory $InterfacesWrapperCopyWith(
          InterfacesWrapper value, $Res Function(InterfacesWrapper) then) =
      _$InterfacesWrapperCopyWithImpl<$Res, InterfacesWrapper>;
  @useResult
  $Res call({List<Interfaces> interface});
}

/// @nodoc
class _$InterfacesWrapperCopyWithImpl<$Res, $Val extends InterfacesWrapper>
    implements $InterfacesWrapperCopyWith<$Res> {
  _$InterfacesWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interface = null,
  }) {
    return _then(_value.copyWith(
      interface: null == interface
          ? _value.interface
          : interface // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InterfacesWrapperCopyWith<$Res>
    implements $InterfacesWrapperCopyWith<$Res> {
  factory _$$_InterfacesWrapperCopyWith(_$_InterfacesWrapper value,
          $Res Function(_$_InterfacesWrapper) then) =
      __$$_InterfacesWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Interfaces> interface});
}

/// @nodoc
class __$$_InterfacesWrapperCopyWithImpl<$Res>
    extends _$InterfacesWrapperCopyWithImpl<$Res, _$_InterfacesWrapper>
    implements _$$_InterfacesWrapperCopyWith<$Res> {
  __$$_InterfacesWrapperCopyWithImpl(
      _$_InterfacesWrapper _value, $Res Function(_$_InterfacesWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interface = null,
  }) {
    return _then(_$_InterfacesWrapper(
      interface: null == interface
          ? _value._interface
          : interface // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InterfacesWrapper implements _InterfacesWrapper {
  _$_InterfacesWrapper({required final List<Interfaces> interface})
      : _interface = interface;

  factory _$_InterfacesWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_InterfacesWrapperFromJson(json);

  final List<Interfaces> _interface;
  @override
  List<Interfaces> get interface {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interface);
  }

  @override
  String toString() {
    return 'InterfacesWrapper(interface: $interface)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InterfacesWrapper &&
            const DeepCollectionEquality()
                .equals(other._interface, _interface));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_interface));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InterfacesWrapperCopyWith<_$_InterfacesWrapper> get copyWith =>
      __$$_InterfacesWrapperCopyWithImpl<_$_InterfacesWrapper>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InterfacesWrapperToJson(
      this,
    );
  }
}

abstract class _InterfacesWrapper implements InterfacesWrapper {
  factory _InterfacesWrapper({required final List<Interfaces> interface}) =
      _$_InterfacesWrapper;

  factory _InterfacesWrapper.fromJson(Map<String, dynamic> json) =
      _$_InterfacesWrapper.fromJson;

  @override
  List<Interfaces> get interface;
  @override
  @JsonKey(ignore: true)
  _$$_InterfacesWrapperCopyWith<_$_InterfacesWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

Interfaces _$InterfacesFromJson(Map<String, dynamic> json) {
  return _Interfaces.fromJson(json);
}

/// @nodoc
mixin _$Interfaces {
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Config get config => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterfacesCopyWith<Interfaces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterfacesCopyWith<$Res> {
  factory $InterfacesCopyWith(
          Interfaces value, $Res Function(Interfaces) then) =
      _$InterfacesCopyWithImpl<$Res, Interfaces>;
  @useResult
  $Res call({String type, String name, Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$InterfacesCopyWithImpl<$Res, $Val extends Interfaces>
    implements $InterfacesCopyWith<$Res> {
  _$InterfacesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InterfacesCopyWith<$Res>
    implements $InterfacesCopyWith<$Res> {
  factory _$$_InterfacesCopyWith(
          _$_Interfaces value, $Res Function(_$_Interfaces) then) =
      __$$_InterfacesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String name, Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$_InterfacesCopyWithImpl<$Res>
    extends _$InterfacesCopyWithImpl<$Res, _$_Interfaces>
    implements _$$_InterfacesCopyWith<$Res> {
  __$$_InterfacesCopyWithImpl(
      _$_Interfaces _value, $Res Function(_$_Interfaces) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? config = null,
  }) {
    return _then(_$_Interfaces(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Interfaces implements _Interfaces {
  _$_Interfaces({required this.type, required this.name, required this.config});

  factory _$_Interfaces.fromJson(Map<String, dynamic> json) =>
      _$$_InterfacesFromJson(json);

  @override
  final String type;
  @override
  final String name;
  @override
  final Config config;

  @override
  String toString() {
    return 'Interfaces(type: $type, name: $name, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Interfaces &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.config, config) || other.config == config));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InterfacesCopyWith<_$_Interfaces> get copyWith =>
      __$$_InterfacesCopyWithImpl<_$_Interfaces>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InterfacesToJson(
      this,
    );
  }
}

abstract class _Interfaces implements Interfaces {
  factory _Interfaces(
      {required final String type,
      required final String name,
      required final Config config}) = _$_Interfaces;

  factory _Interfaces.fromJson(Map<String, dynamic> json) =
      _$_Interfaces.fromJson;

  @override
  String get type;
  @override
  String get name;
  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$$_InterfacesCopyWith<_$_Interfaces> get copyWith =>
      throw _privateConstructorUsedError;
}

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  int get localStoreTTL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call({int localStoreTTL});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localStoreTTL = null,
  }) {
    return _then(_value.copyWith(
      localStoreTTL: null == localStoreTTL
          ? _value.localStoreTTL
          : localStoreTTL // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int localStoreTTL});
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$_Config>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localStoreTTL = null,
  }) {
    return _then(_$_Config(
      localStoreTTL: null == localStoreTTL
          ? _value.localStoreTTL
          : localStoreTTL // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Config implements _Config {
  _$_Config({required this.localStoreTTL});

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  @override
  final int localStoreTTL;

  @override
  String toString() {
    return 'Config(localStoreTTL: $localStoreTTL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            (identical(other.localStoreTTL, localStoreTTL) ||
                other.localStoreTTL == localStoreTTL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, localStoreTTL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(
      this,
    );
  }
}

abstract class _Config implements Config {
  factory _Config({required final int localStoreTTL}) = _$_Config;

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  int get localStoreTTL;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}

Languages _$LanguagesFromJson(Map<String, dynamic> json) {
  return _Languages.fromJson(json);
}

/// @nodoc
mixin _$Languages {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguagesCopyWith<Languages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguagesCopyWith<$Res> {
  factory $LanguagesCopyWith(Languages value, $Res Function(Languages) then) =
      _$LanguagesCopyWithImpl<$Res, Languages>;
  @useResult
  $Res call({String label, String value, bool isSelected});
}

/// @nodoc
class _$LanguagesCopyWithImpl<$Res, $Val extends Languages>
    implements $LanguagesCopyWith<$Res> {
  _$LanguagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguagesCopyWith<$Res> implements $LanguagesCopyWith<$Res> {
  factory _$$_LanguagesCopyWith(
          _$_Languages value, $Res Function(_$_Languages) then) =
      __$$_LanguagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, bool isSelected});
}

/// @nodoc
class __$$_LanguagesCopyWithImpl<$Res>
    extends _$LanguagesCopyWithImpl<$Res, _$_Languages>
    implements _$$_LanguagesCopyWith<$Res> {
  __$$_LanguagesCopyWithImpl(
      _$_Languages _value, $Res Function(_$_Languages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_$_Languages(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Languages implements _Languages {
  _$_Languages(
      {required this.label, required this.value, this.isSelected = false});

  factory _$_Languages.fromJson(Map<String, dynamic> json) =>
      _$$_LanguagesFromJson(json);

  @override
  final String label;
  @override
  final String value;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'Languages(label: $label, value: $value, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Languages &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguagesCopyWith<_$_Languages> get copyWith =>
      __$$_LanguagesCopyWithImpl<_$_Languages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguagesToJson(
      this,
    );
  }
}

abstract class _Languages implements Languages {
  factory _Languages(
      {required final String label,
      required final String value,
      final bool isSelected}) = _$_Languages;

  factory _Languages.fromJson(Map<String, dynamic> json) =
      _$_Languages.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_LanguagesCopyWith<_$_Languages> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckListTypes _$CheckListTypesFromJson(Map<String, dynamic> json) {
  return _CheckListTypes.fromJson(json);
}

/// @nodoc
mixin _$CheckListTypes {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckListTypesCopyWith<CheckListTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckListTypesCopyWith<$Res> {
  factory $CheckListTypesCopyWith(
          CheckListTypes value, $Res Function(CheckListTypes) then) =
      _$CheckListTypesCopyWithImpl<$Res, CheckListTypes>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$CheckListTypesCopyWithImpl<$Res, $Val extends CheckListTypes>
    implements $CheckListTypesCopyWith<$Res> {
  _$CheckListTypesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckListTypesCopyWith<$Res>
    implements $CheckListTypesCopyWith<$Res> {
  factory _$$_CheckListTypesCopyWith(
          _$_CheckListTypes value, $Res Function(_$_CheckListTypes) then) =
      __$$_CheckListTypesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_CheckListTypesCopyWithImpl<$Res>
    extends _$CheckListTypesCopyWithImpl<$Res, _$_CheckListTypes>
    implements _$$_CheckListTypesCopyWith<$Res> {
  __$$_CheckListTypesCopyWithImpl(
      _$_CheckListTypes _value, $Res Function(_$_CheckListTypes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_CheckListTypes(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckListTypes implements _CheckListTypes {
  _$_CheckListTypes({required this.name, required this.code});

  factory _$_CheckListTypes.fromJson(Map<String, dynamic> json) =>
      _$$_CheckListTypesFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CheckListTypes(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckListTypes &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckListTypesCopyWith<_$_CheckListTypes> get copyWith =>
      __$$_CheckListTypesCopyWithImpl<_$_CheckListTypes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckListTypesToJson(
      this,
    );
  }
}

abstract class _CheckListTypes implements CheckListTypes {
  factory _CheckListTypes(
      {required final String name,
      required final String code}) = _$_CheckListTypes;

  factory _CheckListTypes.fromJson(Map<String, dynamic> json) =
      _$_CheckListTypes.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_CheckListTypesCopyWith<_$_CheckListTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

CallSupportList _$CallSupportListFromJson(Map<String, dynamic> json) {
  return _CallSupportList.fromJson(json);
}

/// @nodoc
mixin _$CallSupportList {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallSupportListCopyWith<CallSupportList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallSupportListCopyWith<$Res> {
  factory $CallSupportListCopyWith(
          CallSupportList value, $Res Function(CallSupportList) then) =
      _$CallSupportListCopyWithImpl<$Res, CallSupportList>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$CallSupportListCopyWithImpl<$Res, $Val extends CallSupportList>
    implements $CallSupportListCopyWith<$Res> {
  _$CallSupportListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CallSupportListCopyWith<$Res>
    implements $CallSupportListCopyWith<$Res> {
  factory _$$_CallSupportListCopyWith(
          _$_CallSupportList value, $Res Function(_$_CallSupportList) then) =
      __$$_CallSupportListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_CallSupportListCopyWithImpl<$Res>
    extends _$CallSupportListCopyWithImpl<$Res, _$_CallSupportList>
    implements _$$_CallSupportListCopyWith<$Res> {
  __$$_CallSupportListCopyWithImpl(
      _$_CallSupportList _value, $Res Function(_$_CallSupportList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_CallSupportList(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CallSupportList implements _CallSupportList {
  _$_CallSupportList({required this.name, required this.code});

  factory _$_CallSupportList.fromJson(Map<String, dynamic> json) =>
      _$$_CallSupportListFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CallSupportList(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallSupportList &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallSupportListCopyWith<_$_CallSupportList> get copyWith =>
      __$$_CallSupportListCopyWithImpl<_$_CallSupportList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CallSupportListToJson(
      this,
    );
  }
}

abstract class _CallSupportList implements CallSupportList {
  factory _CallSupportList(
      {required final String name,
      required final String code}) = _$_CallSupportList;

  factory _CallSupportList.fromJson(Map<String, dynamic> json) =
      _$_CallSupportList.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_CallSupportListCopyWith<_$_CallSupportList> get copyWith =>
      throw _privateConstructorUsedError;
}

TransportTypes _$TransportTypesFromJson(Map<String, dynamic> json) {
  return _TransportTypes.fromJson(json);
}

/// @nodoc
mixin _$TransportTypes {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportTypesCopyWith<TransportTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportTypesCopyWith<$Res> {
  factory $TransportTypesCopyWith(
          TransportTypes value, $Res Function(TransportTypes) then) =
      _$TransportTypesCopyWithImpl<$Res, TransportTypes>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$TransportTypesCopyWithImpl<$Res, $Val extends TransportTypes>
    implements $TransportTypesCopyWith<$Res> {
  _$TransportTypesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransportTypesCopyWith<$Res>
    implements $TransportTypesCopyWith<$Res> {
  factory _$$_TransportTypesCopyWith(
          _$_TransportTypes value, $Res Function(_$_TransportTypes) then) =
      __$$_TransportTypesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_TransportTypesCopyWithImpl<$Res>
    extends _$TransportTypesCopyWithImpl<$Res, _$_TransportTypes>
    implements _$$_TransportTypesCopyWith<$Res> {
  __$$_TransportTypesCopyWithImpl(
      _$_TransportTypes _value, $Res Function(_$_TransportTypes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_TransportTypes(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransportTypes implements _TransportTypes {
  _$_TransportTypes({required this.name, required this.code});

  factory _$_TransportTypes.fromJson(Map<String, dynamic> json) =>
      _$$_TransportTypesFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'TransportTypes(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransportTypes &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransportTypesCopyWith<_$_TransportTypes> get copyWith =>
      __$$_TransportTypesCopyWithImpl<_$_TransportTypes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransportTypesToJson(
      this,
    );
  }
}

abstract class _TransportTypes implements TransportTypes {
  factory _TransportTypes(
      {required final String name,
      required final String code}) = _$_TransportTypes;

  factory _TransportTypes.fromJson(Map<String, dynamic> json) =
      _$_TransportTypes.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_TransportTypesCopyWith<_$_TransportTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

RowVersions _$RowVersionsFromJson(Map<String, dynamic> json) {
  return _RowVersions.fromJson(json);
}

/// @nodoc
mixin _$RowVersions {
  String get module => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RowVersionsCopyWith<RowVersions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowVersionsCopyWith<$Res> {
  factory $RowVersionsCopyWith(
          RowVersions value, $Res Function(RowVersions) then) =
      _$RowVersionsCopyWithImpl<$Res, RowVersions>;
  @useResult
  $Res call({String module, String version});
}

/// @nodoc
class _$RowVersionsCopyWithImpl<$Res, $Val extends RowVersions>
    implements $RowVersionsCopyWith<$Res> {
  _$RowVersionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RowVersionsCopyWith<$Res>
    implements $RowVersionsCopyWith<$Res> {
  factory _$$_RowVersionsCopyWith(
          _$_RowVersions value, $Res Function(_$_RowVersions) then) =
      __$$_RowVersionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String module, String version});
}

/// @nodoc
class __$$_RowVersionsCopyWithImpl<$Res>
    extends _$RowVersionsCopyWithImpl<$Res, _$_RowVersions>
    implements _$$_RowVersionsCopyWith<$Res> {
  __$$_RowVersionsCopyWithImpl(
      _$_RowVersions _value, $Res Function(_$_RowVersions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? version = null,
  }) {
    return _then(_$_RowVersions(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RowVersions implements _RowVersions {
  _$_RowVersions({required this.module, required this.version});

  factory _$_RowVersions.fromJson(Map<String, dynamic> json) =>
      _$$_RowVersionsFromJson(json);

  @override
  final String module;
  @override
  final String version;

  @override
  String toString() {
    return 'RowVersions(module: $module, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RowVersions &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, module, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RowVersionsCopyWith<_$_RowVersions> get copyWith =>
      __$$_RowVersionsCopyWithImpl<_$_RowVersions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RowVersionsToJson(
      this,
    );
  }
}

abstract class _RowVersions implements RowVersions {
  factory _RowVersions(
      {required final String module,
      required final String version}) = _$_RowVersions;

  factory _RowVersions.fromJson(Map<String, dynamic> json) =
      _$_RowVersions.fromJson;

  @override
  String get module;
  @override
  String get version;
  @override
  @JsonKey(ignore: true)
  _$$_RowVersionsCopyWith<_$_RowVersions> get copyWith =>
      throw _privateConstructorUsedError;
}
