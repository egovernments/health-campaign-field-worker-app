// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'digit_icon_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DigitIconCardWrapperModel {
  List<DigitIconCardModel> get digitIconCards =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DigitIconCardWrapperModelCopyWith<DigitIconCardWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitIconCardWrapperModelCopyWith<$Res> {
  factory $DigitIconCardWrapperModelCopyWith(DigitIconCardWrapperModel value,
          $Res Function(DigitIconCardWrapperModel) then) =
      _$DigitIconCardWrapperModelCopyWithImpl<$Res, DigitIconCardWrapperModel>;
  @useResult
  $Res call({List<DigitIconCardModel> digitIconCards});
}

/// @nodoc
class _$DigitIconCardWrapperModelCopyWithImpl<$Res,
        $Val extends DigitIconCardWrapperModel>
    implements $DigitIconCardWrapperModelCopyWith<$Res> {
  _$DigitIconCardWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digitIconCards = null,
  }) {
    return _then(_value.copyWith(
      digitIconCards: null == digitIconCards
          ? _value.digitIconCards
          : digitIconCards // ignore: cast_nullable_to_non_nullable
              as List<DigitIconCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DigitIconCardWrapperModelCopyWith<$Res>
    implements $DigitIconCardWrapperModelCopyWith<$Res> {
  factory _$$_DigitIconCardWrapperModelCopyWith(
          _$_DigitIconCardWrapperModel value,
          $Res Function(_$_DigitIconCardWrapperModel) then) =
      __$$_DigitIconCardWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DigitIconCardModel> digitIconCards});
}

/// @nodoc
class __$$_DigitIconCardWrapperModelCopyWithImpl<$Res>
    extends _$DigitIconCardWrapperModelCopyWithImpl<$Res,
        _$_DigitIconCardWrapperModel>
    implements _$$_DigitIconCardWrapperModelCopyWith<$Res> {
  __$$_DigitIconCardWrapperModelCopyWithImpl(
      _$_DigitIconCardWrapperModel _value,
      $Res Function(_$_DigitIconCardWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digitIconCards = null,
  }) {
    return _then(_$_DigitIconCardWrapperModel(
      digitIconCards: null == digitIconCards
          ? _value._digitIconCards
          : digitIconCards // ignore: cast_nullable_to_non_nullable
              as List<DigitIconCardModel>,
    ));
  }
}

/// @nodoc

class _$_DigitIconCardWrapperModel implements _DigitIconCardWrapperModel {
  const _$_DigitIconCardWrapperModel(
      {final List<DigitIconCardModel> digitIconCards = const []})
      : _digitIconCards = digitIconCards;

  final List<DigitIconCardModel> _digitIconCards;
  @override
  @JsonKey()
  List<DigitIconCardModel> get digitIconCards {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_digitIconCards);
  }

  @override
  String toString() {
    return 'DigitIconCardWrapperModel(digitIconCards: $digitIconCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DigitIconCardWrapperModel &&
            const DeepCollectionEquality()
                .equals(other._digitIconCards, _digitIconCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_digitIconCards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DigitIconCardWrapperModelCopyWith<_$_DigitIconCardWrapperModel>
      get copyWith => __$$_DigitIconCardWrapperModelCopyWithImpl<
          _$_DigitIconCardWrapperModel>(this, _$identity);
}

abstract class _DigitIconCardWrapperModel implements DigitIconCardWrapperModel {
  const factory _DigitIconCardWrapperModel(
          {final List<DigitIconCardModel> digitIconCards}) =
      _$_DigitIconCardWrapperModel;

  @override
  List<DigitIconCardModel> get digitIconCards;
  @override
  @JsonKey(ignore: true)
  _$$_DigitIconCardWrapperModelCopyWith<_$_DigitIconCardWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DigitIconCardModel {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get widgetKey => throw _privateConstructorUsedError;
  VoidCallback? get onPressed => throw _privateConstructorUsedError;
  int get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DigitIconCardModelCopyWith<DigitIconCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitIconCardModelCopyWith<$Res> {
  factory $DigitIconCardModelCopyWith(
          DigitIconCardModel value, $Res Function(DigitIconCardModel) then) =
      _$DigitIconCardModelCopyWithImpl<$Res, DigitIconCardModel>;
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String widgetKey,
      VoidCallback? onPressed,
      int icon});
}

/// @nodoc
class _$DigitIconCardModelCopyWithImpl<$Res, $Val extends DigitIconCardModel>
    implements $DigitIconCardModelCopyWith<$Res> {
  _$DigitIconCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? widgetKey = null,
    Object? onPressed = freezed,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DigitIconCardModelCopyWith<$Res>
    implements $DigitIconCardModelCopyWith<$Res> {
  factory _$$_DigitIconCardModelCopyWith(_$_DigitIconCardModel value,
          $Res Function(_$_DigitIconCardModel) then) =
      __$$_DigitIconCardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String widgetKey,
      VoidCallback? onPressed,
      int icon});
}

/// @nodoc
class __$$_DigitIconCardModelCopyWithImpl<$Res>
    extends _$DigitIconCardModelCopyWithImpl<$Res, _$_DigitIconCardModel>
    implements _$$_DigitIconCardModelCopyWith<$Res> {
  __$$_DigitIconCardModelCopyWithImpl(
      _$_DigitIconCardModel _value, $Res Function(_$_DigitIconCardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? widgetKey = null,
    Object? onPressed = freezed,
    Object? icon = null,
  }) {
    return _then(_$_DigitIconCardModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DigitIconCardModel implements _DigitIconCardModel {
  const _$_DigitIconCardModel(
      {required this.title,
      required this.subtitle,
      required this.widgetKey,
      this.onPressed,
      required this.icon});

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String widgetKey;
  @override
  final VoidCallback? onPressed;
  @override
  final int icon;

  @override
  String toString() {
    return 'DigitIconCardModel(title: $title, subtitle: $subtitle, widgetKey: $widgetKey, onPressed: $onPressed, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DigitIconCardModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.widgetKey, widgetKey) ||
                other.widgetKey == widgetKey) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subtitle, widgetKey, onPressed, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DigitIconCardModelCopyWith<_$_DigitIconCardModel> get copyWith =>
      __$$_DigitIconCardModelCopyWithImpl<_$_DigitIconCardModel>(
          this, _$identity);
}

abstract class _DigitIconCardModel implements DigitIconCardModel {
  const factory _DigitIconCardModel(
      {required final String title,
      required final String subtitle,
      required final String widgetKey,
      final VoidCallback? onPressed,
      required final int icon}) = _$_DigitIconCardModel;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get widgetKey;
  @override
  VoidCallback? get onPressed;
  @override
  int get icon;
  @override
  @JsonKey(ignore: true)
  _$$_DigitIconCardModelCopyWith<_$_DigitIconCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
