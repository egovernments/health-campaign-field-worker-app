// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'individual_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IndividualModel _$IndividualModelFromJson(Map<String, dynamic> json) {
  return _IndividualModel.fromJson(json);
}

/// @nodoc
mixin _$IndividualModel {
  String get name => throw _privateConstructorUsedError;

  /// Date of birth in YYYYMMDD format
  String get dateOfBirth => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;

  /// [isHead] will be true if this individual is the head of a family
  bool get isHead => throw _privateConstructorUsedError;
  List<IndividualIdentifierModel> get identifiers =>
      throw _privateConstructorUsedError;
  AdditionalFieldsModel? get additionalFields =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndividualModelCopyWith<IndividualModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualModelCopyWith<$Res> {
  factory $IndividualModelCopyWith(
          IndividualModel value, $Res Function(IndividualModel) then) =
      _$IndividualModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String dateOfBirth,
      Gender gender,
      bool isHead,
      List<IndividualIdentifierModel> identifiers,
      AdditionalFieldsModel? additionalFields});

  $AdditionalFieldsModelCopyWith<$Res>? get additionalFields;
}

/// @nodoc
class _$IndividualModelCopyWithImpl<$Res>
    implements $IndividualModelCopyWith<$Res> {
  _$IndividualModelCopyWithImpl(this._value, this._then);

  final IndividualModel _value;
  // ignore: unused_field
  final $Res Function(IndividualModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isHead = freezed,
    Object? identifiers = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      isHead: isHead == freezed
          ? _value.isHead
          : isHead // ignore: cast_nullable_to_non_nullable
              as bool,
      identifiers: identifiers == freezed
          ? _value.identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<IndividualIdentifierModel>,
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as AdditionalFieldsModel?,
    ));
  }

  @override
  $AdditionalFieldsModelCopyWith<$Res>? get additionalFields {
    if (_value.additionalFields == null) {
      return null;
    }

    return $AdditionalFieldsModelCopyWith<$Res>(_value.additionalFields!,
        (value) {
      return _then(_value.copyWith(additionalFields: value));
    });
  }
}

/// @nodoc
abstract class _$$_IndividualModelCopyWith<$Res>
    implements $IndividualModelCopyWith<$Res> {
  factory _$$_IndividualModelCopyWith(
          _$_IndividualModel value, $Res Function(_$_IndividualModel) then) =
      __$$_IndividualModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String dateOfBirth,
      Gender gender,
      bool isHead,
      List<IndividualIdentifierModel> identifiers,
      AdditionalFieldsModel? additionalFields});

  @override
  $AdditionalFieldsModelCopyWith<$Res>? get additionalFields;
}

/// @nodoc
class __$$_IndividualModelCopyWithImpl<$Res>
    extends _$IndividualModelCopyWithImpl<$Res>
    implements _$$_IndividualModelCopyWith<$Res> {
  __$$_IndividualModelCopyWithImpl(
      _$_IndividualModel _value, $Res Function(_$_IndividualModel) _then)
      : super(_value, (v) => _then(v as _$_IndividualModel));

  @override
  _$_IndividualModel get _value => super._value as _$_IndividualModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isHead = freezed,
    Object? identifiers = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_$_IndividualModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      isHead: isHead == freezed
          ? _value.isHead
          : isHead // ignore: cast_nullable_to_non_nullable
              as bool,
      identifiers: identifiers == freezed
          ? _value._identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<IndividualIdentifierModel>,
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as AdditionalFieldsModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_IndividualModel implements _IndividualModel {
  const _$_IndividualModel(
      {required this.name,
      required this.dateOfBirth,
      required this.gender,
      this.isHead = false,
      required final List<IndividualIdentifierModel> identifiers,
      this.additionalFields})
      : _identifiers = identifiers;

  factory _$_IndividualModel.fromJson(Map<String, dynamic> json) =>
      _$$_IndividualModelFromJson(json);

  @override
  final String name;

  /// Date of birth in YYYYMMDD format
  @override
  final String dateOfBirth;
  @override
  final Gender gender;

  /// [isHead] will be true if this individual is the head of a family
  @override
  @JsonKey()
  final bool isHead;
  final List<IndividualIdentifierModel> _identifiers;
  @override
  List<IndividualIdentifierModel> get identifiers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_identifiers);
  }

  @override
  final AdditionalFieldsModel? additionalFields;

  @override
  String toString() {
    return 'IndividualModel(name: $name, dateOfBirth: $dateOfBirth, gender: $gender, isHead: $isHead, identifiers: $identifiers, additionalFields: $additionalFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndividualModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.isHead, isHead) &&
            const DeepCollectionEquality()
                .equals(other._identifiers, _identifiers) &&
            const DeepCollectionEquality()
                .equals(other.additionalFields, additionalFields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(isHead),
      const DeepCollectionEquality().hash(_identifiers),
      const DeepCollectionEquality().hash(additionalFields));

  @JsonKey(ignore: true)
  @override
  _$$_IndividualModelCopyWith<_$_IndividualModel> get copyWith =>
      __$$_IndividualModelCopyWithImpl<_$_IndividualModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IndividualModelToJson(
      this,
    );
  }
}

