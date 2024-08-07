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

PrivacyPolicy _$PrivacyPolicyFromJson(Map<String, dynamic> json) {
  return _PrivacyPolicy.fromJson(json);
}

/// @nodoc
mixin _$PrivacyPolicy {
  String get header => throw _privateConstructorUsedError;
  String get module => throw _privateConstructorUsedError;
  List<Content> get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacyPolicyCopyWith<PrivacyPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyPolicyCopyWith<$Res> {
  factory $PrivacyPolicyCopyWith(
          PrivacyPolicy value, $Res Function(PrivacyPolicy) then) =
      _$PrivacyPolicyCopyWithImpl<$Res, PrivacyPolicy>;
  @useResult
  $Res call({String header, String module, List<Content> contents});
}

/// @nodoc
class _$PrivacyPolicyCopyWithImpl<$Res, $Val extends PrivacyPolicy>
    implements $PrivacyPolicyCopyWith<$Res> {
  _$PrivacyPolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? module = null,
    Object? contents = null,
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
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyPolicyImplCopyWith<$Res>
    implements $PrivacyPolicyCopyWith<$Res> {
  factory _$$PrivacyPolicyImplCopyWith(
          _$PrivacyPolicyImpl value, $Res Function(_$PrivacyPolicyImpl) then) =
      __$$PrivacyPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String header, String module, List<Content> contents});
}

