// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardEvent {
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? selectedDate, bool? isNetworkError)
        handleSearch,
    required TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)
        handleRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult? Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardSearchEvent value) handleSearch,
    required TResult Function(DashboardRefreshEvent value) handleRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardSearchEvent value)? handleSearch,
    TResult? Function(DashboardRefreshEvent value)? handleRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardSearchEvent value)? handleSearch,
    TResult Function(DashboardRefreshEvent value)? handleRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardEventCopyWith<DashboardEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
  @useResult
  $Res call({DateTime selectedDate});
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
  }) {
    return _then(_value.copyWith(
      selectedDate: null == selectedDate
          ? _value.selectedDate!
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardSearchEventImplCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$$DashboardSearchEventImplCopyWith(_$DashboardSearchEventImpl value,
          $Res Function(_$DashboardSearchEventImpl) then) =
      __$$DashboardSearchEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? selectedDate, bool? isNetworkError});
}

/// @nodoc
class __$$DashboardSearchEventImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$DashboardSearchEventImpl>
    implements _$$DashboardSearchEventImplCopyWith<$Res> {
  __$$DashboardSearchEventImplCopyWithImpl(_$DashboardSearchEventImpl _value,
      $Res Function(_$DashboardSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? isNetworkError = freezed,
  }) {
    return _then(_$DashboardSearchEventImpl(
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNetworkError: freezed == isNetworkError
          ? _value.isNetworkError
          : isNetworkError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$DashboardSearchEventImpl implements DashboardSearchEvent {
  const _$DashboardSearchEventImpl(
      {this.selectedDate, this.isNetworkError = false});

  @override
  final DateTime? selectedDate;
  @override
  @JsonKey()
  final bool? isNetworkError;

  @override
  String toString() {
    return 'DashboardEvent.handleSearch(selectedDate: $selectedDate, isNetworkError: $isNetworkError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardSearchEventImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.isNetworkError, isNetworkError) ||
                other.isNetworkError == isNetworkError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate, isNetworkError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardSearchEventImplCopyWith<_$DashboardSearchEventImpl>
      get copyWith =>
          __$$DashboardSearchEventImplCopyWithImpl<_$DashboardSearchEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? selectedDate, bool? isNetworkError)
        handleSearch,
    required TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)
        handleRefresh,
  }) {
    return handleSearch(selectedDate, isNetworkError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult? Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
  }) {
    return handleSearch?.call(selectedDate, isNetworkError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(selectedDate, isNetworkError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardSearchEvent value) handleSearch,
    required TResult Function(DashboardRefreshEvent value) handleRefresh,
  }) {
    return handleSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardSearchEvent value)? handleSearch,
    TResult? Function(DashboardRefreshEvent value)? handleRefresh,
  }) {
    return handleSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardSearchEvent value)? handleSearch,
    TResult Function(DashboardRefreshEvent value)? handleRefresh,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(this);
    }
    return orElse();
  }
}

abstract class DashboardSearchEvent implements DashboardEvent {
  const factory DashboardSearchEvent(
      {final DateTime? selectedDate,
      final bool? isNetworkError}) = _$DashboardSearchEventImpl;

  @override
  DateTime? get selectedDate;
  bool? get isNetworkError;
  @override
  @JsonKey(ignore: true)
  _$$DashboardSearchEventImplCopyWith<_$DashboardSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DashboardRefreshEventImplCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$$DashboardRefreshEventImplCopyWith(
          _$DashboardRefreshEventImpl value,
          $Res Function(_$DashboardRefreshEventImpl) then) =
      __$$DashboardRefreshEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime selectedDate, String projectId, bool syncFromServer});
}

/// @nodoc
class __$$DashboardRefreshEventImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$DashboardRefreshEventImpl>
    implements _$$DashboardRefreshEventImplCopyWith<$Res> {
  __$$DashboardRefreshEventImplCopyWithImpl(_$DashboardRefreshEventImpl _value,
      $Res Function(_$DashboardRefreshEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? projectId = null,
    Object? syncFromServer = null,
  }) {
    return _then(_$DashboardRefreshEventImpl(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      syncFromServer: null == syncFromServer
          ? _value.syncFromServer
          : syncFromServer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DashboardRefreshEventImpl implements DashboardRefreshEvent {
  const _$DashboardRefreshEventImpl(
      {required this.selectedDate,
      required this.projectId,
      this.syncFromServer = false});

  @override
  final DateTime selectedDate;
  @override
  final String projectId;
  @override
  @JsonKey()
  final bool syncFromServer;

  @override
  String toString() {
    return 'DashboardEvent.handleRefresh(selectedDate: $selectedDate, projectId: $projectId, syncFromServer: $syncFromServer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardRefreshEventImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.syncFromServer, syncFromServer) ||
                other.syncFromServer == syncFromServer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedDate, projectId, syncFromServer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardRefreshEventImplCopyWith<_$DashboardRefreshEventImpl>
      get copyWith => __$$DashboardRefreshEventImplCopyWithImpl<
          _$DashboardRefreshEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? selectedDate, bool? isNetworkError)
        handleSearch,
    required TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)
        handleRefresh,
  }) {
    return handleRefresh(selectedDate, projectId, syncFromServer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult? Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
  }) {
    return handleRefresh?.call(selectedDate, projectId, syncFromServer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
    required TResult orElse(),
  }) {
    if (handleRefresh != null) {
      return handleRefresh(selectedDate, projectId, syncFromServer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardSearchEvent value) handleSearch,
    required TResult Function(DashboardRefreshEvent value) handleRefresh,
  }) {
    return handleRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardSearchEvent value)? handleSearch,
    TResult? Function(DashboardRefreshEvent value)? handleRefresh,
  }) {
    return handleRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardSearchEvent value)? handleSearch,
    TResult Function(DashboardRefreshEvent value)? handleRefresh,
    required TResult orElse(),
  }) {
    if (handleRefresh != null) {
      return handleRefresh(this);
    }
    return orElse();
  }
}

