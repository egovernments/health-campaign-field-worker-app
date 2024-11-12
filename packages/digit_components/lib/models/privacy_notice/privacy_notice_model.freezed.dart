// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacyNoticeModel _$PrivacyNoticeModelFromJson(Map<String, dynamic> json) {
  return _PrivacyNoticeModel.fromJson(json);
}

/// @nodoc
mixin _$PrivacyNoticeModel {
  String get header => throw _privateConstructorUsedError;
  String get module => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  List<ContentNoticeModel>? get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacyNoticeModelCopyWith<PrivacyNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyNoticeModelCopyWith<$Res> {
  factory $PrivacyNoticeModelCopyWith(
          PrivacyNoticeModel value, $Res Function(PrivacyNoticeModel) then) =
      _$PrivacyNoticeModelCopyWithImpl<$Res, PrivacyNoticeModel>;
  @useResult
  $Res call(
      {String header,
      String module,
      bool? active,
      List<ContentNoticeModel>? contents});
}

/// @nodoc
class _$PrivacyNoticeModelCopyWithImpl<$Res, $Val extends PrivacyNoticeModel>
    implements $PrivacyNoticeModelCopyWith<$Res> {
  _$PrivacyNoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? module = null,
    Object? active = freezed,
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ContentNoticeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyNoticeModelImplCopyWith<$Res>
    implements $PrivacyNoticeModelCopyWith<$Res> {
  factory _$$PrivacyNoticeModelImplCopyWith(_$PrivacyNoticeModelImpl value,
          $Res Function(_$PrivacyNoticeModelImpl) then) =
      __$$PrivacyNoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String header,
      String module,
      bool? active,
      List<ContentNoticeModel>? contents});
}

