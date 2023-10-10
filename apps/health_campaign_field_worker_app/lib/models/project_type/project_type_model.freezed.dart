// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectTypePrimaryWrapper _$ProjectTypePrimaryWrapperFromJson(
    Map<String, dynamic> json) {
  return _ProjectTypePrimaryWrapper.fromJson(json);
}

/// @nodoc
mixin _$ProjectTypePrimaryWrapper {
  @JsonKey(name: "HCM-PROJECT-TYPES")
  ProjectTypesSecondaryModel? get projectTypeWrapper =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypePrimaryWrapperCopyWith<ProjectTypePrimaryWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypePrimaryWrapperCopyWith<$Res> {
  factory $ProjectTypePrimaryWrapperCopyWith(ProjectTypePrimaryWrapper value,
          $Res Function(ProjectTypePrimaryWrapper) then) =
      _$ProjectTypePrimaryWrapperCopyWithImpl<$Res, ProjectTypePrimaryWrapper>;
  @useResult
  $Res call(
      {@JsonKey(name: "HCM-PROJECT-TYPES")
          ProjectTypesSecondaryModel? projectTypeWrapper});

  $ProjectTypesSecondaryModelCopyWith<$Res>? get projectTypeWrapper;
}

/// @nodoc
class _$ProjectTypePrimaryWrapperCopyWithImpl<$Res,
        $Val extends ProjectTypePrimaryWrapper>
    implements $ProjectTypePrimaryWrapperCopyWith<$Res> {
  _$ProjectTypePrimaryWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypeWrapper = freezed,
  }) {
    return _then(_value.copyWith(
      projectTypeWrapper: freezed == projectTypeWrapper
          ? _value.projectTypeWrapper
          : projectTypeWrapper // ignore: cast_nullable_to_non_nullable
              as ProjectTypesSecondaryModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectTypesSecondaryModelCopyWith<$Res>? get projectTypeWrapper {
    if (_value.projectTypeWrapper == null) {
      return null;
    }

    return $ProjectTypesSecondaryModelCopyWith<$Res>(_value.projectTypeWrapper!,
        (value) {
      return _then(_value.copyWith(projectTypeWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectTypePrimaryWrapperCopyWith<$Res>
    implements $ProjectTypePrimaryWrapperCopyWith<$Res> {
  factory _$$_ProjectTypePrimaryWrapperCopyWith(
          _$_ProjectTypePrimaryWrapper value,
          $Res Function(_$_ProjectTypePrimaryWrapper) then) =
      __$$_ProjectTypePrimaryWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "HCM-PROJECT-TYPES")
          ProjectTypesSecondaryModel? projectTypeWrapper});

  @override
  $ProjectTypesSecondaryModelCopyWith<$Res>? get projectTypeWrapper;
}

/// @nodoc
class __$$_ProjectTypePrimaryWrapperCopyWithImpl<$Res>
    extends _$ProjectTypePrimaryWrapperCopyWithImpl<$Res,
        _$_ProjectTypePrimaryWrapper>
    implements _$$_ProjectTypePrimaryWrapperCopyWith<$Res> {
  __$$_ProjectTypePrimaryWrapperCopyWithImpl(
      _$_ProjectTypePrimaryWrapper _value,
      $Res Function(_$_ProjectTypePrimaryWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypeWrapper = freezed,
  }) {
    return _then(_$_ProjectTypePrimaryWrapper(
      projectTypeWrapper: freezed == projectTypeWrapper
          ? _value.projectTypeWrapper
          : projectTypeWrapper // ignore: cast_nullable_to_non_nullable
              as ProjectTypesSecondaryModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectTypePrimaryWrapper implements _ProjectTypePrimaryWrapper {
  const _$_ProjectTypePrimaryWrapper(
      {@JsonKey(name: "HCM-PROJECT-TYPES") this.projectTypeWrapper});

  factory _$_ProjectTypePrimaryWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectTypePrimaryWrapperFromJson(json);

  @override
  @JsonKey(name: "HCM-PROJECT-TYPES")
  final ProjectTypesSecondaryModel? projectTypeWrapper;

  @override
  String toString() {
    return 'ProjectTypePrimaryWrapper(projectTypeWrapper: $projectTypeWrapper)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectTypePrimaryWrapper &&
            (identical(other.projectTypeWrapper, projectTypeWrapper) ||
                other.projectTypeWrapper == projectTypeWrapper));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectTypeWrapper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectTypePrimaryWrapperCopyWith<_$_ProjectTypePrimaryWrapper>
      get copyWith => __$$_ProjectTypePrimaryWrapperCopyWithImpl<
          _$_ProjectTypePrimaryWrapper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectTypePrimaryWrapperToJson(
      this,
    );
  }
}

abstract class _ProjectTypePrimaryWrapper implements ProjectTypePrimaryWrapper {
  const factory _ProjectTypePrimaryWrapper(
          {@JsonKey(name: "HCM-PROJECT-TYPES")
              final ProjectTypesSecondaryModel? projectTypeWrapper}) =
      _$_ProjectTypePrimaryWrapper;

  factory _ProjectTypePrimaryWrapper.fromJson(Map<String, dynamic> json) =
      _$_ProjectTypePrimaryWrapper.fromJson;

  @override
  @JsonKey(name: "HCM-PROJECT-TYPES")
  ProjectTypesSecondaryModel? get projectTypeWrapper;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectTypePrimaryWrapperCopyWith<_$_ProjectTypePrimaryWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectTypesSecondaryModel _$ProjectTypesSecondaryModelFromJson(
    Map<String, dynamic> json) {
  return _ProjectTypesSecondaryModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectTypesSecondaryModel {
  @JsonKey(name: 'projectTypes')
  List<ProjectType> get projectTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypesSecondaryModelCopyWith<ProjectTypesSecondaryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypesSecondaryModelCopyWith<$Res> {
  factory $ProjectTypesSecondaryModelCopyWith(ProjectTypesSecondaryModel value,
          $Res Function(ProjectTypesSecondaryModel) then) =
      _$ProjectTypesSecondaryModelCopyWithImpl<$Res,
          ProjectTypesSecondaryModel>;
  @useResult
  $Res call({@JsonKey(name: 'projectTypes') List<ProjectType> projectTypes});
}

/// @nodoc
class _$ProjectTypesSecondaryModelCopyWithImpl<$Res,
        $Val extends ProjectTypesSecondaryModel>
    implements $ProjectTypesSecondaryModelCopyWith<$Res> {
  _$ProjectTypesSecondaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypes = null,
  }) {
    return _then(_value.copyWith(
      projectTypes: null == projectTypes
          ? _value.projectTypes
          : projectTypes // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectTypesSecondaryModelCopyWith<$Res>
    implements $ProjectTypesSecondaryModelCopyWith<$Res> {
  factory _$$_ProjectTypesSecondaryModelCopyWith(
          _$_ProjectTypesSecondaryModel value,
          $Res Function(_$_ProjectTypesSecondaryModel) then) =
      __$$_ProjectTypesSecondaryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'projectTypes') List<ProjectType> projectTypes});
}

/// @nodoc
class __$$_ProjectTypesSecondaryModelCopyWithImpl<$Res>
    extends _$ProjectTypesSecondaryModelCopyWithImpl<$Res,
        _$_ProjectTypesSecondaryModel>
    implements _$$_ProjectTypesSecondaryModelCopyWith<$Res> {
  __$$_ProjectTypesSecondaryModelCopyWithImpl(
      _$_ProjectTypesSecondaryModel _value,
      $Res Function(_$_ProjectTypesSecondaryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypes = null,
  }) {
    return _then(_$_ProjectTypesSecondaryModel(
      projectTypes: null == projectTypes
          ? _value._projectTypes
          : projectTypes // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectTypesSecondaryModel implements _ProjectTypesSecondaryModel {
  const _$_ProjectTypesSecondaryModel(
      {@JsonKey(name: 'projectTypes')
          final List<ProjectType> projectTypes = const []})
      : _projectTypes = projectTypes;

  factory _$_ProjectTypesSecondaryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectTypesSecondaryModelFromJson(json);

  final List<ProjectType> _projectTypes;
  @override
  @JsonKey(name: 'projectTypes')
  List<ProjectType> get projectTypes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectTypes);
  }

  @override
  String toString() {
    return 'ProjectTypesSecondaryModel(projectTypes: $projectTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectTypesSecondaryModel &&
            const DeepCollectionEquality()
                .equals(other._projectTypes, _projectTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectTypesSecondaryModelCopyWith<_$_ProjectTypesSecondaryModel>
      get copyWith => __$$_ProjectTypesSecondaryModelCopyWithImpl<
          _$_ProjectTypesSecondaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectTypesSecondaryModelToJson(
      this,
    );
  }
}

abstract class _ProjectTypesSecondaryModel
    implements ProjectTypesSecondaryModel {
  const factory _ProjectTypesSecondaryModel(
          {@JsonKey(name: 'projectTypes')
              final List<ProjectType> projectTypes}) =
      _$_ProjectTypesSecondaryModel;

  factory _ProjectTypesSecondaryModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectTypesSecondaryModel.fromJson;

  @override
  @JsonKey(name: 'projectTypes')
  List<ProjectType> get projectTypes;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectTypesSecondaryModelCopyWith<_$_ProjectTypesSecondaryModel>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectType _$ProjectTypeFromJson(Map<String, dynamic> json) {
  return _ProjectType.fromJson(json);
}

/// @nodoc
mixin _$ProjectType {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;
  String get beneficiaryType => throw _privateConstructorUsedError;
  String? get observationStrategy => throw _privateConstructorUsedError;
  List<Cycle>? get cycles => throw _privateConstructorUsedError;
  List<ProductVariantsModel>? get resources =>
      throw _privateConstructorUsedError;
  int? get validMinAge => throw _privateConstructorUsedError;
  int? get validMaxAge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypeCopyWith<ProjectType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypeCopyWith<$Res> {
  factory $ProjectTypeCopyWith(
          ProjectType value, $Res Function(ProjectType) then) =
      _$ProjectTypeCopyWithImpl<$Res, ProjectType>;
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      String group,
      String beneficiaryType,
      String? observationStrategy,
      List<Cycle>? cycles,
      List<ProductVariantsModel>? resources,
      int? validMinAge,
      int? validMaxAge});
}

/// @nodoc
class _$ProjectTypeCopyWithImpl<$Res, $Val extends ProjectType>
    implements $ProjectTypeCopyWith<$Res> {
  _$ProjectTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? group = null,
    Object? beneficiaryType = null,
    Object? observationStrategy = freezed,
    Object? cycles = freezed,
    Object? resources = freezed,
    Object? validMinAge = freezed,
    Object? validMaxAge = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryType: null == beneficiaryType
          ? _value.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String,
      observationStrategy: freezed == observationStrategy
          ? _value.observationStrategy
          : observationStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      cycles: freezed == cycles
          ? _value.cycles
          : cycles // ignore: cast_nullable_to_non_nullable
              as List<Cycle>?,
      resources: freezed == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
      validMinAge: freezed == validMinAge
          ? _value.validMinAge
          : validMinAge // ignore: cast_nullable_to_non_nullable
              as int?,
      validMaxAge: freezed == validMaxAge
          ? _value.validMaxAge
          : validMaxAge // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectTypeCopyWith<$Res>
    implements $ProjectTypeCopyWith<$Res> {
  factory _$$_ProjectTypeCopyWith(
          _$_ProjectType value, $Res Function(_$_ProjectType) then) =
      __$$_ProjectTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      String group,
      String beneficiaryType,
      String? observationStrategy,
      List<Cycle>? cycles,
      List<ProductVariantsModel>? resources,
      int? validMinAge,
      int? validMaxAge});
}

/// @nodoc
class __$$_ProjectTypeCopyWithImpl<$Res>
    extends _$ProjectTypeCopyWithImpl<$Res, _$_ProjectType>
    implements _$$_ProjectTypeCopyWith<$Res> {
  __$$_ProjectTypeCopyWithImpl(
      _$_ProjectType _value, $Res Function(_$_ProjectType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? group = null,
    Object? beneficiaryType = null,
    Object? observationStrategy = freezed,
    Object? cycles = freezed,
    Object? resources = freezed,
    Object? validMinAge = freezed,
    Object? validMaxAge = freezed,
  }) {
    return _then(_$_ProjectType(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryType: null == beneficiaryType
          ? _value.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String,
      observationStrategy: freezed == observationStrategy
          ? _value.observationStrategy
          : observationStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      cycles: freezed == cycles
          ? _value._cycles
          : cycles // ignore: cast_nullable_to_non_nullable
              as List<Cycle>?,
      resources: freezed == resources
          ? _value._resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
      validMinAge: freezed == validMinAge
          ? _value.validMinAge
          : validMinAge // ignore: cast_nullable_to_non_nullable
              as int?,
      validMaxAge: freezed == validMaxAge
          ? _value.validMaxAge
          : validMaxAge // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectType implements _ProjectType {
  const _$_ProjectType(
      {required this.id,
      required this.code,
      required this.name,
      required this.group,
      required this.beneficiaryType,
      this.observationStrategy,
      final List<Cycle>? cycles,
      final List<ProductVariantsModel>? resources,
      this.validMinAge,
      this.validMaxAge})
      : _cycles = cycles,
        _resources = resources;

  factory _$_ProjectType.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectTypeFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String group;
  @override
  final String beneficiaryType;
  @override
  final String? observationStrategy;
  final List<Cycle>? _cycles;
  @override
  List<Cycle>? get cycles {
    final value = _cycles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductVariantsModel>? _resources;
  @override
  List<ProductVariantsModel>? get resources {
    final value = _resources;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? validMinAge;
  @override
  final int? validMaxAge;

  @override
  String toString() {
    return 'ProjectType(id: $id, code: $code, name: $name, group: $group, beneficiaryType: $beneficiaryType, observationStrategy: $observationStrategy, cycles: $cycles, resources: $resources, validMinAge: $validMinAge, validMaxAge: $validMaxAge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.beneficiaryType, beneficiaryType) ||
                other.beneficiaryType == beneficiaryType) &&
            (identical(other.observationStrategy, observationStrategy) ||
                other.observationStrategy == observationStrategy) &&
            const DeepCollectionEquality().equals(other._cycles, _cycles) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources) &&
            (identical(other.validMinAge, validMinAge) ||
                other.validMinAge == validMinAge) &&
            (identical(other.validMaxAge, validMaxAge) ||
                other.validMaxAge == validMaxAge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      group,
      beneficiaryType,
      observationStrategy,
      const DeepCollectionEquality().hash(_cycles),
      const DeepCollectionEquality().hash(_resources),
      validMinAge,
      validMaxAge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectTypeCopyWith<_$_ProjectType> get copyWith =>
      __$$_ProjectTypeCopyWithImpl<_$_ProjectType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectTypeToJson(
      this,
    );
  }
}

abstract class _ProjectType implements ProjectType {
  const factory _ProjectType(
      {required final String id,
      required final String code,
      required final String name,
      required final String group,
      required final String beneficiaryType,
      final String? observationStrategy,
      final List<Cycle>? cycles,
      final List<ProductVariantsModel>? resources,
      final int? validMinAge,
      final int? validMaxAge}) = _$_ProjectType;

  factory _ProjectType.fromJson(Map<String, dynamic> json) =
      _$_ProjectType.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  @override
  String get group;
  @override
  String get beneficiaryType;
  @override
  String? get observationStrategy;
  @override
  List<Cycle>? get cycles;
  @override
  List<ProductVariantsModel>? get resources;
  @override
  int? get validMinAge;
  @override
  int? get validMaxAge;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectTypeCopyWith<_$_ProjectType> get copyWith =>
      throw _privateConstructorUsedError;
}

Cycle _$CycleFromJson(Map<String, dynamic> json) {
  return _Cycle.fromJson(json);
}

/// @nodoc
mixin _$Cycle {
  String? get mandatoryWaitSinceLastCycleInDays =>
      throw _privateConstructorUsedError;
  int? get startDate => throw _privateConstructorUsedError;
  int? get endDate => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CycleCopyWith<Cycle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleCopyWith<$Res> {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) then) =
      _$CycleCopyWithImpl<$Res, Cycle>;
  @useResult
  $Res call(
      {String? mandatoryWaitSinceLastCycleInDays,
      int? startDate,
      int? endDate,
      int id,
      @JsonKey(name: 'deliveries') List<DeliveryModel>? deliveries});
}

/// @nodoc
class _$CycleCopyWithImpl<$Res, $Val extends Cycle>
    implements $CycleCopyWith<$Res> {
  _$CycleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastCycleInDays = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? id = null,
    Object? deliveries = freezed,
  }) {
    return _then(_value.copyWith(
      mandatoryWaitSinceLastCycleInDays: freezed ==
              mandatoryWaitSinceLastCycleInDays
          ? _value.mandatoryWaitSinceLastCycleInDays
          : mandatoryWaitSinceLastCycleInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deliveries: freezed == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CycleCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$$_CycleCopyWith(_$_Cycle value, $Res Function(_$_Cycle) then) =
      __$$_CycleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? mandatoryWaitSinceLastCycleInDays,
      int? startDate,
      int? endDate,
      int id,
      @JsonKey(name: 'deliveries') List<DeliveryModel>? deliveries});
}

/// @nodoc
class __$$_CycleCopyWithImpl<$Res> extends _$CycleCopyWithImpl<$Res, _$_Cycle>
    implements _$$_CycleCopyWith<$Res> {
  __$$_CycleCopyWithImpl(_$_Cycle _value, $Res Function(_$_Cycle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastCycleInDays = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? id = null,
    Object? deliveries = freezed,
  }) {
    return _then(_$_Cycle(
      mandatoryWaitSinceLastCycleInDays: freezed ==
              mandatoryWaitSinceLastCycleInDays
          ? _value.mandatoryWaitSinceLastCycleInDays
          : mandatoryWaitSinceLastCycleInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deliveries: freezed == deliveries
          ? _value._deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cycle implements _Cycle {
  const _$_Cycle(
      {this.mandatoryWaitSinceLastCycleInDays,
      this.startDate,
      this.endDate,
      this.id = 0,
      @JsonKey(name: 'deliveries') final List<DeliveryModel>? deliveries})
      : _deliveries = deliveries;

  factory _$_Cycle.fromJson(Map<String, dynamic> json) =>
      _$$_CycleFromJson(json);

  @override
  final String? mandatoryWaitSinceLastCycleInDays;
  @override
  final int? startDate;
  @override
  final int? endDate;
  @override
  @JsonKey()
  final int id;
  final List<DeliveryModel>? _deliveries;
  @override
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries {
    final value = _deliveries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Cycle(mandatoryWaitSinceLastCycleInDays: $mandatoryWaitSinceLastCycleInDays, startDate: $startDate, endDate: $endDate, id: $id, deliveries: $deliveries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cycle &&
            (identical(other.mandatoryWaitSinceLastCycleInDays,
                    mandatoryWaitSinceLastCycleInDays) ||
                other.mandatoryWaitSinceLastCycleInDays ==
                    mandatoryWaitSinceLastCycleInDays) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._deliveries, _deliveries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mandatoryWaitSinceLastCycleInDays,
      startDate,
      endDate,
      id,
      const DeepCollectionEquality().hash(_deliveries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CycleCopyWith<_$_Cycle> get copyWith =>
      __$$_CycleCopyWithImpl<_$_Cycle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CycleToJson(
      this,
    );
  }
}

abstract class _Cycle implements Cycle {
  const factory _Cycle(
          {final String? mandatoryWaitSinceLastCycleInDays,
          final int? startDate,
          final int? endDate,
          final int id,
          @JsonKey(name: 'deliveries') final List<DeliveryModel>? deliveries}) =
      _$_Cycle;

  factory _Cycle.fromJson(Map<String, dynamic> json) = _$_Cycle.fromJson;

  @override
  String? get mandatoryWaitSinceLastCycleInDays;
  @override
  int? get startDate;
  @override
  int? get endDate;
  @override
  int get id;
  @override
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries;
  @override
  @JsonKey(ignore: true)
  _$$_CycleCopyWith<_$_Cycle> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return _DeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryModel {
  List<DoseCriteriaModel>? get doseCriteria =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  String? get mandatoryWaitSinceLastDeliveryInDays =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryStrategy')
  String? get deliveryStrategy => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) then) =
      _$DeliveryModelCopyWithImpl<$Res, DeliveryModel>;
  @useResult
  $Res call(
      {List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy')
          String? deliveryStrategy,
      int id});
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res, $Val extends DeliveryModel>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doseCriteria = freezed,
    Object? mandatoryWaitSinceLastDeliveryInDays = freezed,
    Object? deliveryStrategy = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      doseCriteria: freezed == doseCriteria
          ? _value.doseCriteria
          : doseCriteria // ignore: cast_nullable_to_non_nullable
              as List<DoseCriteriaModel>?,
      mandatoryWaitSinceLastDeliveryInDays: freezed ==
              mandatoryWaitSinceLastDeliveryInDays
          ? _value.mandatoryWaitSinceLastDeliveryInDays
          : mandatoryWaitSinceLastDeliveryInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStrategy: freezed == deliveryStrategy
          ? _value.deliveryStrategy
          : deliveryStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryModelCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$$_DeliveryModelCopyWith(
          _$_DeliveryModel value, $Res Function(_$_DeliveryModel) then) =
      __$$_DeliveryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy')
          String? deliveryStrategy,
      int id});
}

/// @nodoc
class __$$_DeliveryModelCopyWithImpl<$Res>
    extends _$DeliveryModelCopyWithImpl<$Res, _$_DeliveryModel>
    implements _$$_DeliveryModelCopyWith<$Res> {
  __$$_DeliveryModelCopyWithImpl(
      _$_DeliveryModel _value, $Res Function(_$_DeliveryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doseCriteria = freezed,
    Object? mandatoryWaitSinceLastDeliveryInDays = freezed,
    Object? deliveryStrategy = freezed,
    Object? id = null,
  }) {
    return _then(_$_DeliveryModel(
      doseCriteria: freezed == doseCriteria
          ? _value._doseCriteria
          : doseCriteria // ignore: cast_nullable_to_non_nullable
              as List<DoseCriteriaModel>?,
      mandatoryWaitSinceLastDeliveryInDays: freezed ==
              mandatoryWaitSinceLastDeliveryInDays
          ? _value.mandatoryWaitSinceLastDeliveryInDays
          : mandatoryWaitSinceLastDeliveryInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStrategy: freezed == deliveryStrategy
          ? _value.deliveryStrategy
          : deliveryStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryModel implements _DeliveryModel {
  const _$_DeliveryModel(
      {final List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          this.mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy')
          this.deliveryStrategy,
      this.id = 0})
      : _doseCriteria = doseCriteria;

  factory _$_DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryModelFromJson(json);

  final List<DoseCriteriaModel>? _doseCriteria;
  @override
  List<DoseCriteriaModel>? get doseCriteria {
    final value = _doseCriteria;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  final String? mandatoryWaitSinceLastDeliveryInDays;
  @override
  @JsonKey(name: 'deliveryStrategy')
  final String? deliveryStrategy;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'DeliveryModel(doseCriteria: $doseCriteria, mandatoryWaitSinceLastDeliveryInDays: $mandatoryWaitSinceLastDeliveryInDays, deliveryStrategy: $deliveryStrategy, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryModel &&
            const DeepCollectionEquality()
                .equals(other._doseCriteria, _doseCriteria) &&
            (identical(other.mandatoryWaitSinceLastDeliveryInDays,
                    mandatoryWaitSinceLastDeliveryInDays) ||
                other.mandatoryWaitSinceLastDeliveryInDays ==
                    mandatoryWaitSinceLastDeliveryInDays) &&
            (identical(other.deliveryStrategy, deliveryStrategy) ||
                other.deliveryStrategy == deliveryStrategy) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_doseCriteria),
      mandatoryWaitSinceLastDeliveryInDays,
      deliveryStrategy,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryModelCopyWith<_$_DeliveryModel> get copyWith =>
      __$$_DeliveryModelCopyWithImpl<_$_DeliveryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryModelToJson(
      this,
    );
  }
}

abstract class _DeliveryModel implements DeliveryModel {
  const factory _DeliveryModel(
      {final List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
          final String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy')
          final String? deliveryStrategy,
      final int id}) = _$_DeliveryModel;

  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =
      _$_DeliveryModel.fromJson;

  @override
  List<DoseCriteriaModel>? get doseCriteria;
  @override
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  String? get mandatoryWaitSinceLastDeliveryInDays;
  @override
  @JsonKey(name: 'deliveryStrategy')
  String? get deliveryStrategy;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryModelCopyWith<_$_DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DoseCriteriaModel _$DoseCriteriaModelFromJson(Map<String, dynamic> json) {
  return _DoseCriteriaModel.fromJson(json);
}

/// @nodoc
mixin _$DoseCriteriaModel {
  @JsonKey(name: 'condition')
  String? get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductVariants')
  List<ProductVariantsModel>? get productVariants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoseCriteriaModelCopyWith<DoseCriteriaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseCriteriaModelCopyWith<$Res> {
  factory $DoseCriteriaModelCopyWith(
          DoseCriteriaModel value, $Res Function(DoseCriteriaModel) then) =
      _$DoseCriteriaModelCopyWithImpl<$Res, DoseCriteriaModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'condition')
          String? condition,
      @JsonKey(name: 'ProductVariants')
          List<ProductVariantsModel>? productVariants});
}

/// @nodoc
class _$DoseCriteriaModelCopyWithImpl<$Res, $Val extends DoseCriteriaModel>
    implements $DoseCriteriaModelCopyWith<$Res> {
  _$DoseCriteriaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? productVariants = freezed,
  }) {
    return _then(_value.copyWith(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      productVariants: freezed == productVariants
          ? _value.productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoseCriteriaModelCopyWith<$Res>
    implements $DoseCriteriaModelCopyWith<$Res> {
  factory _$$_DoseCriteriaModelCopyWith(_$_DoseCriteriaModel value,
          $Res Function(_$_DoseCriteriaModel) then) =
      __$$_DoseCriteriaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'condition')
          String? condition,
      @JsonKey(name: 'ProductVariants')
          List<ProductVariantsModel>? productVariants});
}

/// @nodoc
class __$$_DoseCriteriaModelCopyWithImpl<$Res>
    extends _$DoseCriteriaModelCopyWithImpl<$Res, _$_DoseCriteriaModel>
    implements _$$_DoseCriteriaModelCopyWith<$Res> {
  __$$_DoseCriteriaModelCopyWithImpl(
      _$_DoseCriteriaModel _value, $Res Function(_$_DoseCriteriaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? productVariants = freezed,
  }) {
    return _then(_$_DoseCriteriaModel(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      productVariants: freezed == productVariants
          ? _value._productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DoseCriteriaModel implements _DoseCriteriaModel {
  const _$_DoseCriteriaModel(
      {@JsonKey(name: 'condition')
          this.condition,
      @JsonKey(name: 'ProductVariants')
          final List<ProductVariantsModel>? productVariants})
      : _productVariants = productVariants;

  factory _$_DoseCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$$_DoseCriteriaModelFromJson(json);

  @override
  @JsonKey(name: 'condition')
  final String? condition;
  final List<ProductVariantsModel>? _productVariants;
  @override
  @JsonKey(name: 'ProductVariants')
  List<ProductVariantsModel>? get productVariants {
    final value = _productVariants;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DoseCriteriaModel(condition: $condition, productVariants: $productVariants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoseCriteriaModel &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality()
                .equals(other._productVariants, _productVariants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, condition,
      const DeepCollectionEquality().hash(_productVariants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoseCriteriaModelCopyWith<_$_DoseCriteriaModel> get copyWith =>
      __$$_DoseCriteriaModelCopyWithImpl<_$_DoseCriteriaModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoseCriteriaModelToJson(
      this,
    );
  }
}

abstract class _DoseCriteriaModel implements DoseCriteriaModel {
  const factory _DoseCriteriaModel(
          {@JsonKey(name: 'condition')
              final String? condition,
          @JsonKey(name: 'ProductVariants')
              final List<ProductVariantsModel>? productVariants}) =
      _$_DoseCriteriaModel;

  factory _DoseCriteriaModel.fromJson(Map<String, dynamic> json) =
      _$_DoseCriteriaModel.fromJson;

  @override
  @JsonKey(name: 'condition')
  String? get condition;
  @override
  @JsonKey(name: 'ProductVariants')
  List<ProductVariantsModel>? get productVariants;
  @override
  @JsonKey(ignore: true)
  _$$_DoseCriteriaModelCopyWith<_$_DoseCriteriaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductVariantsModel _$ProductVariantsModelFromJson(Map<String, dynamic> json) {
  return _ProductVariantsModel.fromJson(json);
}

/// @nodoc
mixin _$ProductVariantsModel {
  String? get productVariantId => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductVariantsModelCopyWith<ProductVariantsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantsModelCopyWith<$Res> {
  factory $ProductVariantsModelCopyWith(ProductVariantsModel value,
          $Res Function(ProductVariantsModel) then) =
      _$ProductVariantsModelCopyWithImpl<$Res, ProductVariantsModel>;
  @useResult
  $Res call({String? productVariantId, int? quantity});
}

/// @nodoc
class _$ProductVariantsModelCopyWithImpl<$Res,
        $Val extends ProductVariantsModel>
    implements $ProductVariantsModelCopyWith<$Res> {
  _$ProductVariantsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariantId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productVariantId: freezed == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductVariantsModelCopyWith<$Res>
    implements $ProductVariantsModelCopyWith<$Res> {
  factory _$$_ProductVariantsModelCopyWith(_$_ProductVariantsModel value,
          $Res Function(_$_ProductVariantsModel) then) =
      __$$_ProductVariantsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? productVariantId, int? quantity});
}

/// @nodoc
class __$$_ProductVariantsModelCopyWithImpl<$Res>
    extends _$ProductVariantsModelCopyWithImpl<$Res, _$_ProductVariantsModel>
    implements _$$_ProductVariantsModelCopyWith<$Res> {
  __$$_ProductVariantsModelCopyWithImpl(_$_ProductVariantsModel _value,
      $Res Function(_$_ProductVariantsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariantId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_ProductVariantsModel(
      productVariantId: freezed == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductVariantsModel implements _ProductVariantsModel {
  const _$_ProductVariantsModel({this.productVariantId, this.quantity});

  factory _$_ProductVariantsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductVariantsModelFromJson(json);

  @override
  final String? productVariantId;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'ProductVariantsModel(productVariantId: $productVariantId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductVariantsModel &&
            (identical(other.productVariantId, productVariantId) ||
                other.productVariantId == productVariantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productVariantId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductVariantsModelCopyWith<_$_ProductVariantsModel> get copyWith =>
      __$$_ProductVariantsModelCopyWithImpl<_$_ProductVariantsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductVariantsModelToJson(
      this,
    );
  }
}

abstract class _ProductVariantsModel implements ProductVariantsModel {
  const factory _ProductVariantsModel(
      {final String? productVariantId,
      final int? quantity}) = _$_ProductVariantsModel;

  factory _ProductVariantsModel.fromJson(Map<String, dynamic> json) =
      _$_ProductVariantsModel.fromJson;

  @override
  String? get productVariantId;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_ProductVariantsModelCopyWith<_$_ProductVariantsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
