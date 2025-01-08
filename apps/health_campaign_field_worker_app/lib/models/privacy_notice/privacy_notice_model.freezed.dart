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

PrivacyPolicyModel _$PrivacyPolicyModelFromJson(Map<String, dynamic> json) {
  return _PrivacyPolicyModel.fromJson(json);
}

/// @nodoc
mixin _$PrivacyPolicyModel {
  String get header => throw _privateConstructorUsedError;
  String get module => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  List<ContentModel>? get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacyPolicyModelCopyWith<PrivacyPolicyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyPolicyModelCopyWith<$Res> {
  factory $PrivacyPolicyModelCopyWith(
          PrivacyPolicyModel value, $Res Function(PrivacyPolicyModel) then) =
      _$PrivacyPolicyModelCopyWithImpl<$Res, PrivacyPolicyModel>;
  @useResult
  $Res call(
      {String header,
      String module,
      bool? active,
      List<ContentModel>? contents});
}

/// @nodoc
class _$PrivacyPolicyModelCopyWithImpl<$Res, $Val extends PrivacyPolicyModel>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  _$PrivacyPolicyModelCopyWithImpl(this._value, this._then);

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
              as List<ContentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyPolicyModelImplCopyWith<$Res>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  factory _$$PrivacyPolicyModelImplCopyWith(_$PrivacyPolicyModelImpl value,
          $Res Function(_$PrivacyPolicyModelImpl) then) =
      __$$PrivacyPolicyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String header,
      String module,
      bool? active,
      List<ContentModel>? contents});
}

