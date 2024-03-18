// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pgr_service_defenitions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PGRServiceDefinitions _$PGRServiceDefinitionsFromJson(
    Map<String, dynamic> json) {
  return _PGRServiceDefinitions.fromJson(json);
}

/// @nodoc
mixin _$PGRServiceDefinitions {
  @JsonKey(name: 'RAINMAKER-PGR')
  ServiceDefinitionWrapper? get serviceDefinitionWrapper =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PGRServiceDefinitionsCopyWith<PGRServiceDefinitions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PGRServiceDefinitionsCopyWith<$Res> {
  factory $PGRServiceDefinitionsCopyWith(PGRServiceDefinitions value,
          $Res Function(PGRServiceDefinitions) then) =
      _$PGRServiceDefinitionsCopyWithImpl<$Res, PGRServiceDefinitions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RAINMAKER-PGR')
      ServiceDefinitionWrapper? serviceDefinitionWrapper});

  $ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper;
}

/// @nodoc
class _$PGRServiceDefinitionsCopyWithImpl<$Res,
        $Val extends PGRServiceDefinitions>
    implements $PGRServiceDefinitionsCopyWith<$Res> {
  _$PGRServiceDefinitionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDefinitionWrapper = freezed,
  }) {
    return _then(_value.copyWith(
      serviceDefinitionWrapper: freezed == serviceDefinitionWrapper
          ? _value.serviceDefinitionWrapper
          : serviceDefinitionWrapper // ignore: cast_nullable_to_non_nullable
              as ServiceDefinitionWrapper?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper {
    if (_value.serviceDefinitionWrapper == null) {
      return null;
    }

    return $ServiceDefinitionWrapperCopyWith<$Res>(
        _value.serviceDefinitionWrapper!, (value) {
      return _then(_value.copyWith(serviceDefinitionWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PGRServiceDefinitionsImplCopyWith<$Res>
    implements $PGRServiceDefinitionsCopyWith<$Res> {
  factory _$$PGRServiceDefinitionsImplCopyWith(
          _$PGRServiceDefinitionsImpl value,
          $Res Function(_$PGRServiceDefinitionsImpl) then) =
      __$$PGRServiceDefinitionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RAINMAKER-PGR')
      ServiceDefinitionWrapper? serviceDefinitionWrapper});

  @override
  $ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper;
}

/// @nodoc
class __$$PGRServiceDefinitionsImplCopyWithImpl<$Res>
    extends _$PGRServiceDefinitionsCopyWithImpl<$Res,
        _$PGRServiceDefinitionsImpl>
    implements _$$PGRServiceDefinitionsImplCopyWith<$Res> {
  __$$PGRServiceDefinitionsImplCopyWithImpl(_$PGRServiceDefinitionsImpl _value,
      $Res Function(_$PGRServiceDefinitionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDefinitionWrapper = freezed,
  }) {
    return _then(_$PGRServiceDefinitionsImpl(
      serviceDefinitionWrapper: freezed == serviceDefinitionWrapper
          ? _value.serviceDefinitionWrapper
          : serviceDefinitionWrapper // ignore: cast_nullable_to_non_nullable
              as ServiceDefinitionWrapper?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PGRServiceDefinitionsImpl implements _PGRServiceDefinitions {
  const _$PGRServiceDefinitionsImpl(
      {@JsonKey(name: 'RAINMAKER-PGR') this.serviceDefinitionWrapper});

  factory _$PGRServiceDefinitionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PGRServiceDefinitionsImplFromJson(json);

  @override
  @JsonKey(name: 'RAINMAKER-PGR')
  final ServiceDefinitionWrapper? serviceDefinitionWrapper;

  @override
  String toString() {
    return 'PGRServiceDefinitions(serviceDefinitionWrapper: $serviceDefinitionWrapper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PGRServiceDefinitionsImpl &&
            (identical(
                    other.serviceDefinitionWrapper, serviceDefinitionWrapper) ||
                other.serviceDefinitionWrapper == serviceDefinitionWrapper));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceDefinitionWrapper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PGRServiceDefinitionsImplCopyWith<_$PGRServiceDefinitionsImpl>
      get copyWith => __$$PGRServiceDefinitionsImplCopyWithImpl<
          _$PGRServiceDefinitionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PGRServiceDefinitionsImplToJson(
      this,
    );
  }
}

abstract class _PGRServiceDefinitions implements PGRServiceDefinitions {
  const factory _PGRServiceDefinitions(
          {@JsonKey(name: 'RAINMAKER-PGR')
          final ServiceDefinitionWrapper? serviceDefinitionWrapper}) =
      _$PGRServiceDefinitionsImpl;

  factory _PGRServiceDefinitions.fromJson(Map<String, dynamic> json) =
      _$PGRServiceDefinitionsImpl.fromJson;

  @override
  @JsonKey(name: 'RAINMAKER-PGR')
  ServiceDefinitionWrapper? get serviceDefinitionWrapper;
  @override
  @JsonKey(ignore: true)
  _$$PGRServiceDefinitionsImplCopyWith<_$PGRServiceDefinitionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceDefinitionWrapper _$ServiceDefinitionWrapperFromJson(
    Map<String, dynamic> json) {
  return _ServiceDefinitionWrapper.fromJson(json);
}

/// @nodoc
mixin _$ServiceDefinitionWrapper {
  @JsonKey(name: "ServiceDefs")
  List<Definition> get definition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceDefinitionWrapperCopyWith<ServiceDefinitionWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDefinitionWrapperCopyWith<$Res> {
  factory $ServiceDefinitionWrapperCopyWith(ServiceDefinitionWrapper value,
          $Res Function(ServiceDefinitionWrapper) then) =
      _$ServiceDefinitionWrapperCopyWithImpl<$Res, ServiceDefinitionWrapper>;
  @useResult
  $Res call({@JsonKey(name: "ServiceDefs") List<Definition> definition});
}

/// @nodoc
class _$ServiceDefinitionWrapperCopyWithImpl<$Res,
        $Val extends ServiceDefinitionWrapper>
    implements $ServiceDefinitionWrapperCopyWith<$Res> {
  _$ServiceDefinitionWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = null,
  }) {
    return _then(_value.copyWith(
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as List<Definition>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceDefinitionWrapperImplCopyWith<$Res>
    implements $ServiceDefinitionWrapperCopyWith<$Res> {
  factory _$$ServiceDefinitionWrapperImplCopyWith(
          _$ServiceDefinitionWrapperImpl value,
          $Res Function(_$ServiceDefinitionWrapperImpl) then) =
      __$$ServiceDefinitionWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "ServiceDefs") List<Definition> definition});
}

/// @nodoc
class __$$ServiceDefinitionWrapperImplCopyWithImpl<$Res>
    extends _$ServiceDefinitionWrapperCopyWithImpl<$Res,
        _$ServiceDefinitionWrapperImpl>
    implements _$$ServiceDefinitionWrapperImplCopyWith<$Res> {
  __$$ServiceDefinitionWrapperImplCopyWithImpl(
      _$ServiceDefinitionWrapperImpl _value,
      $Res Function(_$ServiceDefinitionWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = null,
  }) {
    return _then(_$ServiceDefinitionWrapperImpl(
      definition: null == definition
          ? _value._definition
          : definition // ignore: cast_nullable_to_non_nullable
              as List<Definition>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceDefinitionWrapperImpl implements _ServiceDefinitionWrapper {
  const _$ServiceDefinitionWrapperImpl(
      {@JsonKey(name: "ServiceDefs")
      final List<Definition> definition = const []})
      : _definition = definition;

  factory _$ServiceDefinitionWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceDefinitionWrapperImplFromJson(json);

  final List<Definition> _definition;
  @override
  @JsonKey(name: "ServiceDefs")
  List<Definition> get definition {
    if (_definition is EqualUnmodifiableListView) return _definition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_definition);
  }

  @override
  String toString() {
    return 'ServiceDefinitionWrapper(definition: $definition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDefinitionWrapperImpl &&
            const DeepCollectionEquality()
                .equals(other._definition, _definition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_definition));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDefinitionWrapperImplCopyWith<_$ServiceDefinitionWrapperImpl>
      get copyWith => __$$ServiceDefinitionWrapperImplCopyWithImpl<
          _$ServiceDefinitionWrapperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceDefinitionWrapperImplToJson(
      this,
    );
  }
}

abstract class _ServiceDefinitionWrapper implements ServiceDefinitionWrapper {
  const factory _ServiceDefinitionWrapper(
          {@JsonKey(name: "ServiceDefs") final List<Definition> definition}) =
      _$ServiceDefinitionWrapperImpl;

  factory _ServiceDefinitionWrapper.fromJson(Map<String, dynamic> json) =
      _$ServiceDefinitionWrapperImpl.fromJson;

  @override
  @JsonKey(name: "ServiceDefs")
  List<Definition> get definition;
  @override
  @JsonKey(ignore: true)
  _$$ServiceDefinitionWrapperImplCopyWith<_$ServiceDefinitionWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return _Definition.fromJson(json);
}

/// @nodoc
mixin _$Definition {
  String get serviceCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefinitionCopyWith<Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
          Definition value, $Res Function(Definition) then) =
      _$DefinitionCopyWithImpl<$Res, Definition>;
  @useResult
  $Res call({String serviceCode, String name});
}

/// @nodoc
class _$DefinitionCopyWithImpl<$Res, $Val extends Definition>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceCode = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      serviceCode: null == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefinitionImplCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$DefinitionImplCopyWith(
          _$DefinitionImpl value, $Res Function(_$DefinitionImpl) then) =
      __$$DefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serviceCode, String name});
}

/// @nodoc
class __$$DefinitionImplCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$DefinitionImpl>
    implements _$$DefinitionImplCopyWith<$Res> {
  __$$DefinitionImplCopyWithImpl(
      _$DefinitionImpl _value, $Res Function(_$DefinitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceCode = null,
    Object? name = null,
  }) {
    return _then(_$DefinitionImpl(
      serviceCode: null == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefinitionImpl implements _Definition {
  const _$DefinitionImpl({required this.serviceCode, required this.name});

  factory _$DefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefinitionImplFromJson(json);

  @override
  final String serviceCode;
  @override
  final String name;

  @override
  String toString() {
    return 'Definition(serviceCode: $serviceCode, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefinitionImpl &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceCode, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      __$$DefinitionImplCopyWithImpl<_$DefinitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefinitionImplToJson(
      this,
    );
  }
}

abstract class _Definition implements Definition {
  const factory _Definition(
      {required final String serviceCode,
      required final String name}) = _$DefinitionImpl;

  factory _Definition.fromJson(Map<String, dynamic> json) =
      _$DefinitionImpl.fromJson;

  @override
  String get serviceCode;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
