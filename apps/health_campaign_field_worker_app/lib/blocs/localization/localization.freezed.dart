// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalizationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String module, String tenantId, String locale, String path)
        onLoadLocalization,
    required TResult Function(int index, String code) onUpdateLocalizationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String module, String tenantId, String locale, String path)?
        onLoadLocalization,
    TResult? Function(int index, String code)? onUpdateLocalizationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String module, String tenantId, String locale, String path)?
        onLoadLocalization,
    TResult Function(int index, String code)? onUpdateLocalizationIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLocalizationEvent value) onLoadLocalization,
    required TResult Function(OnUpdateLocalizationIndexEvent value)
        onUpdateLocalizationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult? Function(OnUpdateLocalizationIndexEvent value)?
        onUpdateLocalizationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult Function(OnUpdateLocalizationIndexEvent value)?
        onUpdateLocalizationIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationEventCopyWith<$Res> {
  factory $LocalizationEventCopyWith(
          LocalizationEvent value, $Res Function(LocalizationEvent) then) =
      _$LocalizationEventCopyWithImpl<$Res, LocalizationEvent>;
}

/// @nodoc
class _$LocalizationEventCopyWithImpl<$Res, $Val extends LocalizationEvent>
    implements $LocalizationEventCopyWith<$Res> {
  _$LocalizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadLocalizationEventImplCopyWith<$Res> {
  factory _$$OnLoadLocalizationEventImplCopyWith(
          _$OnLoadLocalizationEventImpl value,
          $Res Function(_$OnLoadLocalizationEventImpl) then) =
      __$$OnLoadLocalizationEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String module, String tenantId, String locale, String path});
}

/// @nodoc
class __$$OnLoadLocalizationEventImplCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res, _$OnLoadLocalizationEventImpl>
    implements _$$OnLoadLocalizationEventImplCopyWith<$Res> {
  __$$OnLoadLocalizationEventImplCopyWithImpl(
      _$OnLoadLocalizationEventImpl _value,
      $Res Function(_$OnLoadLocalizationEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? tenantId = null,
    Object? locale = null,
    Object? path = null,
  }) {
    return _then(_$OnLoadLocalizationEventImpl(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadLocalizationEventImpl implements OnLoadLocalizationEvent {
  const _$OnLoadLocalizationEventImpl(
      {required this.module,
      required this.tenantId,
      required this.locale,
      required this.path});

  @override
  final String module;
  @override
  final String tenantId;
  @override
  final String locale;
  @override
  final String path;

  @override
  String toString() {
    return 'LocalizationEvent.onLoadLocalization(module: $module, tenantId: $tenantId, locale: $locale, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadLocalizationEventImpl &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, module, tenantId, locale, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadLocalizationEventImplCopyWith<_$OnLoadLocalizationEventImpl>
      get copyWith => __$$OnLoadLocalizationEventImplCopyWithImpl<
          _$OnLoadLocalizationEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String module, String tenantId, String locale, String path)
        onLoadLocalization,
    required TResult Function(int index, String code) onUpdateLocalizationIndex,
  }) {
    return onLoadLocalization(module, tenantId, locale, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String module, String tenantId, String locale, String path)?
        onLoadLocalization,
    TResult? Function(int index, String code)? onUpdateLocalizationIndex,
  }) {
    return onLoadLocalization?.call(module, tenantId, locale, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String module, String tenantId, String locale, String path)?
        onLoadLocalization,
    TResult Function(int index, String code)? onUpdateLocalizationIndex,
    required TResult orElse(),
  }) {
    if (onLoadLocalization != null) {
      return onLoadLocalization(module, tenantId, locale, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLocalizationEvent value) onLoadLocalization,
    required TResult Function(OnUpdateLocalizationIndexEvent value)
        onUpdateLocalizationIndex,
  }) {
    return onLoadLocalization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult? Function(OnUpdateLocalizationIndexEvent value)?
        onUpdateLocalizationIndex,
  }) {
    return onLoadLocalization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult Function(OnUpdateLocalizationIndexEvent value)?
        onUpdateLocalizationIndex,
    required TResult orElse(),
  }) {
    if (onLoadLocalization != null) {
      return onLoadLocalization(this);
    }
    return orElse();
  }
}

abstract class OnLoadLocalizationEvent implements LocalizationEvent {
  const factory OnLoadLocalizationEvent(
      {required final String module,
      required final String tenantId,
      required final String locale,
      required final String path}) = _$OnLoadLocalizationEventImpl;

  String get module;
  String get tenantId;
  String get locale;
  String get path;
  @JsonKey(ignore: true)
  _$$OnLoadLocalizationEventImplCopyWith<_$OnLoadLocalizationEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateLocalizationIndexEventImplCopyWith<$Res> {
  factory _$$OnUpdateLocalizationIndexEventImplCopyWith(
          _$OnUpdateLocalizationIndexEventImpl value,
          $Res Function(_$OnUpdateLocalizationIndexEventImpl) then) =
      __$$OnUpdateLocalizationIndexEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, String code});
}

