// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardEvent {
  DateTime? get selectedDate;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardEventCopyWith<DashboardEvent> get copyWith =>
      _$DashboardEventCopyWithImpl<DashboardEvent>(
          this as DashboardEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardEvent &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate);

  @override
  String toString() {
    return 'DashboardEvent(selectedDate: $selectedDate)';
  }
}

/// @nodoc
abstract mixin class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) _then) =
      _$DashboardEventCopyWithImpl;
  @useResult
  $Res call({DateTime selectedDate});
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._self, this._then);

  final DashboardEvent _self;
  final $Res Function(DashboardEvent) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
  }) {
    return _then(_self.copyWith(
      selectedDate: null == selectedDate
          ? _self.selectedDate!
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardEvent].
extension DashboardEventPatterns on DashboardEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardSearchEvent value)? handleSearch,
    TResult Function(DashboardRefreshEvent value)? handleRefresh,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DashboardSearchEvent() when handleSearch != null:
        return handleSearch(_that);
      case DashboardRefreshEvent() when handleRefresh != null:
        return handleRefresh(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardSearchEvent value) handleSearch,
    required TResult Function(DashboardRefreshEvent value) handleRefresh,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardSearchEvent():
        return handleSearch(_that);
      case DashboardRefreshEvent():
        return handleRefresh(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardSearchEvent value)? handleSearch,
    TResult? Function(DashboardRefreshEvent value)? handleRefresh,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardSearchEvent() when handleSearch != null:
        return handleSearch(_that);
      case DashboardRefreshEvent() when handleRefresh != null:
        return handleRefresh(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DashboardSearchEvent() when handleSearch != null:
        return handleSearch(_that.selectedDate, _that.isNetworkError);
      case DashboardRefreshEvent() when handleRefresh != null:
        return handleRefresh(
            _that.selectedDate, _that.projectId, _that.syncFromServer);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? selectedDate, bool? isNetworkError)
        handleSearch,
    required TResult Function(
            DateTime selectedDate, String projectId, bool syncFromServer)
        handleRefresh,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardSearchEvent():
        return handleSearch(_that.selectedDate, _that.isNetworkError);
      case DashboardRefreshEvent():
        return handleRefresh(
            _that.selectedDate, _that.projectId, _that.syncFromServer);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? selectedDate, bool? isNetworkError)?
        handleSearch,
    TResult? Function(
            DateTime selectedDate, String projectId, bool syncFromServer)?
        handleRefresh,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardSearchEvent() when handleSearch != null:
        return handleSearch(_that.selectedDate, _that.isNetworkError);
      case DashboardRefreshEvent() when handleRefresh != null:
        return handleRefresh(
            _that.selectedDate, _that.projectId, _that.syncFromServer);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DashboardSearchEvent implements DashboardEvent {
  const DashboardSearchEvent({this.selectedDate, this.isNetworkError = false});

  @override
  final DateTime? selectedDate;
  @JsonKey()
  final bool? isNetworkError;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardSearchEventCopyWith<DashboardSearchEvent> get copyWith =>
      _$DashboardSearchEventCopyWithImpl<DashboardSearchEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardSearchEvent &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.isNetworkError, isNetworkError) ||
                other.isNetworkError == isNetworkError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate, isNetworkError);

  @override
  String toString() {
    return 'DashboardEvent.handleSearch(selectedDate: $selectedDate, isNetworkError: $isNetworkError)';
  }
}

/// @nodoc
abstract mixin class $DashboardSearchEventCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory $DashboardSearchEventCopyWith(DashboardSearchEvent value,
          $Res Function(DashboardSearchEvent) _then) =
      _$DashboardSearchEventCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime? selectedDate, bool? isNetworkError});
}

/// @nodoc
class _$DashboardSearchEventCopyWithImpl<$Res>
    implements $DashboardSearchEventCopyWith<$Res> {
  _$DashboardSearchEventCopyWithImpl(this._self, this._then);

  final DashboardSearchEvent _self;
  final $Res Function(DashboardSearchEvent) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedDate = freezed,
    Object? isNetworkError = freezed,
  }) {
    return _then(DashboardSearchEvent(
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNetworkError: freezed == isNetworkError
          ? _self.isNetworkError
          : isNetworkError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class DashboardRefreshEvent implements DashboardEvent {
  const DashboardRefreshEvent(
      {required this.selectedDate,
      required this.projectId,
      this.syncFromServer = false});

  @override
  final DateTime selectedDate;
  final String projectId;
  @JsonKey()
  final bool syncFromServer;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardRefreshEventCopyWith<DashboardRefreshEvent> get copyWith =>
      _$DashboardRefreshEventCopyWithImpl<DashboardRefreshEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardRefreshEvent &&
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

  @override
  String toString() {
    return 'DashboardEvent.handleRefresh(selectedDate: $selectedDate, projectId: $projectId, syncFromServer: $syncFromServer)';
  }
}

/// @nodoc
abstract mixin class $DashboardRefreshEventCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory $DashboardRefreshEventCopyWith(DashboardRefreshEvent value,
          $Res Function(DashboardRefreshEvent) _then) =
      _$DashboardRefreshEventCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime selectedDate, String projectId, bool syncFromServer});
}

