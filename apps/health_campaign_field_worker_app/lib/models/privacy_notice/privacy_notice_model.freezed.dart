// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivacyPolicyModel {

 String get header; String get module; bool? get active; List<ContentModel>? get contents;
/// Create a copy of PrivacyPolicyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacyPolicyModelCopyWith<PrivacyPolicyModel> get copyWith => _$PrivacyPolicyModelCopyWithImpl<PrivacyPolicyModel>(this as PrivacyPolicyModel, _$identity);

  /// Serializes this PrivacyPolicyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyModel&&(identical(other.header, header) || other.header == header)&&(identical(other.module, module) || other.module == module)&&(identical(other.active, active) || other.active == active)&&const DeepCollectionEquality().equals(other.contents, contents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,module,active,const DeepCollectionEquality().hash(contents));

@override
String toString() {
  return 'PrivacyPolicyModel(header: $header, module: $module, active: $active, contents: $contents)';
}


}

/// @nodoc
abstract mixin class $PrivacyPolicyModelCopyWith<$Res>  {
  factory $PrivacyPolicyModelCopyWith(PrivacyPolicyModel value, $Res Function(PrivacyPolicyModel) _then) = _$PrivacyPolicyModelCopyWithImpl;
@useResult
$Res call({
 String header, String module, bool? active, List<ContentModel>? contents
});




}
/// @nodoc
class _$PrivacyPolicyModelCopyWithImpl<$Res>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  _$PrivacyPolicyModelCopyWithImpl(this._self, this._then);

  final PrivacyPolicyModel _self;
  final $Res Function(PrivacyPolicyModel) _then;

