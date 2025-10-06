// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_referral_reconciliations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchReferralsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String searchText) searchByName,
    required TResult Function(String tag) searchByTag,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String searchText)? searchByName,
    TResult? Function(String tag)? searchByTag,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String searchText)? searchByName,
    TResult Function(String tag)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchReferralsInitializedEvent value) initialize,
    required TResult Function(SearchReferralsByNameEvent value) searchByName,
    required TResult Function(SearchReferralsByTagEvent value) searchByTag,
    required TResult Function(SearchReferralsClearEvent value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchReferralsInitializedEvent value)? initialize,
    TResult? Function(SearchReferralsByNameEvent value)? searchByName,
    TResult? Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult? Function(SearchReferralsClearEvent value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchReferralsInitializedEvent value)? initialize,
    TResult Function(SearchReferralsByNameEvent value)? searchByName,
    TResult Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult Function(SearchReferralsClearEvent value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchReferralsEventCopyWith<$Res> {
  factory $SearchReferralsEventCopyWith(SearchReferralsEvent value,
          $Res Function(SearchReferralsEvent) then) =
      _$SearchReferralsEventCopyWithImpl<$Res, SearchReferralsEvent>;
}

/// @nodoc
class _$SearchReferralsEventCopyWithImpl<$Res,
        $Val extends SearchReferralsEvent>
    implements $SearchReferralsEventCopyWith<$Res> {
  _$SearchReferralsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchReferralsInitializedEventImplCopyWith<$Res> {
  factory _$$SearchReferralsInitializedEventImplCopyWith(
          _$SearchReferralsInitializedEventImpl value,
          $Res Function(_$SearchReferralsInitializedEventImpl) then) =
      __$$SearchReferralsInitializedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchReferralsInitializedEventImplCopyWithImpl<$Res>
    extends _$SearchReferralsEventCopyWithImpl<$Res,
        _$SearchReferralsInitializedEventImpl>
    implements _$$SearchReferralsInitializedEventImplCopyWith<$Res> {
  __$$SearchReferralsInitializedEventImplCopyWithImpl(
      _$SearchReferralsInitializedEventImpl _value,
      $Res Function(_$SearchReferralsInitializedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchReferralsInitializedEventImpl
    with DiagnosticableTreeMixin
    implements SearchReferralsInitializedEvent {
  const _$SearchReferralsInitializedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchReferralsEvent.initialize()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'SearchReferralsEvent.initialize'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchReferralsInitializedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String searchText) searchByName,
    required TResult Function(String tag) searchByTag,
    required TResult Function() clear,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String searchText)? searchByName,
    TResult? Function(String tag)? searchByTag,
    TResult? Function()? clear,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String searchText)? searchByName,
    TResult Function(String tag)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchReferralsInitializedEvent value) initialize,
    required TResult Function(SearchReferralsByNameEvent value) searchByName,
    required TResult Function(SearchReferralsByTagEvent value) searchByTag,
    required TResult Function(SearchReferralsClearEvent value) clear,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchReferralsInitializedEvent value)? initialize,
    TResult? Function(SearchReferralsByNameEvent value)? searchByName,
    TResult? Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult? Function(SearchReferralsClearEvent value)? clear,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchReferralsInitializedEvent value)? initialize,
    TResult Function(SearchReferralsByNameEvent value)? searchByName,
    TResult Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult Function(SearchReferralsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class SearchReferralsInitializedEvent implements SearchReferralsEvent {
  const factory SearchReferralsInitializedEvent() =
      _$SearchReferralsInitializedEventImpl;
}

/// @nodoc
abstract class _$$SearchReferralsByNameEventImplCopyWith<$Res> {
  factory _$$SearchReferralsByNameEventImplCopyWith(
          _$SearchReferralsByNameEventImpl value,
          $Res Function(_$SearchReferralsByNameEventImpl) then) =
      __$$SearchReferralsByNameEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$SearchReferralsByNameEventImplCopyWithImpl<$Res>
    extends _$SearchReferralsEventCopyWithImpl<$Res,
        _$SearchReferralsByNameEventImpl>
    implements _$$SearchReferralsByNameEventImplCopyWith<$Res> {
  __$$SearchReferralsByNameEventImplCopyWithImpl(
      _$SearchReferralsByNameEventImpl _value,
      $Res Function(_$SearchReferralsByNameEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$SearchReferralsByNameEventImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchReferralsByNameEventImpl
    with DiagnosticableTreeMixin
    implements SearchReferralsByNameEvent {
  const _$SearchReferralsByNameEventImpl({required this.searchText});

  @override
  final String searchText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchReferralsEvent.searchByName(searchText: $searchText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchReferralsEvent.searchByName'))
      ..add(DiagnosticsProperty('searchText', searchText));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchReferralsByNameEventImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchReferralsByNameEventImplCopyWith<_$SearchReferralsByNameEventImpl>
      get copyWith => __$$SearchReferralsByNameEventImplCopyWithImpl<
          _$SearchReferralsByNameEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String searchText) searchByName,
    required TResult Function(String tag) searchByTag,
    required TResult Function() clear,
  }) {
    return searchByName(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String searchText)? searchByName,
    TResult? Function(String tag)? searchByTag,
    TResult? Function()? clear,
  }) {
    return searchByName?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String searchText)? searchByName,
    TResult Function(String tag)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (searchByName != null) {
      return searchByName(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchReferralsInitializedEvent value) initialize,
    required TResult Function(SearchReferralsByNameEvent value) searchByName,
    required TResult Function(SearchReferralsByTagEvent value) searchByTag,
    required TResult Function(SearchReferralsClearEvent value) clear,
  }) {
    return searchByName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchReferralsInitializedEvent value)? initialize,
    TResult? Function(SearchReferralsByNameEvent value)? searchByName,
    TResult? Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult? Function(SearchReferralsClearEvent value)? clear,
  }) {
    return searchByName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchReferralsInitializedEvent value)? initialize,
    TResult Function(SearchReferralsByNameEvent value)? searchByName,
    TResult Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult Function(SearchReferralsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchByName != null) {
      return searchByName(this);
    }
    return orElse();
  }
}

