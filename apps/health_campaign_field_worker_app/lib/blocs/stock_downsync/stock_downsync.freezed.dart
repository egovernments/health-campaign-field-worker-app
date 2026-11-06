// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_downsync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockDownSyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(ProjectModel projectModel, int batchSize)
        checkTotalCount,
    required TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)
        downloadStock,
    required TResult Function() resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult? Function(ProjectModel projectModel, int batchSize)?
        checkTotalCount,
    TResult? Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult? Function()? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult Function(ProjectModel projectModel, int batchSize)? checkTotalCount,
    TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult Function()? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(StockDownSyncCheckTotalCountEvent value)
        checkTotalCount,
    required TResult Function(StockDownSyncDownloadEvent value) downloadStock,
    required TResult Function(StockDownSyncResetStateEvent value) resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult? Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult? Function(StockDownSyncResetStateEvent value)? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult Function(StockDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDownSyncEventCopyWith<$Res> {
  factory $StockDownSyncEventCopyWith(
          StockDownSyncEvent value, $Res Function(StockDownSyncEvent) then) =
      _$StockDownSyncEventCopyWithImpl<$Res, StockDownSyncEvent>;
}

/// @nodoc
class _$StockDownSyncEventCopyWithImpl<$Res, $Val extends StockDownSyncEvent>
    implements $StockDownSyncEventCopyWith<$Res> {
  _$StockDownSyncEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StockDownSyncGetBatchSizeEventImplCopyWith<$Res> {
  factory _$$StockDownSyncGetBatchSizeEventImplCopyWith(
          _$StockDownSyncGetBatchSizeEventImpl value,
          $Res Function(_$StockDownSyncGetBatchSizeEventImpl) then) =
      __$$StockDownSyncGetBatchSizeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<AppConfiguration> appConfiguration, ProjectModel projectModel});
}

/// @nodoc
class __$$StockDownSyncGetBatchSizeEventImplCopyWithImpl<$Res>
    extends _$StockDownSyncEventCopyWithImpl<$Res,
        _$StockDownSyncGetBatchSizeEventImpl>
    implements _$$StockDownSyncGetBatchSizeEventImplCopyWith<$Res> {
  __$$StockDownSyncGetBatchSizeEventImplCopyWithImpl(
      _$StockDownSyncGetBatchSizeEventImpl _value,
      $Res Function(_$StockDownSyncGetBatchSizeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiguration = null,
    Object? projectModel = null,
  }) {
    return _then(_$StockDownSyncGetBatchSizeEventImpl(
      appConfiguration: null == appConfiguration
          ? _value._appConfiguration
          : appConfiguration // ignore: cast_nullable_to_non_nullable
              as List<AppConfiguration>,
      projectModel: null == projectModel
          ? _value.projectModel
          : projectModel // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
    ));
  }
}

/// @nodoc

class _$StockDownSyncGetBatchSizeEventImpl
    with DiagnosticableTreeMixin
    implements StockDownSyncGetBatchSizeEvent {
  const _$StockDownSyncGetBatchSizeEventImpl(
      {required final List<AppConfiguration> appConfiguration,
      required this.projectModel})
      : _appConfiguration = appConfiguration;

  final List<AppConfiguration> _appConfiguration;
  @override
  List<AppConfiguration> get appConfiguration {
    if (_appConfiguration is EqualUnmodifiableListView)
      return _appConfiguration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appConfiguration);
  }

  @override
  final ProjectModel projectModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncEvent.getBatchSize(appConfiguration: $appConfiguration, projectModel: $projectModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncEvent.getBatchSize'))
      ..add(DiagnosticsProperty('appConfiguration', appConfiguration))
      ..add(DiagnosticsProperty('projectModel', projectModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncGetBatchSizeEventImpl &&
            const DeepCollectionEquality()
                .equals(other._appConfiguration, _appConfiguration) &&
            (identical(other.projectModel, projectModel) ||
                other.projectModel == projectModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_appConfiguration), projectModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncGetBatchSizeEventImplCopyWith<
          _$StockDownSyncGetBatchSizeEventImpl>
      get copyWith => __$$StockDownSyncGetBatchSizeEventImplCopyWithImpl<
          _$StockDownSyncGetBatchSizeEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(ProjectModel projectModel, int batchSize)
        checkTotalCount,
    required TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)
        downloadStock,
    required TResult Function() resetState,
  }) {
    return getBatchSize(appConfiguration, projectModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult? Function(ProjectModel projectModel, int batchSize)?
        checkTotalCount,
    TResult? Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult? Function()? resetState,
  }) {
    return getBatchSize?.call(appConfiguration, projectModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult Function(ProjectModel projectModel, int batchSize)? checkTotalCount,
    TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(appConfiguration, projectModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(StockDownSyncCheckTotalCountEvent value)
        checkTotalCount,
    required TResult Function(StockDownSyncDownloadEvent value) downloadStock,
    required TResult Function(StockDownSyncResetStateEvent value) resetState,
  }) {
    return getBatchSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult? Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult? Function(StockDownSyncResetStateEvent value)? resetState,
  }) {
    return getBatchSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult Function(StockDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(this);
    }
    return orElse();
  }
}

