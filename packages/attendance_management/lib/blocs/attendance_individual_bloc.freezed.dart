// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_individual_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttendanceIndividualEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)
        individualAttendanceLogSearch,
    required TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)
        individualAttendanceMark,
    required TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)
        saveAsDraft,
    required TResult Function(String name) searchAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult? Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult? Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult? Function(String name)? searchAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult Function(String name)? searchAttendees,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceIndividualLogSearchEvent value)
        individualAttendanceLogSearch,
    required TResult Function(AttendanceMarkEvent value)
        individualAttendanceMark,
    required TResult Function(SaveAsDraftEvent value) saveAsDraft,
    required TResult Function(SearchAttendeesEvent value) searchAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult? Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult? Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult? Function(SearchAttendeesEvent value)? searchAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult Function(SearchAttendeesEvent value)? searchAttendees,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceIndividualEventCopyWith<$Res> {
  factory $AttendanceIndividualEventCopyWith(AttendanceIndividualEvent value,
          $Res Function(AttendanceIndividualEvent) then) =
      _$AttendanceIndividualEventCopyWithImpl<$Res, AttendanceIndividualEvent>;
}

/// @nodoc
class _$AttendanceIndividualEventCopyWithImpl<$Res,
        $Val extends AttendanceIndividualEvent>
    implements $AttendanceIndividualEventCopyWith<$Res> {
  _$AttendanceIndividualEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AttendanceIndividualLogSearchEventImplCopyWith<$Res> {
  factory _$$AttendanceIndividualLogSearchEventImplCopyWith(
          _$AttendanceIndividualLogSearchEventImpl value,
          $Res Function(_$AttendanceIndividualLogSearchEventImpl) then) =
      __$$AttendanceIndividualLogSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String registerId,
      String tenantId,
      int entryTime,
      int exitTime,
      int currentDate,
      List<AttendeeModel> attendees,
      int offset,
      int limit,
      bool isSingleSession});
}