/// @nodoc
class __$$PrivacyPolicyModelImplCopyWithImpl<$Res>
    extends _$PrivacyPolicyModelCopyWithImpl<$Res, _$PrivacyPolicyModelImpl>
    implements _$$PrivacyPolicyModelImplCopyWith<$Res> {
  __$$PrivacyPolicyModelImplCopyWithImpl(_$PrivacyPolicyModelImpl _value,
      $Res Function(_$PrivacyPolicyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? module = null,
    Object? active = freezed,
    Object? contents = freezed,
  }) {
    return _then(_$PrivacyPolicyModelImpl(
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
              as List<ContentModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyPolicyModelImpl implements _PrivacyPolicyModel {
  const _$PrivacyPolicyModelImpl(
      {required this.header,
      required this.module,
      this.active,
      final List<ContentModel>? contents})
      : _contents = contents;

  factory _$PrivacyPolicyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyPolicyModelImplFromJson(json);

  @override
  final String header;
  @override
  final String module;
  @override
  final bool? active;
  final List<ContentModel>? _contents;
  @override
  List<ContentModel>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PrivacyPolicyModel(header: $header, module: $module, active: $active, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyPolicyModelImpl &&
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
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      __$$PrivacyPolicyModelImplCopyWithImpl<_$PrivacyPolicyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyPolicyModelImplToJson(
      this,
    );
  }
}

abstract class _PrivacyPolicyModel implements PrivacyPolicyModel {
  const factory _PrivacyPolicyModel(
      {required final String header,
      required final String module,
      final bool? active,
      final List<ContentModel>? contents}) = _$PrivacyPolicyModelImpl;

  factory _PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =
      _$PrivacyPolicyModelImpl.fromJson;

  @override
  String get header;
  @override
  String get module;
  @override
  bool? get active;
  @override
  List<ContentModel>? get contents;
  @override
  @JsonKey(ignore: true)
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) {
  return _ContentModel.fromJson(json);
}

/// @nodoc
mixin _$ContentModel {
  String? get header => throw _privateConstructorUsedError;
  List<DescriptionModel>? get descriptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentModelCopyWith<ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentModelCopyWith<$Res> {
  factory $ContentModelCopyWith(
          ContentModel value, $Res Function(ContentModel) then) =
      _$ContentModelCopyWithImpl<$Res, ContentModel>;
  @useResult
  $Res call({String? header, List<DescriptionModel>? descriptions});
}

/// @nodoc
class _$ContentModelCopyWithImpl<$Res, $Val extends ContentModel>
    implements $ContentModelCopyWith<$Res> {
  _$ContentModelCopyWithImpl(this._value, this._then);

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
              as List<DescriptionModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentModelImplCopyWith<$Res>
    implements $ContentModelCopyWith<$Res> {
  factory _$$ContentModelImplCopyWith(
          _$ContentModelImpl value, $Res Function(_$ContentModelImpl) then) =
      __$$ContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? header, List<DescriptionModel>? descriptions});
}

/// @nodoc
class __$$ContentModelImplCopyWithImpl<$Res>
    extends _$ContentModelCopyWithImpl<$Res, _$ContentModelImpl>
    implements _$$ContentModelImplCopyWith<$Res> {
  __$$ContentModelImplCopyWithImpl(
      _$ContentModelImpl _value, $Res Function(_$ContentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? descriptions = freezed,
  }) {
    return _then(_$ContentModelImpl(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<DescriptionModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentModelImpl implements _ContentModel {
  const _$ContentModelImpl(
      {this.header, final List<DescriptionModel>? descriptions})
      : _descriptions = descriptions;

  factory _$ContentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentModelImplFromJson(json);

  @override
  final String? header;
  final List<DescriptionModel>? _descriptions;
  @override
  List<DescriptionModel>? get descriptions {
    final value = _descriptions;
    if (value == null) return null;
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContentModel(header: $header, descriptions: $descriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentModelImpl &&
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
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      __$$ContentModelImplCopyWithImpl<_$ContentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentModelImplToJson(
      this,
    );
  }
}

abstract class _ContentModel implements ContentModel {
  const factory _ContentModel(
      {final String? header,
      final List<DescriptionModel>? descriptions}) = _$ContentModelImpl;

  factory _ContentModel.fromJson(Map<String, dynamic> json) =
      _$ContentModelImpl.fromJson;

  @override
  String? get header;
  @override
  List<DescriptionModel>? get descriptions;
  @override
  @JsonKey(ignore: true)
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DescriptionModel _$DescriptionModelFromJson(Map<String, dynamic> json) {
  return _DescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$DescriptionModel {
  String? get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isBold => throw _privateConstructorUsedError;
  List<SubDescriptionModel>? get subDescriptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DescriptionModelCopyWith<DescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionModelCopyWith<$Res> {
  factory $DescriptionModelCopyWith(
          DescriptionModel value, $Res Function(DescriptionModel) then) =
      _$DescriptionModelCopyWithImpl<$Res, DescriptionModel>;
  @useResult
  $Res call(
      {String? text,
      String? type,
      bool? isBold,
      List<SubDescriptionModel>? subDescriptions});
}

/// @nodoc
class _$DescriptionModelCopyWithImpl<$Res, $Val extends DescriptionModel>
    implements $DescriptionModelCopyWith<$Res> {
  _$DescriptionModelCopyWithImpl(this._value, this._then);

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
              as List<SubDescriptionModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DescriptionModelImplCopyWith<$Res>
    implements $DescriptionModelCopyWith<$Res> {
  factory _$$DescriptionModelImplCopyWith(_$DescriptionModelImpl value,
          $Res Function(_$DescriptionModelImpl) then) =
      __$$DescriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? text,
      String? type,
      bool? isBold,
      List<SubDescriptionModel>? subDescriptions});
}

/// @nodoc
class __$$DescriptionModelImplCopyWithImpl<$Res>
    extends _$DescriptionModelCopyWithImpl<$Res, _$DescriptionModelImpl>
    implements _$$DescriptionModelImplCopyWith<$Res> {
  __$$DescriptionModelImplCopyWithImpl(_$DescriptionModelImpl _value,
      $Res Function(_$DescriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = freezed,
    Object? isBold = freezed,
    Object? subDescriptions = freezed,
  }) {
    return _then(_$DescriptionModelImpl(
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
              as List<SubDescriptionModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DescriptionModelImpl implements _DescriptionModel {
  const _$DescriptionModelImpl(
      {this.text,
      this.type,
      this.isBold,
      final List<SubDescriptionModel>? subDescriptions})
      : _subDescriptions = subDescriptions;

  factory _$DescriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DescriptionModelImplFromJson(json);

  @override
  final String? text;
  @override
  final String? type;
  @override
  final bool? isBold;
  final List<SubDescriptionModel>? _subDescriptions;
  @override
  List<SubDescriptionModel>? get subDescriptions {
    final value = _subDescriptions;
    if (value == null) return null;
    if (_subDescriptions is EqualUnmodifiableListView) return _subDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DescriptionModel(text: $text, type: $type, isBold: $isBold, subDescriptions: $subDescriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionModelImpl &&
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
  _$$DescriptionModelImplCopyWith<_$DescriptionModelImpl> get copyWith =>
      __$$DescriptionModelImplCopyWithImpl<_$DescriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DescriptionModelImplToJson(
      this,
    );
  }
}

abstract class _DescriptionModel implements DescriptionModel {
  const factory _DescriptionModel(
          {final String? text,
          final String? type,
          final bool? isBold,
          final List<SubDescriptionModel>? subDescriptions}) =
      _$DescriptionModelImpl;

  factory _DescriptionModel.fromJson(Map<String, dynamic> json) =
      _$DescriptionModelImpl.fromJson;

  @override
  String? get text;
  @override
  String? get type;
  @override
  bool? get isBold;
  @override
  List<SubDescriptionModel>? get subDescriptions;
  @override
  @JsonKey(ignore: true)
  _$$DescriptionModelImplCopyWith<_$DescriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubDescriptionModel _$SubDescriptionModelFromJson(Map<String, dynamic> json) {
  return _SubDescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$SubDescriptionModel {
  String? get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isBold => throw _privateConstructorUsedError;
  bool? get isSpaceRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubDescriptionModelCopyWith<SubDescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubDescriptionModelCopyWith<$Res> {
  factory $SubDescriptionModelCopyWith(
          SubDescriptionModel value, $Res Function(SubDescriptionModel) then) =
      _$SubDescriptionModelCopyWithImpl<$Res, SubDescriptionModel>;
  @useResult
  $Res call({String? text, String? type, bool? isBold, bool? isSpaceRequired});
}

/// @nodoc
class _$SubDescriptionModelCopyWithImpl<$Res, $Val extends SubDescriptionModel>
    implements $SubDescriptionModelCopyWith<$Res> {
  _$SubDescriptionModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SubDescriptionModelImplCopyWith<$Res>
    implements $SubDescriptionModelCopyWith<$Res> {
  factory _$$SubDescriptionModelImplCopyWith(_$SubDescriptionModelImpl value,
          $Res Function(_$SubDescriptionModelImpl) then) =
      __$$SubDescriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? type, bool? isBold, bool? isSpaceRequired});
}

/// @nodoc
class __$$SubDescriptionModelImplCopyWithImpl<$Res>
    extends _$SubDescriptionModelCopyWithImpl<$Res, _$SubDescriptionModelImpl>
    implements _$$SubDescriptionModelImplCopyWith<$Res> {
  __$$SubDescriptionModelImplCopyWithImpl(_$SubDescriptionModelImpl _value,
      $Res Function(_$SubDescriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = freezed,
    Object? isBold = freezed,
    Object? isSpaceRequired = freezed,
  }) {
    return _then(_$SubDescriptionModelImpl(
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
class _$SubDescriptionModelImpl implements _SubDescriptionModel {
  const _$SubDescriptionModelImpl(
      {this.text, this.type, this.isBold, this.isSpaceRequired});

  factory _$SubDescriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubDescriptionModelImplFromJson(json);

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
    return 'SubDescriptionModel(text: $text, type: $type, isBold: $isBold, isSpaceRequired: $isSpaceRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubDescriptionModelImpl &&
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
  _$$SubDescriptionModelImplCopyWith<_$SubDescriptionModelImpl> get copyWith =>
      __$$SubDescriptionModelImplCopyWithImpl<_$SubDescriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubDescriptionModelImplToJson(
      this,
    );
  }
}

abstract class _SubDescriptionModel implements SubDescriptionModel {
  const factory _SubDescriptionModel(
      {final String? text,
      final String? type,
      final bool? isBold,
      final bool? isSpaceRequired}) = _$SubDescriptionModelImpl;

  factory _SubDescriptionModel.fromJson(Map<String, dynamic> json) =
      _$SubDescriptionModelImpl.fromJson;

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
  _$$SubDescriptionModelImplCopyWith<_$SubDescriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