/// @nodoc
class __$$OnUpdateLocalizationIndexEventImplCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res,
        _$OnUpdateLocalizationIndexEventImpl>
    implements _$$OnUpdateLocalizationIndexEventImplCopyWith<$Res> {
  __$$OnUpdateLocalizationIndexEventImplCopyWithImpl(
      _$OnUpdateLocalizationIndexEventImpl _value,
      $Res Function(_$OnUpdateLocalizationIndexEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? code = null,
  }) {
    return _then(_$OnUpdateLocalizationIndexEventImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnUpdateLocalizationIndexEventImpl
    implements OnUpdateLocalizationIndexEvent {
  const _$OnUpdateLocalizationIndexEventImpl(
      {required this.index, required this.code});

  @override
  final int index;
  @override
  final String code;

  @override
  String toString() {
    return 'LocalizationEvent.onUpdateLocalizationIndex(index: $index, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateLocalizationIndexEventImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUpdateLocalizationIndexEventImplCopyWith<
          _$OnUpdateLocalizationIndexEventImpl>
      get copyWith => __$$OnUpdateLocalizationIndexEventImplCopyWithImpl<
          _$OnUpdateLocalizationIndexEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String module, String tenantId, String locale, String path)
        onLoadLocalization,
    required TResult Function(int index, String code) onUpdateLocalizationIndex,
  }) {
    return onUpdateLocalizationIndex(index, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String module, String tenantId, String locale, String path)?
        onLoadLocalization,
    TResult? Function(int index, String code)? onUpdateLocalizationIndex,
  }) {
    return onUpdateLocalizationIndex?.call(index, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String module, String tenantId, String locale, String path)?
        onLoadLocalization,
    TResult Function(int index, String code)? onUpdateLocalizationIndex,
    required TResult orElse(),
  }) {
    if (onUpdateLocalizationIndex != null) {
      return onUpdateLocalizationIndex(index, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLocalizationEvent value) onLoadLocalization,
    required TResult Function(OnUpdateLocalizationIndexEvent value)
        onUpdateLocalizationIndex,
  }) {
    return onUpdateLocalizationIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult? Function(OnUpdateLocalizationIndexEvent value)?
        onUpdateLocalizationIndex,
  }) {
    return onUpdateLocalizationIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult Function(OnUpdateLocalizationIndexEvent value)?
        onUpdateLocalizationIndex,
    required TResult orElse(),
  }) {
    if (onUpdateLocalizationIndex != null) {
      return onUpdateLocalizationIndex(this);
    }
    return orElse();
  }
}

abstract class OnUpdateLocalizationIndexEvent implements LocalizationEvent {
  const factory OnUpdateLocalizationIndexEvent(
      {required final int index,
      required final String code}) = _$OnUpdateLocalizationIndexEventImpl;

  int get index;
  String get code;
  @JsonKey(ignore: true)
  _$$OnUpdateLocalizationIndexEventImplCopyWith<
          _$OnUpdateLocalizationIndexEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocalizationState {
  bool get loading => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  bool get isLocalizationLoadCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationStateCopyWith<LocalizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
          LocalizationState value, $Res Function(LocalizationState) then) =
      _$LocalizationStateCopyWithImpl<$Res, LocalizationState>;
  @useResult
  $Res call({bool loading, int index, bool isLocalizationLoadCompleted});
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res, $Val extends LocalizationState>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? index = null,
    Object? isLocalizationLoadCompleted = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isLocalizationLoadCompleted: null == isLocalizationLoadCompleted
          ? _value.isLocalizationLoadCompleted
          : isLocalizationLoadCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationStateImplCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$LocalizationStateImplCopyWith(_$LocalizationStateImpl value,
          $Res Function(_$LocalizationStateImpl) then) =
      __$$LocalizationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, int index, bool isLocalizationLoadCompleted});
}

/// @nodoc
class __$$LocalizationStateImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LocalizationStateImpl>
    implements _$$LocalizationStateImplCopyWith<$Res> {
  __$$LocalizationStateImplCopyWithImpl(_$LocalizationStateImpl _value,
      $Res Function(_$LocalizationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? index = null,
    Object? isLocalizationLoadCompleted = null,
  }) {
    return _then(_$LocalizationStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isLocalizationLoadCompleted: null == isLocalizationLoadCompleted
          ? _value.isLocalizationLoadCompleted
          : isLocalizationLoadCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LocalizationStateImpl implements _LocalizationState {
  const _$LocalizationStateImpl(
      {this.loading = false,
      this.index = 0,
      this.isLocalizationLoadCompleted = false});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final bool isLocalizationLoadCompleted;

  @override
  String toString() {
    return 'LocalizationState(loading: $loading, index: $index, isLocalizationLoadCompleted: $isLocalizationLoadCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isLocalizationLoadCompleted,
                    isLocalizationLoadCompleted) ||
                other.isLocalizationLoadCompleted ==
                    isLocalizationLoadCompleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, index, isLocalizationLoadCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationStateImplCopyWith<_$LocalizationStateImpl> get copyWith =>
      __$$LocalizationStateImplCopyWithImpl<_$LocalizationStateImpl>(
          this, _$identity);
}

abstract class _LocalizationState implements LocalizationState {
  const factory _LocalizationState(
      {final bool loading,
      final int index,
      final bool isLocalizationLoadCompleted}) = _$LocalizationStateImpl;

  @override
  bool get loading;
  @override
  int get index;
  @override
  bool get isLocalizationLoadCompleted;
  @override
  @JsonKey(ignore: true)
  _$$LocalizationStateImplCopyWith<_$LocalizationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