abstract class _IndividualModel implements IndividualModel {
  const factory _IndividualModel(
      {required final String name,
      required final String dateOfBirth,
      required final Gender gender,
      final bool isHead,
      required final List<IndividualIdentifierModel> identifiers,
      final AdditionalFieldsModel? additionalFields}) = _$_IndividualModel;

  factory _IndividualModel.fromJson(Map<String, dynamic> json) =
      _$_IndividualModel.fromJson;

  @override
  String get name;
  @override

  /// Date of birth in YYYYMMDD format
  String get dateOfBirth;
  @override
  Gender get gender;
  @override

  /// [isHead] will be true if this individual is the head of a family
  bool get isHead;
  @override
  List<IndividualIdentifierModel> get identifiers;
  @override
  AdditionalFieldsModel? get additionalFields;
  @override
  @JsonKey(ignore: true)
  _$$_IndividualModelCopyWith<_$_IndividualModel> get copyWith =>
      throw _privateConstructorUsedError;
}

IndividualIdentifierModel _$IndividualIdentifierModelFromJson(
    Map<String, dynamic> json) {
  return _IndividualIdentifierModel.fromJson(json);
}

/// @nodoc
mixin _$IndividualIdentifierModel {
  IndividualIdentifierType get type => throw _privateConstructorUsedError;
  String get identifierId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndividualIdentifierModelCopyWith<IndividualIdentifierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualIdentifierModelCopyWith<$Res> {
  factory $IndividualIdentifierModelCopyWith(IndividualIdentifierModel value,
          $Res Function(IndividualIdentifierModel) then) =
      _$IndividualIdentifierModelCopyWithImpl<$Res>;
  $Res call({IndividualIdentifierType type, String identifierId});
}

/// @nodoc
class _$IndividualIdentifierModelCopyWithImpl<$Res>
    implements $IndividualIdentifierModelCopyWith<$Res> {
  _$IndividualIdentifierModelCopyWithImpl(this._value, this._then);

  final IndividualIdentifierModel _value;
  // ignore: unused_field
  final $Res Function(IndividualIdentifierModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? identifierId = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IndividualIdentifierType,
      identifierId: identifierId == freezed
          ? _value.identifierId
          : identifierId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_IndividualIdentifierModelCopyWith<$Res>
    implements $IndividualIdentifierModelCopyWith<$Res> {
  factory _$$_IndividualIdentifierModelCopyWith(
          _$_IndividualIdentifierModel value,
          $Res Function(_$_IndividualIdentifierModel) then) =
      __$$_IndividualIdentifierModelCopyWithImpl<$Res>;
  @override
  $Res call({IndividualIdentifierType type, String identifierId});
}

/// @nodoc
class __$$_IndividualIdentifierModelCopyWithImpl<$Res>
    extends _$IndividualIdentifierModelCopyWithImpl<$Res>
    implements _$$_IndividualIdentifierModelCopyWith<$Res> {
  __$$_IndividualIdentifierModelCopyWithImpl(
      _$_IndividualIdentifierModel _value,
      $Res Function(_$_IndividualIdentifierModel) _then)
      : super(_value, (v) => _then(v as _$_IndividualIdentifierModel));

  @override
  _$_IndividualIdentifierModel get _value =>
      super._value as _$_IndividualIdentifierModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? identifierId = freezed,
  }) {
    return _then(_$_IndividualIdentifierModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IndividualIdentifierType,
      identifierId: identifierId == freezed
          ? _value.identifierId
          : identifierId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_IndividualIdentifierModel implements _IndividualIdentifierModel {
  const _$_IndividualIdentifierModel(
      {required this.type, required this.identifierId});

  factory _$_IndividualIdentifierModel.fromJson(Map<String, dynamic> json) =>
      _$$_IndividualIdentifierModelFromJson(json);

  @override
  final IndividualIdentifierType type;
  @override
  final String identifierId;

  @override
  String toString() {
    return 'IndividualIdentifierModel(type: $type, identifierId: $identifierId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndividualIdentifierModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.identifierId, identifierId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(identifierId));

  @JsonKey(ignore: true)
  @override
  _$$_IndividualIdentifierModelCopyWith<_$_IndividualIdentifierModel>
      get copyWith => __$$_IndividualIdentifierModelCopyWithImpl<
          _$_IndividualIdentifierModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IndividualIdentifierModelToJson(
      this,
    );
  }
}

abstract class _IndividualIdentifierModel implements IndividualIdentifierModel {
  const factory _IndividualIdentifierModel(
      {required final IndividualIdentifierType type,
      required final String identifierId}) = _$_IndividualIdentifierModel;

  factory _IndividualIdentifierModel.fromJson(Map<String, dynamic> json) =
      _$_IndividualIdentifierModel.fromJson;

  @override
  IndividualIdentifierType get type;
  @override
  String get identifierId;
  @override
  @JsonKey(ignore: true)
  _$$_IndividualIdentifierModelCopyWith<_$_IndividualIdentifierModel>
      get copyWith => throw _privateConstructorUsedError;
}