/// @nodoc
class __$$AttendanceIndividualLogSearchEventImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualEventCopyWithImpl<$Res,
        _$AttendanceIndividualLogSearchEventImpl>
    implements _$$AttendanceIndividualLogSearchEventImplCopyWith<$Res> {
  __$$AttendanceIndividualLogSearchEventImplCopyWithImpl(
      _$AttendanceIndividualLogSearchEventImpl _value,
      $Res Function(_$AttendanceIndividualLogSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerId = null,
    Object? tenantId = null,
    Object? entryTime = null,
    Object? exitTime = null,
    Object? currentDate = null,
    Object? attendees = null,
    Object? offset = null,
    Object? limit = null,
    Object? isSingleSession = null,
  }) {
    return _then(_$AttendanceIndividualLogSearchEventImpl(
      registerId: null == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      entryTime: null == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as int,
      exitTime: null == exitTime
          ? _value.exitTime
          : exitTime // ignore: cast_nullable_to_non_nullable
              as int,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as int,
      attendees: null == attendees
          ? _value._attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<AttendeeModel>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      isSingleSession: null == isSingleSession
          ? _value.isSingleSession
          : isSingleSession // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AttendanceIndividualLogSearchEventImpl
    implements AttendanceIndividualLogSearchEvent {
  const _$AttendanceIndividualLogSearchEventImpl(
      {required this.registerId,
      required this.tenantId,
      required this.entryTime,
      required this.exitTime,
      required this.currentDate,
      required final List<AttendeeModel> attendees,
      required this.offset,
      required this.limit,
      this.isSingleSession = false})
      : _attendees = attendees;

  @override
  final String registerId;
  @override
  final String tenantId;
  @override
  final int entryTime;
  @override
  final int exitTime;
  @override
  final int currentDate;
  final List<AttendeeModel> _attendees;
  @override
  List<AttendeeModel> get attendees {
    if (_attendees is EqualUnmodifiableListView) return _attendees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendees);
  }

  @override
  final int offset;
  @override
  final int limit;
  @override
  @JsonKey()
  final bool isSingleSession;

  @override
  String toString() {
    return 'AttendanceIndividualEvent.individualAttendanceLogSearch(registerId: $registerId, tenantId: $tenantId, entryTime: $entryTime, exitTime: $exitTime, currentDate: $currentDate, attendees: $attendees, offset: $offset, limit: $limit, isSingleSession: $isSingleSession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceIndividualLogSearchEventImpl &&
            (identical(other.registerId, registerId) ||
                other.registerId == registerId) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.exitTime, exitTime) ||
                other.exitTime == exitTime) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            const DeepCollectionEquality()
                .equals(other._attendees, _attendees) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.isSingleSession, isSingleSession) ||
                other.isSingleSession == isSingleSession));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      registerId,
      tenantId,
      entryTime,
      exitTime,
      currentDate,
      const DeepCollectionEquality().hash(_attendees),
      offset,
      limit,
      isSingleSession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceIndividualLogSearchEventImplCopyWith<
          _$AttendanceIndividualLogSearchEventImpl>
      get copyWith => __$$AttendanceIndividualLogSearchEventImplCopyWithImpl<
          _$AttendanceIndividualLogSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)
        individualAttendanceLogSearch,
    required TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)
        individualAttendanceMark,
    required TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)
        saveAsDraft,
    required TResult Function(String name) searchAttendees,
  }) {
    return individualAttendanceLogSearch(registerId, tenantId, entryTime,
        exitTime, currentDate, attendees, offset, limit, isSingleSession);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult? Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult? Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult? Function(String name)? searchAttendees,
  }) {
    return individualAttendanceLogSearch?.call(registerId, tenantId, entryTime,
        exitTime, currentDate, attendees, offset, limit, isSingleSession);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult Function(String name)? searchAttendees,
    required TResult orElse(),
  }) {
    if (individualAttendanceLogSearch != null) {
      return individualAttendanceLogSearch(registerId, tenantId, entryTime,
          exitTime, currentDate, attendees, offset, limit, isSingleSession);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceIndividualLogSearchEvent value)
        individualAttendanceLogSearch,
    required TResult Function(AttendanceMarkEvent value)
        individualAttendanceMark,
    required TResult Function(SaveAsDraftEvent value) saveAsDraft,
    required TResult Function(SearchAttendeesEvent value) searchAttendees,
  }) {
    return individualAttendanceLogSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult? Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult? Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult? Function(SearchAttendeesEvent value)? searchAttendees,
  }) {
    return individualAttendanceLogSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult Function(SearchAttendeesEvent value)? searchAttendees,
    required TResult orElse(),
  }) {
    if (individualAttendanceLogSearch != null) {
      return individualAttendanceLogSearch(this);
    }
    return orElse();
  }
}

abstract class AttendanceIndividualLogSearchEvent
    implements AttendanceIndividualEvent {
  const factory AttendanceIndividualLogSearchEvent(
      {required final String registerId,
      required final String tenantId,
      required final int entryTime,
      required final int exitTime,
      required final int currentDate,
      required final List<AttendeeModel> attendees,
      required final int offset,
      required final int limit,
      final bool isSingleSession}) = _$AttendanceIndividualLogSearchEventImpl;

  String get registerId;
  String get tenantId;
  int get entryTime;
  int get exitTime;
  int get currentDate;
  List<AttendeeModel> get attendees;
  int get offset;
  int get limit;
  bool get isSingleSession;
  @JsonKey(ignore: true)
  _$$AttendanceIndividualLogSearchEventImplCopyWith<
          _$AttendanceIndividualLogSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttendanceMarkEventImplCopyWith<$Res> {
  factory _$$AttendanceMarkEventImplCopyWith(_$AttendanceMarkEventImpl value,
          $Res Function(_$AttendanceMarkEventImpl) then) =
      __$$AttendanceMarkEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int entryTime,
      int exitTime,
      dynamic status,
      bool isSingleSession,
      String individualId,
      String registerId});
}

