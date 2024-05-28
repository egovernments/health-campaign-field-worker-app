// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beneficiary_statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BeneficiaryStatisticsWrapperModel {
  List<BeneficiaryStatisticsModel> get beneficiaryStatisticsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeneficiaryStatisticsWrapperModelCopyWith<BeneficiaryStatisticsWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiaryStatisticsWrapperModelCopyWith<$Res> {
  factory $BeneficiaryStatisticsWrapperModelCopyWith(
          BeneficiaryStatisticsWrapperModel value,
          $Res Function(BeneficiaryStatisticsWrapperModel) then) =
      _$BeneficiaryStatisticsWrapperModelCopyWithImpl<$Res,
          BeneficiaryStatisticsWrapperModel>;
  @useResult
  $Res call({List<BeneficiaryStatisticsModel> beneficiaryStatisticsList});
}

/// @nodoc
class _$BeneficiaryStatisticsWrapperModelCopyWithImpl<$Res,
        $Val extends BeneficiaryStatisticsWrapperModel>
    implements $BeneficiaryStatisticsWrapperModelCopyWith<$Res> {
  _$BeneficiaryStatisticsWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryStatisticsList = null,
  }) {
    return _then(_value.copyWith(
      beneficiaryStatisticsList: null == beneficiaryStatisticsList
          ? _value.beneficiaryStatisticsList
          : beneficiaryStatisticsList // ignore: cast_nullable_to_non_nullable
              as List<BeneficiaryStatisticsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeneficiaryStatisticsWrapperModelImplCopyWith<$Res>
    implements $BeneficiaryStatisticsWrapperModelCopyWith<$Res> {
  factory _$$BeneficiaryStatisticsWrapperModelImplCopyWith(
          _$BeneficiaryStatisticsWrapperModelImpl value,
          $Res Function(_$BeneficiaryStatisticsWrapperModelImpl) then) =
      __$$BeneficiaryStatisticsWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BeneficiaryStatisticsModel> beneficiaryStatisticsList});
}

/// @nodoc
class __$$BeneficiaryStatisticsWrapperModelImplCopyWithImpl<$Res>
    extends _$BeneficiaryStatisticsWrapperModelCopyWithImpl<$Res,
        _$BeneficiaryStatisticsWrapperModelImpl>
    implements _$$BeneficiaryStatisticsWrapperModelImplCopyWith<$Res> {
  __$$BeneficiaryStatisticsWrapperModelImplCopyWithImpl(
      _$BeneficiaryStatisticsWrapperModelImpl _value,
      $Res Function(_$BeneficiaryStatisticsWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryStatisticsList = null,
  }) {
    return _then(_$BeneficiaryStatisticsWrapperModelImpl(
      beneficiaryStatisticsList: null == beneficiaryStatisticsList
          ? _value._beneficiaryStatisticsList
          : beneficiaryStatisticsList // ignore: cast_nullable_to_non_nullable
              as List<BeneficiaryStatisticsModel>,
    ));
  }
}

/// @nodoc

class _$BeneficiaryStatisticsWrapperModelImpl
    implements _BeneficiaryStatisticsWrapperModel {
  const _$BeneficiaryStatisticsWrapperModelImpl(
      {required final List<BeneficiaryStatisticsModel>
          beneficiaryStatisticsList})
      : _beneficiaryStatisticsList = beneficiaryStatisticsList;

  final List<BeneficiaryStatisticsModel> _beneficiaryStatisticsList;
  @override
  List<BeneficiaryStatisticsModel> get beneficiaryStatisticsList {
    if (_beneficiaryStatisticsList is EqualUnmodifiableListView)
      return _beneficiaryStatisticsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beneficiaryStatisticsList);
  }

  @override
  String toString() {
    return 'BeneficiaryStatisticsWrapperModel(beneficiaryStatisticsList: $beneficiaryStatisticsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeneficiaryStatisticsWrapperModelImpl &&
            const DeepCollectionEquality().equals(
                other._beneficiaryStatisticsList, _beneficiaryStatisticsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_beneficiaryStatisticsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeneficiaryStatisticsWrapperModelImplCopyWith<
          _$BeneficiaryStatisticsWrapperModelImpl>
      get copyWith => __$$BeneficiaryStatisticsWrapperModelImplCopyWithImpl<
          _$BeneficiaryStatisticsWrapperModelImpl>(this, _$identity);
}

abstract class _BeneficiaryStatisticsWrapperModel
    implements BeneficiaryStatisticsWrapperModel {
  const factory _BeneficiaryStatisticsWrapperModel(
      {required final List<BeneficiaryStatisticsModel>
          beneficiaryStatisticsList}) = _$BeneficiaryStatisticsWrapperModelImpl;

  @override
  List<BeneficiaryStatisticsModel> get beneficiaryStatisticsList;
  @override
  @JsonKey(ignore: true)
  _$$BeneficiaryStatisticsWrapperModelImplCopyWith<
          _$BeneficiaryStatisticsWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeneficiaryStatisticsModel {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeneficiaryStatisticsModelCopyWith<BeneficiaryStatisticsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiaryStatisticsModelCopyWith<$Res> {
  factory $BeneficiaryStatisticsModelCopyWith(BeneficiaryStatisticsModel value,
          $Res Function(BeneficiaryStatisticsModel) then) =
      _$BeneficiaryStatisticsModelCopyWithImpl<$Res,
          BeneficiaryStatisticsModel>;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$BeneficiaryStatisticsModelCopyWithImpl<$Res,
        $Val extends BeneficiaryStatisticsModel>
    implements $BeneficiaryStatisticsModelCopyWith<$Res> {
  _$BeneficiaryStatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeneficiaryStatisticsModelImplCopyWith<$Res>
    implements $BeneficiaryStatisticsModelCopyWith<$Res> {
  factory _$$BeneficiaryStatisticsModelImplCopyWith(
          _$BeneficiaryStatisticsModelImpl value,
          $Res Function(_$BeneficiaryStatisticsModelImpl) then) =
      __$$BeneficiaryStatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$$BeneficiaryStatisticsModelImplCopyWithImpl<$Res>
    extends _$BeneficiaryStatisticsModelCopyWithImpl<$Res,
        _$BeneficiaryStatisticsModelImpl>
    implements _$$BeneficiaryStatisticsModelImplCopyWith<$Res> {
  __$$BeneficiaryStatisticsModelImplCopyWithImpl(
      _$BeneficiaryStatisticsModelImpl _value,
      $Res Function(_$BeneficiaryStatisticsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$BeneficiaryStatisticsModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BeneficiaryStatisticsModelImpl implements _BeneficiaryStatisticsModel {
  const _$BeneficiaryStatisticsModelImpl(
      {required this.title, required this.content});

  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'BeneficiaryStatisticsModel(title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeneficiaryStatisticsModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeneficiaryStatisticsModelImplCopyWith<_$BeneficiaryStatisticsModelImpl>
      get copyWith => __$$BeneficiaryStatisticsModelImplCopyWithImpl<
          _$BeneficiaryStatisticsModelImpl>(this, _$identity);
}

abstract class _BeneficiaryStatisticsModel
    implements BeneficiaryStatisticsModel {
  const factory _BeneficiaryStatisticsModel(
      {required final String title,
      required final String content}) = _$BeneficiaryStatisticsModelImpl;

  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$BeneficiaryStatisticsModelImplCopyWith<_$BeneficiaryStatisticsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
