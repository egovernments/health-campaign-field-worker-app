// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_registry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRegistryPrimaryWrapperModel _$ServiceRegistryPrimaryWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _ServiceRegistryPrimaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceRegistryPrimaryWrapperModel {
  @JsonKey(name: 'HCM-SERVICE-REGISTRY')
  ServiceRegistrySecondaryWrapperModel? get serviceRegistry =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRegistryPrimaryWrapperModelCopyWith<
          ServiceRegistryPrimaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRegistryPrimaryWrapperModelCopyWith<$Res> {
  factory $ServiceRegistryPrimaryWrapperModelCopyWith(
          ServiceRegistryPrimaryWrapperModel value,
          $Res Function(ServiceRegistryPrimaryWrapperModel) then) =
      _$ServiceRegistryPrimaryWrapperModelCopyWithImpl<$Res,
          ServiceRegistryPrimaryWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
          ServiceRegistrySecondaryWrapperModel? serviceRegistry});

  $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>? get serviceRegistry;
}

/// @nodoc
class _$ServiceRegistryPrimaryWrapperModelCopyWithImpl<$Res,
        $Val extends ServiceRegistryPrimaryWrapperModel>
    implements $ServiceRegistryPrimaryWrapperModelCopyWith<$Res> {
  _$ServiceRegistryPrimaryWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistry = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRegistry: freezed == serviceRegistry
          ? _value.serviceRegistry
          : serviceRegistry // ignore: cast_nullable_to_non_nullable
              as ServiceRegistrySecondaryWrapperModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>? get serviceRegistry {
    if (_value.serviceRegistry == null) {
      return null;
    }

    return $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>(
        _value.serviceRegistry!, (value) {
      return _then(_value.copyWith(serviceRegistry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRegistryPrimaryWrapperModelCopyWith<$Res>
    implements $ServiceRegistryPrimaryWrapperModelCopyWith<$Res> {
  factory _$$_ServiceRegistryPrimaryWrapperModelCopyWith(
          _$_ServiceRegistryPrimaryWrapperModel value,
          $Res Function(_$_ServiceRegistryPrimaryWrapperModel) then) =
      __$$_ServiceRegistryPrimaryWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
          ServiceRegistrySecondaryWrapperModel? serviceRegistry});

  @override
  $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>? get serviceRegistry;
}

/// @nodoc
class __$$_ServiceRegistryPrimaryWrapperModelCopyWithImpl<$Res>
    extends _$ServiceRegistryPrimaryWrapperModelCopyWithImpl<$Res,
        _$_ServiceRegistryPrimaryWrapperModel>
    implements _$$_ServiceRegistryPrimaryWrapperModelCopyWith<$Res> {
  __$$_ServiceRegistryPrimaryWrapperModelCopyWithImpl(
      _$_ServiceRegistryPrimaryWrapperModel _value,
      $Res Function(_$_ServiceRegistryPrimaryWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistry = freezed,
  }) {
    return _then(_$_ServiceRegistryPrimaryWrapperModel(
      serviceRegistry: freezed == serviceRegistry
          ? _value.serviceRegistry
          : serviceRegistry // ignore: cast_nullable_to_non_nullable
              as ServiceRegistrySecondaryWrapperModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRegistryPrimaryWrapperModel
    implements _ServiceRegistryPrimaryWrapperModel {
  const _$_ServiceRegistryPrimaryWrapperModel(
      {@JsonKey(name: 'HCM-SERVICE-REGISTRY') this.serviceRegistry});

  factory _$_ServiceRegistryPrimaryWrapperModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_ServiceRegistryPrimaryWrapperModelFromJson(json);

  @override
  @JsonKey(name: 'HCM-SERVICE-REGISTRY')
  final ServiceRegistrySecondaryWrapperModel? serviceRegistry;

  @override
  String toString() {
    return 'ServiceRegistryPrimaryWrapperModel(serviceRegistry: $serviceRegistry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRegistryPrimaryWrapperModel &&
            (identical(other.serviceRegistry, serviceRegistry) ||
                other.serviceRegistry == serviceRegistry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceRegistry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRegistryPrimaryWrapperModelCopyWith<
          _$_ServiceRegistryPrimaryWrapperModel>
      get copyWith => __$$_ServiceRegistryPrimaryWrapperModelCopyWithImpl<
          _$_ServiceRegistryPrimaryWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRegistryPrimaryWrapperModelToJson(
      this,
    );
  }
}

abstract class _ServiceRegistryPrimaryWrapperModel
    implements ServiceRegistryPrimaryWrapperModel {
  const factory _ServiceRegistryPrimaryWrapperModel(
          {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
              final ServiceRegistrySecondaryWrapperModel? serviceRegistry}) =
      _$_ServiceRegistryPrimaryWrapperModel;

  factory _ServiceRegistryPrimaryWrapperModel.fromJson(
          Map<String, dynamic> json) =
      _$_ServiceRegistryPrimaryWrapperModel.fromJson;

  @override
  @JsonKey(name: 'HCM-SERVICE-REGISTRY')
  ServiceRegistrySecondaryWrapperModel? get serviceRegistry;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRegistryPrimaryWrapperModelCopyWith<
          _$_ServiceRegistryPrimaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceRegistrySecondaryWrapperModel
    _$ServiceRegistrySecondaryWrapperModelFromJson(Map<String, dynamic> json) {
  return _ServiceRegistrySecondaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceRegistrySecondaryWrapperModel {
  @JsonKey(name: 'serviceRegistry')
  List<ServiceRegistryModel> get serviceRegistryList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRegistrySecondaryWrapperModelCopyWith<
          ServiceRegistrySecondaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRegistrySecondaryWrapperModelCopyWith<$Res> {
  factory $ServiceRegistrySecondaryWrapperModelCopyWith(
          ServiceRegistrySecondaryWrapperModel value,
          $Res Function(ServiceRegistrySecondaryWrapperModel) then) =
      _$ServiceRegistrySecondaryWrapperModelCopyWithImpl<$Res,
          ServiceRegistrySecondaryWrapperModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'serviceRegistry')
          List<ServiceRegistryModel> serviceRegistryList});
}

/// @nodoc
class _$ServiceRegistrySecondaryWrapperModelCopyWithImpl<$Res,
        $Val extends ServiceRegistrySecondaryWrapperModel>
    implements $ServiceRegistrySecondaryWrapperModelCopyWith<$Res> {
  _$ServiceRegistrySecondaryWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistryList = null,
  }) {
    return _then(_value.copyWith(
      serviceRegistryList: null == serviceRegistryList
          ? _value.serviceRegistryList
          : serviceRegistryList // ignore: cast_nullable_to_non_nullable
              as List<ServiceRegistryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceRegistrySecondaryWrapperModelCopyWith<$Res>
    implements $ServiceRegistrySecondaryWrapperModelCopyWith<$Res> {
  factory _$$_ServiceRegistrySecondaryWrapperModelCopyWith(
          _$_ServiceRegistrySecondaryWrapperModel value,
          $Res Function(_$_ServiceRegistrySecondaryWrapperModel) then) =
      __$$_ServiceRegistrySecondaryWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'serviceRegistry')
          List<ServiceRegistryModel> serviceRegistryList});
}

/// @nodoc
class __$$_ServiceRegistrySecondaryWrapperModelCopyWithImpl<$Res>
    extends _$ServiceRegistrySecondaryWrapperModelCopyWithImpl<$Res,
        _$_ServiceRegistrySecondaryWrapperModel>
    implements _$$_ServiceRegistrySecondaryWrapperModelCopyWith<$Res> {
  __$$_ServiceRegistrySecondaryWrapperModelCopyWithImpl(
      _$_ServiceRegistrySecondaryWrapperModel _value,
      $Res Function(_$_ServiceRegistrySecondaryWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistryList = null,
  }) {
    return _then(_$_ServiceRegistrySecondaryWrapperModel(
      serviceRegistryList: null == serviceRegistryList
          ? _value._serviceRegistryList
          : serviceRegistryList // ignore: cast_nullable_to_non_nullable
              as List<ServiceRegistryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRegistrySecondaryWrapperModel
    implements _ServiceRegistrySecondaryWrapperModel {
  const _$_ServiceRegistrySecondaryWrapperModel(
      {@JsonKey(name: 'serviceRegistry')
          final List<ServiceRegistryModel> serviceRegistryList = const []})
      : _serviceRegistryList = serviceRegistryList;

  factory _$_ServiceRegistrySecondaryWrapperModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_ServiceRegistrySecondaryWrapperModelFromJson(json);

  final List<ServiceRegistryModel> _serviceRegistryList;
  @override
  @JsonKey(name: 'serviceRegistry')
  List<ServiceRegistryModel> get serviceRegistryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceRegistryList);
  }

  @override
  String toString() {
    return 'ServiceRegistrySecondaryWrapperModel(serviceRegistryList: $serviceRegistryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRegistrySecondaryWrapperModel &&
            const DeepCollectionEquality()
                .equals(other._serviceRegistryList, _serviceRegistryList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceRegistryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRegistrySecondaryWrapperModelCopyWith<
          _$_ServiceRegistrySecondaryWrapperModel>
      get copyWith => __$$_ServiceRegistrySecondaryWrapperModelCopyWithImpl<
          _$_ServiceRegistrySecondaryWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRegistrySecondaryWrapperModelToJson(
      this,
    );
  }
}

abstract class _ServiceRegistrySecondaryWrapperModel
    implements ServiceRegistrySecondaryWrapperModel {
  const factory _ServiceRegistrySecondaryWrapperModel(
          {@JsonKey(name: 'serviceRegistry')
              final List<ServiceRegistryModel> serviceRegistryList}) =
      _$_ServiceRegistrySecondaryWrapperModel;

  factory _ServiceRegistrySecondaryWrapperModel.fromJson(
          Map<String, dynamic> json) =
      _$_ServiceRegistrySecondaryWrapperModel.fromJson;

  @override
  @JsonKey(name: 'serviceRegistry')
  List<ServiceRegistryModel> get serviceRegistryList;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRegistrySecondaryWrapperModelCopyWith<
          _$_ServiceRegistrySecondaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceRegistryModel _$ServiceRegistryModelFromJson(Map<String, dynamic> json) {
  return _ServiceRegistryModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceRegistryModel {
  String get service => throw _privateConstructorUsedError;
  List<ActionsModel> get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRegistryModelCopyWith<ServiceRegistryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRegistryModelCopyWith<$Res> {
  factory $ServiceRegistryModelCopyWith(ServiceRegistryModel value,
          $Res Function(ServiceRegistryModel) then) =
      _$ServiceRegistryModelCopyWithImpl<$Res, ServiceRegistryModel>;
  @useResult
  $Res call({String service, List<ActionsModel> actions});
}

/// @nodoc
class _$ServiceRegistryModelCopyWithImpl<$Res,
        $Val extends ServiceRegistryModel>
    implements $ServiceRegistryModelCopyWith<$Res> {
  _$ServiceRegistryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceRegistryModelCopyWith<$Res>
    implements $ServiceRegistryModelCopyWith<$Res> {
  factory _$$_ServiceRegistryModelCopyWith(_$_ServiceRegistryModel value,
          $Res Function(_$_ServiceRegistryModel) then) =
      __$$_ServiceRegistryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String service, List<ActionsModel> actions});
}

/// @nodoc
class __$$_ServiceRegistryModelCopyWithImpl<$Res>
    extends _$ServiceRegistryModelCopyWithImpl<$Res, _$_ServiceRegistryModel>
    implements _$$_ServiceRegistryModelCopyWith<$Res> {
  __$$_ServiceRegistryModelCopyWithImpl(_$_ServiceRegistryModel _value,
      $Res Function(_$_ServiceRegistryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? actions = null,
  }) {
    return _then(_$_ServiceRegistryModel(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRegistryModel implements _ServiceRegistryModel {
  const _$_ServiceRegistryModel(
      {required this.service, final List<ActionsModel> actions = const []})
      : _actions = actions;

  factory _$_ServiceRegistryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRegistryModelFromJson(json);

  @override
  final String service;
  final List<ActionsModel> _actions;
  @override
  @JsonKey()
  List<ActionsModel> get actions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'ServiceRegistryModel(service: $service, actions: $actions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRegistryModel &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, service, const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRegistryModelCopyWith<_$_ServiceRegistryModel> get copyWith =>
      __$$_ServiceRegistryModelCopyWithImpl<_$_ServiceRegistryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRegistryModelToJson(
      this,
    );
  }
}

abstract class _ServiceRegistryModel implements ServiceRegistryModel {
  const factory _ServiceRegistryModel(
      {required final String service,
      final List<ActionsModel> actions}) = _$_ServiceRegistryModel;

  factory _ServiceRegistryModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceRegistryModel.fromJson;

  @override
  String get service;
  @override
  List<ActionsModel> get actions;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRegistryModelCopyWith<_$_ServiceRegistryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionsModel _$ActionsModelFromJson(Map<String, dynamic> json) {
  return _ActionsModel.fromJson(json);
}

/// @nodoc
mixin _$ActionsModel {
  String get action => throw _privateConstructorUsedError;
  String get entityName => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionsModelCopyWith<ActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionsModelCopyWith<$Res> {
  factory $ActionsModelCopyWith(
          ActionsModel value, $Res Function(ActionsModel) then) =
      _$ActionsModelCopyWithImpl<$Res, ActionsModel>;
  @useResult
  $Res call({String action, String entityName, String path});
}

/// @nodoc
class _$ActionsModelCopyWithImpl<$Res, $Val extends ActionsModel>
    implements $ActionsModelCopyWith<$Res> {
  _$ActionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? entityName = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      entityName: null == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActionsModelCopyWith<$Res>
    implements $ActionsModelCopyWith<$Res> {
  factory _$$_ActionsModelCopyWith(
          _$_ActionsModel value, $Res Function(_$_ActionsModel) then) =
      __$$_ActionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action, String entityName, String path});
}

/// @nodoc
class __$$_ActionsModelCopyWithImpl<$Res>
    extends _$ActionsModelCopyWithImpl<$Res, _$_ActionsModel>
    implements _$$_ActionsModelCopyWith<$Res> {
  __$$_ActionsModelCopyWithImpl(
      _$_ActionsModel _value, $Res Function(_$_ActionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? entityName = null,
    Object? path = null,
  }) {
    return _then(_$_ActionsModel(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      entityName: null == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActionsModel implements _ActionsModel {
  const _$_ActionsModel(
      {required this.action, required this.entityName, required this.path});

  factory _$_ActionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ActionsModelFromJson(json);

  @override
  final String action;
  @override
  final String entityName;
  @override
  final String path;

  @override
  String toString() {
    return 'ActionsModel(action: $action, entityName: $entityName, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActionsModel &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action, entityName, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActionsModelCopyWith<_$_ActionsModel> get copyWith =>
      __$$_ActionsModelCopyWithImpl<_$_ActionsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActionsModelToJson(
      this,
    );
  }
}

abstract class _ActionsModel implements ActionsModel {
  const factory _ActionsModel(
      {required final String action,
      required final String entityName,
      required final String path}) = _$_ActionsModel;

  factory _ActionsModel.fromJson(Map<String, dynamic> json) =
      _$_ActionsModel.fromJson;

  @override
  String get action;
  @override
  String get entityName;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$_ActionsModelCopyWith<_$_ActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