abstract class SearchReferralsByNameEvent implements SearchReferralsEvent {
  const factory SearchReferralsByNameEvent({required final String searchText}) =
      _$SearchReferralsByNameEventImpl;

  String get searchText;
  @JsonKey(ignore: true)
  _$$SearchReferralsByNameEventImplCopyWith<_$SearchReferralsByNameEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchReferralsByTagEventImplCopyWith<$Res> {
  factory _$$SearchReferralsByTagEventImplCopyWith(
          _$SearchReferralsByTagEventImpl value,
          $Res Function(_$SearchReferralsByTagEventImpl) then) =
      __$$SearchReferralsByTagEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tag});
}

/// @nodoc
class __$$SearchReferralsByTagEventImplCopyWithImpl<$Res>
    extends _$SearchReferralsEventCopyWithImpl<$Res,
        _$SearchReferralsByTagEventImpl>
    implements _$$SearchReferralsByTagEventImplCopyWith<$Res> {
  __$$SearchReferralsByTagEventImplCopyWithImpl(
      _$SearchReferralsByTagEventImpl _value,
      $Res Function(_$SearchReferralsByTagEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
  }) {
    return _then(_$SearchReferralsByTagEventImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchReferralsByTagEventImpl
    with DiagnosticableTreeMixin
    implements SearchReferralsByTagEvent {
  const _$SearchReferralsByTagEventImpl({required this.tag});

  @override
  final String tag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchReferralsEvent.searchByTag(tag: $tag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchReferralsEvent.searchByTag'))
      ..add(DiagnosticsProperty('tag', tag));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchReferralsByTagEventImpl &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchReferralsByTagEventImplCopyWith<_$SearchReferralsByTagEventImpl>
      get copyWith => __$$SearchReferralsByTagEventImplCopyWithImpl<
          _$SearchReferralsByTagEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String searchText) searchByName,
    required TResult Function(String tag) searchByTag,
    required TResult Function() clear,
  }) {
    return searchByTag(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String searchText)? searchByName,
    TResult? Function(String tag)? searchByTag,
    TResult? Function()? clear,
  }) {
    return searchByTag?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String searchText)? searchByName,
    TResult Function(String tag)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (searchByTag != null) {
      return searchByTag(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchReferralsInitializedEvent value) initialize,
    required TResult Function(SearchReferralsByNameEvent value) searchByName,
    required TResult Function(SearchReferralsByTagEvent value) searchByTag,
    required TResult Function(SearchReferralsClearEvent value) clear,
  }) {
    return searchByTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchReferralsInitializedEvent value)? initialize,
    TResult? Function(SearchReferralsByNameEvent value)? searchByName,
    TResult? Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult? Function(SearchReferralsClearEvent value)? clear,
  }) {
    return searchByTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchReferralsInitializedEvent value)? initialize,
    TResult Function(SearchReferralsByNameEvent value)? searchByName,
    TResult Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult Function(SearchReferralsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchByTag != null) {
      return searchByTag(this);
    }
    return orElse();
  }
}

abstract class SearchReferralsByTagEvent implements SearchReferralsEvent {
  const factory SearchReferralsByTagEvent({required final String tag}) =
      _$SearchReferralsByTagEventImpl;