/// @nodoc
class __$$AttendanceMarkEventImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualEventCopyWithImpl<$Res,
        _$AttendanceMarkEventImpl>
    implements _$$AttendanceMarkEventImplCopyWith<$Res> {
  __$$AttendanceMarkEventImplCopyWithImpl(_$AttendanceMarkEventImpl _value,
      $Res Function(_$AttendanceMarkEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryTime = null,
    Object? exitTime = null,
    Object? status = freezed,
    Object? isSingleSession = null,
    Object? individualId = null,
    Object? registerId = null,
  }) {
    return _then(_$AttendanceMarkEventImpl(
      entryTime: null == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as int,
      exitTime: null == exitTime
          ? _value.exitTime
          : exitTime // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status ? _value.status! : status,
      isSingleSession: null == isSingleSession
          ? _value.isSingleSession
          : isSingleSession // ignore: cast_nullable_to_non_nullable
              as bool,
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
      registerId: null == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AttendanceMarkEventImpl implements AttendanceMarkEvent {
  const _$AttendanceMarkEventImpl(
      {this.entryTime = 0,
      this.exitTime = 0,
      this.status = -1,
      this.isSingleSession = false,
      required this.individualId,
      required this.registerId});

  @override
  @JsonKey()
  final int entryTime;
  @override
  @JsonKey()
  final int exitTime;
  @override
  @JsonKey()
  final dynamic status;
  @override
  @JsonKey()
  final bool isSingleSession;
  @override
  final String individualId;
  @override
  final String registerId;

  @override
  String toString() {
    return 'AttendanceIndividualEvent.individualAttendanceMark(entryTime: $entryTime, exitTime: $exitTime, status: $status, isSingleSession: $isSingleSession, individualId: $individualId, registerId: $registerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceMarkEventImpl &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.exitTime, exitTime) ||
                other.exitTime == exitTime) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.isSingleSession, isSingleSession) ||
                other.isSingleSession == isSingleSession) &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId) &&
            (identical(other.registerId, registerId) ||
                other.registerId == registerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      entryTime,
      exitTime,
      const DeepCollectionEquality().hash(status),
      isSingleSession,
      individualId,
      registerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceMarkEventImplCopyWith<_$AttendanceMarkEventImpl> get copyWith =>
      __$$AttendanceMarkEventImplCopyWithImpl<_$AttendanceMarkEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)
        individualAttendanceLogSearch,
    required TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)
        individualAttendanceMark,
    required TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)
        saveAsDraft,
    required TResult Function(String name) searchAttendees,
  }) {
    return individualAttendanceMark(
        entryTime, exitTime, status, isSingleSession, individualId, registerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult? Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult? Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult? Function(String name)? searchAttendees,
  }) {
    return individualAttendanceMark?.call(
        entryTime, exitTime, status, isSingleSession, individualId, registerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult Function(String name)? searchAttendees,
    required TResult orElse(),
  }) {
    if (individualAttendanceMark != null) {
      return individualAttendanceMark(entryTime, exitTime, status,
          isSingleSession, individualId, registerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceIndividualLogSearchEvent value)
        individualAttendanceLogSearch,
    required TResult Function(AttendanceMarkEvent value)
        individualAttendanceMark,
    required TResult Function(SaveAsDraftEvent value) saveAsDraft,
    required TResult Function(SearchAttendeesEvent value) searchAttendees,
  }) {
    return individualAttendanceMark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult? Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult? Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult? Function(SearchAttendeesEvent value)? searchAttendees,
  }) {
    return individualAttendanceMark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult Function(SearchAttendeesEvent value)? searchAttendees,
    required TResult orElse(),
  }) {
    if (individualAttendanceMark != null) {
      return individualAttendanceMark(this);
    }
    return orElse();
  }
}

abstract class AttendanceMarkEvent implements AttendanceIndividualEvent {
  const factory AttendanceMarkEvent(
      {final int entryTime,
      final int exitTime,
      final dynamic status,
      final bool isSingleSession,
      required final String individualId,
      required final String registerId}) = _$AttendanceMarkEventImpl;

  int get entryTime;
  int get exitTime;
  dynamic get status;
  bool get isSingleSession;
  String get individualId;
  String get registerId;
  @JsonKey(ignore: true)
  _$$AttendanceMarkEventImplCopyWith<_$AttendanceMarkEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveAsDraftEventImplCopyWith<$Res> {
  factory _$$SaveAsDraftEventImplCopyWith(_$SaveAsDraftEventImpl value,
          $Res Function(_$SaveAsDraftEventImpl) then) =
      __$$SaveAsDraftEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int entryTime,
      int exitTime,
      DateTime selectedDate,
      bool isSingleSession,
      bool? createOplog,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$SaveAsDraftEventImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualEventCopyWithImpl<$Res,
        _$SaveAsDraftEventImpl>
    implements _$$SaveAsDraftEventImplCopyWith<$Res> {
  __$$SaveAsDraftEventImplCopyWithImpl(_$SaveAsDraftEventImpl _value,
      $Res Function(_$SaveAsDraftEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryTime = null,
    Object? exitTime = null,
    Object? selectedDate = null,
    Object? isSingleSession = null,
    Object? createOplog = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$SaveAsDraftEventImpl(
      entryTime: null == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as int,
      exitTime: null == exitTime
          ? _value.exitTime
          : exitTime // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSingleSession: null == isSingleSession
          ? _value.isSingleSession
          : isSingleSession // ignore: cast_nullable_to_non_nullable
              as bool,
      createOplog: freezed == createOplog
          ? _value.createOplog
          : createOplog // ignore: cast_nullable_to_non_nullable
              as bool?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$SaveAsDraftEventImpl implements SaveAsDraftEvent {
  const _$SaveAsDraftEventImpl(
      {required this.entryTime,
      required this.exitTime,
      required this.selectedDate,
      this.isSingleSession = false,
      this.createOplog = false,
      this.latitude,
      this.longitude});

  @override
  final int entryTime;
  @override
  final int exitTime;
  @override
  final DateTime selectedDate;
  @override
  @JsonKey()
  final bool isSingleSession;
  @override
  @JsonKey()
  final bool? createOplog;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'AttendanceIndividualEvent.saveAsDraft(entryTime: $entryTime, exitTime: $exitTime, selectedDate: $selectedDate, isSingleSession: $isSingleSession, createOplog: $createOplog, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAsDraftEventImpl &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.exitTime, exitTime) ||
                other.exitTime == exitTime) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.isSingleSession, isSingleSession) ||
                other.isSingleSession == isSingleSession) &&
            (identical(other.createOplog, createOplog) ||
                other.createOplog == createOplog) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entryTime, exitTime,
      selectedDate, isSingleSession, createOplog, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveAsDraftEventImplCopyWith<_$SaveAsDraftEventImpl> get copyWith =>
      __$$SaveAsDraftEventImplCopyWithImpl<_$SaveAsDraftEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)
        individualAttendanceLogSearch,
    required TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)
        individualAttendanceMark,
    required TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)
        saveAsDraft,
    required TResult Function(String name) searchAttendees,
  }) {
    return saveAsDraft(entryTime, exitTime, selectedDate, isSingleSession,
        createOplog, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult? Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult? Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult? Function(String name)? searchAttendees,
  }) {
    return saveAsDraft?.call(entryTime, exitTime, selectedDate, isSingleSession,
        createOplog, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult Function(String name)? searchAttendees,
    required TResult orElse(),
  }) {
    if (saveAsDraft != null) {
      return saveAsDraft(entryTime, exitTime, selectedDate, isSingleSession,
          createOplog, latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceIndividualLogSearchEvent value)
        individualAttendanceLogSearch,
    required TResult Function(AttendanceMarkEvent value)
        individualAttendanceMark,
    required TResult Function(SaveAsDraftEvent value) saveAsDraft,
    required TResult Function(SearchAttendeesEvent value) searchAttendees,
  }) {
    return saveAsDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult? Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult? Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult? Function(SearchAttendeesEvent value)? searchAttendees,
  }) {
    return saveAsDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult Function(SearchAttendeesEvent value)? searchAttendees,
    required TResult orElse(),
  }) {
    if (saveAsDraft != null) {
      return saveAsDraft(this);
    }
    return orElse();
  }
}

