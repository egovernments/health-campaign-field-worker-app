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
  String? get additionalFields => throw _privateConstructorUsedError;
  String? get addressId => throw _privateConstructorUsedError;
  AuditDetailsModel? get auditDetails => throw _privateConstructorUsedError;

  /// [dateOfBirth] in yyyyMMDD format
  String get dateOfBirth => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  List<IndividualIdentifierModel> get identifiers =>
      throw _privateConstructorUsedError;
  String? get individualId => throw _privateConstructorUsedError;

  /// [isHead] will be true if this individual is the head of a family
  bool get isHead => throw _privateConstructorUsedError;
  String get givenName => throw _privateConstructorUsedError;
  String? get familyName => throw _privateConstructorUsedError;
  String? get additionalName => throw _privateConstructorUsedError;

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
      {String? additionalFields,
      String? addressId,
      AuditDetailsModel? auditDetails,
      String dateOfBirth,
      Gender gender,
      List<IndividualIdentifierModel> identifiers,
      String? individualId,
      bool isHead,
      String givenName,
      String? familyName,
      String? additionalName});

  $AuditDetailsModelCopyWith<$Res>? get auditDetails;
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
    Object? additionalFields = freezed,
    Object? addressId = freezed,
    Object? auditDetails = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? identifiers = freezed,
    Object? individualId = freezed,
    Object? isHead = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? additionalName = freezed,
  }) {
    return _then(_value.copyWith(
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      auditDetails: auditDetails == freezed
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetailsModel?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      identifiers: identifiers == freezed
          ? _value.identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<IndividualIdentifierModel>,
      individualId: individualId == freezed
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String?,
      isHead: isHead == freezed
          ? _value.isHead
          : isHead // ignore: cast_nullable_to_non_nullable
              as bool,
      givenName: givenName == freezed
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalName: additionalName == freezed
          ? _value.additionalName
          : additionalName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $AuditDetailsModelCopyWith<$Res>? get auditDetails {
    if (_value.auditDetails == null) {
      return null;
    }

    return $AuditDetailsModelCopyWith<$Res>(_value.auditDetails!, (value) {
      return _then(_value.copyWith(auditDetails: value));
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
      {String? additionalFields,
      String? addressId,
      AuditDetailsModel? auditDetails,
      String dateOfBirth,
      Gender gender,
      List<IndividualIdentifierModel> identifiers,
      String? individualId,
      bool isHead,
      String givenName,
      String? familyName,
      String? additionalName});

  @override
  $AuditDetailsModelCopyWith<$Res>? get auditDetails;
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
    Object? additionalFields = freezed,
    Object? addressId = freezed,
    Object? auditDetails = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? identifiers = freezed,
    Object? individualId = freezed,
    Object? isHead = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? additionalName = freezed,
  }) {
    return _then(_$_IndividualModel(
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      auditDetails: auditDetails == freezed
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetailsModel?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      identifiers: identifiers == freezed
          ? _value._identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<IndividualIdentifierModel>,
      individualId: individualId == freezed
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String?,
      isHead: isHead == freezed
          ? _value.isHead
          : isHead // ignore: cast_nullable_to_non_nullable
              as bool,
      givenName: givenName == freezed
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalName: additionalName == freezed
          ? _value.additionalName
          : additionalName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_IndividualModel implements _IndividualModel {
  const _$_IndividualModel(
      {this.additionalFields,
      this.addressId,
      this.auditDetails,
      required this.dateOfBirth,
      required this.gender,
      required final List<IndividualIdentifierModel> identifiers,
      this.individualId,
      this.isHead = false,
      required this.givenName,
      this.familyName,
      this.additionalName})
      : _identifiers = identifiers;

  factory _$_IndividualModel.fromJson(Map<String, dynamic> json) =>
      _$$_IndividualModelFromJson(json);

  @override
  final String? additionalFields;
  @override
  final String? addressId;
  @override
  final AuditDetailsModel? auditDetails;

  /// [dateOfBirth] in yyyyMMDD format
  @override
  final String dateOfBirth;
  @override
  final Gender gender;
  final List<IndividualIdentifierModel> _identifiers;
  @override
  List<IndividualIdentifierModel> get identifiers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_identifiers);
  }

  @override
  final String? individualId;

  /// [isHead] will be true if this individual is the head of a family
  @override
  @JsonKey()
  final bool isHead;
  @override
  final String givenName;
  @override
  final String? familyName;
  @override
  final String? additionalName;

  @override
  String toString() {
    return 'IndividualModel(additionalFields: $additionalFields, addressId: $addressId, auditDetails: $auditDetails, dateOfBirth: $dateOfBirth, gender: $gender, identifiers: $identifiers, individualId: $individualId, isHead: $isHead, givenName: $givenName, familyName: $familyName, additionalName: $additionalName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndividualModel &&
            const DeepCollectionEquality()
                .equals(other.additionalFields, additionalFields) &&
            const DeepCollectionEquality().equals(other.addressId, addressId) &&
            const DeepCollectionEquality()
                .equals(other.auditDetails, auditDetails) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other._identifiers, _identifiers) &&
            const DeepCollectionEquality()
                .equals(other.individualId, individualId) &&
            const DeepCollectionEquality().equals(other.isHead, isHead) &&
            const DeepCollectionEquality().equals(other.givenName, givenName) &&
            const DeepCollectionEquality()
                .equals(other.familyName, familyName) &&
            const DeepCollectionEquality()
                .equals(other.additionalName, additionalName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(additionalFields),
      const DeepCollectionEquality().hash(addressId),
      const DeepCollectionEquality().hash(auditDetails),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(_identifiers),
      const DeepCollectionEquality().hash(individualId),
      const DeepCollectionEquality().hash(isHead),
      const DeepCollectionEquality().hash(givenName),
      const DeepCollectionEquality().hash(familyName),
      const DeepCollectionEquality().hash(additionalName));

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
      {final String? additionalFields,
      final String? addressId,
      final AuditDetailsModel? auditDetails,
      required final String dateOfBirth,
      required final Gender gender,
      required final List<IndividualIdentifierModel> identifiers,
      final String? individualId,
      final bool isHead,
      required final String givenName,
      final String? familyName,
      final String? additionalName}) = _$_IndividualModel;

  factory _IndividualModel.fromJson(Map<String, dynamic> json) =
      _$_IndividualModel.fromJson;

  @override
  String? get additionalFields;
  @override
  String? get addressId;
  @override
  AuditDetailsModel? get auditDetails;
  @override

  /// [dateOfBirth] in yyyyMMDD format
  String get dateOfBirth;
  @override
  Gender get gender;
  @override
  List<IndividualIdentifierModel> get identifiers;
  @override
  String? get individualId;
  @override

  /// [isHead] will be true if this individual is the head of a family
  bool get isHead;
  @override
  String get givenName;
  @override
  String? get familyName;
  @override
  String? get additionalName;
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