/// Create a copy of PrivacyPolicyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? header = null,Object? module = null,Object? active = freezed,Object? contents = freezed,}) {
  return _then(_self.copyWith(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String,module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,contents: freezed == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<ContentModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacyPolicyModel].
extension PrivacyPolicyModelPatterns on PrivacyPolicyModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacyPolicyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacyPolicyModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacyPolicyModel value)  $default,){
final _that = this;
switch (_that) {
case _PrivacyPolicyModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacyPolicyModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacyPolicyModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String header,  String module,  bool? active,  List<ContentModel>? contents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacyPolicyModel() when $default != null:
return $default(_that.header,_that.module,_that.active,_that.contents);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String header,  String module,  bool? active,  List<ContentModel>? contents)  $default,) {final _that = this;
switch (_that) {
case _PrivacyPolicyModel():
return $default(_that.header,_that.module,_that.active,_that.contents);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String header,  String module,  bool? active,  List<ContentModel>? contents)?  $default,) {final _that = this;
switch (_that) {
case _PrivacyPolicyModel() when $default != null:
return $default(_that.header,_that.module,_that.active,_that.contents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacyPolicyModel implements PrivacyPolicyModel {
  const _PrivacyPolicyModel({required this.header, required this.module, this.active, final  List<ContentModel>? contents}): _contents = contents;
  factory _PrivacyPolicyModel.fromJson(Map<String, dynamic> json) => _$PrivacyPolicyModelFromJson(json);

@override final  String header;
@override final  String module;
@override final  bool? active;
 final  List<ContentModel>? _contents;
@override List<ContentModel>? get contents {
  final value = _contents;
  if (value == null) return null;
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PrivacyPolicyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacyPolicyModelCopyWith<_PrivacyPolicyModel> get copyWith => __$PrivacyPolicyModelCopyWithImpl<_PrivacyPolicyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacyPolicyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacyPolicyModel&&(identical(other.header, header) || other.header == header)&&(identical(other.module, module) || other.module == module)&&(identical(other.active, active) || other.active == active)&&const DeepCollectionEquality().equals(other._contents, _contents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,module,active,const DeepCollectionEquality().hash(_contents));

@override
String toString() {
  return 'PrivacyPolicyModel(header: $header, module: $module, active: $active, contents: $contents)';
}


}

/// @nodoc
abstract mixin class _$PrivacyPolicyModelCopyWith<$Res> implements $PrivacyPolicyModelCopyWith<$Res> {
  factory _$PrivacyPolicyModelCopyWith(_PrivacyPolicyModel value, $Res Function(_PrivacyPolicyModel) _then) = __$PrivacyPolicyModelCopyWithImpl;
@override @useResult
$Res call({
 String header, String module, bool? active, List<ContentModel>? contents
});




}
/// @nodoc
class __$PrivacyPolicyModelCopyWithImpl<$Res>
    implements _$PrivacyPolicyModelCopyWith<$Res> {
  __$PrivacyPolicyModelCopyWithImpl(this._self, this._then);

  final _PrivacyPolicyModel _self;
  final $Res Function(_PrivacyPolicyModel) _then;

/// Create a copy of PrivacyPolicyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? header = null,Object? module = null,Object? active = freezed,Object? contents = freezed,}) {
  return _then(_PrivacyPolicyModel(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String,module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,contents: freezed == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<ContentModel>?,
  ));
}


}


/// @nodoc
mixin _$ContentModel {

 String? get header; List<DescriptionModel>? get descriptions;
/// Create a copy of ContentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentModelCopyWith<ContentModel> get copyWith => _$ContentModelCopyWithImpl<ContentModel>(this as ContentModel, _$identity);

  /// Serializes this ContentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentModel&&(identical(other.header, header) || other.header == header)&&const DeepCollectionEquality().equals(other.descriptions, descriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,const DeepCollectionEquality().hash(descriptions));

@override
String toString() {
  return 'ContentModel(header: $header, descriptions: $descriptions)';
}


}

/// @nodoc
abstract mixin class $ContentModelCopyWith<$Res>  {
  factory $ContentModelCopyWith(ContentModel value, $Res Function(ContentModel) _then) = _$ContentModelCopyWithImpl;
@useResult
$Res call({
 String? header, List<DescriptionModel>? descriptions
});




}
/// @nodoc
class _$ContentModelCopyWithImpl<$Res>
    implements $ContentModelCopyWith<$Res> {
  _$ContentModelCopyWithImpl(this._self, this._then);

  final ContentModel _self;
  final $Res Function(ContentModel) _then;

/// Create a copy of ContentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? header = freezed,Object? descriptions = freezed,}) {
  return _then(_self.copyWith(
header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String?,descriptions: freezed == descriptions ? _self.descriptions : descriptions // ignore: cast_nullable_to_non_nullable
as List<DescriptionModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentModel].
extension ContentModelPatterns on ContentModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentModel value)  $default,){
final _that = this;
switch (_that) {
case _ContentModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContentModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? header,  List<DescriptionModel>? descriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentModel() when $default != null:
return $default(_that.header,_that.descriptions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? header,  List<DescriptionModel>? descriptions)  $default,) {final _that = this;
switch (_that) {
case _ContentModel():
return $default(_that.header,_that.descriptions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? header,  List<DescriptionModel>? descriptions)?  $default,) {final _that = this;
switch (_that) {
case _ContentModel() when $default != null:
return $default(_that.header,_that.descriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentModel implements ContentModel {
  const _ContentModel({this.header, final  List<DescriptionModel>? descriptions}): _descriptions = descriptions;
  factory _ContentModel.fromJson(Map<String, dynamic> json) => _$ContentModelFromJson(json);

@override final  String? header;
 final  List<DescriptionModel>? _descriptions;
@override List<DescriptionModel>? get descriptions {
  final value = _descriptions;
  if (value == null) return null;
  if (_descriptions is EqualUnmodifiableListView) return _descriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ContentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentModelCopyWith<_ContentModel> get copyWith => __$ContentModelCopyWithImpl<_ContentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentModel&&(identical(other.header, header) || other.header == header)&&const DeepCollectionEquality().equals(other._descriptions, _descriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,const DeepCollectionEquality().hash(_descriptions));

@override
String toString() {
  return 'ContentModel(header: $header, descriptions: $descriptions)';
}


}

/// @nodoc
abstract mixin class _$ContentModelCopyWith<$Res> implements $ContentModelCopyWith<$Res> {
  factory _$ContentModelCopyWith(_ContentModel value, $Res Function(_ContentModel) _then) = __$ContentModelCopyWithImpl;
@override @useResult
$Res call({
 String? header, List<DescriptionModel>? descriptions
});




}
/// @nodoc
class __$ContentModelCopyWithImpl<$Res>
    implements _$ContentModelCopyWith<$Res> {
  __$ContentModelCopyWithImpl(this._self, this._then);

  final _ContentModel _self;
  final $Res Function(_ContentModel) _then;

/// Create a copy of ContentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? header = freezed,Object? descriptions = freezed,}) {
  return _then(_ContentModel(
header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String?,descriptions: freezed == descriptions ? _self._descriptions : descriptions // ignore: cast_nullable_to_non_nullable
as List<DescriptionModel>?,
  ));
}


}


/// @nodoc
mixin _$DescriptionModel {

 String? get text; String? get type; bool? get isBold; List<SubDescriptionModel>? get subDescriptions;
/// Create a copy of DescriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DescriptionModelCopyWith<DescriptionModel> get copyWith => _$DescriptionModelCopyWithImpl<DescriptionModel>(this as DescriptionModel, _$identity);

  /// Serializes this DescriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DescriptionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&const DeepCollectionEquality().equals(other.subDescriptions, subDescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type,isBold,const DeepCollectionEquality().hash(subDescriptions));

@override
String toString() {
  return 'DescriptionModel(text: $text, type: $type, isBold: $isBold, subDescriptions: $subDescriptions)';
}


}

/// @nodoc
abstract mixin class $DescriptionModelCopyWith<$Res>  {
  factory $DescriptionModelCopyWith(DescriptionModel value, $Res Function(DescriptionModel) _then) = _$DescriptionModelCopyWithImpl;
@useResult
$Res call({
 String? text, String? type, bool? isBold, List<SubDescriptionModel>? subDescriptions
});




}
/// @nodoc
class _$DescriptionModelCopyWithImpl<$Res>
    implements $DescriptionModelCopyWith<$Res> {
  _$DescriptionModelCopyWithImpl(this._self, this._then);

  final DescriptionModel _self;
  final $Res Function(DescriptionModel) _then;

/// Create a copy of DescriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? type = freezed,Object? isBold = freezed,Object? subDescriptions = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isBold: freezed == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool?,subDescriptions: freezed == subDescriptions ? _self.subDescriptions : subDescriptions // ignore: cast_nullable_to_non_nullable
as List<SubDescriptionModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DescriptionModel].
extension DescriptionModelPatterns on DescriptionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DescriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DescriptionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DescriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _DescriptionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DescriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _DescriptionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? text,  String? type,  bool? isBold,  List<SubDescriptionModel>? subDescriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DescriptionModel() when $default != null:
return $default(_that.text,_that.type,_that.isBold,_that.subDescriptions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? text,  String? type,  bool? isBold,  List<SubDescriptionModel>? subDescriptions)  $default,) {final _that = this;
switch (_that) {
case _DescriptionModel():
return $default(_that.text,_that.type,_that.isBold,_that.subDescriptions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? text,  String? type,  bool? isBold,  List<SubDescriptionModel>? subDescriptions)?  $default,) {final _that = this;
switch (_that) {
case _DescriptionModel() when $default != null:
return $default(_that.text,_that.type,_that.isBold,_that.subDescriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DescriptionModel implements DescriptionModel {
  const _DescriptionModel({this.text, this.type, this.isBold, final  List<SubDescriptionModel>? subDescriptions}): _subDescriptions = subDescriptions;
  factory _DescriptionModel.fromJson(Map<String, dynamic> json) => _$DescriptionModelFromJson(json);

@override final  String? text;
@override final  String? type;
@override final  bool? isBold;
 final  List<SubDescriptionModel>? _subDescriptions;
@override List<SubDescriptionModel>? get subDescriptions {
  final value = _subDescriptions;
  if (value == null) return null;
  if (_subDescriptions is EqualUnmodifiableListView) return _subDescriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DescriptionModelCopyWith<_DescriptionModel> get copyWith => __$DescriptionModelCopyWithImpl<_DescriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DescriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DescriptionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&const DeepCollectionEquality().equals(other._subDescriptions, _subDescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type,isBold,const DeepCollectionEquality().hash(_subDescriptions));

@override
String toString() {
  return 'DescriptionModel(text: $text, type: $type, isBold: $isBold, subDescriptions: $subDescriptions)';
}


}

/// @nodoc
abstract mixin class _$DescriptionModelCopyWith<$Res> implements $DescriptionModelCopyWith<$Res> {
  factory _$DescriptionModelCopyWith(_DescriptionModel value, $Res Function(_DescriptionModel) _then) = __$DescriptionModelCopyWithImpl;
@override @useResult
$Res call({
 String? text, String? type, bool? isBold, List<SubDescriptionModel>? subDescriptions
});




}
/// @nodoc
class __$DescriptionModelCopyWithImpl<$Res>
    implements _$DescriptionModelCopyWith<$Res> {
  __$DescriptionModelCopyWithImpl(this._self, this._then);

  final _DescriptionModel _self;
  final $Res Function(_DescriptionModel) _then;

/// Create a copy of DescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? type = freezed,Object? isBold = freezed,Object? subDescriptions = freezed,}) {
  return _then(_DescriptionModel(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isBold: freezed == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool?,subDescriptions: freezed == subDescriptions ? _self._subDescriptions : subDescriptions // ignore: cast_nullable_to_non_nullable
as List<SubDescriptionModel>?,
  ));
}


}


/// @nodoc
mixin _$SubDescriptionModel {

 String? get text; String? get type; bool? get isBold; bool? get isSpaceRequired;
/// Create a copy of SubDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubDescriptionModelCopyWith<SubDescriptionModel> get copyWith => _$SubDescriptionModelCopyWithImpl<SubDescriptionModel>(this as SubDescriptionModel, _$identity);

  /// Serializes this SubDescriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubDescriptionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isSpaceRequired, isSpaceRequired) || other.isSpaceRequired == isSpaceRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type,isBold,isSpaceRequired);

@override
String toString() {
  return 'SubDescriptionModel(text: $text, type: $type, isBold: $isBold, isSpaceRequired: $isSpaceRequired)';
}


}

/// @nodoc
abstract mixin class $SubDescriptionModelCopyWith<$Res>  {
  factory $SubDescriptionModelCopyWith(SubDescriptionModel value, $Res Function(SubDescriptionModel) _then) = _$SubDescriptionModelCopyWithImpl;
@useResult
$Res call({
 String? text, String? type, bool? isBold, bool? isSpaceRequired
});




}
/// @nodoc
class _$SubDescriptionModelCopyWithImpl<$Res>
    implements $SubDescriptionModelCopyWith<$Res> {
  _$SubDescriptionModelCopyWithImpl(this._self, this._then);

  final SubDescriptionModel _self;
  final $Res Function(SubDescriptionModel) _then;

/// Create a copy of SubDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? type = freezed,Object? isBold = freezed,Object? isSpaceRequired = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isBold: freezed == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool?,isSpaceRequired: freezed == isSpaceRequired ? _self.isSpaceRequired : isSpaceRequired // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubDescriptionModel].
extension SubDescriptionModelPatterns on SubDescriptionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubDescriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubDescriptionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubDescriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _SubDescriptionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubDescriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubDescriptionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? text,  String? type,  bool? isBold,  bool? isSpaceRequired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubDescriptionModel() when $default != null:
return $default(_that.text,_that.type,_that.isBold,_that.isSpaceRequired);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? text,  String? type,  bool? isBold,  bool? isSpaceRequired)  $default,) {final _that = this;
switch (_that) {
case _SubDescriptionModel():
return $default(_that.text,_that.type,_that.isBold,_that.isSpaceRequired);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? text,  String? type,  bool? isBold,  bool? isSpaceRequired)?  $default,) {final _that = this;
switch (_that) {
case _SubDescriptionModel() when $default != null:
return $default(_that.text,_that.type,_that.isBold,_that.isSpaceRequired);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubDescriptionModel implements SubDescriptionModel {
  const _SubDescriptionModel({this.text, this.type, this.isBold, this.isSpaceRequired});
  factory _SubDescriptionModel.fromJson(Map<String, dynamic> json) => _$SubDescriptionModelFromJson(json);

@override final  String? text;
@override final  String? type;
@override final  bool? isBold;
@override final  bool? isSpaceRequired;

/// Create a copy of SubDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubDescriptionModelCopyWith<_SubDescriptionModel> get copyWith => __$SubDescriptionModelCopyWithImpl<_SubDescriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubDescriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubDescriptionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isSpaceRequired, isSpaceRequired) || other.isSpaceRequired == isSpaceRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type,isBold,isSpaceRequired);

@override
String toString() {
  return 'SubDescriptionModel(text: $text, type: $type, isBold: $isBold, isSpaceRequired: $isSpaceRequired)';
}


}

/// @nodoc
abstract mixin class _$SubDescriptionModelCopyWith<$Res> implements $SubDescriptionModelCopyWith<$Res> {
  factory _$SubDescriptionModelCopyWith(_SubDescriptionModel value, $Res Function(_SubDescriptionModel) _then) = __$SubDescriptionModelCopyWithImpl;
@override @useResult
$Res call({
 String? text, String? type, bool? isBold, bool? isSpaceRequired
});




}
/// @nodoc
class __$SubDescriptionModelCopyWithImpl<$Res>
    implements _$SubDescriptionModelCopyWith<$Res> {
  __$SubDescriptionModelCopyWithImpl(this._self, this._then);

  final _SubDescriptionModel _self;
  final $Res Function(_SubDescriptionModel) _then;

/// Create a copy of SubDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? type = freezed,Object? isBold = freezed,Object? isSpaceRequired = freezed,}) {
  return _then(_SubDescriptionModel(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isBold: freezed == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool?,isSpaceRequired: freezed == isSpaceRequired ? _self.isSpaceRequired : isSpaceRequired // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
