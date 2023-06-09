// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pgr_service_defenitions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_PGRServiceDefinitionsCopyWith<$Res>
    implements $PGRServiceDefinitionsCopyWith<$Res> {
  factory _$$_PGRServiceDefinitionsCopyWith(_$_PGRServiceDefinitions value,
          $Res Function(_$_PGRServiceDefinitions) then) =
      __$$_PGRServiceDefinitionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RAINMAKER-PGR')
          ServiceDefinitionWrapper? serviceDefinitionWrapper});

  @override
  $ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper;
}

/// @nodoc
class __$$_PGRServiceDefinitionsCopyWithImpl<$Res>
    extends _$PGRServiceDefinitionsCopyWithImpl<$Res, _$_PGRServiceDefinitions>
    implements _$$_PGRServiceDefinitionsCopyWith<$Res> {
  __$$_PGRServiceDefinitionsCopyWithImpl(_$_PGRServiceDefinitions _value,
      $Res Function(_$_PGRServiceDefinitions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDefinitionWrapper = freezed,
  }) {
    return _then(_$_PGRServiceDefinitions(
      serviceDefinitionWrapper: freezed == serviceDefinitionWrapper
          ? _value.serviceDefinitionWrapper
          : serviceDefinitionWrapper // ignore: cast_nullable_to_non_nullable
              as ServiceDefinitionWrapper?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PGRServiceDefinitions implements _PGRServiceDefinitions {
  const _$_PGRServiceDefinitions(
      {@JsonKey(name: 'RAINMAKER-PGR') this.serviceDefinitionWrapper});

  factory _$_PGRServiceDefinitions.fromJson(Map<String, dynamic> json) =>
      _$$_PGRServiceDefinitionsFromJson(json);

  @override
  @JsonKey(name: 'RAINMAKER-PGR')
  final ServiceDefinitionWrapper? serviceDefinitionWrapper;

  @override
  String toString() {
    return 'PGRServiceDefinitions(serviceDefinitionWrapper: $serviceDefinitionWrapper)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PGRServiceDefinitions &&
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
  _$$_PGRServiceDefinitionsCopyWith<_$_PGRServiceDefinitions> get copyWith =>
      __$$_PGRServiceDefinitionsCopyWithImpl<_$_PGRServiceDefinitions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PGRServiceDefinitionsToJson(
      this,
    );
  }
}

abstract class _PGRServiceDefinitions implements PGRServiceDefinitions {
  const factory _PGRServiceDefinitions(
          {@JsonKey(name: 'RAINMAKER-PGR')
              final ServiceDefinitionWrapper? serviceDefinitionWrapper}) =
      _$_PGRServiceDefinitions;

  factory _PGRServiceDefinitions.fromJson(Map<String, dynamic> json) =
      _$_PGRServiceDefinitions.fromJson;

  @override
  @JsonKey(name: 'RAINMAKER-PGR')
  ServiceDefinitionWrapper? get serviceDefinitionWrapper;
  @override
  @JsonKey(ignore: true)
  _$$_PGRServiceDefinitionsCopyWith<_$_PGRServiceDefinitions> get copyWith =>
      throw _privateConstructorUsedError;
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
abstract class _$$_ServiceDefinitionWrapperCopyWith<$Res>
    implements $ServiceDefinitionWrapperCopyWith<$Res> {
  factory _$$_ServiceDefinitionWrapperCopyWith(
          _$_ServiceDefinitionWrapper value,
          $Res Function(_$_ServiceDefinitionWrapper) then) =
      __$$_ServiceDefinitionWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "ServiceDefs") List<Definition> definition});
}

/// @nodoc
class __$$_ServiceDefinitionWrapperCopyWithImpl<$Res>
    extends _$ServiceDefinitionWrapperCopyWithImpl<$Res,
        _$_ServiceDefinitionWrapper>
    implements _$$_ServiceDefinitionWrapperCopyWith<$Res> {
  __$$_ServiceDefinitionWrapperCopyWithImpl(_$_ServiceDefinitionWrapper _value,
      $Res Function(_$_ServiceDefinitionWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = null,
  }) {
    return _then(_$_ServiceDefinitionWrapper(
      definition: null == definition
          ? _value._definition
          : definition // ignore: cast_nullable_to_non_nullable
              as List<Definition>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceDefinitionWrapper implements _ServiceDefinitionWrapper {
  const _$_ServiceDefinitionWrapper(
      {@JsonKey(name: "ServiceDefs")
          final List<Definition> definition = const []})
      : _definition = definition;

  factory _$_ServiceDefinitionWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceDefinitionWrapperFromJson(json);

  final List<Definition> _definition;
  @override
  @JsonKey(name: "ServiceDefs")
  List<Definition> get definition {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_definition);
  }

  @override
  String toString() {
    return 'ServiceDefinitionWrapper(definition: $definition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceDefinitionWrapper &&
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
  _$$_ServiceDefinitionWrapperCopyWith<_$_ServiceDefinitionWrapper>
      get copyWith => __$$_ServiceDefinitionWrapperCopyWithImpl<
          _$_ServiceDefinitionWrapper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceDefinitionWrapperToJson(
      this,
    );
  }
}

abstract class _ServiceDefinitionWrapper implements ServiceDefinitionWrapper {
  const factory _ServiceDefinitionWrapper(
          {@JsonKey(name: "ServiceDefs") final List<Definition> definition}) =
      _$_ServiceDefinitionWrapper;

  factory _ServiceDefinitionWrapper.fromJson(Map<String, dynamic> json) =
      _$_ServiceDefinitionWrapper.fromJson;

  @override
  @JsonKey(name: "ServiceDefs")
  List<Definition> get definition;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceDefinitionWrapperCopyWith<_$_ServiceDefinitionWrapper>
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
abstract class _$$_DefinitionCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$_DefinitionCopyWith(
          _$_Definition value, $Res Function(_$_Definition) then) =
      __$$_DefinitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serviceCode, String name});
}

/// @nodoc
class __$$_DefinitionCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$_Definition>
    implements _$$_DefinitionCopyWith<$Res> {
  __$$_DefinitionCopyWithImpl(
      _$_Definition _value, $Res Function(_$_Definition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceCode = null,
    Object? name = null,
  }) {
    return _then(_$_Definition(
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
class _$_Definition implements _Definition {
  const _$_Definition({required this.serviceCode, required this.name});

  factory _$_Definition.fromJson(Map<String, dynamic> json) =>
      _$$_DefinitionFromJson(json);

  @override
  final String serviceCode;
  @override
  final String name;

  @override
  String toString() {
    return 'Definition(serviceCode: $serviceCode, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Definition &&
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
  _$$_DefinitionCopyWith<_$_Definition> get copyWith =>
      __$$_DefinitionCopyWithImpl<_$_Definition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefinitionToJson(
      this,
    );
  }
}

abstract class _Definition implements Definition {
  const factory _Definition(
      {required final String serviceCode,
      required final String name}) = _$_Definition;

  factory _Definition.fromJson(Map<String, dynamic> json) =
      _$_Definition.fromJson;

  @override
  String get serviceCode;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_DefinitionCopyWith<_$_Definition> get copyWith =>
      throw _privateConstructorUsedError;
}