abstract class DashboardRefreshEvent implements DashboardEvent {
  const factory DashboardRefreshEvent(
      {required final DateTime selectedDate,
      required final String projectId,
      final bool syncFromServer}) = _$DashboardRefreshEventImpl;

  @override
  DateTime get selectedDate;
  String get projectId;
  bool get syncFromServer;
  @override
  @JsonKey(ignore: true)
  _$$DashboardRefreshEventImplCopyWith<_$DashboardRefreshEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)
        fetched,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initialState,
    TResult? Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardInitialState value) initialState,
    required TResult Function(DashboardFetchedState value) fetched,
    required TResult Function(DashboardErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardInitialState value)? initialState,
    TResult? Function(DashboardFetchedState value)? fetched,
    TResult? Function(DashboardErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardInitialState value)? initialState,
    TResult Function(DashboardFetchedState value)? fetched,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DashboardLoadingStateImplCopyWith<$Res> {
  factory _$$DashboardLoadingStateImplCopyWith(
          _$DashboardLoadingStateImpl value,
          $Res Function(_$DashboardLoadingStateImpl) then) =
      __$$DashboardLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardLoadingStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardLoadingStateImpl>
    implements _$$DashboardLoadingStateImplCopyWith<$Res> {
  __$$DashboardLoadingStateImplCopyWithImpl(_$DashboardLoadingStateImpl _value,
      $Res Function(_$DashboardLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardLoadingStateImpl implements DashboardLoadingState {
  const _$DashboardLoadingStateImpl();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)
        fetched,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initialState,
    TResult? Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardInitialState value) initialState,
    required TResult Function(DashboardFetchedState value) fetched,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardInitialState value)? initialState,
    TResult? Function(DashboardFetchedState value)? fetched,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardInitialState value)? initialState,
    TResult Function(DashboardFetchedState value)? fetched,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DashboardLoadingState implements DashboardState {
  const factory DashboardLoadingState() = _$DashboardLoadingStateImpl;
}

/// @nodoc
abstract class _$$DashboardInitialStateImplCopyWith<$Res> {
  factory _$$DashboardInitialStateImplCopyWith(
          _$DashboardInitialStateImpl value,
          $Res Function(_$DashboardInitialStateImpl) then) =
      __$$DashboardInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardInitialStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardInitialStateImpl>
    implements _$$DashboardInitialStateImplCopyWith<$Res> {
  __$$DashboardInitialStateImplCopyWithImpl(_$DashboardInitialStateImpl _value,
      $Res Function(_$DashboardInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardInitialStateImpl implements DashboardInitialState {
  const _$DashboardInitialStateImpl();

  @override
  String toString() {
    return 'DashboardState.initialState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)
        fetched,
    required TResult Function() error,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initialState,
    TResult? Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult? Function()? error,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardInitialState value) initialState,
    required TResult Function(DashboardFetchedState value) fetched,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardInitialState value)? initialState,
    TResult? Function(DashboardFetchedState value)? fetched,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardInitialState value)? initialState,
    TResult Function(DashboardFetchedState value)? fetched,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class DashboardInitialState implements DashboardState {
  const factory DashboardInitialState() = _$DashboardInitialStateImpl;
}

/// @nodoc
abstract class _$$DashboardFetchedStateImplCopyWith<$Res> {
  factory _$$DashboardFetchedStateImplCopyWith(
          _$DashboardFetchedStateImpl value,
          $Res Function(_$DashboardFetchedStateImpl) then) =
      __$$DashboardFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Map<String, MetricWrapper>? metricData,
      List<TableWrapper>? tableData,
      DateTime? selectedDate,
      bool? isNetworkError});
}

/// @nodoc
class __$$DashboardFetchedStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardFetchedStateImpl>
    implements _$$DashboardFetchedStateImplCopyWith<$Res> {
  __$$DashboardFetchedStateImplCopyWithImpl(_$DashboardFetchedStateImpl _value,
      $Res Function(_$DashboardFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricData = freezed,
    Object? tableData = freezed,
    Object? selectedDate = freezed,
    Object? isNetworkError = freezed,
  }) {
    return _then(_$DashboardFetchedStateImpl(
      metricData: freezed == metricData
          ? _value._metricData
          : metricData // ignore: cast_nullable_to_non_nullable
              as Map<String, MetricWrapper>?,
      tableData: freezed == tableData
          ? _value._tableData
          : tableData // ignore: cast_nullable_to_non_nullable
              as List<TableWrapper>?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNetworkError: freezed == isNetworkError
          ? _value.isNetworkError
          : isNetworkError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$DashboardFetchedStateImpl implements DashboardFetchedState {
  const _$DashboardFetchedStateImpl(
      {final Map<String, MetricWrapper>? metricData,
      final List<TableWrapper>? tableData,
      this.selectedDate,
      this.isNetworkError = false})
      : _metricData = metricData,
        _tableData = tableData;

  final Map<String, MetricWrapper>? _metricData;
  @override
  Map<String, MetricWrapper>? get metricData {
    final value = _metricData;
    if (value == null) return null;
    if (_metricData is EqualUnmodifiableMapView) return _metricData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<TableWrapper>? _tableData;
  @override
  List<TableWrapper>? get tableData {
    final value = _tableData;
    if (value == null) return null;
    if (_tableData is EqualUnmodifiableListView) return _tableData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? selectedDate;
  @override
  @JsonKey()
  final bool? isNetworkError;

  @override
  String toString() {
    return 'DashboardState.fetched(metricData: $metricData, tableData: $tableData, selectedDate: $selectedDate, isNetworkError: $isNetworkError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._metricData, _metricData) &&
            const DeepCollectionEquality()
                .equals(other._tableData, _tableData) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.isNetworkError, isNetworkError) ||
                other.isNetworkError == isNetworkError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_metricData),
      const DeepCollectionEquality().hash(_tableData),
      selectedDate,
      isNetworkError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardFetchedStateImplCopyWith<_$DashboardFetchedStateImpl>
      get copyWith => __$$DashboardFetchedStateImplCopyWithImpl<
          _$DashboardFetchedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)
        fetched,
    required TResult Function() error,
  }) {
    return fetched(metricData, tableData, selectedDate, isNetworkError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initialState,
    TResult? Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult? Function()? error,
  }) {
    return fetched?.call(metricData, tableData, selectedDate, isNetworkError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(metricData, tableData, selectedDate, isNetworkError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardInitialState value) initialState,
    required TResult Function(DashboardFetchedState value) fetched,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardInitialState value)? initialState,
    TResult? Function(DashboardFetchedState value)? fetched,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardInitialState value)? initialState,
    TResult Function(DashboardFetchedState value)? fetched,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class DashboardFetchedState implements DashboardState {
  const factory DashboardFetchedState(
      {final Map<String, MetricWrapper>? metricData,
      final List<TableWrapper>? tableData,
      final DateTime? selectedDate,
      final bool? isNetworkError}) = _$DashboardFetchedStateImpl;

  Map<String, MetricWrapper>? get metricData;
  List<TableWrapper>? get tableData;
  DateTime? get selectedDate;
  bool? get isNetworkError;
  @JsonKey(ignore: true)
  _$$DashboardFetchedStateImplCopyWith<_$DashboardFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DashboardErrorStateImplCopyWith<$Res> {
  factory _$$DashboardErrorStateImplCopyWith(_$DashboardErrorStateImpl value,
          $Res Function(_$DashboardErrorStateImpl) then) =
      __$$DashboardErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardErrorStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardErrorStateImpl>
    implements _$$DashboardErrorStateImplCopyWith<$Res> {
  __$$DashboardErrorStateImplCopyWithImpl(_$DashboardErrorStateImpl _value,
      $Res Function(_$DashboardErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardErrorStateImpl implements DashboardErrorState {
  const _$DashboardErrorStateImpl();

  @override
  String toString() {
    return 'DashboardState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)
        fetched,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initialState,
    TResult? Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function(
            Map<String, MetricWrapper>? metricData,
            List<TableWrapper>? tableData,
            DateTime? selectedDate,
            bool? isNetworkError)?
        fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardInitialState value) initialState,
    required TResult Function(DashboardFetchedState value) fetched,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardInitialState value)? initialState,
    TResult? Function(DashboardFetchedState value)? fetched,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardInitialState value)? initialState,
    TResult Function(DashboardFetchedState value)? fetched,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DashboardErrorState implements DashboardState {
  const factory DashboardErrorState() = _$DashboardErrorStateImpl;
}