/// @nodoc
class __$$PrivacyNoticeModelImplCopyWithImpl<$Res>
    extends _$PrivacyNoticeModelCopyWithImpl<$Res, _$PrivacyNoticeModelImpl>
    implements _$$PrivacyNoticeModelImplCopyWith<$Res> {
  __$$PrivacyNoticeModelImplCopyWithImpl(_$PrivacyNoticeModelImpl _value,
      $Res Function(_$PrivacyNoticeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? module = null,
    Object? active = freezed,
    Object? contents = freezed,
  }) {
    return _then(_$PrivacyNoticeModelImpl(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ContentNoticeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyNoticeModelImpl implements _PrivacyNoticeModel {
  const _$PrivacyNoticeModelImpl(
      {required this.header,
      required this.module,
      this.active,
      final List<ContentNoticeModel>? contents})
      : _contents = contents;

  factory _$PrivacyNoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyNoticeModelImplFromJson(json);

  @override
  final String header;
  @override
  final String module;
  @override
  final bool? active;
  final List<ContentNoticeModel>? _contents;
  @override
  List<ContentNoticeModel>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PrivacyNoticeModel(header: $header, module: $module, active: $active, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyNoticeModelImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, module, active,
      const DeepCollectionEquality().hash(_contents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyNoticeModelImplCopyWith<_$PrivacyNoticeModelImpl> get copyWith =>
      __$$PrivacyNoticeModelImplCopyWithImpl<_$PrivacyNoticeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyNoticeModelImplToJson(
      this,
    );
  }
}

abstract class _PrivacyNoticeModel implements PrivacyNoticeModel {
  const factory _PrivacyNoticeModel(
      {required final String header,
      required final String module,
      final bool? active,
      final List<ContentNoticeModel>? contents}) = _$PrivacyNoticeModelImpl;

  factory _PrivacyNoticeModel.fromJson(Map<String, dynamic> json) =
      _$PrivacyNoticeModelImpl.fromJson;

  @override
  String get header;
  @override
  String get module;
  @override
  bool? get active;
  @override
  List<ContentNoticeModel>? get contents;
  @override
  @JsonKey(ignore: true)
  _$$PrivacyNoticeModelImplCopyWith<_$PrivacyNoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentNoticeModel _$ContentNoticeModelFromJson(Map<String, dynamic> json) {
  return _ContentNoticeModel.fromJson(json);
}

/// @nodoc
mixin _$ContentNoticeModel {
  String? get header => throw _privateConstructorUsedError;
  List<DescriptionNoticeModel>? get descriptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentNoticeModelCopyWith<ContentNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentNoticeModelCopyWith<$Res> {
  factory $ContentNoticeModelCopyWith(
          ContentNoticeModel value, $Res Function(ContentNoticeModel) then) =
      _$ContentNoticeModelCopyWithImpl<$Res, ContentNoticeModel>;
  @useResult
  $Res call({String? header, List<DescriptionNoticeModel>? descriptions});
}

/// @nodoc
class _$ContentNoticeModelCopyWithImpl<$Res, $Val extends ContentNoticeModel>
    implements $ContentNoticeModelCopyWith<$Res> {
  _$ContentNoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? descriptions = freezed,
  }) {
    return _then(_value.copyWith(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<DescriptionNoticeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentNoticeModelImplCopyWith<$Res>
    implements $ContentNoticeModelCopyWith<$Res> {
  factory _$$ContentNoticeModelImplCopyWith(_$ContentNoticeModelImpl value,
          $Res Function(_$ContentNoticeModelImpl) then) =
      __$$ContentNoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? header, List<DescriptionNoticeModel>? descriptions});
}

/// @nodoc
class __$$ContentNoticeModelImplCopyWithImpl<$Res>
    extends _$ContentNoticeModelCopyWithImpl<$Res, _$ContentNoticeModelImpl>
    implements _$$ContentNoticeModelImplCopyWith<$Res> {
  __$$ContentNoticeModelImplCopyWithImpl(_$ContentNoticeModelImpl _value,
      $Res Function(_$ContentNoticeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? descriptions = freezed,
  }) {
    return _then(_$ContentNoticeModelImpl(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<DescriptionNoticeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentNoticeModelImpl implements _ContentNoticeModel {
  const _$ContentNoticeModelImpl(
      {this.header, final List<DescriptionNoticeModel>? descriptions})
      : _descriptions = descriptions;

  factory _$ContentNoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentNoticeModelImplFromJson(json);

  @override
  final String? header;
  final List<DescriptionNoticeModel>? _descriptions;
  @override
  List<DescriptionNoticeModel>? get descriptions {
    final value = _descriptions;
    if (value == null) return null;
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContentNoticeModel(header: $header, descriptions: $descriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentNoticeModelImpl &&
            (identical(other.header, header) || other.header == header) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, header, const DeepCollectionEquality().hash(_descriptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentNoticeModelImplCopyWith<_$ContentNoticeModelImpl> get copyWith =>
      __$$ContentNoticeModelImplCopyWithImpl<_$ContentNoticeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentNoticeModelImplToJson(
      this,
    );
  }
}

abstract class _ContentNoticeModel implements ContentNoticeModel {
  const factory _ContentNoticeModel(
          {final String? header,
          final List<DescriptionNoticeModel>? descriptions}) =
      _$ContentNoticeModelImpl;

  factory _ContentNoticeModel.fromJson(Map<String, dynamic> json) =
      _$ContentNoticeModelImpl.fromJson;

  @override
  String? get header;
  @override
  List<DescriptionNoticeModel>? get descriptions;
  @override
  @JsonKey(ignore: true)
  _$$ContentNoticeModelImplCopyWith<_$ContentNoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DescriptionNoticeModel _$DescriptionNoticeModelFromJson(
    Map<String, dynamic> json) {
  return _DescriptionNoticeModel.fromJson(json);
}

/// @nodoc
mixin _$DescriptionNoticeModel {
  String? get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isBold => throw _privateConstructorUsedError;
  List<SubDescriptionNoticeModel>? get subDescriptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DescriptionNoticeModelCopyWith<DescriptionNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionNoticeModelCopyWith<$Res> {
  factory $DescriptionNoticeModelCopyWith(DescriptionNoticeModel value,
          $Res Function(DescriptionNoticeModel) then) =
      _$DescriptionNoticeModelCopyWithImpl<$Res, DescriptionNoticeModel>;
  @useResult
  $Res call(
      {String? text,
      String? type,
      bool? isBold,
      List<SubDescriptionNoticeModel>? subDescriptions});
}

/// @nodoc
class _$DescriptionNoticeModelCopyWithImpl<$Res,
        $Val extends DescriptionNoticeModel>
    implements $DescriptionNoticeModelCopyWith<$Res> {
  _$DescriptionNoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = freezed,
    Object? isBold = freezed,
    Object? subDescriptions = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: freezed == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool?,
      subDescriptions: freezed == subDescriptions
          ? _value.subDescriptions
          : subDescriptions // ignore: cast_nullable_to_non_nullable
              as List<SubDescriptionNoticeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DescriptionNoticeModelImplCopyWith<$Res>
    implements $DescriptionNoticeModelCopyWith<$Res> {
  factory _$$DescriptionNoticeModelImplCopyWith(
          _$DescriptionNoticeModelImpl value,
          $Res Function(_$DescriptionNoticeModelImpl) then) =
      __$$DescriptionNoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? text,
      String? type,
      bool? isBold,
      List<SubDescriptionNoticeModel>? subDescriptions});
}

/// @nodoc
class __$$DescriptionNoticeModelImplCopyWithImpl<$Res>
    extends _$DescriptionNoticeModelCopyWithImpl<$Res,
        _$DescriptionNoticeModelImpl>
    implements _$$DescriptionNoticeModelImplCopyWith<$Res> {
  __$$DescriptionNoticeModelImplCopyWithImpl(
      _$DescriptionNoticeModelImpl _value,
      $Res Function(_$DescriptionNoticeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = freezed,
    Object? isBold = freezed,
    Object? subDescriptions = freezed,
  }) {
    return _then(_$DescriptionNoticeModelImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: freezed == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool?,
      subDescriptions: freezed == subDescriptions
          ? _value._subDescriptions
          : subDescriptions // ignore: cast_nullable_to_non_nullable
              as List<SubDescriptionNoticeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DescriptionNoticeModelImpl implements _DescriptionNoticeModel {
  const _$DescriptionNoticeModelImpl(
      {this.text,
      this.type,
      this.isBold,
      final List<SubDescriptionNoticeModel>? subDescriptions})
      : _subDescriptions = subDescriptions;

  factory _$DescriptionNoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DescriptionNoticeModelImplFromJson(json);

  @override
  final String? text;
  @override
  final String? type;
  @override
  final bool? isBold;
  final List<SubDescriptionNoticeModel>? _subDescriptions;
  @override
  List<SubDescriptionNoticeModel>? get subDescriptions {
    final value = _subDescriptions;
    if (value == null) return null;
    if (_subDescriptions is EqualUnmodifiableListView) return _subDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DescriptionNoticeModel(text: $text, type: $type, isBold: $isBold, subDescriptions: $subDescriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionNoticeModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isBold, isBold) || other.isBold == isBold) &&
            const DeepCollectionEquality()
                .equals(other._subDescriptions, _subDescriptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type, isBold,
      const DeepCollectionEquality().hash(_subDescriptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DescriptionNoticeModelImplCopyWith<_$DescriptionNoticeModelImpl>
      get copyWith => __$$DescriptionNoticeModelImplCopyWithImpl<
          _$DescriptionNoticeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DescriptionNoticeModelImplToJson(
      this,
    );
  }
}

abstract class _DescriptionNoticeModel implements DescriptionNoticeModel {
  const factory _DescriptionNoticeModel(
          {final String? text,
          final String? type,
          final bool? isBold,
          final List<SubDescriptionNoticeModel>? subDescriptions}) =
      _$DescriptionNoticeModelImpl;

  factory _DescriptionNoticeModel.fromJson(Map<String, dynamic> json) =
      _$DescriptionNoticeModelImpl.fromJson;

  @override
  String? get text;
  @override
  String? get type;
  @override
  bool? get isBold;
  @override
  List<SubDescriptionNoticeModel>? get subDescriptions;
  @override
  @JsonKey(ignore: true)
  _$$DescriptionNoticeModelImplCopyWith<_$DescriptionNoticeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SubDescriptionNoticeModel _$SubDescriptionNoticeModelFromJson(
    Map<String, dynamic> json) {
  return _SubDescriptionNoticeModel.fromJson(json);
}

/// @nodoc
mixin _$SubDescriptionNoticeModel {
  String? get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isBold => throw _privateConstructorUsedError;
  bool? get isSpaceRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubDescriptionNoticeModelCopyWith<SubDescriptionNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubDescriptionNoticeModelCopyWith<$Res> {
  factory $SubDescriptionNoticeModelCopyWith(SubDescriptionNoticeModel value,
          $Res Function(SubDescriptionNoticeModel) then) =
      _$SubDescriptionNoticeModelCopyWithImpl<$Res, SubDescriptionNoticeModel>;
  @useResult
  $Res call({String? text, String? type, bool? isBold, bool? isSpaceRequired});
}

/// @nodoc
class _$SubDescriptionNoticeModelCopyWithImpl<$Res,
        $Val extends SubDescriptionNoticeModel>
    implements $SubDescriptionNoticeModelCopyWith<$Res> {
  _$SubDescriptionNoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = freezed,
    Object? isBold = freezed,
    Object? isSpaceRequired = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: freezed == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSpaceRequired: freezed == isSpaceRequired
          ? _value.isSpaceRequired
          : isSpaceRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubDescriptionNoticeModelImplCopyWith<$Res>
    implements $SubDescriptionNoticeModelCopyWith<$Res> {
  factory _$$SubDescriptionNoticeModelImplCopyWith(
          _$SubDescriptionNoticeModelImpl value,
          $Res Function(_$SubDescriptionNoticeModelImpl) then) =
      __$$SubDescriptionNoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? type, bool? isBold, bool? isSpaceRequired});
}

/// @nodoc
class __$$SubDescriptionNoticeModelImplCopyWithImpl<$Res>
    extends _$SubDescriptionNoticeModelCopyWithImpl<$Res,
        _$SubDescriptionNoticeModelImpl>
    implements _$$SubDescriptionNoticeModelImplCopyWith<$Res> {
  __$$SubDescriptionNoticeModelImplCopyWithImpl(
      _$SubDescriptionNoticeModelImpl _value,
      $Res Function(_$SubDescriptionNoticeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = freezed,
    Object? isBold = freezed,
    Object? isSpaceRequired = freezed,
  }) {
    return _then(_$SubDescriptionNoticeModelImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: freezed == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSpaceRequired: freezed == isSpaceRequired
          ? _value.isSpaceRequired
          : isSpaceRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubDescriptionNoticeModelImpl implements _SubDescriptionNoticeModel {
  const _$SubDescriptionNoticeModelImpl(
      {this.text, this.type, this.isBold, this.isSpaceRequired});

  factory _$SubDescriptionNoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubDescriptionNoticeModelImplFromJson(json);

  @override
  final String? text;
  @override
  final String? type;
  @override
  final bool? isBold;
  @override
  final bool? isSpaceRequired;

  @override
  String toString() {
    return 'SubDescriptionNoticeModel(text: $text, type: $type, isBold: $isBold, isSpaceRequired: $isSpaceRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubDescriptionNoticeModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isBold, isBold) || other.isBold == isBold) &&
            (identical(other.isSpaceRequired, isSpaceRequired) ||
                other.isSpaceRequired == isSpaceRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, type, isBold, isSpaceRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubDescriptionNoticeModelImplCopyWith<_$SubDescriptionNoticeModelImpl>
      get copyWith => __$$SubDescriptionNoticeModelImplCopyWithImpl<
          _$SubDescriptionNoticeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubDescriptionNoticeModelImplToJson(
      this,
    );
  }
}

abstract class _SubDescriptionNoticeModel implements SubDescriptionNoticeModel {
  const factory _SubDescriptionNoticeModel(
      {final String? text,
      final String? type,
      final bool? isBold,
      final bool? isSpaceRequired}) = _$SubDescriptionNoticeModelImpl;

  factory _SubDescriptionNoticeModel.fromJson(Map<String, dynamic> json) =
      _$SubDescriptionNoticeModelImpl.fromJson;

  @override
  String? get text;
  @override
  String? get type;
  @override
  bool? get isBold;
  @override
  bool? get isSpaceRequired;
  @override
  @JsonKey(ignore: true)
  _$$SubDescriptionNoticeModelImplCopyWith<_$SubDescriptionNoticeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