/// @nodoc
class _$DashboardRefreshEventCopyWithImpl<$Res>
    implements $DashboardRefreshEventCopyWith<$Res> {
  _$DashboardRefreshEventCopyWithImpl(this._self, this._then);

  final DashboardRefreshEvent _self;
  final $Res Function(DashboardRefreshEvent) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedDate = null,
    Object? projectId = null,
    Object? syncFromServer = null,
  }) {
    return _then(DashboardRefreshEvent(
      selectedDate: null == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      syncFromServer: null == syncFromServer
          ? _self.syncFromServer
          : syncFromServer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$DashboardState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState()';
  }
}

/// @nodoc
class $DashboardStateCopyWith<$Res> {
  $DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}

/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardInitialState value)? initialState,
    TResult Function(DashboardFetchedState value)? fetched,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DashboardLoadingState() when loading != null:
        return loading(_that);
      case DashboardInitialState() when initialState != null:
        return initialState(_that);
      case DashboardFetchedState() when fetched != null:
        return fetched(_that);
      case DashboardErrorState() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardInitialState value) initialState,
    required TResult Function(DashboardFetchedState value) fetched,
    required TResult Function(DashboardErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardLoadingState():
        return loading(_that);
      case DashboardInitialState():
        return initialState(_that);
      case DashboardFetchedState():
        return fetched(_that);
      case DashboardErrorState():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardInitialState value)? initialState,
    TResult? Function(DashboardFetchedState value)? fetched,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardLoadingState() when loading != null:
        return loading(_that);
      case DashboardInitialState() when initialState != null:
        return initialState(_that);
      case DashboardFetchedState() when fetched != null:
        return fetched(_that);
      case DashboardErrorState() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case DashboardLoadingState() when loading != null:
        return loading();
      case DashboardInitialState() when initialState != null:
        return initialState();
      case DashboardFetchedState() when fetched != null:
        return fetched(_that.metricData, _that.tableData, _that.selectedDate,
            _that.isNetworkError);
      case DashboardErrorState() when error != null:
        return error();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case DashboardLoadingState():
        return loading();
      case DashboardInitialState():
        return initialState();
      case DashboardFetchedState():
        return fetched(_that.metricData, _that.tableData, _that.selectedDate,
            _that.isNetworkError);
      case DashboardErrorState():
        return error();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case DashboardLoadingState() when loading != null:
        return loading();
      case DashboardInitialState() when initialState != null:
        return initialState();
      case DashboardFetchedState() when fetched != null:
        return fetched(_that.metricData, _that.tableData, _that.selectedDate,
            _that.isNetworkError);
      case DashboardErrorState() when error != null:
        return error();
      case _:
        return null;
    }
  }
}

/// @nodoc

class DashboardLoadingState implements DashboardState {
  const DashboardLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.loading()';
  }
}

/// @nodoc

class DashboardInitialState implements DashboardState {
  const DashboardInitialState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.initialState()';
  }
}

/// @nodoc

class DashboardFetchedState implements DashboardState {
  const DashboardFetchedState(
      {final Map<String, MetricWrapper>? metricData,
      final List<TableWrapper>? tableData,
      this.selectedDate,
      this.isNetworkError = false})
      : _metricData = metricData,
        _tableData = tableData;

  final Map<String, MetricWrapper>? _metricData;
  Map<String, MetricWrapper>? get metricData {
    final value = _metricData;
    if (value == null) return null;
    if (_metricData is EqualUnmodifiableMapView) return _metricData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<TableWrapper>? _tableData;
  List<TableWrapper>? get tableData {
    final value = _tableData;
    if (value == null) return null;
    if (_tableData is EqualUnmodifiableListView) return _tableData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final DateTime? selectedDate;
  @JsonKey()
  final bool? isNetworkError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardFetchedStateCopyWith<DashboardFetchedState> get copyWith =>
      _$DashboardFetchedStateCopyWithImpl<DashboardFetchedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardFetchedState &&
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

  @override
  String toString() {
    return 'DashboardState.fetched(metricData: $metricData, tableData: $tableData, selectedDate: $selectedDate, isNetworkError: $isNetworkError)';
  }
}

/// @nodoc
abstract mixin class $DashboardFetchedStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory $DashboardFetchedStateCopyWith(DashboardFetchedState value,
          $Res Function(DashboardFetchedState) _then) =
      _$DashboardFetchedStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, MetricWrapper>? metricData,
      List<TableWrapper>? tableData,
      DateTime? selectedDate,
      bool? isNetworkError});
}

/// @nodoc
class _$DashboardFetchedStateCopyWithImpl<$Res>
    implements $DashboardFetchedStateCopyWith<$Res> {
  _$DashboardFetchedStateCopyWithImpl(this._self, this._then);

  final DashboardFetchedState _self;
  final $Res Function(DashboardFetchedState) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? metricData = freezed,
    Object? tableData = freezed,
    Object? selectedDate = freezed,
    Object? isNetworkError = freezed,
  }) {
    return _then(DashboardFetchedState(
      metricData: freezed == metricData
          ? _self._metricData
          : metricData // ignore: cast_nullable_to_non_nullable
              as Map<String, MetricWrapper>?,
      tableData: freezed == tableData
          ? _self._tableData
          : tableData // ignore: cast_nullable_to_non_nullable
              as List<TableWrapper>?,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNetworkError: freezed == isNetworkError
          ? _self.isNetworkError
          : isNetworkError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class DashboardErrorState implements DashboardState {
  const DashboardErrorState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.error()';
  }
}

// dart format on
