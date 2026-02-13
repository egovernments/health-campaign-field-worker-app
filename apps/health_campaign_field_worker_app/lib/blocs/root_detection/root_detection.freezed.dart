// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'root_detection.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

// /// @nodoc
// mixin _$RootDetectionEvent {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(Duration interval) startPeriodicChecks,
//     required TResult Function() stopPeriodicChecks,
//     required TResult Function() performCheck,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(Duration interval)? startPeriodicChecks,
//     TResult? Function()? stopPeriodicChecks,
//     TResult? Function()? performCheck,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(Duration interval)? startPeriodicChecks,
//     TResult Function()? stopPeriodicChecks,
//     TResult Function()? performCheck,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(RootDetectionStartPeriodicChecksEvent value)
//         startPeriodicChecks,
//     required TResult Function(RootDetectionStopPeriodicChecksEvent value)
//         stopPeriodicChecks,
//     required TResult Function(RootDetectionPerformCheckEvent value)
//         performCheck,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult? Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult? Function(RootDetectionPerformCheckEvent value)? performCheck,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult Function(RootDetectionPerformCheckEvent value)? performCheck,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $RootDetectionEventCopyWith<$Res> {
//   factory $RootDetectionEventCopyWith(
//           RootDetectionEvent value, $Res Function(RootDetectionEvent) then) =
//       _$RootDetectionEventCopyWithImpl<$Res, RootDetectionEvent>;
// }

// /// @nodoc
// class _$RootDetectionEventCopyWithImpl<$Res, $Val extends RootDetectionEvent>
//     implements $RootDetectionEventCopyWith<$Res> {
//   _$RootDetectionEventCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
// }

// /// @nodoc
// abstract class _$$RootDetectionStartPeriodicChecksEventImplCopyWith<$Res> {
//   factory _$$RootDetectionStartPeriodicChecksEventImplCopyWith(
//           _$RootDetectionStartPeriodicChecksEventImpl value,
//           $Res Function(_$RootDetectionStartPeriodicChecksEventImpl) then) =
//       __$$RootDetectionStartPeriodicChecksEventImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({Duration interval});
// }

// /// @nodoc
// class __$$RootDetectionStartPeriodicChecksEventImplCopyWithImpl<$Res>
//     extends _$RootDetectionEventCopyWithImpl<$Res,
//         _$RootDetectionStartPeriodicChecksEventImpl>
//     implements _$$RootDetectionStartPeriodicChecksEventImplCopyWith<$Res> {
//   __$$RootDetectionStartPeriodicChecksEventImplCopyWithImpl(
//       _$RootDetectionStartPeriodicChecksEventImpl _value,
//       $Res Function(_$RootDetectionStartPeriodicChecksEventImpl) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? interval = null,
//   }) {
//     return _then(_$RootDetectionStartPeriodicChecksEventImpl(
//       interval: null == interval
//           ? _value.interval
//           : interval // ignore: cast_nullable_to_non_nullable
//               as Duration,
//     ));
//   }
// }

// /// @nodoc

// class _$RootDetectionStartPeriodicChecksEventImpl
//     with DiagnosticableTreeMixin
//     implements RootDetectionStartPeriodicChecksEvent {
//   const _$RootDetectionStartPeriodicChecksEventImpl(
//       {this.interval = const Duration(minutes: 5)});