  String get tag;
  @JsonKey(ignore: true)
  _$$SearchReferralsByTagEventImplCopyWith<_$SearchReferralsByTagEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchReferralsClearEventImplCopyWith<$Res> {
  factory _$$SearchReferralsClearEventImplCopyWith(
          _$SearchReferralsClearEventImpl value,
          $Res Function(_$SearchReferralsClearEventImpl) then) =
      __$$SearchReferralsClearEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchReferralsClearEventImplCopyWithImpl<$Res>
    extends _$SearchReferralsEventCopyWithImpl<$Res,
        _$SearchReferralsClearEventImpl>
    implements _$$SearchReferralsClearEventImplCopyWith<$Res> {
  __$$SearchReferralsClearEventImplCopyWithImpl(
      _$SearchReferralsClearEventImpl _value,
      $Res Function(_$SearchReferralsClearEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchReferralsClearEventImpl
    with DiagnosticableTreeMixin
    implements SearchReferralsClearEvent {
  const _$SearchReferralsClearEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchReferralsEvent.clear()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SearchReferralsEvent.clear'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchReferralsClearEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String searchText) searchByName,
    required TResult Function(String tag) searchByTag,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String searchText)? searchByName,
    TResult? Function(String tag)? searchByTag,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String searchText)? searchByName,
    TResult Function(String tag)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchReferralsInitializedEvent value) initialize,
    required TResult Function(SearchReferralsByNameEvent value) searchByName,
    required TResult Function(SearchReferralsByTagEvent value) searchByTag,
    required TResult Function(SearchReferralsClearEvent value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchReferralsInitializedEvent value)? initialize,
    TResult? Function(SearchReferralsByNameEvent value)? searchByName,
    TResult? Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult? Function(SearchReferralsClearEvent value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchReferralsInitializedEvent value)? initialize,
    TResult Function(SearchReferralsByNameEvent value)? searchByName,
    TResult Function(SearchReferralsByTagEvent value)? searchByTag,
    TResult Function(SearchReferralsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class SearchReferralsClearEvent implements SearchReferralsEvent {
  const factory SearchReferralsClearEvent() = _$SearchReferralsClearEventImpl;
}

/// @nodoc
mixin _$SearchReferralsState {
  bool get loading => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  List<HFReferralModel> get referrals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchReferralsStateCopyWith<SearchReferralsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchReferralsStateCopyWith<$Res> {
  factory $SearchReferralsStateCopyWith(SearchReferralsState value,
          $Res Function(SearchReferralsState) then) =
      _$SearchReferralsStateCopyWithImpl<$Res, SearchReferralsState>;
  @useResult
  $Res call(
      {bool loading,
      String? searchQuery,
      String? tag,
      List<HFReferralModel> referrals});
}

/// @nodoc
class _$SearchReferralsStateCopyWithImpl<$Res,
        $Val extends SearchReferralsState>
    implements $SearchReferralsStateCopyWith<$Res> {
  _$SearchReferralsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? searchQuery = freezed,
    Object? tag = freezed,
    Object? referrals = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      referrals: null == referrals
          ? _value.referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<HFReferralModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchReferralsStateImplCopyWith<$Res>
    implements $SearchReferralsStateCopyWith<$Res> {
  factory _$$SearchReferralsStateImplCopyWith(_$SearchReferralsStateImpl value,
          $Res Function(_$SearchReferralsStateImpl) then) =
      __$$SearchReferralsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      String? searchQuery,
      String? tag,
      List<HFReferralModel> referrals});
}

/// @nodoc
class __$$SearchReferralsStateImplCopyWithImpl<$Res>
    extends _$SearchReferralsStateCopyWithImpl<$Res, _$SearchReferralsStateImpl>
    implements _$$SearchReferralsStateImplCopyWith<$Res> {
  __$$SearchReferralsStateImplCopyWithImpl(_$SearchReferralsStateImpl _value,
      $Res Function(_$SearchReferralsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? searchQuery = freezed,
    Object? tag = freezed,
    Object? referrals = null,
  }) {
    return _then(_$SearchReferralsStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      referrals: null == referrals
          ? _value._referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<HFReferralModel>,
    ));
  }
}

/// @nodoc

class _$SearchReferralsStateImpl extends _SearchReferralsState
    with DiagnosticableTreeMixin {
  const _$SearchReferralsStateImpl(
      {this.loading = false,
      this.searchQuery,
      this.tag,
      final List<HFReferralModel> referrals = const []})
      : _referrals = referrals,
        super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? searchQuery;
  @override
  final String? tag;
  final List<HFReferralModel> _referrals;
  @override
  @JsonKey()
  List<HFReferralModel> get referrals {
    if (_referrals is EqualUnmodifiableListView) return _referrals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referrals);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchReferralsState(loading: $loading, searchQuery: $searchQuery, tag: $tag, referrals: $referrals)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchReferralsState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('searchQuery', searchQuery))
      ..add(DiagnosticsProperty('tag', tag))
      ..add(DiagnosticsProperty('referrals', referrals));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchReferralsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality()
                .equals(other._referrals, _referrals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, searchQuery, tag,
      const DeepCollectionEquality().hash(_referrals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchReferralsStateImplCopyWith<_$SearchReferralsStateImpl>
      get copyWith =>
          __$$SearchReferralsStateImplCopyWithImpl<_$SearchReferralsStateImpl>(
              this, _$identity);
}

abstract class _SearchReferralsState extends SearchReferralsState {
  const factory _SearchReferralsState(
      {final bool loading,
      final String? searchQuery,
      final String? tag,
      final List<HFReferralModel> referrals}) = _$SearchReferralsStateImpl;
  const _SearchReferralsState._() : super._();

  @override
  bool get loading;
  @override
  String? get searchQuery;
  @override
  String? get tag;
  @override
  List<HFReferralModel> get referrals;
  @override
  @JsonKey(ignore: true)
  _$$SearchReferralsStateImplCopyWith<_$SearchReferralsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