abstract class StockDownSyncGetBatchSizeEvent implements StockDownSyncEvent {
  const factory StockDownSyncGetBatchSizeEvent(
          {required final List<AppConfiguration> appConfiguration,
          required final ProjectModel projectModel}) =
      _$StockDownSyncGetBatchSizeEventImpl;

  List<AppConfiguration> get appConfiguration;
  ProjectModel get projectModel;
  @JsonKey(ignore: true)
  _$$StockDownSyncGetBatchSizeEventImplCopyWith<
          _$StockDownSyncGetBatchSizeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncCheckTotalCountEventImplCopyWith<$Res> {
  factory _$$StockDownSyncCheckTotalCountEventImplCopyWith(
          _$StockDownSyncCheckTotalCountEventImpl value,
          $Res Function(_$StockDownSyncCheckTotalCountEventImpl) then) =
      __$$StockDownSyncCheckTotalCountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectModel projectModel, int batchSize});
}

/// @nodoc
class __$$StockDownSyncCheckTotalCountEventImplCopyWithImpl<$Res>
    extends _$StockDownSyncEventCopyWithImpl<$Res,
        _$StockDownSyncCheckTotalCountEventImpl>
    implements _$$StockDownSyncCheckTotalCountEventImplCopyWith<$Res> {
  __$$StockDownSyncCheckTotalCountEventImplCopyWithImpl(
      _$StockDownSyncCheckTotalCountEventImpl _value,
      $Res Function(_$StockDownSyncCheckTotalCountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectModel = null,
    Object? batchSize = null,
  }) {
    return _then(_$StockDownSyncCheckTotalCountEventImpl(
      projectModel: null == projectModel
          ? _value.projectModel
          : projectModel // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StockDownSyncCheckTotalCountEventImpl
    with DiagnosticableTreeMixin
    implements StockDownSyncCheckTotalCountEvent {
  const _$StockDownSyncCheckTotalCountEventImpl(
      {required this.projectModel, required this.batchSize});

  @override
  final ProjectModel projectModel;
  @override
  final int batchSize;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncEvent.checkTotalCount(projectModel: $projectModel, batchSize: $batchSize)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncEvent.checkTotalCount'))
      ..add(DiagnosticsProperty('projectModel', projectModel))
      ..add(DiagnosticsProperty('batchSize', batchSize));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncCheckTotalCountEventImpl &&
            (identical(other.projectModel, projectModel) ||
                other.projectModel == projectModel) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectModel, batchSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncCheckTotalCountEventImplCopyWith<
          _$StockDownSyncCheckTotalCountEventImpl>
      get copyWith => __$$StockDownSyncCheckTotalCountEventImplCopyWithImpl<
          _$StockDownSyncCheckTotalCountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(ProjectModel projectModel, int batchSize)
        checkTotalCount,
    required TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)
        downloadStock,
    required TResult Function() resetState,
  }) {
    return checkTotalCount(projectModel, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult? Function(ProjectModel projectModel, int batchSize)?
        checkTotalCount,
    TResult? Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult? Function()? resetState,
  }) {
    return checkTotalCount?.call(projectModel, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult Function(ProjectModel projectModel, int batchSize)? checkTotalCount,
    TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (checkTotalCount != null) {
      return checkTotalCount(projectModel, batchSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(StockDownSyncCheckTotalCountEvent value)
        checkTotalCount,
    required TResult Function(StockDownSyncDownloadEvent value) downloadStock,
    required TResult Function(StockDownSyncResetStateEvent value) resetState,
  }) {
    return checkTotalCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult? Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult? Function(StockDownSyncResetStateEvent value)? resetState,
  }) {
    return checkTotalCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult Function(StockDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (checkTotalCount != null) {
      return checkTotalCount(this);
    }
    return orElse();
  }
}

abstract class StockDownSyncCheckTotalCountEvent implements StockDownSyncEvent {
  const factory StockDownSyncCheckTotalCountEvent(
      {required final ProjectModel projectModel,
      required final int batchSize}) = _$StockDownSyncCheckTotalCountEventImpl;

  ProjectModel get projectModel;
  int get batchSize;
  @JsonKey(ignore: true)
  _$$StockDownSyncCheckTotalCountEventImplCopyWith<
          _$StockDownSyncCheckTotalCountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncDownloadEventImplCopyWith<$Res> {
  factory _$$StockDownSyncDownloadEventImplCopyWith(
          _$StockDownSyncDownloadEventImpl value,
          $Res Function(_$StockDownSyncDownloadEventImpl) then) =
      __$$StockDownSyncDownloadEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectModel projectModel, int batchSize, int initialServerCount});
}

/// @nodoc
class __$$StockDownSyncDownloadEventImplCopyWithImpl<$Res>
    extends _$StockDownSyncEventCopyWithImpl<$Res,
        _$StockDownSyncDownloadEventImpl>
    implements _$$StockDownSyncDownloadEventImplCopyWith<$Res> {
  __$$StockDownSyncDownloadEventImplCopyWithImpl(
      _$StockDownSyncDownloadEventImpl _value,
      $Res Function(_$StockDownSyncDownloadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectModel = null,
    Object? batchSize = null,
    Object? initialServerCount = null,
  }) {
    return _then(_$StockDownSyncDownloadEventImpl(
      projectModel: null == projectModel
          ? _value.projectModel
          : projectModel // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      initialServerCount: null == initialServerCount
          ? _value.initialServerCount
          : initialServerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StockDownSyncDownloadEventImpl
    with DiagnosticableTreeMixin
    implements StockDownSyncDownloadEvent {
  const _$StockDownSyncDownloadEventImpl(
      {required this.projectModel,
      required this.batchSize,
      required this.initialServerCount});

  @override
  final ProjectModel projectModel;
  @override
  final int batchSize;
  @override
  final int initialServerCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncEvent.downloadStock(projectModel: $projectModel, batchSize: $batchSize, initialServerCount: $initialServerCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncEvent.downloadStock'))
      ..add(DiagnosticsProperty('projectModel', projectModel))
      ..add(DiagnosticsProperty('batchSize', batchSize))
      ..add(DiagnosticsProperty('initialServerCount', initialServerCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncDownloadEventImpl &&
            (identical(other.projectModel, projectModel) ||
                other.projectModel == projectModel) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, projectModel, batchSize, initialServerCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncDownloadEventImplCopyWith<_$StockDownSyncDownloadEventImpl>
      get copyWith => __$$StockDownSyncDownloadEventImplCopyWithImpl<
          _$StockDownSyncDownloadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(ProjectModel projectModel, int batchSize)
        checkTotalCount,
    required TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)
        downloadStock,
    required TResult Function() resetState,
  }) {
    return downloadStock(projectModel, batchSize, initialServerCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult? Function(ProjectModel projectModel, int batchSize)?
        checkTotalCount,
    TResult? Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult? Function()? resetState,
  }) {
    return downloadStock?.call(projectModel, batchSize, initialServerCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult Function(ProjectModel projectModel, int batchSize)? checkTotalCount,
    TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (downloadStock != null) {
      return downloadStock(projectModel, batchSize, initialServerCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(StockDownSyncCheckTotalCountEvent value)
        checkTotalCount,
    required TResult Function(StockDownSyncDownloadEvent value) downloadStock,
    required TResult Function(StockDownSyncResetStateEvent value) resetState,
  }) {
    return downloadStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult? Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult? Function(StockDownSyncResetStateEvent value)? resetState,
  }) {
    return downloadStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult Function(StockDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (downloadStock != null) {
      return downloadStock(this);
    }
    return orElse();
  }
}

abstract class StockDownSyncDownloadEvent implements StockDownSyncEvent {
  const factory StockDownSyncDownloadEvent(
          {required final ProjectModel projectModel,
          required final int batchSize,
          required final int initialServerCount}) =
      _$StockDownSyncDownloadEventImpl;

  ProjectModel get projectModel;
  int get batchSize;
  int get initialServerCount;
  @JsonKey(ignore: true)
  _$$StockDownSyncDownloadEventImplCopyWith<_$StockDownSyncDownloadEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncResetStateEventImplCopyWith<$Res> {
  factory _$$StockDownSyncResetStateEventImplCopyWith(
          _$StockDownSyncResetStateEventImpl value,
          $Res Function(_$StockDownSyncResetStateEventImpl) then) =
      __$$StockDownSyncResetStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StockDownSyncResetStateEventImplCopyWithImpl<$Res>
    extends _$StockDownSyncEventCopyWithImpl<$Res,
        _$StockDownSyncResetStateEventImpl>
    implements _$$StockDownSyncResetStateEventImplCopyWith<$Res> {
  __$$StockDownSyncResetStateEventImplCopyWithImpl(
      _$StockDownSyncResetStateEventImpl _value,
      $Res Function(_$StockDownSyncResetStateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StockDownSyncResetStateEventImpl
    with DiagnosticableTreeMixin
    implements StockDownSyncResetStateEvent {
  const _$StockDownSyncResetStateEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncEvent.resetState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'StockDownSyncEvent.resetState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncResetStateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(ProjectModel projectModel, int batchSize)
        checkTotalCount,
    required TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)
        downloadStock,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult? Function(ProjectModel projectModel, int batchSize)?
        checkTotalCount,
    TResult? Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AppConfiguration> appConfiguration, ProjectModel projectModel)?
        getBatchSize,
    TResult Function(ProjectModel projectModel, int batchSize)? checkTotalCount,
    TResult Function(
            ProjectModel projectModel, int batchSize, int initialServerCount)?
        downloadStock,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(StockDownSyncCheckTotalCountEvent value)
        checkTotalCount,
    required TResult Function(StockDownSyncDownloadEvent value) downloadStock,
    required TResult Function(StockDownSyncResetStateEvent value) resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult? Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult? Function(StockDownSyncResetStateEvent value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(StockDownSyncCheckTotalCountEvent value)? checkTotalCount,
    TResult Function(StockDownSyncDownloadEvent value)? downloadStock,
    TResult Function(StockDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class StockDownSyncResetStateEvent implements StockDownSyncEvent {
  const factory StockDownSyncResetStateEvent() =
      _$StockDownSyncResetStateEventImpl;
}

/// @nodoc
mixin _$StockDownSyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDownSyncStateCopyWith<$Res> {
  factory $StockDownSyncStateCopyWith(
          StockDownSyncState value, $Res Function(StockDownSyncState) then) =
      _$StockDownSyncStateCopyWithImpl<$Res, StockDownSyncState>;
}

/// @nodoc
class _$StockDownSyncStateCopyWithImpl<$Res, $Val extends StockDownSyncState>
    implements $StockDownSyncStateCopyWith<$Res> {
  _$StockDownSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StockDownSyncLoadingStateImplCopyWith<$Res> {
  factory _$$StockDownSyncLoadingStateImplCopyWith(
          _$StockDownSyncLoadingStateImpl value,
          $Res Function(_$StockDownSyncLoadingStateImpl) then) =
      __$$StockDownSyncLoadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPop});
}

/// @nodoc
class __$$StockDownSyncLoadingStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncLoadingStateImpl>
    implements _$$StockDownSyncLoadingStateImplCopyWith<$Res> {
  __$$StockDownSyncLoadingStateImplCopyWithImpl(
      _$StockDownSyncLoadingStateImpl _value,
      $Res Function(_$StockDownSyncLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPop = null,
  }) {
    return _then(_$StockDownSyncLoadingStateImpl(
      null == isPop
          ? _value.isPop
          : isPop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StockDownSyncLoadingStateImpl extends _StockDownSyncLoadingState
    with DiagnosticableTreeMixin {
  const _$StockDownSyncLoadingStateImpl(this.isPop) : super._();

  @override
  final bool isPop;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.loading(isPop: $isPop)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncState.loading'))
      ..add(DiagnosticsProperty('isPop', isPop));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncLoadingStateImpl &&
            (identical(other.isPop, isPop) || other.isPop == isPop));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncLoadingStateImplCopyWith<_$StockDownSyncLoadingStateImpl>
      get copyWith => __$$StockDownSyncLoadingStateImplCopyWithImpl<
          _$StockDownSyncLoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return loading(isPop);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return loading?.call(isPop);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isPop);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncLoadingState extends StockDownSyncState {
  const factory _StockDownSyncLoadingState(final bool isPop) =
      _$StockDownSyncLoadingStateImpl;
  const _StockDownSyncLoadingState._() : super._();

  bool get isPop;
  @JsonKey(ignore: true)
  _$$StockDownSyncLoadingStateImplCopyWith<_$StockDownSyncLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncGetBatchSizeStateImplCopyWith<$Res> {
  factory _$$StockDownSyncGetBatchSizeStateImplCopyWith(
          _$StockDownSyncGetBatchSizeStateImpl value,
          $Res Function(_$StockDownSyncGetBatchSizeStateImpl) then) =
      __$$StockDownSyncGetBatchSizeStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int batchSize, ProjectModel projectModel});
}

/// @nodoc
class __$$StockDownSyncGetBatchSizeStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncGetBatchSizeStateImpl>
    implements _$$StockDownSyncGetBatchSizeStateImplCopyWith<$Res> {
  __$$StockDownSyncGetBatchSizeStateImplCopyWithImpl(
      _$StockDownSyncGetBatchSizeStateImpl _value,
      $Res Function(_$StockDownSyncGetBatchSizeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchSize = null,
    Object? projectModel = null,
  }) {
    return _then(_$StockDownSyncGetBatchSizeStateImpl(
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == projectModel
          ? _value.projectModel
          : projectModel // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
    ));
  }
}

/// @nodoc

class _$StockDownSyncGetBatchSizeStateImpl
    extends _StockDownSyncGetBatchSizeState with DiagnosticableTreeMixin {
  const _$StockDownSyncGetBatchSizeStateImpl(this.batchSize, this.projectModel)
      : super._();

  @override
  final int batchSize;
  @override
  final ProjectModel projectModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.getBatchSize(batchSize: $batchSize, projectModel: $projectModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncState.getBatchSize'))
      ..add(DiagnosticsProperty('batchSize', batchSize))
      ..add(DiagnosticsProperty('projectModel', projectModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncGetBatchSizeStateImpl &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.projectModel, projectModel) ||
                other.projectModel == projectModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, batchSize, projectModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncGetBatchSizeStateImplCopyWith<
          _$StockDownSyncGetBatchSizeStateImpl>
      get copyWith => __$$StockDownSyncGetBatchSizeStateImplCopyWithImpl<
          _$StockDownSyncGetBatchSizeStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return getBatchSize(batchSize, projectModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return getBatchSize?.call(batchSize, projectModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(batchSize, projectModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return getBatchSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return getBatchSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncGetBatchSizeState extends StockDownSyncState {
  const factory _StockDownSyncGetBatchSizeState(
          final int batchSize, final ProjectModel projectModel) =
      _$StockDownSyncGetBatchSizeStateImpl;
  const _StockDownSyncGetBatchSizeState._() : super._();

  int get batchSize;
  ProjectModel get projectModel;
  @JsonKey(ignore: true)
  _$$StockDownSyncGetBatchSizeStateImplCopyWith<
          _$StockDownSyncGetBatchSizeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncDataFoundStateImplCopyWith<$Res> {
  factory _$$StockDownSyncDataFoundStateImplCopyWith(
          _$StockDownSyncDataFoundStateImpl value,
          $Res Function(_$StockDownSyncDataFoundStateImpl) then) =
      __$$StockDownSyncDataFoundStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int initialServerCount, int batchSize, int offset, int? lastSyncedTime});
}

/// @nodoc
class __$$StockDownSyncDataFoundStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncDataFoundStateImpl>
    implements _$$StockDownSyncDataFoundStateImplCopyWith<$Res> {
  __$$StockDownSyncDataFoundStateImplCopyWithImpl(
      _$StockDownSyncDataFoundStateImpl _value,
      $Res Function(_$StockDownSyncDataFoundStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialServerCount = null,
    Object? batchSize = null,
    Object? offset = null,
    Object? lastSyncedTime = freezed,
  }) {
    return _then(_$StockDownSyncDataFoundStateImpl(
      null == initialServerCount
          ? _value.initialServerCount
          : initialServerCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == lastSyncedTime
          ? _value.lastSyncedTime
          : lastSyncedTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$StockDownSyncDataFoundStateImpl extends _StockDownSyncDataFoundState
    with DiagnosticableTreeMixin {
  const _$StockDownSyncDataFoundStateImpl(
      this.initialServerCount, this.batchSize, this.offset, this.lastSyncedTime)
      : super._();

  @override
  final int initialServerCount;
  @override
  final int batchSize;
  @override
  final int offset;
  @override
  final int? lastSyncedTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.dataFound(initialServerCount: $initialServerCount, batchSize: $batchSize, offset: $offset, lastSyncedTime: $lastSyncedTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncState.dataFound'))
      ..add(DiagnosticsProperty('initialServerCount', initialServerCount))
      ..add(DiagnosticsProperty('batchSize', batchSize))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('lastSyncedTime', lastSyncedTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncDataFoundStateImpl &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.lastSyncedTime, lastSyncedTime) ||
                other.lastSyncedTime == lastSyncedTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, initialServerCount, batchSize, offset, lastSyncedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncDataFoundStateImplCopyWith<_$StockDownSyncDataFoundStateImpl>
      get copyWith => __$$StockDownSyncDataFoundStateImplCopyWithImpl<
          _$StockDownSyncDataFoundStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return dataFound(initialServerCount, batchSize, offset, lastSyncedTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return dataFound?.call(
        initialServerCount, batchSize, offset, lastSyncedTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(initialServerCount, batchSize, offset, lastSyncedTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return dataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return dataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncDataFoundState extends StockDownSyncState {
  const factory _StockDownSyncDataFoundState(
      final int initialServerCount,
      final int batchSize,
      final int offset,
      final int? lastSyncedTime) = _$StockDownSyncDataFoundStateImpl;
  const _StockDownSyncDataFoundState._() : super._();

  int get initialServerCount;
  int get batchSize;
  int get offset;
  int? get lastSyncedTime;
  @JsonKey(ignore: true)
  _$$StockDownSyncDataFoundStateImplCopyWith<_$StockDownSyncDataFoundStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncInProgressStateImplCopyWith<$Res> {
  factory _$$StockDownSyncInProgressStateImplCopyWith(
          _$StockDownSyncInProgressStateImpl value,
          $Res Function(_$StockDownSyncInProgressStateImpl) then) =
      __$$StockDownSyncInProgressStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int syncedCount, int totalCount});
}

/// @nodoc
class __$$StockDownSyncInProgressStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncInProgressStateImpl>
    implements _$$StockDownSyncInProgressStateImplCopyWith<$Res> {
  __$$StockDownSyncInProgressStateImplCopyWithImpl(
      _$StockDownSyncInProgressStateImpl _value,
      $Res Function(_$StockDownSyncInProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$StockDownSyncInProgressStateImpl(
      null == syncedCount
          ? _value.syncedCount
          : syncedCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StockDownSyncInProgressStateImpl extends _StockDownSyncInProgressState
    with DiagnosticableTreeMixin {
  const _$StockDownSyncInProgressStateImpl(this.syncedCount, this.totalCount)
      : super._();

  @override
  final int syncedCount;
  @override
  final int totalCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.inProgress(syncedCount: $syncedCount, totalCount: $totalCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncState.inProgress'))
      ..add(DiagnosticsProperty('syncedCount', syncedCount))
      ..add(DiagnosticsProperty('totalCount', totalCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncInProgressStateImpl &&
            (identical(other.syncedCount, syncedCount) ||
                other.syncedCount == syncedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncedCount, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncInProgressStateImplCopyWith<
          _$StockDownSyncInProgressStateImpl>
      get copyWith => __$$StockDownSyncInProgressStateImplCopyWithImpl<
          _$StockDownSyncInProgressStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return inProgress(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return inProgress?.call(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(syncedCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncInProgressState extends StockDownSyncState {
  const factory _StockDownSyncInProgressState(
          final int syncedCount, final int totalCount) =
      _$StockDownSyncInProgressStateImpl;
  const _StockDownSyncInProgressState._() : super._();

  int get syncedCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$StockDownSyncInProgressStateImplCopyWith<
          _$StockDownSyncInProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncSuccessStateImplCopyWith<$Res> {
  factory _$$StockDownSyncSuccessStateImplCopyWith(
          _$StockDownSyncSuccessStateImpl value,
          $Res Function(_$StockDownSyncSuccessStateImpl) then) =
      __$$StockDownSyncSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int syncedCount, int totalCount});
}

/// @nodoc
class __$$StockDownSyncSuccessStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncSuccessStateImpl>
    implements _$$StockDownSyncSuccessStateImplCopyWith<$Res> {
  __$$StockDownSyncSuccessStateImplCopyWithImpl(
      _$StockDownSyncSuccessStateImpl _value,
      $Res Function(_$StockDownSyncSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$StockDownSyncSuccessStateImpl(
      null == syncedCount
          ? _value.syncedCount
          : syncedCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StockDownSyncSuccessStateImpl extends _StockDownSyncSuccessState
    with DiagnosticableTreeMixin {
  const _$StockDownSyncSuccessStateImpl(this.syncedCount, this.totalCount)
      : super._();

  @override
  final int syncedCount;
  @override
  final int totalCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.success(syncedCount: $syncedCount, totalCount: $totalCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDownSyncState.success'))
      ..add(DiagnosticsProperty('syncedCount', syncedCount))
      ..add(DiagnosticsProperty('totalCount', totalCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncSuccessStateImpl &&
            (identical(other.syncedCount, syncedCount) ||
                other.syncedCount == syncedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncedCount, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDownSyncSuccessStateImplCopyWith<_$StockDownSyncSuccessStateImpl>
      get copyWith => __$$StockDownSyncSuccessStateImplCopyWithImpl<
          _$StockDownSyncSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return success(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return success?.call(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(syncedCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncSuccessState extends StockDownSyncState {
  const factory _StockDownSyncSuccessState(
          final int syncedCount, final int totalCount) =
      _$StockDownSyncSuccessStateImpl;
  const _StockDownSyncSuccessState._() : super._();

  int get syncedCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$StockDownSyncSuccessStateImplCopyWith<_$StockDownSyncSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockDownSyncFailureStateImplCopyWith<$Res> {
  factory _$$StockDownSyncFailureStateImplCopyWith(
          _$StockDownSyncFailureStateImpl value,
          $Res Function(_$StockDownSyncFailureStateImpl) then) =
      __$$StockDownSyncFailureStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StockDownSyncFailureStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncFailureStateImpl>
    implements _$$StockDownSyncFailureStateImplCopyWith<$Res> {
  __$$StockDownSyncFailureStateImplCopyWithImpl(
      _$StockDownSyncFailureStateImpl _value,
      $Res Function(_$StockDownSyncFailureStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StockDownSyncFailureStateImpl extends _StockDownSyncFailureState
    with DiagnosticableTreeMixin {
  const _$StockDownSyncFailureStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.failed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StockDownSyncState.failed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncFailureStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncFailureState extends StockDownSyncState {
  const factory _StockDownSyncFailureState() = _$StockDownSyncFailureStateImpl;
  const _StockDownSyncFailureState._() : super._();
}

/// @nodoc
abstract class _$$StockDownSyncInsufficientStorageStateImplCopyWith<$Res> {
  factory _$$StockDownSyncInsufficientStorageStateImplCopyWith(
          _$StockDownSyncInsufficientStorageStateImpl value,
          $Res Function(_$StockDownSyncInsufficientStorageStateImpl) then) =
      __$$StockDownSyncInsufficientStorageStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StockDownSyncInsufficientStorageStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncInsufficientStorageStateImpl>
    implements _$$StockDownSyncInsufficientStorageStateImplCopyWith<$Res> {
  __$$StockDownSyncInsufficientStorageStateImplCopyWithImpl(
      _$StockDownSyncInsufficientStorageStateImpl _value,
      $Res Function(_$StockDownSyncInsufficientStorageStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StockDownSyncInsufficientStorageStateImpl
    extends _StockDownSyncInsufficientStorageState
    with DiagnosticableTreeMixin {
  const _$StockDownSyncInsufficientStorageStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.insufficientStorage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'StockDownSyncState.insufficientStorage'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncInsufficientStorageStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return insufficientStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return insufficientStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (insufficientStorage != null) {
      return insufficientStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return insufficientStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return insufficientStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (insufficientStorage != null) {
      return insufficientStorage(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncInsufficientStorageState
    extends StockDownSyncState {
  const factory _StockDownSyncInsufficientStorageState() =
      _$StockDownSyncInsufficientStorageStateImpl;
  const _StockDownSyncInsufficientStorageState._() : super._();
}

/// @nodoc
abstract class _$$StockDownSyncCountCheckFailedStateImplCopyWith<$Res> {
  factory _$$StockDownSyncCountCheckFailedStateImplCopyWith(
          _$StockDownSyncCountCheckFailedStateImpl value,
          $Res Function(_$StockDownSyncCountCheckFailedStateImpl) then) =
      __$$StockDownSyncCountCheckFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StockDownSyncCountCheckFailedStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncCountCheckFailedStateImpl>
    implements _$$StockDownSyncCountCheckFailedStateImplCopyWith<$Res> {
  __$$StockDownSyncCountCheckFailedStateImplCopyWithImpl(
      _$StockDownSyncCountCheckFailedStateImpl _value,
      $Res Function(_$StockDownSyncCountCheckFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StockDownSyncCountCheckFailedStateImpl
    extends _StockDownSyncCountCheckFailedState with DiagnosticableTreeMixin {
  const _$StockDownSyncCountCheckFailedStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.totalCountCheckFailed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'StockDownSyncState.totalCountCheckFailed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncCountCheckFailedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return totalCountCheckFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return totalCountCheckFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (totalCountCheckFailed != null) {
      return totalCountCheckFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return totalCountCheckFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return totalCountCheckFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (totalCountCheckFailed != null) {
      return totalCountCheckFailed(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncCountCheckFailedState extends StockDownSyncState {
  const factory _StockDownSyncCountCheckFailedState() =
      _$StockDownSyncCountCheckFailedStateImpl;
  const _StockDownSyncCountCheckFailedState._() : super._();
}

/// @nodoc
abstract class _$$StockDownSyncResetStateImplCopyWith<$Res> {
  factory _$$StockDownSyncResetStateImplCopyWith(
          _$StockDownSyncResetStateImpl value,
          $Res Function(_$StockDownSyncResetStateImpl) then) =
      __$$StockDownSyncResetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StockDownSyncResetStateImplCopyWithImpl<$Res>
    extends _$StockDownSyncStateCopyWithImpl<$Res,
        _$StockDownSyncResetStateImpl>
    implements _$$StockDownSyncResetStateImplCopyWith<$Res> {
  __$$StockDownSyncResetStateImplCopyWithImpl(
      _$StockDownSyncResetStateImpl _value,
      $Res Function(_$StockDownSyncResetStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StockDownSyncResetStateImpl extends _StockDownSyncResetState
    with DiagnosticableTreeMixin {
  const _$StockDownSyncResetStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDownSyncState.resetState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'StockDownSyncState.resetState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDownSyncResetStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isPop) loading,
    required TResult Function(int batchSize, ProjectModel projectModel)
        getBatchSize,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() failed,
    required TResult Function() insufficientStorage,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isPop)? loading,
    TResult? Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? failed,
    TResult? Function()? insufficientStorage,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isPop)? loading,
    TResult Function(int batchSize, ProjectModel projectModel)? getBatchSize,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? failed,
    TResult Function()? insufficientStorage,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StockDownSyncLoadingState value) loading,
    required TResult Function(_StockDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_StockDownSyncDataFoundState value) dataFound,
    required TResult Function(_StockDownSyncInProgressState value) inProgress,
    required TResult Function(_StockDownSyncSuccessState value) success,
    required TResult Function(_StockDownSyncFailureState value) failed,
    required TResult Function(_StockDownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_StockDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_StockDownSyncResetState value) resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StockDownSyncLoadingState value)? loading,
    TResult? Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult? Function(_StockDownSyncInProgressState value)? inProgress,
    TResult? Function(_StockDownSyncSuccessState value)? success,
    TResult? Function(_StockDownSyncFailureState value)? failed,
    TResult? Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_StockDownSyncResetState value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StockDownSyncLoadingState value)? loading,
    TResult Function(_StockDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_StockDownSyncDataFoundState value)? dataFound,
    TResult Function(_StockDownSyncInProgressState value)? inProgress,
    TResult Function(_StockDownSyncSuccessState value)? success,
    TResult Function(_StockDownSyncFailureState value)? failed,
    TResult Function(_StockDownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_StockDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_StockDownSyncResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _StockDownSyncResetState extends StockDownSyncState {
  const factory _StockDownSyncResetState() = _$StockDownSyncResetStateImpl;
  const _StockDownSyncResetState._() : super._();
}
