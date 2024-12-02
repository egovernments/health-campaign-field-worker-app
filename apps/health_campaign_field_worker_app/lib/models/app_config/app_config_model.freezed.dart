// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$MdmsRequestModelImplCopyWith<$Res>
    implements $MdmsRequestModelCopyWith<$Res> {
  factory _$$MdmsRequestModelImplCopyWith(_$MdmsRequestModelImpl value,
          $Res Function(_$MdmsRequestModelImpl) then) =
      __$$MdmsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel mdmsCriteria});

  @override
  $MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria;
}

/// @nodoc
class __$$MdmsRequestModelImplCopyWithImpl<$Res>
    extends _$MdmsRequestModelCopyWithImpl<$Res, _$MdmsRequestModelImpl>
    implements _$$MdmsRequestModelImplCopyWith<$Res> {
  __$$MdmsRequestModelImplCopyWithImpl(_$MdmsRequestModelImpl _value,
      $Res Function(_$MdmsRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdmsCriteria = null,
  }) {
    return _then(_$MdmsRequestModelImpl(
      mdmsCriteria: null == mdmsCriteria
          ? _value.mdmsCriteria
          : mdmsCriteria // ignore: cast_nullable_to_non_nullable
              as MdmsCriteriaModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MdmsRequestModelImpl implements _MdmsRequestModel {
  const _$MdmsRequestModelImpl(
      {@JsonKey(name: 'MdmsCriteria') required this.mdmsCriteria});

  factory _$MdmsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'MdmsCriteria')
  final MdmsCriteriaModel mdmsCriteria;

  @override
  String toString() {
    return 'MdmsRequestModel(mdmsCriteria: $mdmsCriteria)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsRequestModelImpl &&
            (identical(other.mdmsCriteria, mdmsCriteria) ||
                other.mdmsCriteria == mdmsCriteria));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mdmsCriteria);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MdmsRequestModelImplCopyWith<_$MdmsRequestModelImpl> get copyWith =>
      __$$MdmsRequestModelImplCopyWithImpl<_$MdmsRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsRequestModel implements MdmsRequestModel {
  const factory _MdmsRequestModel(
      {@JsonKey(name: 'MdmsCriteria')
      required final MdmsCriteriaModel mdmsCriteria}) = _$MdmsRequestModelImpl;

  factory _MdmsRequestModel.fromJson(Map<String, dynamic> json) =
      _$MdmsRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'MdmsCriteria')
  MdmsCriteriaModel get mdmsCriteria;
  @override
  @JsonKey(ignore: true)
  _$$MdmsRequestModelImplCopyWith<_$MdmsRequestModelImpl> get copyWith =>
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
abstract class _$$MdmsCriteriaModelImplCopyWith<$Res>
    implements $MdmsCriteriaModelCopyWith<$Res> {
  factory _$$MdmsCriteriaModelImplCopyWith(_$MdmsCriteriaModelImpl value,
          $Res Function(_$MdmsCriteriaModelImpl) then) =
      __$$MdmsCriteriaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tenantId, List<MdmsModuleDetailModel> moduleDetails});
}

/// @nodoc
class __$$MdmsCriteriaModelImplCopyWithImpl<$Res>
    extends _$MdmsCriteriaModelCopyWithImpl<$Res, _$MdmsCriteriaModelImpl>
    implements _$$MdmsCriteriaModelImplCopyWith<$Res> {
  __$$MdmsCriteriaModelImplCopyWithImpl(_$MdmsCriteriaModelImpl _value,
      $Res Function(_$MdmsCriteriaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleDetails = null,
  }) {
    return _then(_$MdmsCriteriaModelImpl(
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
class _$MdmsCriteriaModelImpl implements _MdmsCriteriaModel {
  const _$MdmsCriteriaModelImpl(
      {required this.tenantId,
      required final List<MdmsModuleDetailModel> moduleDetails})
      : _moduleDetails = moduleDetails;

  factory _$MdmsCriteriaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsCriteriaModelImplFromJson(json);

  @override
  final String tenantId;
  final List<MdmsModuleDetailModel> _moduleDetails;
  @override
  List<MdmsModuleDetailModel> get moduleDetails {
    if (_moduleDetails is EqualUnmodifiableListView) return _moduleDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moduleDetails);
  }

  @override
  String toString() {
    return 'MdmsCriteriaModel(tenantId: $tenantId, moduleDetails: $moduleDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsCriteriaModelImpl &&
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
  _$$MdmsCriteriaModelImplCopyWith<_$MdmsCriteriaModelImpl> get copyWith =>
      __$$MdmsCriteriaModelImplCopyWithImpl<_$MdmsCriteriaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsCriteriaModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsCriteriaModel implements MdmsCriteriaModel {
  const factory _MdmsCriteriaModel(
          {required final String tenantId,
          required final List<MdmsModuleDetailModel> moduleDetails}) =
      _$MdmsCriteriaModelImpl;

  factory _MdmsCriteriaModel.fromJson(Map<String, dynamic> json) =
      _$MdmsCriteriaModelImpl.fromJson;

  @override
  String get tenantId;
  @override
  List<MdmsModuleDetailModel> get moduleDetails;
  @override
  @JsonKey(ignore: true)
  _$$MdmsCriteriaModelImplCopyWith<_$MdmsCriteriaModelImpl> get copyWith =>
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
abstract class _$$MdmsModuleDetailModelImplCopyWith<$Res>
    implements $MdmsModuleDetailModelCopyWith<$Res> {
  factory _$$MdmsModuleDetailModelImplCopyWith(
          _$MdmsModuleDetailModelImpl value,
          $Res Function(_$MdmsModuleDetailModelImpl) then) =
      __$$MdmsModuleDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String moduleName, List<MdmsMasterDetailModel> masterDetails});
}

/// @nodoc
class __$$MdmsModuleDetailModelImplCopyWithImpl<$Res>
    extends _$MdmsModuleDetailModelCopyWithImpl<$Res,
        _$MdmsModuleDetailModelImpl>
    implements _$$MdmsModuleDetailModelImplCopyWith<$Res> {
  __$$MdmsModuleDetailModelImplCopyWithImpl(_$MdmsModuleDetailModelImpl _value,
      $Res Function(_$MdmsModuleDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleName = null,
    Object? masterDetails = null,
  }) {
    return _then(_$MdmsModuleDetailModelImpl(
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
class _$MdmsModuleDetailModelImpl implements _MdmsModuleDetailModel {
  const _$MdmsModuleDetailModelImpl(
      {required this.moduleName,
      required final List<MdmsMasterDetailModel> masterDetails})
      : _masterDetails = masterDetails;

  factory _$MdmsModuleDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsModuleDetailModelImplFromJson(json);

  @override
  final String moduleName;
  final List<MdmsMasterDetailModel> _masterDetails;
  @override
  List<MdmsMasterDetailModel> get masterDetails {
    if (_masterDetails is EqualUnmodifiableListView) return _masterDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_masterDetails);
  }

  @override
  String toString() {
    return 'MdmsModuleDetailModel(moduleName: $moduleName, masterDetails: $masterDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsModuleDetailModelImpl &&
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
  _$$MdmsModuleDetailModelImplCopyWith<_$MdmsModuleDetailModelImpl>
      get copyWith => __$$MdmsModuleDetailModelImplCopyWithImpl<
          _$MdmsModuleDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsModuleDetailModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsModuleDetailModel implements MdmsModuleDetailModel {
  const factory _MdmsModuleDetailModel(
          {required final String moduleName,
          required final List<MdmsMasterDetailModel> masterDetails}) =
      _$MdmsModuleDetailModelImpl;

  factory _MdmsModuleDetailModel.fromJson(Map<String, dynamic> json) =
      _$MdmsModuleDetailModelImpl.fromJson;

  @override
  String get moduleName;
  @override
  List<MdmsMasterDetailModel> get masterDetails;
  @override
  @JsonKey(ignore: true)
  _$$MdmsModuleDetailModelImplCopyWith<_$MdmsModuleDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$MdmsMasterDetailModelImplCopyWith<$Res>
    implements $MdmsMasterDetailModelCopyWith<$Res> {
  factory _$$MdmsMasterDetailModelImplCopyWith(
          _$MdmsMasterDetailModelImpl value,
          $Res Function(_$MdmsMasterDetailModelImpl) then) =
      __$$MdmsMasterDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$MdmsMasterDetailModelImplCopyWithImpl<$Res>
    extends _$MdmsMasterDetailModelCopyWithImpl<$Res,
        _$MdmsMasterDetailModelImpl>
    implements _$$MdmsMasterDetailModelImplCopyWith<$Res> {
  __$$MdmsMasterDetailModelImplCopyWithImpl(_$MdmsMasterDetailModelImpl _value,
      $Res Function(_$MdmsMasterDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$MdmsMasterDetailModelImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MdmsMasterDetailModelImpl implements _MdmsMasterDetailModel {
  const _$MdmsMasterDetailModelImpl(this.name);

  factory _$MdmsMasterDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsMasterDetailModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'MdmsMasterDetailModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsMasterDetailModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MdmsMasterDetailModelImplCopyWith<_$MdmsMasterDetailModelImpl>
      get copyWith => __$$MdmsMasterDetailModelImplCopyWithImpl<
          _$MdmsMasterDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsMasterDetailModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsMasterDetailModel implements MdmsMasterDetailModel {
  const factory _MdmsMasterDetailModel(final String name) =
      _$MdmsMasterDetailModelImpl;

  factory _MdmsMasterDetailModel.fromJson(Map<String, dynamic> json) =
      _$MdmsMasterDetailModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$MdmsMasterDetailModelImplCopyWith<_$MdmsMasterDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppConfigPrimaryWrapperModel _$AppConfigPrimaryWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _AppConfigPrimaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$AppConfigPrimaryWrapperModel {
  @JsonKey(name: 'HCM')
  HCMWrapperModel? get hcmWrapperModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'common-masters')
  CommonMastersWrapperModel? get commonMasters =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'module-version')
  RowVersionWrapperModel? get rowVersions => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'HCM') HCMWrapperModel? hcmWrapperModel,
      @JsonKey(name: 'common-masters') CommonMastersWrapperModel? commonMasters,
      @JsonKey(name: 'module-version') RowVersionWrapperModel? rowVersions});

  $HCMWrapperModelCopyWith<$Res>? get hcmWrapperModel;
  $CommonMastersWrapperModelCopyWith<$Res>? get commonMasters;
  $RowVersionWrapperModelCopyWith<$Res>? get rowVersions;
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
    Object? hcmWrapperModel = freezed,
    Object? commonMasters = freezed,
    Object? rowVersions = freezed,
  }) {
    return _then(_value.copyWith(
      hcmWrapperModel: freezed == hcmWrapperModel
          ? _value.hcmWrapperModel
          : hcmWrapperModel // ignore: cast_nullable_to_non_nullable
              as HCMWrapperModel?,
      commonMasters: freezed == commonMasters
          ? _value.commonMasters
          : commonMasters // ignore: cast_nullable_to_non_nullable
              as CommonMastersWrapperModel?,
      rowVersions: freezed == rowVersions
          ? _value.rowVersions
          : rowVersions // ignore: cast_nullable_to_non_nullable
              as RowVersionWrapperModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HCMWrapperModelCopyWith<$Res>? get hcmWrapperModel {
    if (_value.hcmWrapperModel == null) {
      return null;
    }

    return $HCMWrapperModelCopyWith<$Res>(_value.hcmWrapperModel!, (value) {
      return _then(_value.copyWith(hcmWrapperModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommonMastersWrapperModelCopyWith<$Res>? get commonMasters {
    if (_value.commonMasters == null) {
      return null;
    }

    return $CommonMastersWrapperModelCopyWith<$Res>(_value.commonMasters!,
        (value) {
      return _then(_value.copyWith(commonMasters: value) as $Val);
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
}

/// @nodoc
abstract class _$$AppConfigPrimaryWrapperModelImplCopyWith<$Res>
    implements $AppConfigPrimaryWrapperModelCopyWith<$Res> {
  factory _$$AppConfigPrimaryWrapperModelImplCopyWith(
          _$AppConfigPrimaryWrapperModelImpl value,
          $Res Function(_$AppConfigPrimaryWrapperModelImpl) then) =
      __$$AppConfigPrimaryWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM') HCMWrapperModel? hcmWrapperModel,
      @JsonKey(name: 'common-masters') CommonMastersWrapperModel? commonMasters,
      @JsonKey(name: 'module-version') RowVersionWrapperModel? rowVersions});

  @override
  $HCMWrapperModelCopyWith<$Res>? get hcmWrapperModel;
  @override
  $CommonMastersWrapperModelCopyWith<$Res>? get commonMasters;
  @override
  $RowVersionWrapperModelCopyWith<$Res>? get rowVersions;
}

/// @nodoc
class __$$AppConfigPrimaryWrapperModelImplCopyWithImpl<$Res>
    extends _$AppConfigPrimaryWrapperModelCopyWithImpl<$Res,
        _$AppConfigPrimaryWrapperModelImpl>
    implements _$$AppConfigPrimaryWrapperModelImplCopyWith<$Res> {
  __$$AppConfigPrimaryWrapperModelImplCopyWithImpl(
      _$AppConfigPrimaryWrapperModelImpl _value,
      $Res Function(_$AppConfigPrimaryWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hcmWrapperModel = freezed,
    Object? commonMasters = freezed,
    Object? rowVersions = freezed,
  }) {
    return _then(_$AppConfigPrimaryWrapperModelImpl(
      hcmWrapperModel: freezed == hcmWrapperModel
          ? _value.hcmWrapperModel
          : hcmWrapperModel // ignore: cast_nullable_to_non_nullable
              as HCMWrapperModel?,
      commonMasters: freezed == commonMasters
          ? _value.commonMasters
          : commonMasters // ignore: cast_nullable_to_non_nullable
              as CommonMastersWrapperModel?,
      rowVersions: freezed == rowVersions
          ? _value.rowVersions
          : rowVersions // ignore: cast_nullable_to_non_nullable
              as RowVersionWrapperModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigPrimaryWrapperModelImpl
    implements _AppConfigPrimaryWrapperModel {
  const _$AppConfigPrimaryWrapperModelImpl(
      {@JsonKey(name: 'HCM') this.hcmWrapperModel,
      @JsonKey(name: 'common-masters') this.commonMasters,
      @JsonKey(name: 'module-version') this.rowVersions});

  factory _$AppConfigPrimaryWrapperModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AppConfigPrimaryWrapperModelImplFromJson(json);

  @override
  @JsonKey(name: 'HCM')
  final HCMWrapperModel? hcmWrapperModel;
  @override
  @JsonKey(name: 'common-masters')
  final CommonMastersWrapperModel? commonMasters;
  @override
  @JsonKey(name: 'module-version')
  final RowVersionWrapperModel? rowVersions;

  @override
  String toString() {
    return 'AppConfigPrimaryWrapperModel(hcmWrapperModel: $hcmWrapperModel, commonMasters: $commonMasters, rowVersions: $rowVersions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigPrimaryWrapperModelImpl &&
            (identical(other.hcmWrapperModel, hcmWrapperModel) ||
                other.hcmWrapperModel == hcmWrapperModel) &&
            (identical(other.commonMasters, commonMasters) ||
                other.commonMasters == commonMasters) &&
            (identical(other.rowVersions, rowVersions) ||
                other.rowVersions == rowVersions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hcmWrapperModel, commonMasters, rowVersions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigPrimaryWrapperModelImplCopyWith<
          _$AppConfigPrimaryWrapperModelImpl>
      get copyWith => __$$AppConfigPrimaryWrapperModelImplCopyWithImpl<
          _$AppConfigPrimaryWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigPrimaryWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _AppConfigPrimaryWrapperModel
    implements AppConfigPrimaryWrapperModel {
  const factory _AppConfigPrimaryWrapperModel(
          {@JsonKey(name: 'HCM') final HCMWrapperModel? hcmWrapperModel,
          @JsonKey(name: 'common-masters')
          final CommonMastersWrapperModel? commonMasters,
          @JsonKey(name: 'module-version')
          final RowVersionWrapperModel? rowVersions}) =
      _$AppConfigPrimaryWrapperModelImpl;

  factory _AppConfigPrimaryWrapperModel.fromJson(Map<String, dynamic> json) =
      _$AppConfigPrimaryWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'HCM')
  HCMWrapperModel? get hcmWrapperModel;
  @override
  @JsonKey(name: 'common-masters')
  CommonMastersWrapperModel? get commonMasters;
  @override
  @JsonKey(name: 'module-version')
  RowVersionWrapperModel? get rowVersions;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigPrimaryWrapperModelImplCopyWith<
          _$AppConfigPrimaryWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HCMWrapperModel _$HCMWrapperModelFromJson(Map<String, dynamic> json) {
  return _HCMWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$HCMWrapperModel {
  @JsonKey(name: 'APP_CONFIG')
  List<AppConfig> get appConfig => throw _privateConstructorUsedError;
  @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get bandWidthBatchSize =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get downSyncBandWidthBatchSize =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdDeletionReasonOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdMemberDeletionReasonOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
  List<BackgroundServiceConfig>? get backgroundServiceConfig =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'CHECKLIST_TYPES')
  List<CheckListTypes> get checklistTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
  List<IdTypeOptions> get idTypeOptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
  List<DeliveryCommentOptions> get deliveryCommentOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'BACKEND_INTERFACE')
  List<BackendInterface> get backendInterface =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'CALL_SUPPORT')
  List<CallSupportList>? get callSupportOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'TRANSPORT_TYPES')
  List<TransportTypes> get transportTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'SYMPTOM_TYPES')
  List<SymptomsType>? get symptomsTypeList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
  List<SearchHouseHoldFilters>? get searchHouseHoldFilters =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'REFERRAL_REASONS')
  List<ReferralReasonType>? get referralReasonList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
  List<CommonMasterModel>? get houseStructureTypes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'REFUSAL_REASONS')
  List<CommonMasterModel>? get refusalReasons =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'FIREBASE_CONFIG')
  List<FirebaseConfig>? get firebaseConfig =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'FORM_CONFIG')
  List<FormConfigModel>? get formConfig => throw _privateConstructorUsedError;
  @JsonKey(name: 'REGISTRATION_DELIVERY_CONFIGS')
  List<RegistrationDeliveryConfigModel>? get registrationDeliveryConfig =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HCMWrapperModelCopyWith<HCMWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HCMWrapperModelCopyWith<$Res> {
  factory $HCMWrapperModelCopyWith(
          HCMWrapperModel value, $Res Function(HCMWrapperModel) then) =
      _$HCMWrapperModelCopyWithImpl<$Res, HCMWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'APP_CONFIG') List<AppConfig> appConfig,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
      List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
      List<BandWidthBatchSize> downSyncBandWidthBatchSize,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
      List<DeletionReasonOptions> householdDeletionReasonOptions,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
      List<DeletionReasonOptions> householdMemberDeletionReasonOptions,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
      List<BackgroundServiceConfig>? backgroundServiceConfig,
      @JsonKey(name: 'CHECKLIST_TYPES') List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
      List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
      List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
      List<BackendInterface> backendInterface,
      @JsonKey(name: 'CALL_SUPPORT') List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES') List<TransportTypes> transportTypes,
      @JsonKey(name: 'SYMPTOM_TYPES') List<SymptomsType>? symptomsTypeList,
      @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
      List<SearchHouseHoldFilters>? searchHouseHoldFilters,
      @JsonKey(name: 'REFERRAL_REASONS')
      List<ReferralReasonType>? referralReasonList,
      @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
      List<CommonMasterModel>? houseStructureTypes,
      @JsonKey(name: 'REFUSAL_REASONS') List<CommonMasterModel>? refusalReasons,
      @JsonKey(name: 'FIREBASE_CONFIG') List<FirebaseConfig>? firebaseConfig,
      @JsonKey(name: 'FORM_CONFIG') List<FormConfigModel>? formConfig,
      @JsonKey(name: 'REGISTRATION_DELIVERY_CONFIGS')
      List<RegistrationDeliveryConfigModel>? registrationDeliveryConfig});
}

/// @nodoc
class _$HCMWrapperModelCopyWithImpl<$Res, $Val extends HCMWrapperModel>
    implements $HCMWrapperModelCopyWith<$Res> {
  _$HCMWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = null,
    Object? bandWidthBatchSize = null,
    Object? downSyncBandWidthBatchSize = null,
    Object? householdDeletionReasonOptions = null,
    Object? householdMemberDeletionReasonOptions = null,
    Object? backgroundServiceConfig = freezed,
    Object? checklistTypes = null,
    Object? idTypeOptions = null,
    Object? deliveryCommentOptions = null,
    Object? backendInterface = null,
    Object? callSupportOptions = freezed,
    Object? transportTypes = null,
    Object? symptomsTypeList = freezed,
    Object? searchHouseHoldFilters = freezed,
    Object? referralReasonList = freezed,
    Object? houseStructureTypes = freezed,
    Object? refusalReasons = freezed,
    Object? firebaseConfig = freezed,
    Object? formConfig = freezed,
    Object? registrationDeliveryConfig = freezed,
  }) {
    return _then(_value.copyWith(
      appConfig: null == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as List<AppConfig>,
      bandWidthBatchSize: null == bandWidthBatchSize
          ? _value.bandWidthBatchSize
          : bandWidthBatchSize // ignore: cast_nullable_to_non_nullable
              as List<BandWidthBatchSize>,
      downSyncBandWidthBatchSize: null == downSyncBandWidthBatchSize
          ? _value.downSyncBandWidthBatchSize
          : downSyncBandWidthBatchSize // ignore: cast_nullable_to_non_nullable
              as List<BandWidthBatchSize>,
      householdDeletionReasonOptions: null == householdDeletionReasonOptions
          ? _value.householdDeletionReasonOptions
          : householdDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      householdMemberDeletionReasonOptions: null ==
              householdMemberDeletionReasonOptions
          ? _value.householdMemberDeletionReasonOptions
          : householdMemberDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      backgroundServiceConfig: freezed == backgroundServiceConfig
          ? _value.backgroundServiceConfig
          : backgroundServiceConfig // ignore: cast_nullable_to_non_nullable
              as List<BackgroundServiceConfig>?,
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
              as List<BackendInterface>,
      callSupportOptions: freezed == callSupportOptions
          ? _value.callSupportOptions
          : callSupportOptions // ignore: cast_nullable_to_non_nullable
              as List<CallSupportList>?,
      transportTypes: null == transportTypes
          ? _value.transportTypes
          : transportTypes // ignore: cast_nullable_to_non_nullable
              as List<TransportTypes>,
      symptomsTypeList: freezed == symptomsTypeList
          ? _value.symptomsTypeList
          : symptomsTypeList // ignore: cast_nullable_to_non_nullable
              as List<SymptomsType>?,
      searchHouseHoldFilters: freezed == searchHouseHoldFilters
          ? _value.searchHouseHoldFilters
          : searchHouseHoldFilters // ignore: cast_nullable_to_non_nullable
              as List<SearchHouseHoldFilters>?,
      referralReasonList: freezed == referralReasonList
          ? _value.referralReasonList
          : referralReasonList // ignore: cast_nullable_to_non_nullable
              as List<ReferralReasonType>?,
      houseStructureTypes: freezed == houseStructureTypes
          ? _value.houseStructureTypes
          : houseStructureTypes // ignore: cast_nullable_to_non_nullable
              as List<CommonMasterModel>?,
      refusalReasons: freezed == refusalReasons
          ? _value.refusalReasons
          : refusalReasons // ignore: cast_nullable_to_non_nullable
              as List<CommonMasterModel>?,
      firebaseConfig: freezed == firebaseConfig
          ? _value.firebaseConfig
          : firebaseConfig // ignore: cast_nullable_to_non_nullable
              as List<FirebaseConfig>?,
      formConfig: freezed == formConfig
          ? _value.formConfig
          : formConfig // ignore: cast_nullable_to_non_nullable
              as List<FormConfigModel>?,
      registrationDeliveryConfig: freezed == registrationDeliveryConfig
          ? _value.registrationDeliveryConfig
          : registrationDeliveryConfig // ignore: cast_nullable_to_non_nullable
              as List<RegistrationDeliveryConfigModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HCMWrapperModelImplCopyWith<$Res>
    implements $HCMWrapperModelCopyWith<$Res> {
  factory _$$HCMWrapperModelImplCopyWith(_$HCMWrapperModelImpl value,
          $Res Function(_$HCMWrapperModelImpl) then) =
      __$$HCMWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'APP_CONFIG') List<AppConfig> appConfig,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
      List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
      List<BandWidthBatchSize> downSyncBandWidthBatchSize,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
      List<DeletionReasonOptions> householdDeletionReasonOptions,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
      List<DeletionReasonOptions> householdMemberDeletionReasonOptions,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
      List<BackgroundServiceConfig>? backgroundServiceConfig,
      @JsonKey(name: 'CHECKLIST_TYPES') List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
      List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
      List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
      List<BackendInterface> backendInterface,
      @JsonKey(name: 'CALL_SUPPORT') List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES') List<TransportTypes> transportTypes,
      @JsonKey(name: 'SYMPTOM_TYPES') List<SymptomsType>? symptomsTypeList,
      @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
      List<SearchHouseHoldFilters>? searchHouseHoldFilters,
      @JsonKey(name: 'REFERRAL_REASONS')
      List<ReferralReasonType>? referralReasonList,
      @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
      List<CommonMasterModel>? houseStructureTypes,
      @JsonKey(name: 'REFUSAL_REASONS') List<CommonMasterModel>? refusalReasons,
      @JsonKey(name: 'FIREBASE_CONFIG') List<FirebaseConfig>? firebaseConfig,
      @JsonKey(name: 'FORM_CONFIG') List<FormConfigModel>? formConfig,
      @JsonKey(name: 'REGISTRATION_DELIVERY_CONFIGS')
      List<RegistrationDeliveryConfigModel>? registrationDeliveryConfig});
}

/// @nodoc
class __$$HCMWrapperModelImplCopyWithImpl<$Res>
    extends _$HCMWrapperModelCopyWithImpl<$Res, _$HCMWrapperModelImpl>
    implements _$$HCMWrapperModelImplCopyWith<$Res> {
  __$$HCMWrapperModelImplCopyWithImpl(
      _$HCMWrapperModelImpl _value, $Res Function(_$HCMWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = null,
    Object? bandWidthBatchSize = null,
    Object? downSyncBandWidthBatchSize = null,
    Object? householdDeletionReasonOptions = null,
    Object? householdMemberDeletionReasonOptions = null,
    Object? backgroundServiceConfig = freezed,
    Object? checklistTypes = null,
    Object? idTypeOptions = null,
    Object? deliveryCommentOptions = null,
    Object? backendInterface = null,
    Object? callSupportOptions = freezed,
    Object? transportTypes = null,
    Object? symptomsTypeList = freezed,
    Object? searchHouseHoldFilters = freezed,
    Object? referralReasonList = freezed,
    Object? houseStructureTypes = freezed,
    Object? refusalReasons = freezed,
    Object? firebaseConfig = freezed,
    Object? formConfig = freezed,
    Object? registrationDeliveryConfig = freezed,
  }) {
    return _then(_$HCMWrapperModelImpl(
      appConfig: null == appConfig
          ? _value._appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as List<AppConfig>,
      bandWidthBatchSize: null == bandWidthBatchSize
          ? _value._bandWidthBatchSize
          : bandWidthBatchSize // ignore: cast_nullable_to_non_nullable
              as List<BandWidthBatchSize>,
      downSyncBandWidthBatchSize: null == downSyncBandWidthBatchSize
          ? _value._downSyncBandWidthBatchSize
          : downSyncBandWidthBatchSize // ignore: cast_nullable_to_non_nullable
              as List<BandWidthBatchSize>,
      householdDeletionReasonOptions: null == householdDeletionReasonOptions
          ? _value._householdDeletionReasonOptions
          : householdDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      householdMemberDeletionReasonOptions: null ==
              householdMemberDeletionReasonOptions
          ? _value._householdMemberDeletionReasonOptions
          : householdMemberDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
              as List<DeletionReasonOptions>,
      backgroundServiceConfig: freezed == backgroundServiceConfig
          ? _value._backgroundServiceConfig
          : backgroundServiceConfig // ignore: cast_nullable_to_non_nullable
              as List<BackgroundServiceConfig>?,
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
          ? _value._backendInterface
          : backendInterface // ignore: cast_nullable_to_non_nullable
              as List<BackendInterface>,
      callSupportOptions: freezed == callSupportOptions
          ? _value._callSupportOptions
          : callSupportOptions // ignore: cast_nullable_to_non_nullable
              as List<CallSupportList>?,
      transportTypes: null == transportTypes
          ? _value._transportTypes
          : transportTypes // ignore: cast_nullable_to_non_nullable
              as List<TransportTypes>,
      symptomsTypeList: freezed == symptomsTypeList
          ? _value._symptomsTypeList
          : symptomsTypeList // ignore: cast_nullable_to_non_nullable
              as List<SymptomsType>?,
      searchHouseHoldFilters: freezed == searchHouseHoldFilters
          ? _value._searchHouseHoldFilters
          : searchHouseHoldFilters // ignore: cast_nullable_to_non_nullable
              as List<SearchHouseHoldFilters>?,
      referralReasonList: freezed == referralReasonList
          ? _value._referralReasonList
          : referralReasonList // ignore: cast_nullable_to_non_nullable
              as List<ReferralReasonType>?,
      houseStructureTypes: freezed == houseStructureTypes
          ? _value._houseStructureTypes
          : houseStructureTypes // ignore: cast_nullable_to_non_nullable
              as List<CommonMasterModel>?,
      refusalReasons: freezed == refusalReasons
          ? _value._refusalReasons
          : refusalReasons // ignore: cast_nullable_to_non_nullable
              as List<CommonMasterModel>?,
      firebaseConfig: freezed == firebaseConfig
          ? _value._firebaseConfig
          : firebaseConfig // ignore: cast_nullable_to_non_nullable
              as List<FirebaseConfig>?,
      formConfig: freezed == formConfig
          ? _value._formConfig
          : formConfig // ignore: cast_nullable_to_non_nullable
              as List<FormConfigModel>?,
      registrationDeliveryConfig: freezed == registrationDeliveryConfig
          ? _value._registrationDeliveryConfig
          : registrationDeliveryConfig // ignore: cast_nullable_to_non_nullable
              as List<RegistrationDeliveryConfigModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HCMWrapperModelImpl implements _HCMWrapperModel {
  const _$HCMWrapperModelImpl(
      {@JsonKey(name: 'APP_CONFIG') required final List<AppConfig> appConfig,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
      required final List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
      required final List<BandWidthBatchSize> downSyncBandWidthBatchSize,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
      required final List<DeletionReasonOptions> householdDeletionReasonOptions,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
      required final List<DeletionReasonOptions>
          householdMemberDeletionReasonOptions,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
      final List<BackgroundServiceConfig>? backgroundServiceConfig,
      @JsonKey(name: 'CHECKLIST_TYPES')
      required final List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
      required final List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
      required final List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
      required final List<BackendInterface> backendInterface,
      @JsonKey(name: 'CALL_SUPPORT')
      required final List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES')
      required final List<TransportTypes> transportTypes,
      @JsonKey(name: 'SYMPTOM_TYPES')
      final List<SymptomsType>? symptomsTypeList,
      @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
      final List<SearchHouseHoldFilters>? searchHouseHoldFilters,
      @JsonKey(name: 'REFERRAL_REASONS')
      final List<ReferralReasonType>? referralReasonList,
      @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
      final List<CommonMasterModel>? houseStructureTypes,
      @JsonKey(name: 'REFUSAL_REASONS')
      final List<CommonMasterModel>? refusalReasons,
      @JsonKey(name: 'FIREBASE_CONFIG')
      required final List<FirebaseConfig>? firebaseConfig,
      @JsonKey(name: 'FORM_CONFIG') final List<FormConfigModel>? formConfig,
      @JsonKey(name: 'REGISTRATION_DELIVERY_CONFIGS')
      final List<RegistrationDeliveryConfigModel>? registrationDeliveryConfig})
      : _appConfig = appConfig,
        _bandWidthBatchSize = bandWidthBatchSize,
        _downSyncBandWidthBatchSize = downSyncBandWidthBatchSize,
        _householdDeletionReasonOptions = householdDeletionReasonOptions,
        _householdMemberDeletionReasonOptions =
            householdMemberDeletionReasonOptions,
        _backgroundServiceConfig = backgroundServiceConfig,
        _checklistTypes = checklistTypes,
        _idTypeOptions = idTypeOptions,
        _deliveryCommentOptions = deliveryCommentOptions,
        _backendInterface = backendInterface,
        _callSupportOptions = callSupportOptions,
        _transportTypes = transportTypes,
        _symptomsTypeList = symptomsTypeList,
        _searchHouseHoldFilters = searchHouseHoldFilters,
        _referralReasonList = referralReasonList,
        _houseStructureTypes = houseStructureTypes,
        _refusalReasons = refusalReasons,
        _firebaseConfig = firebaseConfig,
        _formConfig = formConfig,
        _registrationDeliveryConfig = registrationDeliveryConfig;

  factory _$HCMWrapperModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HCMWrapperModelImplFromJson(json);

  final List<AppConfig> _appConfig;
  @override
  @JsonKey(name: 'APP_CONFIG')
  List<AppConfig> get appConfig {
    if (_appConfig is EqualUnmodifiableListView) return _appConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appConfig);
  }

  final List<BandWidthBatchSize> _bandWidthBatchSize;
  @override
  @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get bandWidthBatchSize {
    if (_bandWidthBatchSize is EqualUnmodifiableListView)
      return _bandWidthBatchSize;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bandWidthBatchSize);
  }

  final List<BandWidthBatchSize> _downSyncBandWidthBatchSize;
  @override
  @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get downSyncBandWidthBatchSize {
    if (_downSyncBandWidthBatchSize is EqualUnmodifiableListView)
      return _downSyncBandWidthBatchSize;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downSyncBandWidthBatchSize);
  }

  final List<DeletionReasonOptions> _householdDeletionReasonOptions;
  @override
  @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdDeletionReasonOptions {
    if (_householdDeletionReasonOptions is EqualUnmodifiableListView)
      return _householdDeletionReasonOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdDeletionReasonOptions);
  }

  final List<DeletionReasonOptions> _householdMemberDeletionReasonOptions;
  @override
  @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdMemberDeletionReasonOptions {
    if (_householdMemberDeletionReasonOptions is EqualUnmodifiableListView)
      return _householdMemberDeletionReasonOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdMemberDeletionReasonOptions);
  }

  final List<BackgroundServiceConfig>? _backgroundServiceConfig;
  @override
  @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
  List<BackgroundServiceConfig>? get backgroundServiceConfig {
    final value = _backgroundServiceConfig;
    if (value == null) return null;
    if (_backgroundServiceConfig is EqualUnmodifiableListView)
      return _backgroundServiceConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CheckListTypes> _checklistTypes;
  @override
  @JsonKey(name: 'CHECKLIST_TYPES')
  List<CheckListTypes> get checklistTypes {
    if (_checklistTypes is EqualUnmodifiableListView) return _checklistTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checklistTypes);
  }

  final List<IdTypeOptions> _idTypeOptions;
  @override
  @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
  List<IdTypeOptions> get idTypeOptions {
    if (_idTypeOptions is EqualUnmodifiableListView) return _idTypeOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idTypeOptions);
  }

  final List<DeliveryCommentOptions> _deliveryCommentOptions;
  @override
  @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
  List<DeliveryCommentOptions> get deliveryCommentOptions {
    if (_deliveryCommentOptions is EqualUnmodifiableListView)
      return _deliveryCommentOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryCommentOptions);
  }

  final List<BackendInterface> _backendInterface;
  @override
  @JsonKey(name: 'BACKEND_INTERFACE')
  List<BackendInterface> get backendInterface {
    if (_backendInterface is EqualUnmodifiableListView)
      return _backendInterface;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backendInterface);
  }

  final List<CallSupportList>? _callSupportOptions;
  @override
  @JsonKey(name: 'CALL_SUPPORT')
  List<CallSupportList>? get callSupportOptions {
    final value = _callSupportOptions;
    if (value == null) return null;
    if (_callSupportOptions is EqualUnmodifiableListView)
      return _callSupportOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TransportTypes> _transportTypes;
  @override
  @JsonKey(name: 'TRANSPORT_TYPES')
  List<TransportTypes> get transportTypes {
    if (_transportTypes is EqualUnmodifiableListView) return _transportTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transportTypes);
  }

  final List<SymptomsType>? _symptomsTypeList;
  @override
  @JsonKey(name: 'SYMPTOM_TYPES')
  List<SymptomsType>? get symptomsTypeList {
    final value = _symptomsTypeList;
    if (value == null) return null;
    if (_symptomsTypeList is EqualUnmodifiableListView)
      return _symptomsTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SearchHouseHoldFilters>? _searchHouseHoldFilters;
  @override
  @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
  List<SearchHouseHoldFilters>? get searchHouseHoldFilters {
    final value = _searchHouseHoldFilters;
    if (value == null) return null;
    if (_searchHouseHoldFilters is EqualUnmodifiableListView)
      return _searchHouseHoldFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReferralReasonType>? _referralReasonList;
  @override
  @JsonKey(name: 'REFERRAL_REASONS')
  List<ReferralReasonType>? get referralReasonList {
    final value = _referralReasonList;
    if (value == null) return null;
    if (_referralReasonList is EqualUnmodifiableListView)
      return _referralReasonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CommonMasterModel>? _houseStructureTypes;
  @override
  @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
  List<CommonMasterModel>? get houseStructureTypes {
    final value = _houseStructureTypes;
    if (value == null) return null;
    if (_houseStructureTypes is EqualUnmodifiableListView)
      return _houseStructureTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CommonMasterModel>? _refusalReasons;
  @override
  @JsonKey(name: 'REFUSAL_REASONS')
  List<CommonMasterModel>? get refusalReasons {
    final value = _refusalReasons;
    if (value == null) return null;
    if (_refusalReasons is EqualUnmodifiableListView) return _refusalReasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FirebaseConfig>? _firebaseConfig;
  @override
  @JsonKey(name: 'FIREBASE_CONFIG')
  List<FirebaseConfig>? get firebaseConfig {
    final value = _firebaseConfig;
    if (value == null) return null;
    if (_firebaseConfig is EqualUnmodifiableListView) return _firebaseConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FormConfigModel>? _formConfig;
  @override
  @JsonKey(name: 'FORM_CONFIG')
  List<FormConfigModel>? get formConfig {
    final value = _formConfig;
    if (value == null) return null;
    if (_formConfig is EqualUnmodifiableListView) return _formConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RegistrationDeliveryConfigModel>? _registrationDeliveryConfig;
  @override
  @JsonKey(name: 'REGISTRATION_DELIVERY_CONFIGS')
  List<RegistrationDeliveryConfigModel>? get registrationDeliveryConfig {
    final value = _registrationDeliveryConfig;
    if (value == null) return null;
    if (_registrationDeliveryConfig is EqualUnmodifiableListView)
      return _registrationDeliveryConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HCMWrapperModel(appConfig: $appConfig, bandWidthBatchSize: $bandWidthBatchSize, downSyncBandWidthBatchSize: $downSyncBandWidthBatchSize, householdDeletionReasonOptions: $householdDeletionReasonOptions, householdMemberDeletionReasonOptions: $householdMemberDeletionReasonOptions, backgroundServiceConfig: $backgroundServiceConfig, checklistTypes: $checklistTypes, idTypeOptions: $idTypeOptions, deliveryCommentOptions: $deliveryCommentOptions, backendInterface: $backendInterface, callSupportOptions: $callSupportOptions, transportTypes: $transportTypes, symptomsTypeList: $symptomsTypeList, searchHouseHoldFilters: $searchHouseHoldFilters, referralReasonList: $referralReasonList, houseStructureTypes: $houseStructureTypes, refusalReasons: $refusalReasons, firebaseConfig: $firebaseConfig, formConfig: $formConfig, registrationDeliveryConfig: $registrationDeliveryConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HCMWrapperModelImpl &&
            const DeepCollectionEquality()
                .equals(other._appConfig, _appConfig) &&
            const DeepCollectionEquality()
                .equals(other._bandWidthBatchSize, _bandWidthBatchSize) &&
            const DeepCollectionEquality().equals(
                other._downSyncBandWidthBatchSize,
                _downSyncBandWidthBatchSize) &&
            const DeepCollectionEquality().equals(
                other._householdDeletionReasonOptions,
                _householdDeletionReasonOptions) &&
            const DeepCollectionEquality().equals(
                other._householdMemberDeletionReasonOptions,
                _householdMemberDeletionReasonOptions) &&
            const DeepCollectionEquality().equals(
                other._backgroundServiceConfig, _backgroundServiceConfig) &&
            const DeepCollectionEquality()
                .equals(other._checklistTypes, _checklistTypes) &&
            const DeepCollectionEquality()
                .equals(other._idTypeOptions, _idTypeOptions) &&
            const DeepCollectionEquality().equals(
                other._deliveryCommentOptions, _deliveryCommentOptions) &&
            const DeepCollectionEquality()
                .equals(other._backendInterface, _backendInterface) &&
            const DeepCollectionEquality()
                .equals(other._callSupportOptions, _callSupportOptions) &&
            const DeepCollectionEquality()
                .equals(other._transportTypes, _transportTypes) &&
            const DeepCollectionEquality()
                .equals(other._symptomsTypeList, _symptomsTypeList) &&
            const DeepCollectionEquality().equals(
                other._searchHouseHoldFilters, _searchHouseHoldFilters) &&
            const DeepCollectionEquality()
                .equals(other._referralReasonList, _referralReasonList) &&
            const DeepCollectionEquality()
                .equals(other._houseStructureTypes, _houseStructureTypes) &&
            const DeepCollectionEquality()
                .equals(other._refusalReasons, _refusalReasons) &&
            const DeepCollectionEquality()
                .equals(other._firebaseConfig, _firebaseConfig) &&
            const DeepCollectionEquality()
                .equals(other._formConfig, _formConfig) &&
            const DeepCollectionEquality().equals(
                other._registrationDeliveryConfig,
                _registrationDeliveryConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_appConfig),
        const DeepCollectionEquality().hash(_bandWidthBatchSize),
        const DeepCollectionEquality().hash(_downSyncBandWidthBatchSize),
        const DeepCollectionEquality().hash(_householdDeletionReasonOptions),
        const DeepCollectionEquality()
            .hash(_householdMemberDeletionReasonOptions),
        const DeepCollectionEquality().hash(_backgroundServiceConfig),
        const DeepCollectionEquality().hash(_checklistTypes),
        const DeepCollectionEquality().hash(_idTypeOptions),
        const DeepCollectionEquality().hash(_deliveryCommentOptions),
        const DeepCollectionEquality().hash(_backendInterface),
        const DeepCollectionEquality().hash(_callSupportOptions),
        const DeepCollectionEquality().hash(_transportTypes),
        const DeepCollectionEquality().hash(_symptomsTypeList),
        const DeepCollectionEquality().hash(_searchHouseHoldFilters),
        const DeepCollectionEquality().hash(_referralReasonList),
        const DeepCollectionEquality().hash(_houseStructureTypes),
        const DeepCollectionEquality().hash(_refusalReasons),
        const DeepCollectionEquality().hash(_firebaseConfig),
        const DeepCollectionEquality().hash(_formConfig),
        const DeepCollectionEquality().hash(_registrationDeliveryConfig)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HCMWrapperModelImplCopyWith<_$HCMWrapperModelImpl> get copyWith =>
      __$$HCMWrapperModelImplCopyWithImpl<_$HCMWrapperModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HCMWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _HCMWrapperModel implements HCMWrapperModel {
  const factory _HCMWrapperModel(
      {@JsonKey(name: 'APP_CONFIG') required final List<AppConfig> appConfig,
      @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
      required final List<BandWidthBatchSize> bandWidthBatchSize,
      @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
      required final List<BandWidthBatchSize> downSyncBandWidthBatchSize,
      @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
      required final List<DeletionReasonOptions> householdDeletionReasonOptions,
      @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
      required final List<DeletionReasonOptions>
          householdMemberDeletionReasonOptions,
      @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
      final List<BackgroundServiceConfig>? backgroundServiceConfig,
      @JsonKey(name: 'CHECKLIST_TYPES')
      required final List<CheckListTypes> checklistTypes,
      @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
      required final List<IdTypeOptions> idTypeOptions,
      @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
      required final List<DeliveryCommentOptions> deliveryCommentOptions,
      @JsonKey(name: 'BACKEND_INTERFACE')
      required final List<BackendInterface> backendInterface,
      @JsonKey(name: 'CALL_SUPPORT')
      required final List<CallSupportList>? callSupportOptions,
      @JsonKey(name: 'TRANSPORT_TYPES')
      required final List<TransportTypes> transportTypes,
      @JsonKey(name: 'SYMPTOM_TYPES')
      final List<SymptomsType>? symptomsTypeList,
      @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
      final List<SearchHouseHoldFilters>? searchHouseHoldFilters,
      @JsonKey(name: 'REFERRAL_REASONS')
      final List<ReferralReasonType>? referralReasonList,
      @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
      final List<CommonMasterModel>? houseStructureTypes,
      @JsonKey(name: 'REFUSAL_REASONS')
      final List<CommonMasterModel>? refusalReasons,
      @JsonKey(name: 'FIREBASE_CONFIG')
      required final List<FirebaseConfig>? firebaseConfig,
      @JsonKey(name: 'FORM_CONFIG') final List<FormConfigModel>? formConfig,
      @JsonKey(name: 'REGISTRATION_DELIVERY_CONFIGS')
      final List<RegistrationDeliveryConfigModel>?
          registrationDeliveryConfig}) = _$HCMWrapperModelImpl;

  factory _HCMWrapperModel.fromJson(Map<String, dynamic> json) =
      _$HCMWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'APP_CONFIG')
  List<AppConfig> get appConfig;
  @override
  @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get bandWidthBatchSize;
  @override
  @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
  List<BandWidthBatchSize> get downSyncBandWidthBatchSize;
  @override
  @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdDeletionReasonOptions;
  @override
  @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
  List<DeletionReasonOptions> get householdMemberDeletionReasonOptions;
  @override
  @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
  List<BackgroundServiceConfig>? get backgroundServiceConfig;
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
  List<BackendInterface> get backendInterface;
  @override
  @JsonKey(name: 'CALL_SUPPORT')
  List<CallSupportList>? get callSupportOptions;
  @override
  @JsonKey(name: 'TRANSPORT_TYPES')
  List<TransportTypes> get transportTypes;
  @override
  @JsonKey(name: 'SYMPTOM_TYPES')
  List<SymptomsType>? get symptomsTypeList;
  @override
  @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
  List<SearchHouseHoldFilters>? get searchHouseHoldFilters;
  @override
  @JsonKey(name: 'REFERRAL_REASONS')
  List<ReferralReasonType>? get referralReasonList;
  @override
  @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
  List<CommonMasterModel>? get houseStructureTypes;
  @override
  @JsonKey(name: 'REFUSAL_REASONS')
  List<CommonMasterModel>? get refusalReasons;
  @override
  @JsonKey(name: 'FIREBASE_CONFIG')
  List<FirebaseConfig>? get firebaseConfig;
  @override
  @JsonKey(name: 'FORM_CONFIG')
  List<FormConfigModel>? get formConfig;
  @override
  @JsonKey(name: 'REGISTRATION_DELIVERY_CONFIGS')
  List<RegistrationDeliveryConfigModel>? get registrationDeliveryConfig;
  @override
  @JsonKey(ignore: true)
  _$$HCMWrapperModelImplCopyWith<_$HCMWrapperModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
abstract class _$$AppConfigSecondaryWrapperModelImplCopyWith<$Res>
    implements $AppConfigSecondaryWrapperModelCopyWith<$Res> {
  factory _$$AppConfigSecondaryWrapperModelImplCopyWith(
          _$AppConfigSecondaryWrapperModelImpl value,
          $Res Function(_$AppConfigSecondaryWrapperModelImpl) then) =
      __$$AppConfigSecondaryWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'appConfig') List<AppConfig>? appConfiglist});
}

/// @nodoc
class __$$AppConfigSecondaryWrapperModelImplCopyWithImpl<$Res>
    extends _$AppConfigSecondaryWrapperModelCopyWithImpl<$Res,
        _$AppConfigSecondaryWrapperModelImpl>
    implements _$$AppConfigSecondaryWrapperModelImplCopyWith<$Res> {
  __$$AppConfigSecondaryWrapperModelImplCopyWithImpl(
      _$AppConfigSecondaryWrapperModelImpl _value,
      $Res Function(_$AppConfigSecondaryWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiglist = freezed,
  }) {
    return _then(_$AppConfigSecondaryWrapperModelImpl(
      appConfiglist: freezed == appConfiglist
          ? _value._appConfiglist
          : appConfiglist // ignore: cast_nullable_to_non_nullable
              as List<AppConfig>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigSecondaryWrapperModelImpl
    implements _AppConfigSecondaryWrapperModel {
  const _$AppConfigSecondaryWrapperModelImpl(
      {@JsonKey(name: 'appConfig') final List<AppConfig>? appConfiglist})
      : _appConfiglist = appConfiglist;

  factory _$AppConfigSecondaryWrapperModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AppConfigSecondaryWrapperModelImplFromJson(json);

  final List<AppConfig>? _appConfiglist;
  @override
  @JsonKey(name: 'appConfig')
  List<AppConfig>? get appConfiglist {
    final value = _appConfiglist;
    if (value == null) return null;
    if (_appConfiglist is EqualUnmodifiableListView) return _appConfiglist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppConfigSecondaryWrapperModel(appConfiglist: $appConfiglist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigSecondaryWrapperModelImpl &&
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
  _$$AppConfigSecondaryWrapperModelImplCopyWith<
          _$AppConfigSecondaryWrapperModelImpl>
      get copyWith => __$$AppConfigSecondaryWrapperModelImplCopyWithImpl<
          _$AppConfigSecondaryWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigSecondaryWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _AppConfigSecondaryWrapperModel
    implements AppConfigSecondaryWrapperModel {
  const factory _AppConfigSecondaryWrapperModel(
          {@JsonKey(name: 'appConfig') final List<AppConfig>? appConfiglist}) =
      _$AppConfigSecondaryWrapperModelImpl;

  factory _AppConfigSecondaryWrapperModel.fromJson(Map<String, dynamic> json) =
      _$AppConfigSecondaryWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'appConfig')
  List<AppConfig>? get appConfiglist;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigSecondaryWrapperModelImplCopyWith<
          _$AppConfigSecondaryWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommonMastersWrapperModel _$CommonMastersWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _CommonMastersWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$CommonMastersWrapperModel {
  @JsonKey(name: 'GenderType')
  List<CommonMasterModel> get genderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'StateInfo')
  List<StateInfoModel> get stateInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrivacyPolicy')
  List<PrivacyPolicyModel>? get privacyPolicyConfig =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonMastersWrapperModelCopyWith<CommonMastersWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonMastersWrapperModelCopyWith<$Res> {
  factory $CommonMastersWrapperModelCopyWith(CommonMastersWrapperModel value,
          $Res Function(CommonMastersWrapperModel) then) =
      _$CommonMastersWrapperModelCopyWithImpl<$Res, CommonMastersWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'GenderType') List<CommonMasterModel> genderType,
      @JsonKey(name: 'StateInfo') List<StateInfoModel> stateInfo,
      @JsonKey(name: 'PrivacyPolicy')
      List<PrivacyPolicyModel>? privacyPolicyConfig});
}

/// @nodoc
class _$CommonMastersWrapperModelCopyWithImpl<$Res,
        $Val extends CommonMastersWrapperModel>
    implements $CommonMastersWrapperModelCopyWith<$Res> {
  _$CommonMastersWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderType = null,
    Object? stateInfo = null,
    Object? privacyPolicyConfig = freezed,
  }) {
    return _then(_value.copyWith(
      genderType: null == genderType
          ? _value.genderType
          : genderType // ignore: cast_nullable_to_non_nullable
              as List<CommonMasterModel>,
      stateInfo: null == stateInfo
          ? _value.stateInfo
          : stateInfo // ignore: cast_nullable_to_non_nullable
              as List<StateInfoModel>,
      privacyPolicyConfig: freezed == privacyPolicyConfig
          ? _value.privacyPolicyConfig
          : privacyPolicyConfig // ignore: cast_nullable_to_non_nullable
              as List<PrivacyPolicyModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonMastersWrapperModelImplCopyWith<$Res>
    implements $CommonMastersWrapperModelCopyWith<$Res> {
  factory _$$CommonMastersWrapperModelImplCopyWith(
          _$CommonMastersWrapperModelImpl value,
          $Res Function(_$CommonMastersWrapperModelImpl) then) =
      __$$CommonMastersWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'GenderType') List<CommonMasterModel> genderType,
      @JsonKey(name: 'StateInfo') List<StateInfoModel> stateInfo,
      @JsonKey(name: 'PrivacyPolicy')
      List<PrivacyPolicyModel>? privacyPolicyConfig});
}

/// @nodoc
class __$$CommonMastersWrapperModelImplCopyWithImpl<$Res>
    extends _$CommonMastersWrapperModelCopyWithImpl<$Res,
        _$CommonMastersWrapperModelImpl>
    implements _$$CommonMastersWrapperModelImplCopyWith<$Res> {
  __$$CommonMastersWrapperModelImplCopyWithImpl(
      _$CommonMastersWrapperModelImpl _value,
      $Res Function(_$CommonMastersWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderType = null,
    Object? stateInfo = null,
    Object? privacyPolicyConfig = freezed,
  }) {
    return _then(_$CommonMastersWrapperModelImpl(
      genderType: null == genderType
          ? _value._genderType
          : genderType // ignore: cast_nullable_to_non_nullable
              as List<CommonMasterModel>,
      stateInfo: null == stateInfo
          ? _value._stateInfo
          : stateInfo // ignore: cast_nullable_to_non_nullable
              as List<StateInfoModel>,
      privacyPolicyConfig: freezed == privacyPolicyConfig
          ? _value._privacyPolicyConfig
          : privacyPolicyConfig // ignore: cast_nullable_to_non_nullable
              as List<PrivacyPolicyModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonMastersWrapperModelImpl implements _CommonMastersWrapperModel {
  const _$CommonMastersWrapperModelImpl(
      {@JsonKey(name: 'GenderType')
      required final List<CommonMasterModel> genderType,
      @JsonKey(name: 'StateInfo') required final List<StateInfoModel> stateInfo,
      @JsonKey(name: 'PrivacyPolicy')
      final List<PrivacyPolicyModel>? privacyPolicyConfig})
      : _genderType = genderType,
        _stateInfo = stateInfo,
        _privacyPolicyConfig = privacyPolicyConfig;

  factory _$CommonMastersWrapperModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonMastersWrapperModelImplFromJson(json);

  final List<CommonMasterModel> _genderType;
  @override
  @JsonKey(name: 'GenderType')
  List<CommonMasterModel> get genderType {
    if (_genderType is EqualUnmodifiableListView) return _genderType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genderType);
  }

  final List<StateInfoModel> _stateInfo;
  @override
  @JsonKey(name: 'StateInfo')
  List<StateInfoModel> get stateInfo {
    if (_stateInfo is EqualUnmodifiableListView) return _stateInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stateInfo);
  }

  final List<PrivacyPolicyModel>? _privacyPolicyConfig;
  @override
  @JsonKey(name: 'PrivacyPolicy')
  List<PrivacyPolicyModel>? get privacyPolicyConfig {
    final value = _privacyPolicyConfig;
    if (value == null) return null;
    if (_privacyPolicyConfig is EqualUnmodifiableListView)
      return _privacyPolicyConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommonMastersWrapperModel(genderType: $genderType, stateInfo: $stateInfo, privacyPolicyConfig: $privacyPolicyConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonMastersWrapperModelImpl &&
            const DeepCollectionEquality()
                .equals(other._genderType, _genderType) &&
            const DeepCollectionEquality()
                .equals(other._stateInfo, _stateInfo) &&
            const DeepCollectionEquality()
                .equals(other._privacyPolicyConfig, _privacyPolicyConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_genderType),
      const DeepCollectionEquality().hash(_stateInfo),
      const DeepCollectionEquality().hash(_privacyPolicyConfig));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonMastersWrapperModelImplCopyWith<_$CommonMastersWrapperModelImpl>
      get copyWith => __$$CommonMastersWrapperModelImplCopyWithImpl<
          _$CommonMastersWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonMastersWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _CommonMastersWrapperModel implements CommonMastersWrapperModel {
  const factory _CommonMastersWrapperModel(
      {@JsonKey(name: 'GenderType')
      required final List<CommonMasterModel> genderType,
      @JsonKey(name: 'StateInfo') required final List<StateInfoModel> stateInfo,
      @JsonKey(name: 'PrivacyPolicy')
      final List<PrivacyPolicyModel>?
          privacyPolicyConfig}) = _$CommonMastersWrapperModelImpl;

  factory _CommonMastersWrapperModel.fromJson(Map<String, dynamic> json) =
      _$CommonMastersWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'GenderType')
  List<CommonMasterModel> get genderType;
  @override
  @JsonKey(name: 'StateInfo')
  List<StateInfoModel> get stateInfo;
  @override
  @JsonKey(name: 'PrivacyPolicy')
  List<PrivacyPolicyModel>? get privacyPolicyConfig;
  @override
  @JsonKey(ignore: true)
  _$$CommonMastersWrapperModelImplCopyWith<_$CommonMastersWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommonMasterModel _$CommonMasterModelFromJson(Map<String, dynamic> json) {
  return _CommonMasterModel.fromJson(json);
}

/// @nodoc
mixin _$CommonMasterModel {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonMasterModelCopyWith<CommonMasterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonMasterModelCopyWith<$Res> {
  factory $CommonMasterModelCopyWith(
          CommonMasterModel value, $Res Function(CommonMasterModel) then) =
      _$CommonMasterModelCopyWithImpl<$Res, CommonMasterModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'active') bool active});
}

/// @nodoc
class _$CommonMasterModelCopyWithImpl<$Res, $Val extends CommonMasterModel>
    implements $CommonMasterModelCopyWith<$Res> {
  _$CommonMasterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonMasterModelImplCopyWith<$Res>
    implements $CommonMasterModelCopyWith<$Res> {
  factory _$$CommonMasterModelImplCopyWith(_$CommonMasterModelImpl value,
          $Res Function(_$CommonMasterModelImpl) then) =
      __$$CommonMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'active') bool active});
}

/// @nodoc
class __$$CommonMasterModelImplCopyWithImpl<$Res>
    extends _$CommonMasterModelCopyWithImpl<$Res, _$CommonMasterModelImpl>
    implements _$$CommonMasterModelImplCopyWith<$Res> {
  __$$CommonMasterModelImplCopyWithImpl(_$CommonMasterModelImpl _value,
      $Res Function(_$CommonMasterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = freezed,
    Object? active = null,
  }) {
    return _then(_$CommonMasterModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonMasterModelImpl implements _CommonMasterModel {
  const _$CommonMasterModelImpl(
      {@JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'active') required this.active});

  factory _$CommonMasterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonMasterModelImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'active')
  final bool active;

  @override
  String toString() {
    return 'CommonMasterModel(code: $code, name: $name, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonMasterModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonMasterModelImplCopyWith<_$CommonMasterModelImpl> get copyWith =>
      __$$CommonMasterModelImplCopyWithImpl<_$CommonMasterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonMasterModelImplToJson(
      this,
    );
  }
}

abstract class _CommonMasterModel implements CommonMasterModel {
  const factory _CommonMasterModel(
          {@JsonKey(name: 'code') required final String code,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'active') required final bool active}) =
      _$CommonMasterModelImpl;

  factory _CommonMasterModel.fromJson(Map<String, dynamic> json) =
      _$CommonMasterModelImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'active')
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$CommonMasterModelImplCopyWith<_$CommonMasterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StateInfoModel _$StateInfoModelFromJson(Map<String, dynamic> json) {
  return _StateInfoModel.fromJson(json);
}

/// @nodoc
mixin _$StateInfoModel {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'languages')
  List<Languages> get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'localizationModules')
  List<Languages>? get localizationModules =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateInfoModelCopyWith<StateInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateInfoModelCopyWith<$Res> {
  factory $StateInfoModelCopyWith(
          StateInfoModel value, $Res Function(StateInfoModel) then) =
      _$StateInfoModelCopyWithImpl<$Res, StateInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'languages') List<Languages> languages,
      @JsonKey(name: 'localizationModules')
      List<Languages>? localizationModules});
}

/// @nodoc
class _$StateInfoModelCopyWithImpl<$Res, $Val extends StateInfoModel>
    implements $StateInfoModelCopyWith<$Res> {
  _$StateInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? languages = null,
    Object? localizationModules = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Languages>,
      localizationModules: freezed == localizationModules
          ? _value.localizationModules
          : localizationModules // ignore: cast_nullable_to_non_nullable
              as List<Languages>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateInfoModelImplCopyWith<$Res>
    implements $StateInfoModelCopyWith<$Res> {
  factory _$$StateInfoModelImplCopyWith(_$StateInfoModelImpl value,
          $Res Function(_$StateInfoModelImpl) then) =
      __$$StateInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'languages') List<Languages> languages,
      @JsonKey(name: 'localizationModules')
      List<Languages>? localizationModules});
}

/// @nodoc
class __$$StateInfoModelImplCopyWithImpl<$Res>
    extends _$StateInfoModelCopyWithImpl<$Res, _$StateInfoModelImpl>
    implements _$$StateInfoModelImplCopyWith<$Res> {
  __$$StateInfoModelImplCopyWithImpl(
      _$StateInfoModelImpl _value, $Res Function(_$StateInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? languages = null,
    Object? localizationModules = freezed,
  }) {
    return _then(_$StateInfoModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Languages>,
      localizationModules: freezed == localizationModules
          ? _value._localizationModules
          : localizationModules // ignore: cast_nullable_to_non_nullable
              as List<Languages>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateInfoModelImpl implements _StateInfoModel {
  const _$StateInfoModelImpl(
      {@JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'languages') required final List<Languages> languages,
      @JsonKey(name: 'localizationModules')
      final List<Languages>? localizationModules})
      : _languages = languages,
        _localizationModules = localizationModules;

  factory _$StateInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;
  final List<Languages> _languages;
  @override
  @JsonKey(name: 'languages')
  List<Languages> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  final List<Languages>? _localizationModules;
  @override
  @JsonKey(name: 'localizationModules')
  List<Languages>? get localizationModules {
    final value = _localizationModules;
    if (value == null) return null;
    if (_localizationModules is EqualUnmodifiableListView)
      return _localizationModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StateInfoModel(code: $code, languages: $languages, localizationModules: $localizationModules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateInfoModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._localizationModules, _localizationModules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_localizationModules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateInfoModelImplCopyWith<_$StateInfoModelImpl> get copyWith =>
      __$$StateInfoModelImplCopyWithImpl<_$StateInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateInfoModelImplToJson(
      this,
    );
  }
}

abstract class _StateInfoModel implements StateInfoModel {
  const factory _StateInfoModel(
      {@JsonKey(name: 'code') required final String code,
      @JsonKey(name: 'languages') required final List<Languages> languages,
      @JsonKey(name: 'localizationModules')
      final List<Languages>? localizationModules}) = _$StateInfoModelImpl;

  factory _StateInfoModel.fromJson(Map<String, dynamic> json) =
      _$StateInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'languages')
  List<Languages> get languages;
  @override
  @JsonKey(name: 'localizationModules')
  List<Languages>? get localizationModules;
  @override
  @JsonKey(ignore: true)
  _$$StateInfoModelImplCopyWith<_$StateInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
abstract class _$$RowVersionWrapperModelImplCopyWith<$Res>
    implements $RowVersionWrapperModelCopyWith<$Res> {
  factory _$$RowVersionWrapperModelImplCopyWith(
          _$RowVersionWrapperModelImpl value,
          $Res Function(_$RowVersionWrapperModelImpl) then) =
      __$$RowVersionWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? rowVersionslist});
}

/// @nodoc
class __$$RowVersionWrapperModelImplCopyWithImpl<$Res>
    extends _$RowVersionWrapperModelCopyWithImpl<$Res,
        _$RowVersionWrapperModelImpl>
    implements _$$RowVersionWrapperModelImplCopyWith<$Res> {
  __$$RowVersionWrapperModelImplCopyWithImpl(
      _$RowVersionWrapperModelImpl _value,
      $Res Function(_$RowVersionWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowVersionslist = freezed,
  }) {
    return _then(_$RowVersionWrapperModelImpl(
      rowVersionslist: freezed == rowVersionslist
          ? _value._rowVersionslist
          : rowVersionslist // ignore: cast_nullable_to_non_nullable
              as List<RowVersions>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RowVersionWrapperModelImpl implements _RowVersionWrapperModel {
  const _$RowVersionWrapperModelImpl(
      {@JsonKey(name: 'ROW_VERSIONS') final List<RowVersions>? rowVersionslist})
      : _rowVersionslist = rowVersionslist;

  factory _$RowVersionWrapperModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowVersionWrapperModelImplFromJson(json);

  final List<RowVersions>? _rowVersionslist;
  @override
  @JsonKey(name: 'ROW_VERSIONS')
  List<RowVersions>? get rowVersionslist {
    final value = _rowVersionslist;
    if (value == null) return null;
    if (_rowVersionslist is EqualUnmodifiableListView) return _rowVersionslist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RowVersionWrapperModel(rowVersionslist: $rowVersionslist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowVersionWrapperModelImpl &&
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
  _$$RowVersionWrapperModelImplCopyWith<_$RowVersionWrapperModelImpl>
      get copyWith => __$$RowVersionWrapperModelImplCopyWithImpl<
          _$RowVersionWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowVersionWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _RowVersionWrapperModel implements RowVersionWrapperModel {
  const factory _RowVersionWrapperModel(
      {@JsonKey(name: 'ROW_VERSIONS')
      final List<RowVersions>? rowVersionslist}) = _$RowVersionWrapperModelImpl;

  factory _RowVersionWrapperModel.fromJson(Map<String, dynamic> json) =
      _$RowVersionWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'ROW_VERSIONS')
  List<RowVersions>? get rowVersionslist;
  @override
  @JsonKey(ignore: true)
  _$$RowVersionWrapperModelImplCopyWith<_$RowVersionWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'TENANT_ID')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
  double? get maxRadius => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'NETWORK_DETECTION') String networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE') String persistenceMode,
      @JsonKey(name: 'SYNC_METHOD') String syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER') String syncTrigger,
      @JsonKey(name: 'TENANT_ID') String? tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE') double? maxRadius});
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
    Object? tenantId = freezed,
    Object? maxRadius = freezed,
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
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      maxRadius: freezed == maxRadius
          ? _value.maxRadius
          : maxRadius // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'NETWORK_DETECTION') String networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE') String persistenceMode,
      @JsonKey(name: 'SYNC_METHOD') String syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER') String syncTrigger,
      @JsonKey(name: 'TENANT_ID') String? tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE') double? maxRadius});
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkDetection = null,
    Object? persistenceMode = null,
    Object? syncMethod = null,
    Object? syncTrigger = null,
    Object? tenantId = freezed,
    Object? maxRadius = freezed,
  }) {
    return _then(_$AppConfigImpl(
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
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      maxRadius: freezed == maxRadius
          ? _value.maxRadius
          : maxRadius // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  _$AppConfigImpl(
      {@JsonKey(name: 'NETWORK_DETECTION') required this.networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE') required this.persistenceMode,
      @JsonKey(name: 'SYNC_METHOD') required this.syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER') required this.syncTrigger,
      @JsonKey(name: 'TENANT_ID') this.tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE') this.maxRadius});

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

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
  @override
  @JsonKey(name: 'TENANT_ID')
  final String? tenantId;
  @override
  @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
  final double? maxRadius;

  @override
  String toString() {
    return 'AppConfig(networkDetection: $networkDetection, persistenceMode: $persistenceMode, syncMethod: $syncMethod, syncTrigger: $syncTrigger, tenantId: $tenantId, maxRadius: $maxRadius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.networkDetection, networkDetection) ||
                other.networkDetection == networkDetection) &&
            (identical(other.persistenceMode, persistenceMode) ||
                other.persistenceMode == persistenceMode) &&
            (identical(other.syncMethod, syncMethod) ||
                other.syncMethod == syncMethod) &&
            (identical(other.syncTrigger, syncTrigger) ||
                other.syncTrigger == syncTrigger) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.maxRadius, maxRadius) ||
                other.maxRadius == maxRadius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, networkDetection,
      persistenceMode, syncMethod, syncTrigger, tenantId, maxRadius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig implements AppConfig {
  factory _AppConfig(
      {@JsonKey(name: 'NETWORK_DETECTION')
      required final String networkDetection,
      @JsonKey(name: 'PERSISTENCE_MODE') required final String persistenceMode,
      @JsonKey(name: 'SYNC_METHOD') required final String syncMethod,
      @JsonKey(name: 'SYNC_TRIGGER') required final String syncTrigger,
      @JsonKey(name: 'TENANT_ID') final String? tenantId,
      @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
      final double? maxRadius}) = _$AppConfigImpl;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

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
  @JsonKey(name: 'TENANT_ID')
  String? get tenantId;
  @override
  @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')
  double? get maxRadius;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
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
abstract class _$$IdTypeOptionsImplCopyWith<$Res>
    implements $IdTypeOptionsCopyWith<$Res> {
  factory _$$IdTypeOptionsImplCopyWith(
          _$IdTypeOptionsImpl value, $Res Function(_$IdTypeOptionsImpl) then) =
      __$$IdTypeOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$IdTypeOptionsImplCopyWithImpl<$Res>
    extends _$IdTypeOptionsCopyWithImpl<$Res, _$IdTypeOptionsImpl>
    implements _$$IdTypeOptionsImplCopyWith<$Res> {
  __$$IdTypeOptionsImplCopyWithImpl(
      _$IdTypeOptionsImpl _value, $Res Function(_$IdTypeOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$IdTypeOptionsImpl(
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
class _$IdTypeOptionsImpl implements _IdTypeOptions {
  _$IdTypeOptionsImpl({required this.name, required this.code});

  factory _$IdTypeOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdTypeOptionsImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'IdTypeOptions(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdTypeOptionsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdTypeOptionsImplCopyWith<_$IdTypeOptionsImpl> get copyWith =>
      __$$IdTypeOptionsImplCopyWithImpl<_$IdTypeOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdTypeOptionsImplToJson(
      this,
    );
  }
}

abstract class _IdTypeOptions implements IdTypeOptions {
  factory _IdTypeOptions(
      {required final String name,
      required final String code}) = _$IdTypeOptionsImpl;

  factory _IdTypeOptions.fromJson(Map<String, dynamic> json) =
      _$IdTypeOptionsImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$IdTypeOptionsImplCopyWith<_$IdTypeOptionsImpl> get copyWith =>
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
abstract class _$$BandWidthBatchSizeImplCopyWith<$Res>
    implements $BandWidthBatchSizeCopyWith<$Res> {
  factory _$$BandWidthBatchSizeImplCopyWith(_$BandWidthBatchSizeImpl value,
          $Res Function(_$BandWidthBatchSizeImpl) then) =
      __$$BandWidthBatchSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MIN_RANGE') double minRange,
      @JsonKey(name: 'MAX_RANGE') double maxRange,
      @JsonKey(name: 'BATCH_SIZE') int batchSize});
}

/// @nodoc
class __$$BandWidthBatchSizeImplCopyWithImpl<$Res>
    extends _$BandWidthBatchSizeCopyWithImpl<$Res, _$BandWidthBatchSizeImpl>
    implements _$$BandWidthBatchSizeImplCopyWith<$Res> {
  __$$BandWidthBatchSizeImplCopyWithImpl(_$BandWidthBatchSizeImpl _value,
      $Res Function(_$BandWidthBatchSizeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minRange = null,
    Object? maxRange = null,
    Object? batchSize = null,
  }) {
    return _then(_$BandWidthBatchSizeImpl(
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
class _$BandWidthBatchSizeImpl implements _BandWidthBatchSize {
  _$BandWidthBatchSizeImpl(
      {@JsonKey(name: 'MIN_RANGE') required this.minRange,
      @JsonKey(name: 'MAX_RANGE') required this.maxRange,
      @JsonKey(name: 'BATCH_SIZE') required this.batchSize});

  factory _$BandWidthBatchSizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BandWidthBatchSizeImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BandWidthBatchSizeImpl &&
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
  _$$BandWidthBatchSizeImplCopyWith<_$BandWidthBatchSizeImpl> get copyWith =>
      __$$BandWidthBatchSizeImplCopyWithImpl<_$BandWidthBatchSizeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BandWidthBatchSizeImplToJson(
      this,
    );
  }
}

abstract class _BandWidthBatchSize implements BandWidthBatchSize {
  factory _BandWidthBatchSize(
          {@JsonKey(name: 'MIN_RANGE') required final double minRange,
          @JsonKey(name: 'MAX_RANGE') required final double maxRange,
          @JsonKey(name: 'BATCH_SIZE') required final int batchSize}) =
      _$BandWidthBatchSizeImpl;

  factory _BandWidthBatchSize.fromJson(Map<String, dynamic> json) =
      _$BandWidthBatchSizeImpl.fromJson;

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
  _$$BandWidthBatchSizeImplCopyWith<_$BandWidthBatchSizeImpl> get copyWith =>
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
abstract class _$$DeliveryCommentOptionsImplCopyWith<$Res>
    implements $DeliveryCommentOptionsCopyWith<$Res> {
  factory _$$DeliveryCommentOptionsImplCopyWith(
          _$DeliveryCommentOptionsImpl value,
          $Res Function(_$DeliveryCommentOptionsImpl) then) =
      __$$DeliveryCommentOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$DeliveryCommentOptionsImplCopyWithImpl<$Res>
    extends _$DeliveryCommentOptionsCopyWithImpl<$Res,
        _$DeliveryCommentOptionsImpl>
    implements _$$DeliveryCommentOptionsImplCopyWith<$Res> {
  __$$DeliveryCommentOptionsImplCopyWithImpl(
      _$DeliveryCommentOptionsImpl _value,
      $Res Function(_$DeliveryCommentOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$DeliveryCommentOptionsImpl(
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
class _$DeliveryCommentOptionsImpl implements _DeliveryCommentOptions {
  _$DeliveryCommentOptionsImpl({required this.name, required this.code});

  factory _$DeliveryCommentOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryCommentOptionsImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'DeliveryCommentOptions(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryCommentOptionsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryCommentOptionsImplCopyWith<_$DeliveryCommentOptionsImpl>
      get copyWith => __$$DeliveryCommentOptionsImplCopyWithImpl<
          _$DeliveryCommentOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryCommentOptionsImplToJson(
      this,
    );
  }
}

abstract class _DeliveryCommentOptions implements DeliveryCommentOptions {
  factory _DeliveryCommentOptions(
      {required final String name,
      required final String code}) = _$DeliveryCommentOptionsImpl;

  factory _DeliveryCommentOptions.fromJson(Map<String, dynamic> json) =
      _$DeliveryCommentOptionsImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryCommentOptionsImplCopyWith<_$DeliveryCommentOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$DeletionReasonOptionsImplCopyWith<$Res>
    implements $DeletionReasonOptionsCopyWith<$Res> {
  factory _$$DeletionReasonOptionsImplCopyWith(
          _$DeletionReasonOptionsImpl value,
          $Res Function(_$DeletionReasonOptionsImpl) then) =
      __$$DeletionReasonOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String code});
}

/// @nodoc
class __$$DeletionReasonOptionsImplCopyWithImpl<$Res>
    extends _$DeletionReasonOptionsCopyWithImpl<$Res,
        _$DeletionReasonOptionsImpl>
    implements _$$DeletionReasonOptionsImplCopyWith<$Res> {
  __$$DeletionReasonOptionsImplCopyWithImpl(_$DeletionReasonOptionsImpl _value,
      $Res Function(_$DeletionReasonOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? code = null,
  }) {
    return _then(_$DeletionReasonOptionsImpl(
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
class _$DeletionReasonOptionsImpl implements _DeletionReasonOptions {
  _$DeletionReasonOptionsImpl({required this.value, required this.code});

  factory _$DeletionReasonOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeletionReasonOptionsImplFromJson(json);

  @override
  final String value;
  @override
  final String code;

  @override
  String toString() {
    return 'DeletionReasonOptions(value: $value, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletionReasonOptionsImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletionReasonOptionsImplCopyWith<_$DeletionReasonOptionsImpl>
      get copyWith => __$$DeletionReasonOptionsImplCopyWithImpl<
          _$DeletionReasonOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeletionReasonOptionsImplToJson(
      this,
    );
  }
}

abstract class _DeletionReasonOptions implements DeletionReasonOptions {
  factory _DeletionReasonOptions(
      {required final String value,
      required final String code}) = _$DeletionReasonOptionsImpl;

  factory _DeletionReasonOptions.fromJson(Map<String, dynamic> json) =
      _$DeletionReasonOptionsImpl.fromJson;

  @override
  String get value;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$DeletionReasonOptionsImplCopyWith<_$DeletionReasonOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$GenderOptionsImplCopyWith<$Res>
    implements $GenderOptionsCopyWith<$Res> {
  factory _$$GenderOptionsImplCopyWith(
          _$GenderOptionsImpl value, $Res Function(_$GenderOptionsImpl) then) =
      __$$GenderOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$GenderOptionsImplCopyWithImpl<$Res>
    extends _$GenderOptionsCopyWithImpl<$Res, _$GenderOptionsImpl>
    implements _$$GenderOptionsImplCopyWith<$Res> {
  __$$GenderOptionsImplCopyWithImpl(
      _$GenderOptionsImpl _value, $Res Function(_$GenderOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$GenderOptionsImpl(
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
class _$GenderOptionsImpl implements _GenderOptions {
  _$GenderOptionsImpl({required this.name, required this.code});

  factory _$GenderOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenderOptionsImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'GenderOptions(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderOptionsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderOptionsImplCopyWith<_$GenderOptionsImpl> get copyWith =>
      __$$GenderOptionsImplCopyWithImpl<_$GenderOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenderOptionsImplToJson(
      this,
    );
  }
}

abstract class _GenderOptions implements GenderOptions {
  factory _GenderOptions(
      {required final String name,
      required final String code}) = _$GenderOptionsImpl;

  factory _GenderOptions.fromJson(Map<String, dynamic> json) =
      _$GenderOptionsImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$GenderOptionsImplCopyWith<_$GenderOptionsImpl> get copyWith =>
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
abstract class _$$BackgroundServiceConfigImplCopyWith<$Res>
    implements $BackgroundServiceConfigCopyWith<$Res> {
  factory _$$BackgroundServiceConfigImplCopyWith(
          _$BackgroundServiceConfigImpl value,
          $Res Function(_$BackgroundServiceConfigImpl) then) =
      __$$BackgroundServiceConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') int batteryPercentCutOff,
      @JsonKey(name: 'SERVICE_INTERVAL') int serviceInterval,
      @JsonKey(name: 'API_CONCURRENCY') int apiConcurrency});
}

/// @nodoc
class __$$BackgroundServiceConfigImplCopyWithImpl<$Res>
    extends _$BackgroundServiceConfigCopyWithImpl<$Res,
        _$BackgroundServiceConfigImpl>
    implements _$$BackgroundServiceConfigImplCopyWith<$Res> {
  __$$BackgroundServiceConfigImplCopyWithImpl(
      _$BackgroundServiceConfigImpl _value,
      $Res Function(_$BackgroundServiceConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batteryPercentCutOff = null,
    Object? serviceInterval = null,
    Object? apiConcurrency = null,
  }) {
    return _then(_$BackgroundServiceConfigImpl(
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
class _$BackgroundServiceConfigImpl implements _BackgroundServiceConfig {
  _$BackgroundServiceConfigImpl(
      {@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')
      required this.batteryPercentCutOff,
      @JsonKey(name: 'SERVICE_INTERVAL') required this.serviceInterval,
      @JsonKey(name: 'API_CONCURRENCY') required this.apiConcurrency});

  factory _$BackgroundServiceConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackgroundServiceConfigImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackgroundServiceConfigImpl &&
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
  _$$BackgroundServiceConfigImplCopyWith<_$BackgroundServiceConfigImpl>
      get copyWith => __$$BackgroundServiceConfigImplCopyWithImpl<
          _$BackgroundServiceConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackgroundServiceConfigImplToJson(
      this,
    );
  }
}

abstract class _BackgroundServiceConfig implements BackgroundServiceConfig {
  factory _BackgroundServiceConfig(
      {@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')
      required final int batteryPercentCutOff,
      @JsonKey(name: 'SERVICE_INTERVAL') required final int serviceInterval,
      @JsonKey(name: 'API_CONCURRENCY')
      required final int apiConcurrency}) = _$BackgroundServiceConfigImpl;

  factory _BackgroundServiceConfig.fromJson(Map<String, dynamic> json) =
      _$BackgroundServiceConfigImpl.fromJson;

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
  _$$BackgroundServiceConfigImplCopyWith<_$BackgroundServiceConfigImpl>
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
abstract class _$$BackendInterfaceImplCopyWith<$Res>
    implements $BackendInterfaceCopyWith<$Res> {
  factory _$$BackendInterfaceImplCopyWith(_$BackendInterfaceImpl value,
          $Res Function(_$BackendInterfaceImpl) then) =
      __$$BackendInterfaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'interfaces') List<Interfaces> interface});
}

/// @nodoc
class __$$BackendInterfaceImplCopyWithImpl<$Res>
    extends _$BackendInterfaceCopyWithImpl<$Res, _$BackendInterfaceImpl>
    implements _$$BackendInterfaceImplCopyWith<$Res> {
  __$$BackendInterfaceImplCopyWithImpl(_$BackendInterfaceImpl _value,
      $Res Function(_$BackendInterfaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interface = null,
  }) {
    return _then(_$BackendInterfaceImpl(
      interface: null == interface
          ? _value._interface
          : interface // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendInterfaceImpl implements _BackendInterface {
  _$BackendInterfaceImpl(
      {@JsonKey(name: 'interfaces') required final List<Interfaces> interface})
      : _interface = interface;

  factory _$BackendInterfaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendInterfaceImplFromJson(json);

  final List<Interfaces> _interface;
  @override
  @JsonKey(name: 'interfaces')
  List<Interfaces> get interface {
    if (_interface is EqualUnmodifiableListView) return _interface;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interface);
  }

  @override
  String toString() {
    return 'BackendInterface(interface: $interface)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendInterfaceImpl &&
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
  _$$BackendInterfaceImplCopyWith<_$BackendInterfaceImpl> get copyWith =>
      __$$BackendInterfaceImplCopyWithImpl<_$BackendInterfaceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendInterfaceImplToJson(
      this,
    );
  }
}

abstract class _BackendInterface implements BackendInterface {
  factory _BackendInterface(
      {@JsonKey(name: 'interfaces')
      required final List<Interfaces> interface}) = _$BackendInterfaceImpl;

  factory _BackendInterface.fromJson(Map<String, dynamic> json) =
      _$BackendInterfaceImpl.fromJson;

  @override
  @JsonKey(name: 'interfaces')
  List<Interfaces> get interface;
  @override
  @JsonKey(ignore: true)
  _$$BackendInterfaceImplCopyWith<_$BackendInterfaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegistrationDeliveryConfigModel _$RegistrationDeliveryConfigModelFromJson(
    Map<String, dynamic> json) {
  return _RegistrationDeliveryConfigModel.fromJson(json);
}

/// @nodoc
mixin _$RegistrationDeliveryConfigModel {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'fields')
  List<RegistrationDeliveryConfigFieldModel>? get fields =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationDeliveryConfigModelCopyWith<RegistrationDeliveryConfigModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDeliveryConfigModelCopyWith<$Res> {
  factory $RegistrationDeliveryConfigModelCopyWith(
          RegistrationDeliveryConfigModel value,
          $Res Function(RegistrationDeliveryConfigModel) then) =
      _$RegistrationDeliveryConfigModelCopyWithImpl<$Res,
          RegistrationDeliveryConfigModel>;
  @useResult
  $Res call(
      {String name,
      String type,
      @JsonKey(name: 'fields')
      List<RegistrationDeliveryConfigFieldModel>? fields});
}

/// @nodoc
class _$RegistrationDeliveryConfigModelCopyWithImpl<$Res,
        $Val extends RegistrationDeliveryConfigModel>
    implements $RegistrationDeliveryConfigModelCopyWith<$Res> {
  _$RegistrationDeliveryConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? fields = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      fields: freezed == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<RegistrationDeliveryConfigFieldModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationDeliveryConfigModelImplCopyWith<$Res>
    implements $RegistrationDeliveryConfigModelCopyWith<$Res> {
  factory _$$RegistrationDeliveryConfigModelImplCopyWith(
          _$RegistrationDeliveryConfigModelImpl value,
          $Res Function(_$RegistrationDeliveryConfigModelImpl) then) =
      __$$RegistrationDeliveryConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String type,
      @JsonKey(name: 'fields')
      List<RegistrationDeliveryConfigFieldModel>? fields});
}

/// @nodoc
class __$$RegistrationDeliveryConfigModelImplCopyWithImpl<$Res>
    extends _$RegistrationDeliveryConfigModelCopyWithImpl<$Res,
        _$RegistrationDeliveryConfigModelImpl>
    implements _$$RegistrationDeliveryConfigModelImplCopyWith<$Res> {
  __$$RegistrationDeliveryConfigModelImplCopyWithImpl(
      _$RegistrationDeliveryConfigModelImpl _value,
      $Res Function(_$RegistrationDeliveryConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? fields = freezed,
  }) {
    return _then(_$RegistrationDeliveryConfigModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      fields: freezed == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<RegistrationDeliveryConfigFieldModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationDeliveryConfigModelImpl
    implements _RegistrationDeliveryConfigModel {
  _$RegistrationDeliveryConfigModelImpl(
      {required this.name,
      required this.type,
      @JsonKey(name: 'fields')
      final List<RegistrationDeliveryConfigFieldModel>? fields})
      : _fields = fields;

  factory _$RegistrationDeliveryConfigModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegistrationDeliveryConfigModelImplFromJson(json);

  @override
  final String name;
  @override
  final String type;
  final List<RegistrationDeliveryConfigFieldModel>? _fields;
  @override
  @JsonKey(name: 'fields')
  List<RegistrationDeliveryConfigFieldModel>? get fields {
    final value = _fields;
    if (value == null) return null;
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RegistrationDeliveryConfigModel(name: $name, type: $type, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationDeliveryConfigModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, type, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationDeliveryConfigModelImplCopyWith<
          _$RegistrationDeliveryConfigModelImpl>
      get copyWith => __$$RegistrationDeliveryConfigModelImplCopyWithImpl<
          _$RegistrationDeliveryConfigModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationDeliveryConfigModelImplToJson(
      this,
    );
  }
}

abstract class _RegistrationDeliveryConfigModel
    implements RegistrationDeliveryConfigModel {
  factory _RegistrationDeliveryConfigModel(
          {required final String name,
          required final String type,
          @JsonKey(name: 'fields')
          final List<RegistrationDeliveryConfigFieldModel>? fields}) =
      _$RegistrationDeliveryConfigModelImpl;

  factory _RegistrationDeliveryConfigModel.fromJson(Map<String, dynamic> json) =
      _$RegistrationDeliveryConfigModelImpl.fromJson;

  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(name: 'fields')
  List<RegistrationDeliveryConfigFieldModel>? get fields;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationDeliveryConfigModelImplCopyWith<
          _$RegistrationDeliveryConfigModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RegistrationDeliveryConfigFieldModel
    _$RegistrationDeliveryConfigFieldModelFromJson(Map<String, dynamic> json) {
  return _RegistrationDeliveryConfigFieldModel.fromJson(json);
}

/// @nodoc
mixin _$RegistrationDeliveryConfigFieldModel {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get component => throw _privateConstructorUsedError;
  String get formDataType => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  bool get readOnly => throw _privateConstructorUsedError;
  String? get keyboardType => throw _privateConstructorUsedError;
  List<ValidationRule>? get validation => throw _privateConstructorUsedError;
  List<String>? get menuItems => throw _privateConstructorUsedError;
  bool? get allowMultipleSelection => throw _privateConstructorUsedError;
  int? get initialValue => throw _privateConstructorUsedError;
  int? get minimum => throw _privateConstructorUsedError;
  int? get maximum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationDeliveryConfigFieldModelCopyWith<
          RegistrationDeliveryConfigFieldModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDeliveryConfigFieldModelCopyWith<$Res> {
  factory $RegistrationDeliveryConfigFieldModelCopyWith(
          RegistrationDeliveryConfigFieldModel value,
          $Res Function(RegistrationDeliveryConfigFieldModel) then) =
      _$RegistrationDeliveryConfigFieldModelCopyWithImpl<$Res,
          RegistrationDeliveryConfigFieldModel>;
  @useResult
  $Res call(
      {String name,
      String type,
      String label,
      String component,
      String formDataType,
      int order,
      bool isRequired,
      bool isEnabled,
      bool readOnly,
      String? keyboardType,
      List<ValidationRule>? validation,
      List<String>? menuItems,
      bool? allowMultipleSelection,
      int? initialValue,
      int? minimum,
      int? maximum});
}

/// @nodoc
class _$RegistrationDeliveryConfigFieldModelCopyWithImpl<$Res,
        $Val extends RegistrationDeliveryConfigFieldModel>
    implements $RegistrationDeliveryConfigFieldModelCopyWith<$Res> {
  _$RegistrationDeliveryConfigFieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? label = null,
    Object? component = null,
    Object? formDataType = null,
    Object? order = null,
    Object? isRequired = null,
    Object? isEnabled = null,
    Object? readOnly = null,
    Object? keyboardType = freezed,
    Object? validation = freezed,
    Object? menuItems = freezed,
    Object? allowMultipleSelection = freezed,
    Object? initialValue = freezed,
    Object? minimum = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      component: null == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      formDataType: null == formDataType
          ? _value.formDataType
          : formDataType // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      readOnly: null == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      keyboardType: freezed == keyboardType
          ? _value.keyboardType
          : keyboardType // ignore: cast_nullable_to_non_nullable
              as String?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as List<ValidationRule>?,
      menuItems: freezed == menuItems
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allowMultipleSelection: freezed == allowMultipleSelection
          ? _value.allowMultipleSelection
          : allowMultipleSelection // ignore: cast_nullable_to_non_nullable
              as bool?,
      initialValue: freezed == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as int?,
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationDeliveryConfigFieldModelImplCopyWith<$Res>
    implements $RegistrationDeliveryConfigFieldModelCopyWith<$Res> {
  factory _$$RegistrationDeliveryConfigFieldModelImplCopyWith(
          _$RegistrationDeliveryConfigFieldModelImpl value,
          $Res Function(_$RegistrationDeliveryConfigFieldModelImpl) then) =
      __$$RegistrationDeliveryConfigFieldModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String type,
      String label,
      String component,
      String formDataType,
      int order,
      bool isRequired,
      bool isEnabled,
      bool readOnly,
      String? keyboardType,
      List<ValidationRule>? validation,
      List<String>? menuItems,
      bool? allowMultipleSelection,
      int? initialValue,
      int? minimum,
      int? maximum});
}

/// @nodoc
class __$$RegistrationDeliveryConfigFieldModelImplCopyWithImpl<$Res>
    extends _$RegistrationDeliveryConfigFieldModelCopyWithImpl<$Res,
        _$RegistrationDeliveryConfigFieldModelImpl>
    implements _$$RegistrationDeliveryConfigFieldModelImplCopyWith<$Res> {
  __$$RegistrationDeliveryConfigFieldModelImplCopyWithImpl(
      _$RegistrationDeliveryConfigFieldModelImpl _value,
      $Res Function(_$RegistrationDeliveryConfigFieldModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? label = null,
    Object? component = null,
    Object? formDataType = null,
    Object? order = null,
    Object? isRequired = null,
    Object? isEnabled = null,
    Object? readOnly = null,
    Object? keyboardType = freezed,
    Object? validation = freezed,
    Object? menuItems = freezed,
    Object? allowMultipleSelection = freezed,
    Object? initialValue = freezed,
    Object? minimum = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_$RegistrationDeliveryConfigFieldModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      component: null == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      formDataType: null == formDataType
          ? _value.formDataType
          : formDataType // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      readOnly: null == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      keyboardType: freezed == keyboardType
          ? _value.keyboardType
          : keyboardType // ignore: cast_nullable_to_non_nullable
              as String?,
      validation: freezed == validation
          ? _value._validation
          : validation // ignore: cast_nullable_to_non_nullable
              as List<ValidationRule>?,
      menuItems: freezed == menuItems
          ? _value._menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allowMultipleSelection: freezed == allowMultipleSelection
          ? _value.allowMultipleSelection
          : allowMultipleSelection // ignore: cast_nullable_to_non_nullable
              as bool?,
      initialValue: freezed == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as int?,
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationDeliveryConfigFieldModelImpl
    implements _RegistrationDeliveryConfigFieldModel {
  _$RegistrationDeliveryConfigFieldModelImpl(
      {required this.name,
      required this.type,
      required this.label,
      required this.component,
      required this.formDataType,
      required this.order,
      required this.isRequired,
      required this.isEnabled,
      required this.readOnly,
      this.keyboardType,
      final List<ValidationRule>? validation,
      final List<String>? menuItems,
      this.allowMultipleSelection,
      this.initialValue,
      this.minimum,
      this.maximum})
      : _validation = validation,
        _menuItems = menuItems;

  factory _$RegistrationDeliveryConfigFieldModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegistrationDeliveryConfigFieldModelImplFromJson(json);

  @override
  final String name;
  @override
  final String type;
  @override
  final String label;
  @override
  final String component;
  @override
  final String formDataType;
  @override
  final int order;
  @override
  final bool isRequired;
  @override
  final bool isEnabled;
  @override
  final bool readOnly;
  @override
  final String? keyboardType;
  final List<ValidationRule>? _validation;
  @override
  List<ValidationRule>? get validation {
    final value = _validation;
    if (value == null) return null;
    if (_validation is EqualUnmodifiableListView) return _validation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _menuItems;
  @override
  List<String>? get menuItems {
    final value = _menuItems;
    if (value == null) return null;
    if (_menuItems is EqualUnmodifiableListView) return _menuItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? allowMultipleSelection;
  @override
  final int? initialValue;
  @override
  final int? minimum;
  @override
  final int? maximum;

  @override
  String toString() {
    return 'RegistrationDeliveryConfigFieldModel(name: $name, type: $type, label: $label, component: $component, formDataType: $formDataType, order: $order, isRequired: $isRequired, isEnabled: $isEnabled, readOnly: $readOnly, keyboardType: $keyboardType, validation: $validation, menuItems: $menuItems, allowMultipleSelection: $allowMultipleSelection, initialValue: $initialValue, minimum: $minimum, maximum: $maximum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationDeliveryConfigFieldModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.component, component) ||
                other.component == component) &&
            (identical(other.formDataType, formDataType) ||
                other.formDataType == formDataType) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.readOnly, readOnly) ||
                other.readOnly == readOnly) &&
            (identical(other.keyboardType, keyboardType) ||
                other.keyboardType == keyboardType) &&
            const DeepCollectionEquality()
                .equals(other._validation, _validation) &&
            const DeepCollectionEquality()
                .equals(other._menuItems, _menuItems) &&
            (identical(other.allowMultipleSelection, allowMultipleSelection) ||
                other.allowMultipleSelection == allowMultipleSelection) &&
            (identical(other.initialValue, initialValue) ||
                other.initialValue == initialValue) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.maximum, maximum) || other.maximum == maximum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      type,
      label,
      component,
      formDataType,
      order,
      isRequired,
      isEnabled,
      readOnly,
      keyboardType,
      const DeepCollectionEquality().hash(_validation),
      const DeepCollectionEquality().hash(_menuItems),
      allowMultipleSelection,
      initialValue,
      minimum,
      maximum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationDeliveryConfigFieldModelImplCopyWith<
          _$RegistrationDeliveryConfigFieldModelImpl>
      get copyWith => __$$RegistrationDeliveryConfigFieldModelImplCopyWithImpl<
          _$RegistrationDeliveryConfigFieldModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationDeliveryConfigFieldModelImplToJson(
      this,
    );
  }
}

abstract class _RegistrationDeliveryConfigFieldModel
    implements RegistrationDeliveryConfigFieldModel {
  factory _RegistrationDeliveryConfigFieldModel(
      {required final String name,
      required final String type,
      required final String label,
      required final String component,
      required final String formDataType,
      required final int order,
      required final bool isRequired,
      required final bool isEnabled,
      required final bool readOnly,
      final String? keyboardType,
      final List<ValidationRule>? validation,
      final List<String>? menuItems,
      final bool? allowMultipleSelection,
      final int? initialValue,
      final int? minimum,
      final int? maximum}) = _$RegistrationDeliveryConfigFieldModelImpl;

  factory _RegistrationDeliveryConfigFieldModel.fromJson(
          Map<String, dynamic> json) =
      _$RegistrationDeliveryConfigFieldModelImpl.fromJson;

  @override
  String get name;
  @override
  String get type;
  @override
  String get label;
  @override
  String get component;
  @override
  String get formDataType;
  @override
  int get order;
  @override
  bool get isRequired;
  @override
  bool get isEnabled;
  @override
  bool get readOnly;
  @override
  String? get keyboardType;
  @override
  List<ValidationRule>? get validation;
  @override
  List<String>? get menuItems;
  @override
  bool? get allowMultipleSelection;
  @override
  int? get initialValue;
  @override
  int? get minimum;
  @override
  int? get maximum;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationDeliveryConfigFieldModelImplCopyWith<
          _$RegistrationDeliveryConfigFieldModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ValidationRule _$ValidationRuleFromJson(Map<String, dynamic> json) {
  return _ValidationRule.fromJson(json);
}

/// @nodoc
mixin _$ValidationRule {
  String get pattern => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidationRuleCopyWith<ValidationRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationRuleCopyWith<$Res> {
  factory $ValidationRuleCopyWith(
          ValidationRule value, $Res Function(ValidationRule) then) =
      _$ValidationRuleCopyWithImpl<$Res, ValidationRule>;
  @useResult
  $Res call({String pattern, String key, String errorMessage});
}

/// @nodoc
class _$ValidationRuleCopyWithImpl<$Res, $Val extends ValidationRule>
    implements $ValidationRuleCopyWith<$Res> {
  _$ValidationRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pattern = null,
    Object? key = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationRuleImplCopyWith<$Res>
    implements $ValidationRuleCopyWith<$Res> {
  factory _$$ValidationRuleImplCopyWith(_$ValidationRuleImpl value,
          $Res Function(_$ValidationRuleImpl) then) =
      __$$ValidationRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pattern, String key, String errorMessage});
}

/// @nodoc
class __$$ValidationRuleImplCopyWithImpl<$Res>
    extends _$ValidationRuleCopyWithImpl<$Res, _$ValidationRuleImpl>
    implements _$$ValidationRuleImplCopyWith<$Res> {
  __$$ValidationRuleImplCopyWithImpl(
      _$ValidationRuleImpl _value, $Res Function(_$ValidationRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pattern = null,
    Object? key = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ValidationRuleImpl(
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationRuleImpl implements _ValidationRule {
  _$ValidationRuleImpl(
      {required this.pattern, required this.key, required this.errorMessage});

  factory _$ValidationRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationRuleImplFromJson(json);

  @override
  final String pattern;
  @override
  final String key;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ValidationRule(pattern: $pattern, key: $key, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationRuleImpl &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pattern, key, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationRuleImplCopyWith<_$ValidationRuleImpl> get copyWith =>
      __$$ValidationRuleImplCopyWithImpl<_$ValidationRuleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationRuleImplToJson(
      this,
    );
  }
}

abstract class _ValidationRule implements ValidationRule {
  factory _ValidationRule(
      {required final String pattern,
      required final String key,
      required final String errorMessage}) = _$ValidationRuleImpl;

  factory _ValidationRule.fromJson(Map<String, dynamic> json) =
      _$ValidationRuleImpl.fromJson;

  @override
  String get pattern;
  @override
  String get key;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ValidationRuleImplCopyWith<_$ValidationRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormConfigModel _$FormConfigModelFromJson(Map<String, dynamic> json) {
  return _FormConfigModel.fromJson(json);
}

/// @nodoc
mixin _$FormConfigModel {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'fields')
  List<FormConfigFieldModel>? get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormConfigModelCopyWith<FormConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormConfigModelCopyWith<$Res> {
  factory $FormConfigModelCopyWith(
          FormConfigModel value, $Res Function(FormConfigModel) then) =
      _$FormConfigModelCopyWithImpl<$Res, FormConfigModel>;
  @useResult
  $Res call(
      {String name,
      String type,
      @JsonKey(name: 'fields') List<FormConfigFieldModel>? fields});
}

/// @nodoc
class _$FormConfigModelCopyWithImpl<$Res, $Val extends FormConfigModel>
    implements $FormConfigModelCopyWith<$Res> {
  _$FormConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? fields = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      fields: freezed == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<FormConfigFieldModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormConfigModelImplCopyWith<$Res>
    implements $FormConfigModelCopyWith<$Res> {
  factory _$$FormConfigModelImplCopyWith(_$FormConfigModelImpl value,
          $Res Function(_$FormConfigModelImpl) then) =
      __$$FormConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String type,
      @JsonKey(name: 'fields') List<FormConfigFieldModel>? fields});
}

/// @nodoc
class __$$FormConfigModelImplCopyWithImpl<$Res>
    extends _$FormConfigModelCopyWithImpl<$Res, _$FormConfigModelImpl>
    implements _$$FormConfigModelImplCopyWith<$Res> {
  __$$FormConfigModelImplCopyWithImpl(
      _$FormConfigModelImpl _value, $Res Function(_$FormConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? fields = freezed,
  }) {
    return _then(_$FormConfigModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      fields: freezed == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<FormConfigFieldModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormConfigModelImpl implements _FormConfigModel {
  _$FormConfigModelImpl(
      {required this.name,
      required this.type,
      @JsonKey(name: 'fields') final List<FormConfigFieldModel>? fields})
      : _fields = fields;

  factory _$FormConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormConfigModelImplFromJson(json);

  @override
  final String name;
  @override
  final String type;
  final List<FormConfigFieldModel>? _fields;
  @override
  @JsonKey(name: 'fields')
  List<FormConfigFieldModel>? get fields {
    final value = _fields;
    if (value == null) return null;
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FormConfigModel(name: $name, type: $type, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormConfigModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, type, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormConfigModelImplCopyWith<_$FormConfigModelImpl> get copyWith =>
      __$$FormConfigModelImplCopyWithImpl<_$FormConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormConfigModelImplToJson(
      this,
    );
  }
}

abstract class _FormConfigModel implements FormConfigModel {
  factory _FormConfigModel(
          {required final String name,
          required final String type,
          @JsonKey(name: 'fields') final List<FormConfigFieldModel>? fields}) =
      _$FormConfigModelImpl;

  factory _FormConfigModel.fromJson(Map<String, dynamic> json) =
      _$FormConfigModelImpl.fromJson;

  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(name: 'fields')
  List<FormConfigFieldModel>? get fields;
  @override
  @JsonKey(ignore: true)
  _$$FormConfigModelImplCopyWith<_$FormConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormConfigFieldModel _$FormConfigFieldModelFromJson(Map<String, dynamic> json) {
  return _FormConfigFieldModel.fromJson(json);
}

/// @nodoc
mixin _$FormConfigFieldModel {
  String get name => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  bool get readOnly => throw _privateConstructorUsedError;
  List<String>? get regex => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormConfigFieldModelCopyWith<FormConfigFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormConfigFieldModelCopyWith<$Res> {
  factory $FormConfigFieldModelCopyWith(FormConfigFieldModel value,
          $Res Function(FormConfigFieldModel) then) =
      _$FormConfigFieldModelCopyWithImpl<$Res, FormConfigFieldModel>;
  @useResult
  $Res call(
      {String name,
      int order,
      bool isRequired,
      bool isEnabled,
      bool readOnly,
      List<String>? regex,
      String? errorMessage});
}

/// @nodoc
class _$FormConfigFieldModelCopyWithImpl<$Res,
        $Val extends FormConfigFieldModel>
    implements $FormConfigFieldModelCopyWith<$Res> {
  _$FormConfigFieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? order = null,
    Object? isRequired = null,
    Object? isEnabled = null,
    Object? readOnly = null,
    Object? regex = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      readOnly: null == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      regex: freezed == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormConfigFieldModelImplCopyWith<$Res>
    implements $FormConfigFieldModelCopyWith<$Res> {
  factory _$$FormConfigFieldModelImplCopyWith(_$FormConfigFieldModelImpl value,
          $Res Function(_$FormConfigFieldModelImpl) then) =
      __$$FormConfigFieldModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int order,
      bool isRequired,
      bool isEnabled,
      bool readOnly,
      List<String>? regex,
      String? errorMessage});
}

/// @nodoc
class __$$FormConfigFieldModelImplCopyWithImpl<$Res>
    extends _$FormConfigFieldModelCopyWithImpl<$Res, _$FormConfigFieldModelImpl>
    implements _$$FormConfigFieldModelImplCopyWith<$Res> {
  __$$FormConfigFieldModelImplCopyWithImpl(_$FormConfigFieldModelImpl _value,
      $Res Function(_$FormConfigFieldModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? order = null,
    Object? isRequired = null,
    Object? isEnabled = null,
    Object? readOnly = null,
    Object? regex = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$FormConfigFieldModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      readOnly: null == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      regex: freezed == regex
          ? _value._regex
          : regex // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormConfigFieldModelImpl implements _FormConfigFieldModel {
  _$FormConfigFieldModelImpl(
      {required this.name,
      required this.order,
      required this.isRequired,
      required this.isEnabled,
      required this.readOnly,
      final List<String>? regex,
      this.errorMessage})
      : _regex = regex;

  factory _$FormConfigFieldModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormConfigFieldModelImplFromJson(json);

  @override
  final String name;
  @override
  final int order;
  @override
  final bool isRequired;
  @override
  final bool isEnabled;
  @override
  final bool readOnly;
  final List<String>? _regex;
  @override
  List<String>? get regex {
    final value = _regex;
    if (value == null) return null;
    if (_regex is EqualUnmodifiableListView) return _regex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'FormConfigFieldModel(name: $name, order: $order, isRequired: $isRequired, isEnabled: $isEnabled, readOnly: $readOnly, regex: $regex, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormConfigFieldModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.readOnly, readOnly) ||
                other.readOnly == readOnly) &&
            const DeepCollectionEquality().equals(other._regex, _regex) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      order,
      isRequired,
      isEnabled,
      readOnly,
      const DeepCollectionEquality().hash(_regex),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormConfigFieldModelImplCopyWith<_$FormConfigFieldModelImpl>
      get copyWith =>
          __$$FormConfigFieldModelImplCopyWithImpl<_$FormConfigFieldModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormConfigFieldModelImplToJson(
      this,
    );
  }
}

abstract class _FormConfigFieldModel implements FormConfigFieldModel {
  factory _FormConfigFieldModel(
      {required final String name,
      required final int order,
      required final bool isRequired,
      required final bool isEnabled,
      required final bool readOnly,
      final List<String>? regex,
      final String? errorMessage}) = _$FormConfigFieldModelImpl;

  factory _FormConfigFieldModel.fromJson(Map<String, dynamic> json) =
      _$FormConfigFieldModelImpl.fromJson;

  @override
  String get name;
  @override
  int get order;
  @override
  bool get isRequired;
  @override
  bool get isEnabled;
  @override
  bool get readOnly;
  @override
  List<String>? get regex;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$FormConfigFieldModelImplCopyWith<_$FormConfigFieldModelImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$InterfacesWrapperImplCopyWith<$Res>
    implements $InterfacesWrapperCopyWith<$Res> {
  factory _$$InterfacesWrapperImplCopyWith(_$InterfacesWrapperImpl value,
          $Res Function(_$InterfacesWrapperImpl) then) =
      __$$InterfacesWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Interfaces> interface});
}

/// @nodoc
class __$$InterfacesWrapperImplCopyWithImpl<$Res>
    extends _$InterfacesWrapperCopyWithImpl<$Res, _$InterfacesWrapperImpl>
    implements _$$InterfacesWrapperImplCopyWith<$Res> {
  __$$InterfacesWrapperImplCopyWithImpl(_$InterfacesWrapperImpl _value,
      $Res Function(_$InterfacesWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interface = null,
  }) {
    return _then(_$InterfacesWrapperImpl(
      interface: null == interface
          ? _value._interface
          : interface // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterfacesWrapperImpl implements _InterfacesWrapper {
  _$InterfacesWrapperImpl({required final List<Interfaces> interface})
      : _interface = interface;

  factory _$InterfacesWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterfacesWrapperImplFromJson(json);

  final List<Interfaces> _interface;
  @override
  List<Interfaces> get interface {
    if (_interface is EqualUnmodifiableListView) return _interface;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interface);
  }

  @override
  String toString() {
    return 'InterfacesWrapper(interface: $interface)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterfacesWrapperImpl &&
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
  _$$InterfacesWrapperImplCopyWith<_$InterfacesWrapperImpl> get copyWith =>
      __$$InterfacesWrapperImplCopyWithImpl<_$InterfacesWrapperImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterfacesWrapperImplToJson(
      this,
    );
  }
}

abstract class _InterfacesWrapper implements InterfacesWrapper {
  factory _InterfacesWrapper({required final List<Interfaces> interface}) =
      _$InterfacesWrapperImpl;

  factory _InterfacesWrapper.fromJson(Map<String, dynamic> json) =
      _$InterfacesWrapperImpl.fromJson;

  @override
  List<Interfaces> get interface;
  @override
  @JsonKey(ignore: true)
  _$$InterfacesWrapperImplCopyWith<_$InterfacesWrapperImpl> get copyWith =>
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
abstract class _$$InterfacesImplCopyWith<$Res>
    implements $InterfacesCopyWith<$Res> {
  factory _$$InterfacesImplCopyWith(
          _$InterfacesImpl value, $Res Function(_$InterfacesImpl) then) =
      __$$InterfacesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String name, Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$InterfacesImplCopyWithImpl<$Res>
    extends _$InterfacesCopyWithImpl<$Res, _$InterfacesImpl>
    implements _$$InterfacesImplCopyWith<$Res> {
  __$$InterfacesImplCopyWithImpl(
      _$InterfacesImpl _value, $Res Function(_$InterfacesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? config = null,
  }) {
    return _then(_$InterfacesImpl(
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
class _$InterfacesImpl implements _Interfaces {
  _$InterfacesImpl(
      {required this.type, required this.name, required this.config});

  factory _$InterfacesImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterfacesImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterfacesImpl &&
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
  _$$InterfacesImplCopyWith<_$InterfacesImpl> get copyWith =>
      __$$InterfacesImplCopyWithImpl<_$InterfacesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterfacesImplToJson(
      this,
    );
  }
}

abstract class _Interfaces implements Interfaces {
  factory _Interfaces(
      {required final String type,
      required final String name,
      required final Config config}) = _$InterfacesImpl;

  factory _Interfaces.fromJson(Map<String, dynamic> json) =
      _$InterfacesImpl.fromJson;

  @override
  String get type;
  @override
  String get name;
  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$$InterfacesImplCopyWith<_$InterfacesImpl> get copyWith =>
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
abstract class _$$ConfigImplCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$ConfigImplCopyWith(
          _$ConfigImpl value, $Res Function(_$ConfigImpl) then) =
      __$$ConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int localStoreTTL});
}

/// @nodoc
class __$$ConfigImplCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$ConfigImpl>
    implements _$$ConfigImplCopyWith<$Res> {
  __$$ConfigImplCopyWithImpl(
      _$ConfigImpl _value, $Res Function(_$ConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localStoreTTL = null,
  }) {
    return _then(_$ConfigImpl(
      localStoreTTL: null == localStoreTTL
          ? _value.localStoreTTL
          : localStoreTTL // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigImpl implements _Config {
  _$ConfigImpl({required this.localStoreTTL});

  factory _$ConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigImplFromJson(json);

  @override
  final int localStoreTTL;

  @override
  String toString() {
    return 'Config(localStoreTTL: $localStoreTTL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigImpl &&
            (identical(other.localStoreTTL, localStoreTTL) ||
                other.localStoreTTL == localStoreTTL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, localStoreTTL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      __$$ConfigImplCopyWithImpl<_$ConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigImplToJson(
      this,
    );
  }
}

abstract class _Config implements Config {
  factory _Config({required final int localStoreTTL}) = _$ConfigImpl;

  factory _Config.fromJson(Map<String, dynamic> json) = _$ConfigImpl.fromJson;

  @override
  int get localStoreTTL;
  @override
  @JsonKey(ignore: true)
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
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
abstract class _$$LanguagesImplCopyWith<$Res>
    implements $LanguagesCopyWith<$Res> {
  factory _$$LanguagesImplCopyWith(
          _$LanguagesImpl value, $Res Function(_$LanguagesImpl) then) =
      __$$LanguagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, bool isSelected});
}

/// @nodoc
class __$$LanguagesImplCopyWithImpl<$Res>
    extends _$LanguagesCopyWithImpl<$Res, _$LanguagesImpl>
    implements _$$LanguagesImplCopyWith<$Res> {
  __$$LanguagesImplCopyWithImpl(
      _$LanguagesImpl _value, $Res Function(_$LanguagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_$LanguagesImpl(
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
class _$LanguagesImpl implements _Languages {
  _$LanguagesImpl(
      {required this.label, required this.value, this.isSelected = false});

  factory _$LanguagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguagesImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguagesImpl &&
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
  _$$LanguagesImplCopyWith<_$LanguagesImpl> get copyWith =>
      __$$LanguagesImplCopyWithImpl<_$LanguagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguagesImplToJson(
      this,
    );
  }
}

abstract class _Languages implements Languages {
  factory _Languages(
      {required final String label,
      required final String value,
      final bool isSelected}) = _$LanguagesImpl;

  factory _Languages.fromJson(Map<String, dynamic> json) =
      _$LanguagesImpl.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$LanguagesImplCopyWith<_$LanguagesImpl> get copyWith =>
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
abstract class _$$CheckListTypesImplCopyWith<$Res>
    implements $CheckListTypesCopyWith<$Res> {
  factory _$$CheckListTypesImplCopyWith(_$CheckListTypesImpl value,
          $Res Function(_$CheckListTypesImpl) then) =
      __$$CheckListTypesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$CheckListTypesImplCopyWithImpl<$Res>
    extends _$CheckListTypesCopyWithImpl<$Res, _$CheckListTypesImpl>
    implements _$$CheckListTypesImplCopyWith<$Res> {
  __$$CheckListTypesImplCopyWithImpl(
      _$CheckListTypesImpl _value, $Res Function(_$CheckListTypesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$CheckListTypesImpl(
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
class _$CheckListTypesImpl implements _CheckListTypes {
  _$CheckListTypesImpl({required this.name, required this.code});

  factory _$CheckListTypesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckListTypesImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CheckListTypes(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckListTypesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckListTypesImplCopyWith<_$CheckListTypesImpl> get copyWith =>
      __$$CheckListTypesImplCopyWithImpl<_$CheckListTypesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckListTypesImplToJson(
      this,
    );
  }
}

abstract class _CheckListTypes implements CheckListTypes {
  factory _CheckListTypes(
      {required final String name,
      required final String code}) = _$CheckListTypesImpl;

  factory _CheckListTypes.fromJson(Map<String, dynamic> json) =
      _$CheckListTypesImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CheckListTypesImplCopyWith<_$CheckListTypesImpl> get copyWith =>
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
abstract class _$$CallSupportListImplCopyWith<$Res>
    implements $CallSupportListCopyWith<$Res> {
  factory _$$CallSupportListImplCopyWith(_$CallSupportListImpl value,
          $Res Function(_$CallSupportListImpl) then) =
      __$$CallSupportListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$CallSupportListImplCopyWithImpl<$Res>
    extends _$CallSupportListCopyWithImpl<$Res, _$CallSupportListImpl>
    implements _$$CallSupportListImplCopyWith<$Res> {
  __$$CallSupportListImplCopyWithImpl(
      _$CallSupportListImpl _value, $Res Function(_$CallSupportListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$CallSupportListImpl(
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
class _$CallSupportListImpl implements _CallSupportList {
  _$CallSupportListImpl({required this.name, required this.code});

  factory _$CallSupportListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallSupportListImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CallSupportList(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallSupportListImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallSupportListImplCopyWith<_$CallSupportListImpl> get copyWith =>
      __$$CallSupportListImplCopyWithImpl<_$CallSupportListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallSupportListImplToJson(
      this,
    );
  }
}

abstract class _CallSupportList implements CallSupportList {
  factory _CallSupportList(
      {required final String name,
      required final String code}) = _$CallSupportListImpl;

  factory _CallSupportList.fromJson(Map<String, dynamic> json) =
      _$CallSupportListImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CallSupportListImplCopyWith<_$CallSupportListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchHouseHoldFilters _$SearchHouseHoldFiltersFromJson(
    Map<String, dynamic> json) {
  return _SearchHouseHoldFilters.fromJson(json);
}

/// @nodoc
mixin _$SearchHouseHoldFilters {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchHouseHoldFiltersCopyWith<SearchHouseHoldFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHouseHoldFiltersCopyWith<$Res> {
  factory $SearchHouseHoldFiltersCopyWith(SearchHouseHoldFilters value,
          $Res Function(SearchHouseHoldFilters) then) =
      _$SearchHouseHoldFiltersCopyWithImpl<$Res, SearchHouseHoldFilters>;
  @useResult
  $Res call({String name, String code, bool active});
}

/// @nodoc
class _$SearchHouseHoldFiltersCopyWithImpl<$Res,
        $Val extends SearchHouseHoldFilters>
    implements $SearchHouseHoldFiltersCopyWith<$Res> {
  _$SearchHouseHoldFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? active = null,
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
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchHouseHoldFiltersImplCopyWith<$Res>
    implements $SearchHouseHoldFiltersCopyWith<$Res> {
  factory _$$SearchHouseHoldFiltersImplCopyWith(
          _$SearchHouseHoldFiltersImpl value,
          $Res Function(_$SearchHouseHoldFiltersImpl) then) =
      __$$SearchHouseHoldFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code, bool active});
}

/// @nodoc
class __$$SearchHouseHoldFiltersImplCopyWithImpl<$Res>
    extends _$SearchHouseHoldFiltersCopyWithImpl<$Res,
        _$SearchHouseHoldFiltersImpl>
    implements _$$SearchHouseHoldFiltersImplCopyWith<$Res> {
  __$$SearchHouseHoldFiltersImplCopyWithImpl(
      _$SearchHouseHoldFiltersImpl _value,
      $Res Function(_$SearchHouseHoldFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? active = null,
  }) {
    return _then(_$SearchHouseHoldFiltersImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchHouseHoldFiltersImpl implements _SearchHouseHoldFilters {
  _$SearchHouseHoldFiltersImpl(
      {required this.name, required this.code, required this.active});

  factory _$SearchHouseHoldFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchHouseHoldFiltersImplFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final bool active;

  @override
  String toString() {
    return 'SearchHouseHoldFilters(name: $name, code: $code, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseHoldFiltersImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseHoldFiltersImplCopyWith<_$SearchHouseHoldFiltersImpl>
      get copyWith => __$$SearchHouseHoldFiltersImplCopyWithImpl<
          _$SearchHouseHoldFiltersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchHouseHoldFiltersImplToJson(
      this,
    );
  }
}

abstract class _SearchHouseHoldFilters implements SearchHouseHoldFilters {
  factory _SearchHouseHoldFilters(
      {required final String name,
      required final String code,
      required final bool active}) = _$SearchHouseHoldFiltersImpl;

  factory _SearchHouseHoldFilters.fromJson(Map<String, dynamic> json) =
      _$SearchHouseHoldFiltersImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$SearchHouseHoldFiltersImplCopyWith<_$SearchHouseHoldFiltersImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$TransportTypesImplCopyWith<$Res>
    implements $TransportTypesCopyWith<$Res> {
  factory _$$TransportTypesImplCopyWith(_$TransportTypesImpl value,
          $Res Function(_$TransportTypesImpl) then) =
      __$$TransportTypesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$TransportTypesImplCopyWithImpl<$Res>
    extends _$TransportTypesCopyWithImpl<$Res, _$TransportTypesImpl>
    implements _$$TransportTypesImplCopyWith<$Res> {
  __$$TransportTypesImplCopyWithImpl(
      _$TransportTypesImpl _value, $Res Function(_$TransportTypesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$TransportTypesImpl(
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
class _$TransportTypesImpl implements _TransportTypes {
  _$TransportTypesImpl({required this.name, required this.code});

  factory _$TransportTypesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransportTypesImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'TransportTypes(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransportTypesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransportTypesImplCopyWith<_$TransportTypesImpl> get copyWith =>
      __$$TransportTypesImplCopyWithImpl<_$TransportTypesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransportTypesImplToJson(
      this,
    );
  }
}

abstract class _TransportTypes implements TransportTypes {
  factory _TransportTypes(
      {required final String name,
      required final String code}) = _$TransportTypesImpl;

  factory _TransportTypes.fromJson(Map<String, dynamic> json) =
      _$TransportTypesImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$TransportTypesImplCopyWith<_$TransportTypesImpl> get copyWith =>
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
abstract class _$$RowVersionsImplCopyWith<$Res>
    implements $RowVersionsCopyWith<$Res> {
  factory _$$RowVersionsImplCopyWith(
          _$RowVersionsImpl value, $Res Function(_$RowVersionsImpl) then) =
      __$$RowVersionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String module, String version});
}

/// @nodoc
class __$$RowVersionsImplCopyWithImpl<$Res>
    extends _$RowVersionsCopyWithImpl<$Res, _$RowVersionsImpl>
    implements _$$RowVersionsImplCopyWith<$Res> {
  __$$RowVersionsImplCopyWithImpl(
      _$RowVersionsImpl _value, $Res Function(_$RowVersionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? version = null,
  }) {
    return _then(_$RowVersionsImpl(
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
class _$RowVersionsImpl implements _RowVersions {
  _$RowVersionsImpl({required this.module, required this.version});

  factory _$RowVersionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowVersionsImplFromJson(json);

  @override
  final String module;
  @override
  final String version;

  @override
  String toString() {
    return 'RowVersions(module: $module, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowVersionsImpl &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, module, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RowVersionsImplCopyWith<_$RowVersionsImpl> get copyWith =>
      __$$RowVersionsImplCopyWithImpl<_$RowVersionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowVersionsImplToJson(
      this,
    );
  }
}

abstract class _RowVersions implements RowVersions {
  factory _RowVersions(
      {required final String module,
      required final String version}) = _$RowVersionsImpl;

  factory _RowVersions.fromJson(Map<String, dynamic> json) =
      _$RowVersionsImpl.fromJson;

  @override
  String get module;
  @override
  String get version;
  @override
  @JsonKey(ignore: true)
  _$$RowVersionsImplCopyWith<_$RowVersionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FirebaseConfig _$FirebaseConfigFromJson(Map<String, dynamic> json) {
  return _FirebaseConfig.fromJson(json);
}

/// @nodoc
mixin _$FirebaseConfig {
  bool get enableCrashlytics => throw _privateConstructorUsedError;
  bool get enableAnalytics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseConfigCopyWith<FirebaseConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseConfigCopyWith<$Res> {
  factory $FirebaseConfigCopyWith(
          FirebaseConfig value, $Res Function(FirebaseConfig) then) =
      _$FirebaseConfigCopyWithImpl<$Res, FirebaseConfig>;
  @useResult
  $Res call({bool enableCrashlytics, bool enableAnalytics});
}

/// @nodoc
class _$FirebaseConfigCopyWithImpl<$Res, $Val extends FirebaseConfig>
    implements $FirebaseConfigCopyWith<$Res> {
  _$FirebaseConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableCrashlytics = null,
    Object? enableAnalytics = null,
  }) {
    return _then(_value.copyWith(
      enableCrashlytics: null == enableCrashlytics
          ? _value.enableCrashlytics
          : enableCrashlytics // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAnalytics: null == enableAnalytics
          ? _value.enableAnalytics
          : enableAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirebaseConfigImplCopyWith<$Res>
    implements $FirebaseConfigCopyWith<$Res> {
  factory _$$FirebaseConfigImplCopyWith(_$FirebaseConfigImpl value,
          $Res Function(_$FirebaseConfigImpl) then) =
      __$$FirebaseConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enableCrashlytics, bool enableAnalytics});
}

/// @nodoc
class __$$FirebaseConfigImplCopyWithImpl<$Res>
    extends _$FirebaseConfigCopyWithImpl<$Res, _$FirebaseConfigImpl>
    implements _$$FirebaseConfigImplCopyWith<$Res> {
  __$$FirebaseConfigImplCopyWithImpl(
      _$FirebaseConfigImpl _value, $Res Function(_$FirebaseConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableCrashlytics = null,
    Object? enableAnalytics = null,
  }) {
    return _then(_$FirebaseConfigImpl(
      enableCrashlytics: null == enableCrashlytics
          ? _value.enableCrashlytics
          : enableCrashlytics // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAnalytics: null == enableAnalytics
          ? _value.enableAnalytics
          : enableAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseConfigImpl implements _FirebaseConfig {
  _$FirebaseConfigImpl(
      {required this.enableCrashlytics, required this.enableAnalytics});

  factory _$FirebaseConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseConfigImplFromJson(json);

  @override
  final bool enableCrashlytics;
  @override
  final bool enableAnalytics;

  @override
  String toString() {
    return 'FirebaseConfig(enableCrashlytics: $enableCrashlytics, enableAnalytics: $enableAnalytics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseConfigImpl &&
            (identical(other.enableCrashlytics, enableCrashlytics) ||
                other.enableCrashlytics == enableCrashlytics) &&
            (identical(other.enableAnalytics, enableAnalytics) ||
                other.enableAnalytics == enableAnalytics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, enableCrashlytics, enableAnalytics);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseConfigImplCopyWith<_$FirebaseConfigImpl> get copyWith =>
      __$$FirebaseConfigImplCopyWithImpl<_$FirebaseConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseConfigImplToJson(
      this,
    );
  }
}

abstract class _FirebaseConfig implements FirebaseConfig {
  factory _FirebaseConfig(
      {required final bool enableCrashlytics,
      required final bool enableAnalytics}) = _$FirebaseConfigImpl;

  factory _FirebaseConfig.fromJson(Map<String, dynamic> json) =
      _$FirebaseConfigImpl.fromJson;

  @override
  bool get enableCrashlytics;
  @override
  bool get enableAnalytics;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseConfigImplCopyWith<_$FirebaseConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