abstract class SaveAsDraftEvent implements AttendanceIndividualEvent {
  const factory SaveAsDraftEvent(
      {required final int entryTime,
      required final int exitTime,
      required final DateTime selectedDate,
      final bool isSingleSession,
      final bool? createOplog,
      final double? latitude,
      final double? longitude}) = _$SaveAsDraftEventImpl;

  int get entryTime;
  int get exitTime;
  DateTime get selectedDate;
  bool get isSingleSession;
  bool? get createOplog;
  double? get latitude;
  double? get longitude;
  @JsonKey(ignore: true)
  _$$SaveAsDraftEventImplCopyWith<_$SaveAsDraftEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchAttendeesEventImplCopyWith<$Res> {
  factory _$$SearchAttendeesEventImplCopyWith(_$SearchAttendeesEventImpl value,
          $Res Function(_$SearchAttendeesEventImpl) then) =
      __$$SearchAttendeesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$SearchAttendeesEventImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualEventCopyWithImpl<$Res,
        _$SearchAttendeesEventImpl>
    implements _$$SearchAttendeesEventImplCopyWith<$Res> {
  __$$SearchAttendeesEventImplCopyWithImpl(_$SearchAttendeesEventImpl _value,
      $Res Function(_$SearchAttendeesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$SearchAttendeesEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchAttendeesEventImpl implements SearchAttendeesEvent {
  const _$SearchAttendeesEventImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'AttendanceIndividualEvent.searchAttendees(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchAttendeesEventImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchAttendeesEventImplCopyWith<_$SearchAttendeesEventImpl>
      get copyWith =>
          __$$SearchAttendeesEventImplCopyWithImpl<_$SearchAttendeesEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)
        individualAttendanceLogSearch,
    required TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)
        individualAttendanceMark,
    required TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)
        saveAsDraft,
    required TResult Function(String name) searchAttendees,
  }) {
    return searchAttendees(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult? Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult? Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult? Function(String name)? searchAttendees,
  }) {
    return searchAttendees?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String registerId,
            String tenantId,
            int entryTime,
            int exitTime,
            int currentDate,
            List<AttendeeModel> attendees,
            int offset,
            int limit,
            bool isSingleSession)?
        individualAttendanceLogSearch,
    TResult Function(int entryTime, int exitTime, dynamic status,
            bool isSingleSession, String individualId, String registerId)?
        individualAttendanceMark,
    TResult Function(
            int entryTime,
            int exitTime,
            DateTime selectedDate,
            bool isSingleSession,
            bool? createOplog,
            double? latitude,
            double? longitude)?
        saveAsDraft,
    TResult Function(String name)? searchAttendees,
    required TResult orElse(),
  }) {
    if (searchAttendees != null) {
      return searchAttendees(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceIndividualLogSearchEvent value)
        individualAttendanceLogSearch,
    required TResult Function(AttendanceMarkEvent value)
        individualAttendanceMark,
    required TResult Function(SaveAsDraftEvent value) saveAsDraft,
    required TResult Function(SearchAttendeesEvent value) searchAttendees,
  }) {
    return searchAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult? Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult? Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult? Function(SearchAttendeesEvent value)? searchAttendees,
  }) {
    return searchAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceIndividualLogSearchEvent value)?
        individualAttendanceLogSearch,
    TResult Function(AttendanceMarkEvent value)? individualAttendanceMark,
    TResult Function(SaveAsDraftEvent value)? saveAsDraft,
    TResult Function(SearchAttendeesEvent value)? searchAttendees,
    required TResult orElse(),
  }) {
    if (searchAttendees != null) {
      return searchAttendees(this);
    }
    return orElse();
  }
}

abstract class SearchAttendeesEvent implements AttendanceIndividualEvent {
  const factory SearchAttendeesEvent({required final String name}) =
      _$SearchAttendeesEventImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$SearchAttendeesEventImplCopyWith<_$SearchAttendeesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendanceIndividualState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)
        loaded,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AttendanceRowModelLoaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AttendanceRowModelLoaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AttendanceRowModelLoaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceIndividualStateCopyWith<$Res> {
  factory $AttendanceIndividualStateCopyWith(AttendanceIndividualState value,
          $Res Function(AttendanceIndividualState) then) =
      _$AttendanceIndividualStateCopyWithImpl<$Res, AttendanceIndividualState>;
}

/// @nodoc
class _$AttendanceIndividualStateCopyWithImpl<$Res,
        $Val extends AttendanceIndividualState>
    implements $AttendanceIndividualStateCopyWith<$Res> {
  _$AttendanceIndividualStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'AttendanceIndividualState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AttendanceRowModelLoaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AttendanceRowModelLoaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AttendanceRowModelLoaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends AttendanceIndividualState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'AttendanceIndividualState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult Function(String? error)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AttendanceRowModelLoaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AttendanceRowModelLoaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AttendanceRowModelLoaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends AttendanceIndividualState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$AttendanceRowModelLoadedImplCopyWith<$Res> {
  factory _$$AttendanceRowModelLoadedImplCopyWith(
          _$AttendanceRowModelLoadedImpl value,
          $Res Function(_$AttendanceRowModelLoadedImpl) then) =
      __$$AttendanceRowModelLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<AttendeeModel>? attendanceSearchModelList,
      List<AttendeeModel>? attendanceCollectionModel,
      int offsetData,
      int currentOffset,
      int countData,
      int limitData,
      bool viewOnly});
}

/// @nodoc
class __$$AttendanceRowModelLoadedImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualStateCopyWithImpl<$Res,
        _$AttendanceRowModelLoadedImpl>
    implements _$$AttendanceRowModelLoadedImplCopyWith<$Res> {
  __$$AttendanceRowModelLoadedImplCopyWithImpl(
      _$AttendanceRowModelLoadedImpl _value,
      $Res Function(_$AttendanceRowModelLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceSearchModelList = freezed,
    Object? attendanceCollectionModel = freezed,
    Object? offsetData = null,
    Object? currentOffset = null,
    Object? countData = null,
    Object? limitData = null,
    Object? viewOnly = null,
  }) {
    return _then(_$AttendanceRowModelLoadedImpl(
      attendanceSearchModelList: freezed == attendanceSearchModelList
          ? _value._attendanceSearchModelList
          : attendanceSearchModelList // ignore: cast_nullable_to_non_nullable
              as List<AttendeeModel>?,
      attendanceCollectionModel: freezed == attendanceCollectionModel
          ? _value._attendanceCollectionModel
          : attendanceCollectionModel // ignore: cast_nullable_to_non_nullable
              as List<AttendeeModel>?,
      offsetData: null == offsetData
          ? _value.offsetData
          : offsetData // ignore: cast_nullable_to_non_nullable
              as int,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      countData: null == countData
          ? _value.countData
          : countData // ignore: cast_nullable_to_non_nullable
              as int,
      limitData: null == limitData
          ? _value.limitData
          : limitData // ignore: cast_nullable_to_non_nullable
              as int,
      viewOnly: null == viewOnly
          ? _value.viewOnly
          : viewOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AttendanceRowModelLoadedImpl extends _AttendanceRowModelLoaded {
  _$AttendanceRowModelLoadedImpl(
      {final List<AttendeeModel>? attendanceSearchModelList,
      final List<AttendeeModel>? attendanceCollectionModel,
      this.offsetData = 0,
      this.currentOffset = 0,
      this.countData = 0,
      this.limitData = 10,
      this.viewOnly = false})
      : _attendanceSearchModelList = attendanceSearchModelList,
        _attendanceCollectionModel = attendanceCollectionModel,
        super._();

  final List<AttendeeModel>? _attendanceSearchModelList;
  @override
  List<AttendeeModel>? get attendanceSearchModelList {
    final value = _attendanceSearchModelList;
    if (value == null) return null;
    if (_attendanceSearchModelList is EqualUnmodifiableListView)
      return _attendanceSearchModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AttendeeModel>? _attendanceCollectionModel;
  @override
  List<AttendeeModel>? get attendanceCollectionModel {
    final value = _attendanceCollectionModel;
    if (value == null) return null;
    if (_attendanceCollectionModel is EqualUnmodifiableListView)
      return _attendanceCollectionModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int offsetData;
  @override
  @JsonKey()
  final int currentOffset;
  @override
  @JsonKey()
  final int countData;
  @override
  @JsonKey()
  final int limitData;
  @override
  @JsonKey()
  final bool viewOnly;

  @override
  String toString() {
    return 'AttendanceIndividualState.loaded(attendanceSearchModelList: $attendanceSearchModelList, attendanceCollectionModel: $attendanceCollectionModel, offsetData: $offsetData, currentOffset: $currentOffset, countData: $countData, limitData: $limitData, viewOnly: $viewOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRowModelLoadedImpl &&
            const DeepCollectionEquality().equals(
                other._attendanceSearchModelList, _attendanceSearchModelList) &&
            const DeepCollectionEquality().equals(
                other._attendanceCollectionModel, _attendanceCollectionModel) &&
            (identical(other.offsetData, offsetData) ||
                other.offsetData == offsetData) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.countData, countData) ||
                other.countData == countData) &&
            (identical(other.limitData, limitData) ||
                other.limitData == limitData) &&
            (identical(other.viewOnly, viewOnly) ||
                other.viewOnly == viewOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_attendanceSearchModelList),
      const DeepCollectionEquality().hash(_attendanceCollectionModel),
      offsetData,
      currentOffset,
      countData,
      limitData,
      viewOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRowModelLoadedImplCopyWith<_$AttendanceRowModelLoadedImpl>
      get copyWith => __$$AttendanceRowModelLoadedImplCopyWithImpl<
          _$AttendanceRowModelLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return loaded(attendanceSearchModelList, attendanceCollectionModel,
        offsetData, currentOffset, countData, limitData, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return loaded?.call(attendanceSearchModelList, attendanceCollectionModel,
        offsetData, currentOffset, countData, limitData, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(attendanceSearchModelList, attendanceCollectionModel,
          offsetData, currentOffset, countData, limitData, viewOnly);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AttendanceRowModelLoaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AttendanceRowModelLoaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AttendanceRowModelLoaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _AttendanceRowModelLoaded extends AttendanceIndividualState {
  factory _AttendanceRowModelLoaded(
      {final List<AttendeeModel>? attendanceSearchModelList,
      final List<AttendeeModel>? attendanceCollectionModel,
      final int offsetData,
      final int currentOffset,
      final int countData,
      final int limitData,
      final bool viewOnly}) = _$AttendanceRowModelLoadedImpl;
  _AttendanceRowModelLoaded._() : super._();

  List<AttendeeModel>? get attendanceSearchModelList;
  List<AttendeeModel>? get attendanceCollectionModel;
  int get offsetData;
  int get currentOffset;
  int get countData;
  int get limitData;
  bool get viewOnly;
  @JsonKey(ignore: true)
  _$$AttendanceRowModelLoadedImplCopyWith<_$AttendanceRowModelLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AttendanceIndividualStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl(this.error) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'AttendanceIndividualState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AttendeeModel>? attendanceSearchModelList,
            List<AttendeeModel>? attendanceCollectionModel,
            int offsetData,
            int currentOffset,
            int countData,
            int limitData,
            bool viewOnly)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AttendanceRowModelLoaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AttendanceRowModelLoaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AttendanceRowModelLoaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends AttendanceIndividualState {
  const factory _Error(final String? error) = _$ErrorImpl;
  const _Error._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