/// @nodoc
class __$$PrivacyPolicyImplCopyWithImpl<$Res>
    extends _$PrivacyPolicyCopyWithImpl<$Res, _$PrivacyPolicyImpl>
    implements _$$PrivacyPolicyImplCopyWith<$Res> {
  __$$PrivacyPolicyImplCopyWithImpl(
      _$PrivacyPolicyImpl _value, $Res Function(_$PrivacyPolicyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? module = null,
    Object? contents = null,
  }) {
    return _then(_$PrivacyPolicyImpl(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyPolicyImpl implements _PrivacyPolicy {
  const _$PrivacyPolicyImpl(
      {required this.header,
      required this.module,
      required final List<Content> contents})
      : _contents = contents;

  factory _$PrivacyPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyPolicyImplFromJson(json);

  @override
  final String header;
  @override
  final String module;
  final List<Content> _contents;
  @override
  List<Content> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  String toString() {
    return 'PrivacyPolicy(header: $header, module: $module, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyPolicyImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.module, module) || other.module == module) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, module,
      const DeepCollectionEquality().hash(_contents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyPolicyImplCopyWith<_$PrivacyPolicyImpl> get copyWith =>
      __$$PrivacyPolicyImplCopyWithImpl<_$PrivacyPolicyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyPolicyImplToJson(
      this,
    );
  }
}

abstract class _PrivacyPolicy implements PrivacyPolicy {
  const factory _PrivacyPolicy(
      {required final String header,
      required final String module,
      required final List<Content> contents}) = _$PrivacyPolicyImpl;

  factory _PrivacyPolicy.fromJson(Map<String, dynamic> json) =
      _$PrivacyPolicyImpl.fromJson;

  @override
  String get header;
  @override
  String get module;
  @override
  List<Content> get contents;
  @override
  @JsonKey(ignore: true)
  _$$PrivacyPolicyImplCopyWith<_$PrivacyPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  String get header => throw _privateConstructorUsedError;
  List<Description> get descriptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call({String header, List<Description> descriptions});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? descriptions = null,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<Description>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String header, List<Description> descriptions});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? descriptions = null,
  }) {
    return _then(_$ContentImpl(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<Description>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl implements _Content {
  const _$ContentImpl(
      {required this.header, required final List<Description> descriptions})
      : _descriptions = descriptions;

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

  @override
  final String header;
  final List<Description> _descriptions;
  @override
  List<Description> get descriptions {
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptions);
  }

  @override
  String toString() {
    return 'Content(header: $header, descriptions: $descriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
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
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  const factory _Content(
      {required final String header,
      required final List<Description> descriptions}) = _$ContentImpl;

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override
  String get header;
  @override
  List<Description> get descriptions;
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return _Description.fromJson(json);
}

/// @nodoc
mixin _$Description {
  String get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool get isBold => throw _privateConstructorUsedError;
  List<SubDescription>? get subDescriptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DescriptionCopyWith<Description> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionCopyWith<$Res> {
  factory $DescriptionCopyWith(
          Description value, $Res Function(Description) then) =
      _$DescriptionCopyWithImpl<$Res, Description>;
  @useResult
  $Res call(
      {String text,
      String? type,
      bool isBold,
      List<SubDescription>? subDescriptions});
}

/// @nodoc
class _$DescriptionCopyWithImpl<$Res, $Val extends Description>
    implements $DescriptionCopyWith<$Res> {
  _$DescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = freezed,
    Object? isBold = null,
    Object? subDescriptions = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: null == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      subDescriptions: freezed == subDescriptions
          ? _value.subDescriptions
          : subDescriptions // ignore: cast_nullable_to_non_nullable
              as List<SubDescription>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DescriptionImplCopyWith<$Res>
    implements $DescriptionCopyWith<$Res> {
  factory _$$DescriptionImplCopyWith(
          _$DescriptionImpl value, $Res Function(_$DescriptionImpl) then) =
      __$$DescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      String? type,
      bool isBold,
      List<SubDescription>? subDescriptions});
}

/// @nodoc
class __$$DescriptionImplCopyWithImpl<$Res>
    extends _$DescriptionCopyWithImpl<$Res, _$DescriptionImpl>
    implements _$$DescriptionImplCopyWith<$Res> {
  __$$DescriptionImplCopyWithImpl(
      _$DescriptionImpl _value, $Res Function(_$DescriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = freezed,
    Object? isBold = null,
    Object? subDescriptions = freezed,
  }) {
    return _then(_$DescriptionImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: null == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      subDescriptions: freezed == subDescriptions
          ? _value._subDescriptions
          : subDescriptions // ignore: cast_nullable_to_non_nullable
              as List<SubDescription>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DescriptionImpl implements _Description {
  const _$DescriptionImpl(
      {required this.text,
      this.type,
      required this.isBold,
      final List<SubDescription>? subDescriptions})
      : _subDescriptions = subDescriptions;

  factory _$DescriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DescriptionImplFromJson(json);

  @override
  final String text;
  @override
  final String? type;
  @override
  final bool isBold;
  final List<SubDescription>? _subDescriptions;
  @override
  List<SubDescription>? get subDescriptions {
    final value = _subDescriptions;
    if (value == null) return null;
    if (_subDescriptions is EqualUnmodifiableListView) return _subDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Description(text: $text, type: $type, isBold: $isBold, subDescriptions: $subDescriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionImpl &&
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
  _$$DescriptionImplCopyWith<_$DescriptionImpl> get copyWith =>
      __$$DescriptionImplCopyWithImpl<_$DescriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DescriptionImplToJson(
      this,
    );
  }
}

abstract class _Description implements Description {
  const factory _Description(
      {required final String text,
      final String? type,
      required final bool isBold,
      final List<SubDescription>? subDescriptions}) = _$DescriptionImpl;

  factory _Description.fromJson(Map<String, dynamic> json) =
      _$DescriptionImpl.fromJson;

  @override
  String get text;
  @override
  String? get type;
  @override
  bool get isBold;
  @override
  List<SubDescription>? get subDescriptions;
  @override
  @JsonKey(ignore: true)
  _$$DescriptionImplCopyWith<_$DescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubDescription _$SubDescriptionFromJson(Map<String, dynamic> json) {
  return _SubDescription.fromJson(json);
}

/// @nodoc
mixin _$SubDescription {
  String get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool get isBold => throw _privateConstructorUsedError;
  bool get isSpaceRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubDescriptionCopyWith<SubDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubDescriptionCopyWith<$Res> {
  factory $SubDescriptionCopyWith(
          SubDescription value, $Res Function(SubDescription) then) =
      _$SubDescriptionCopyWithImpl<$Res, SubDescription>;
  @useResult
  $Res call({String text, String? type, bool isBold, bool isSpaceRequired});
}

/// @nodoc
class _$SubDescriptionCopyWithImpl<$Res, $Val extends SubDescription>
    implements $SubDescriptionCopyWith<$Res> {
  _$SubDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = freezed,
    Object? isBold = null,
    Object? isSpaceRequired = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: null == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpaceRequired: null == isSpaceRequired
          ? _value.isSpaceRequired
          : isSpaceRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubDescriptionImplCopyWith<$Res>
    implements $SubDescriptionCopyWith<$Res> {
  factory _$$SubDescriptionImplCopyWith(_$SubDescriptionImpl value,
          $Res Function(_$SubDescriptionImpl) then) =
      __$$SubDescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String? type, bool isBold, bool isSpaceRequired});
}

/// @nodoc
class __$$SubDescriptionImplCopyWithImpl<$Res>
    extends _$SubDescriptionCopyWithImpl<$Res, _$SubDescriptionImpl>
    implements _$$SubDescriptionImplCopyWith<$Res> {
  __$$SubDescriptionImplCopyWithImpl(
      _$SubDescriptionImpl _value, $Res Function(_$SubDescriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = freezed,
    Object? isBold = null,
    Object? isSpaceRequired = null,
  }) {
    return _then(_$SubDescriptionImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isBold: null == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpaceRequired: null == isSpaceRequired
          ? _value.isSpaceRequired
          : isSpaceRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubDescriptionImpl implements _SubDescription {
  const _$SubDescriptionImpl(
      {required this.text,
      this.type,
      required this.isBold,
      required this.isSpaceRequired});

  factory _$SubDescriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubDescriptionImplFromJson(json);

  @override
  final String text;
  @override
  final String? type;
  @override
  final bool isBold;
  @override
  final bool isSpaceRequired;

  @override
  String toString() {
    return 'SubDescription(text: $text, type: $type, isBold: $isBold, isSpaceRequired: $isSpaceRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubDescriptionImpl &&
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
  _$$SubDescriptionImplCopyWith<_$SubDescriptionImpl> get copyWith =>
      __$$SubDescriptionImplCopyWithImpl<_$SubDescriptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubDescriptionImplToJson(
      this,
    );
  }
}

abstract class _SubDescription implements SubDescription {
  const factory _SubDescription(
      {required final String text,
      final String? type,
      required final bool isBold,
      required final bool isSpaceRequired}) = _$SubDescriptionImpl;

  factory _SubDescription.fromJson(Map<String, dynamic> json) =
      _$SubDescriptionImpl.fromJson;

  @override
  String get text;
  @override
  String? get type;
  @override
  bool get isBold;
  @override
  bool get isSpaceRequired;
  @override
  @JsonKey(ignore: true)
  _$$SubDescriptionImplCopyWith<_$SubDescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