//   @override
//   @JsonKey()
//   final Duration interval;

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'RootDetectionEvent.startPeriodicChecks(interval: $interval)';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(
//           DiagnosticsProperty('type', 'RootDetectionEvent.startPeriodicChecks'))
//       ..add(DiagnosticsProperty('interval', interval));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$RootDetectionStartPeriodicChecksEventImpl &&
//             (identical(other.interval, interval) ||
//                 other.interval == interval));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, interval);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$RootDetectionStartPeriodicChecksEventImplCopyWith<
//           _$RootDetectionStartPeriodicChecksEventImpl>
//       get copyWith => __$$RootDetectionStartPeriodicChecksEventImplCopyWithImpl<
//           _$RootDetectionStartPeriodicChecksEventImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(Duration interval) startPeriodicChecks,
//     required TResult Function() stopPeriodicChecks,
//     required TResult Function() performCheck,
//   }) {
//     return startPeriodicChecks(interval);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(Duration interval)? startPeriodicChecks,
//     TResult? Function()? stopPeriodicChecks,
//     TResult? Function()? performCheck,
//   }) {
//     return startPeriodicChecks?.call(interval);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(Duration interval)? startPeriodicChecks,
//     TResult Function()? stopPeriodicChecks,
//     TResult Function()? performCheck,
//     required TResult orElse(),
//   }) {
//     if (startPeriodicChecks != null) {
//       return startPeriodicChecks(interval);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(RootDetectionStartPeriodicChecksEvent value)
//         startPeriodicChecks,
//     required TResult Function(RootDetectionStopPeriodicChecksEvent value)
//         stopPeriodicChecks,
//     required TResult Function(RootDetectionPerformCheckEvent value)
//         performCheck,
//   }) {
//     return startPeriodicChecks(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult? Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult? Function(RootDetectionPerformCheckEvent value)? performCheck,
//   }) {
//     return startPeriodicChecks?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult Function(RootDetectionPerformCheckEvent value)? performCheck,
//     required TResult orElse(),
//   }) {
//     if (startPeriodicChecks != null) {
//       return startPeriodicChecks(this);
//     }
//     return orElse();
//   }
// }

// abstract class RootDetectionStartPeriodicChecksEvent
//     implements RootDetectionEvent {
//   const factory RootDetectionStartPeriodicChecksEvent(
//       {final Duration interval}) = _$RootDetectionStartPeriodicChecksEventImpl;

//   Duration get interval;
//   @JsonKey(ignore: true)
//   _$$RootDetectionStartPeriodicChecksEventImplCopyWith<
//           _$RootDetectionStartPeriodicChecksEventImpl>
//       get copyWith => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$RootDetectionStopPeriodicChecksEventImplCopyWith<$Res> {
//   factory _$$RootDetectionStopPeriodicChecksEventImplCopyWith(
//           _$RootDetectionStopPeriodicChecksEventImpl value,
//           $Res Function(_$RootDetectionStopPeriodicChecksEventImpl) then) =
//       __$$RootDetectionStopPeriodicChecksEventImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$RootDetectionStopPeriodicChecksEventImplCopyWithImpl<$Res>
//     extends _$RootDetectionEventCopyWithImpl<$Res,
//         _$RootDetectionStopPeriodicChecksEventImpl>
//     implements _$$RootDetectionStopPeriodicChecksEventImplCopyWith<$Res> {
//   __$$RootDetectionStopPeriodicChecksEventImplCopyWithImpl(
//       _$RootDetectionStopPeriodicChecksEventImpl _value,
//       $Res Function(_$RootDetectionStopPeriodicChecksEventImpl) _then)
//       : super(_value, _then);
// }

// /// @nodoc

// class _$RootDetectionStopPeriodicChecksEventImpl
//     with DiagnosticableTreeMixin
//     implements RootDetectionStopPeriodicChecksEvent {
//   const _$RootDetectionStopPeriodicChecksEventImpl();

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'RootDetectionEvent.stopPeriodicChecks()';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(
//         DiagnosticsProperty('type', 'RootDetectionEvent.stopPeriodicChecks'));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$RootDetectionStopPeriodicChecksEventImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(Duration interval) startPeriodicChecks,
//     required TResult Function() stopPeriodicChecks,
//     required TResult Function() performCheck,
//   }) {
//     return stopPeriodicChecks();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(Duration interval)? startPeriodicChecks,
//     TResult? Function()? stopPeriodicChecks,
//     TResult? Function()? performCheck,
//   }) {
//     return stopPeriodicChecks?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(Duration interval)? startPeriodicChecks,
//     TResult Function()? stopPeriodicChecks,
//     TResult Function()? performCheck,
//     required TResult orElse(),
//   }) {
//     if (stopPeriodicChecks != null) {
//       return stopPeriodicChecks();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(RootDetectionStartPeriodicChecksEvent value)
//         startPeriodicChecks,
//     required TResult Function(RootDetectionStopPeriodicChecksEvent value)
//         stopPeriodicChecks,
//     required TResult Function(RootDetectionPerformCheckEvent value)
//         performCheck,
//   }) {
//     return stopPeriodicChecks(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult? Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult? Function(RootDetectionPerformCheckEvent value)? performCheck,
//   }) {
//     return stopPeriodicChecks?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult Function(RootDetectionPerformCheckEvent value)? performCheck,
//     required TResult orElse(),
//   }) {
//     if (stopPeriodicChecks != null) {
//       return stopPeriodicChecks(this);
//     }
//     return orElse();
//   }
// }

// abstract class RootDetectionStopPeriodicChecksEvent
//     implements RootDetectionEvent {
//   const factory RootDetectionStopPeriodicChecksEvent() =
//       _$RootDetectionStopPeriodicChecksEventImpl;
// }

// /// @nodoc
// abstract class _$$RootDetectionPerformCheckEventImplCopyWith<$Res> {
//   factory _$$RootDetectionPerformCheckEventImplCopyWith(
//           _$RootDetectionPerformCheckEventImpl value,
//           $Res Function(_$RootDetectionPerformCheckEventImpl) then) =
//       __$$RootDetectionPerformCheckEventImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$RootDetectionPerformCheckEventImplCopyWithImpl<$Res>
//     extends _$RootDetectionEventCopyWithImpl<$Res,
//         _$RootDetectionPerformCheckEventImpl>
//     implements _$$RootDetectionPerformCheckEventImplCopyWith<$Res> {
//   __$$RootDetectionPerformCheckEventImplCopyWithImpl(
//       _$RootDetectionPerformCheckEventImpl _value,
//       $Res Function(_$RootDetectionPerformCheckEventImpl) _then)
//       : super(_value, _then);
// }

// /// @nodoc

// class _$RootDetectionPerformCheckEventImpl
//     with DiagnosticableTreeMixin
//     implements RootDetectionPerformCheckEvent {
//   const _$RootDetectionPerformCheckEventImpl();

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'RootDetectionEvent.performCheck()';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//         .add(DiagnosticsProperty('type', 'RootDetectionEvent.performCheck'));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$RootDetectionPerformCheckEventImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(Duration interval) startPeriodicChecks,
//     required TResult Function() stopPeriodicChecks,
//     required TResult Function() performCheck,
//   }) {
//     return performCheck();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(Duration interval)? startPeriodicChecks,
//     TResult? Function()? stopPeriodicChecks,
//     TResult? Function()? performCheck,
//   }) {
//     return performCheck?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(Duration interval)? startPeriodicChecks,
//     TResult Function()? stopPeriodicChecks,
//     TResult Function()? performCheck,
//     required TResult orElse(),
//   }) {
//     if (performCheck != null) {
//       return performCheck();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(RootDetectionStartPeriodicChecksEvent value)
//         startPeriodicChecks,
//     required TResult Function(RootDetectionStopPeriodicChecksEvent value)
//         stopPeriodicChecks,
//     required TResult Function(RootDetectionPerformCheckEvent value)
//         performCheck,
//   }) {
//     return performCheck(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult? Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult? Function(RootDetectionPerformCheckEvent value)? performCheck,
//   }) {
//     return performCheck?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(RootDetectionStartPeriodicChecksEvent value)?
//         startPeriodicChecks,
//     TResult Function(RootDetectionStopPeriodicChecksEvent value)?
//         stopPeriodicChecks,
//     TResult Function(RootDetectionPerformCheckEvent value)? performCheck,
//     required TResult orElse(),
//   }) {
//     if (performCheck != null) {
//       return performCheck(this);
//     }
//     return orElse();
//   }
// }

// abstract class RootDetectionPerformCheckEvent implements RootDetectionEvent {
//   const factory RootDetectionPerformCheckEvent() =
//       _$RootDetectionPerformCheckEventImpl;
// }

// /// @nodoc
// mixin _$RootDetectionState {
//   bool? get isRooted => throw _privateConstructorUsedError;
//   bool get isPeriodicCheckRunning => throw _privateConstructorUsedError;
//   SecurityCheckResult? get lastSecurityCheck =>
//       throw _privateConstructorUsedError;
//   bool get isSecurityCompromised => throw _privateConstructorUsedError;

//   @JsonKey(ignore: true)
//   $RootDetectionStateCopyWith<RootDetectionState> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $RootDetectionStateCopyWith<$Res> {
//   factory $RootDetectionStateCopyWith(
//           RootDetectionState value, $Res Function(RootDetectionState) then) =
//       _$RootDetectionStateCopyWithImpl<$Res, RootDetectionState>;
//   @useResult
//   $Res call(
//       {bool? isRooted,
//       bool isPeriodicCheckRunning,
//       SecurityCheckResult? lastSecurityCheck,
//       bool isSecurityCompromised});
// }

// /// @nodoc
// class _$RootDetectionStateCopyWithImpl<$Res, $Val extends RootDetectionState>
//     implements $RootDetectionStateCopyWith<$Res> {
//   _$RootDetectionStateCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? isRooted = freezed,
//     Object? isPeriodicCheckRunning = null,
//     Object? lastSecurityCheck = freezed,
//     Object? isSecurityCompromised = null,
//   }) {
//     return _then(_value.copyWith(
//       isRooted: freezed == isRooted
//           ? _value.isRooted
//           : isRooted // ignore: cast_nullable_to_non_nullable
//               as bool?,
//       isPeriodicCheckRunning: null == isPeriodicCheckRunning
//           ? _value.isPeriodicCheckRunning
//           : isPeriodicCheckRunning // ignore: cast_nullable_to_non_nullable
//               as bool,
//       lastSecurityCheck: freezed == lastSecurityCheck
//           ? _value.lastSecurityCheck
//           : lastSecurityCheck // ignore: cast_nullable_to_non_nullable
//               as SecurityCheckResult?,
//       isSecurityCompromised: null == isSecurityCompromised
//           ? _value.isSecurityCompromised
//           : isSecurityCompromised // ignore: cast_nullable_to_non_nullable
//               as bool,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$RootDetectionStateImplCopyWith<$Res>
//     implements $RootDetectionStateCopyWith<$Res> {
//   factory _$$RootDetectionStateImplCopyWith(_$RootDetectionStateImpl value,
//           $Res Function(_$RootDetectionStateImpl) then) =
//       __$$RootDetectionStateImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call(
//       {bool? isRooted,
//       bool isPeriodicCheckRunning,
//       SecurityCheckResult? lastSecurityCheck,
//       bool isSecurityCompromised});
// }

// /// @nodoc
// class __$$RootDetectionStateImplCopyWithImpl<$Res>
//     extends _$RootDetectionStateCopyWithImpl<$Res, _$RootDetectionStateImpl>
//     implements _$$RootDetectionStateImplCopyWith<$Res> {
//   __$$RootDetectionStateImplCopyWithImpl(_$RootDetectionStateImpl _value,
//       $Res Function(_$RootDetectionStateImpl) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? isRooted = freezed,
//     Object? isPeriodicCheckRunning = null,
//     Object? lastSecurityCheck = freezed,
//     Object? isSecurityCompromised = null,
//   }) {
//     return _then(_$RootDetectionStateImpl(
//       isRooted: freezed == isRooted
//           ? _value.isRooted
//           : isRooted // ignore: cast_nullable_to_non_nullable
//               as bool?,
//       isPeriodicCheckRunning: null == isPeriodicCheckRunning
//           ? _value.isPeriodicCheckRunning
//           : isPeriodicCheckRunning // ignore: cast_nullable_to_non_nullable
//               as bool,
//       lastSecurityCheck: freezed == lastSecurityCheck
//           ? _value.lastSecurityCheck
//           : lastSecurityCheck // ignore: cast_nullable_to_non_nullable
//               as SecurityCheckResult?,
//       isSecurityCompromised: null == isSecurityCompromised
//           ? _value.isSecurityCompromised
//           : isSecurityCompromised // ignore: cast_nullable_to_non_nullable
//               as bool,
//     ));
//   }
// }

// /// @nodoc

// class _$RootDetectionStateImpl
//     with DiagnosticableTreeMixin
//     implements _RootDetectionState {
//   const _$RootDetectionStateImpl(
//       {this.isRooted,
//       this.isPeriodicCheckRunning = false,
//       this.lastSecurityCheck,
//       this.isSecurityCompromised = false});

//   @override
//   final bool? isRooted;
//   @override
//   @JsonKey()
//   final bool isPeriodicCheckRunning;
//   @override
//   final SecurityCheckResult? lastSecurityCheck;
//   @override
//   @JsonKey()
//   final bool isSecurityCompromised;

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'RootDetectionState(isRooted: $isRooted, isPeriodicCheckRunning: $isPeriodicCheckRunning, lastSecurityCheck: $lastSecurityCheck, isSecurityCompromised: $isSecurityCompromised)';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'RootDetectionState'))
//       ..add(DiagnosticsProperty('isRooted', isRooted))
//       ..add(
//           DiagnosticsProperty('isPeriodicCheckRunning', isPeriodicCheckRunning))
//       ..add(DiagnosticsProperty('lastSecurityCheck', lastSecurityCheck))
//       ..add(
//           DiagnosticsProperty('isSecurityCompromised', isSecurityCompromised));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$RootDetectionStateImpl &&
//             (identical(other.isRooted, isRooted) ||
//                 other.isRooted == isRooted) &&
//             (identical(other.isPeriodicCheckRunning, isPeriodicCheckRunning) ||
//                 other.isPeriodicCheckRunning == isPeriodicCheckRunning) &&
//             (identical(other.lastSecurityCheck, lastSecurityCheck) ||
//                 other.lastSecurityCheck == lastSecurityCheck) &&
//             (identical(other.isSecurityCompromised, isSecurityCompromised) ||
//                 other.isSecurityCompromised == isSecurityCompromised));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, isRooted, isPeriodicCheckRunning,
//       lastSecurityCheck, isSecurityCompromised);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$RootDetectionStateImplCopyWith<_$RootDetectionStateImpl> get copyWith =>
//       __$$RootDetectionStateImplCopyWithImpl<_$RootDetectionStateImpl>(
//           this, _$identity);
// }

// abstract class _RootDetectionState implements RootDetectionState {
//   const factory _RootDetectionState(
//       {final bool? isRooted,
//       final bool isPeriodicCheckRunning,
//       final SecurityCheckResult? lastSecurityCheck,
//       final bool isSecurityCompromised}) = _$RootDetectionStateImpl;

//   @override
//   bool? get isRooted;
//   @override
//   bool get isPeriodicCheckRunning;
//   @override
//   SecurityCheckResult? get lastSecurityCheck;
//   @override
//   bool get isSecurityCompromised;
//   @override
//   @JsonKey(ignore: true)
//   _$$RootDetectionStateImplCopyWith<_$RootDetectionStateImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }
