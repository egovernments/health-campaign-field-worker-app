// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CacheProgressState {
  DownloadProgress? get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CacheProgressStateCopyWith<CacheProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheProgressStateCopyWith<$Res> {
  factory $CacheProgressStateCopyWith(
          CacheProgressState value, $Res Function(CacheProgressState) then) =
      _$CacheProgressStateCopyWithImpl<$Res, CacheProgressState>;
  @useResult
  $Res call({DownloadProgress? progress});
}

/// @nodoc
class _$CacheProgressStateCopyWithImpl<$Res, $Val extends CacheProgressState>
    implements $CacheProgressStateCopyWith<$Res> {
  _$CacheProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as DownloadProgress?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CacheProgressStateImplCopyWith<$Res>
    implements $CacheProgressStateCopyWith<$Res> {
  factory _$$CacheProgressStateImplCopyWith(_$CacheProgressStateImpl value,
          $Res Function(_$CacheProgressStateImpl) then) =
      __$$CacheProgressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DownloadProgress? progress});
}

/// @nodoc
class __$$CacheProgressStateImplCopyWithImpl<$Res>
    extends _$CacheProgressStateCopyWithImpl<$Res, _$CacheProgressStateImpl>
    implements _$$CacheProgressStateImplCopyWith<$Res> {
  __$$CacheProgressStateImplCopyWithImpl(_$CacheProgressStateImpl _value,
      $Res Function(_$CacheProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(_$CacheProgressStateImpl(
      freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as DownloadProgress?,
    ));
  }
}

/// @nodoc

class _$CacheProgressStateImpl implements _CacheProgressState {
  const _$CacheProgressStateImpl([this.progress]);

  @override
  final DownloadProgress? progress;

  @override
  String toString() {
    return 'CacheProgressState(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheProgressStateImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheProgressStateImplCopyWith<_$CacheProgressStateImpl> get copyWith =>
      __$$CacheProgressStateImplCopyWithImpl<_$CacheProgressStateImpl>(
          this, _$identity);
}

abstract class _CacheProgressState implements CacheProgressState {
  const factory _CacheProgressState([final DownloadProgress? progress]) =
      _$CacheProgressStateImpl;

  @override
  DownloadProgress? get progress;
  @override
  @JsonKey(ignore: true)
  _$$CacheProgressStateImplCopyWith<_$CacheProgressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
