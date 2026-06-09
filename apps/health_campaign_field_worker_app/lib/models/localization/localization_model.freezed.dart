// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalizationModel {

 List<LocalizationMessageModel> get messages;
/// Create a copy of LocalizationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizationModelCopyWith<LocalizationModel> get copyWith => _$LocalizationModelCopyWithImpl<LocalizationModel>(this as LocalizationModel, _$identity);

  /// Serializes this LocalizationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationModel&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'LocalizationModel(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $LocalizationModelCopyWith<$Res>  {
  factory $LocalizationModelCopyWith(LocalizationModel value, $Res Function(LocalizationModel) _then) = _$LocalizationModelCopyWithImpl;
@useResult
$Res call({
 List<LocalizationMessageModel> messages
});




}
/// @nodoc
class _$LocalizationModelCopyWithImpl<$Res>
    implements $LocalizationModelCopyWith<$Res> {
  _$LocalizationModelCopyWithImpl(this._self, this._then);

  final LocalizationModel _self;
  final $Res Function(LocalizationModel) _then;

/// Create a copy of LocalizationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<LocalizationMessageModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizationModel].
extension LocalizationModelPatterns on LocalizationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizationModel value)  $default,){
final _that = this;
switch (_that) {
case _LocalizationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizationModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LocalizationMessageModel> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizationModel() when $default != null:
return $default(_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LocalizationMessageModel> messages)  $default,) {final _that = this;
switch (_that) {
case _LocalizationModel():
return $default(_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LocalizationMessageModel> messages)?  $default,) {final _that = this;
switch (_that) {
case _LocalizationModel() when $default != null:
return $default(_that.messages);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LocalizationModel implements LocalizationModel {
  const _LocalizationModel({final  List<LocalizationMessageModel> messages = const []}): _messages = messages;
  factory _LocalizationModel.fromJson(Map<String, dynamic> json) => _$LocalizationModelFromJson(json);

 final  List<LocalizationMessageModel> _messages;
@override@JsonKey() List<LocalizationMessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of LocalizationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizationModelCopyWith<_LocalizationModel> get copyWith => __$LocalizationModelCopyWithImpl<_LocalizationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizationModel&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'LocalizationModel(messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$LocalizationModelCopyWith<$Res> implements $LocalizationModelCopyWith<$Res> {
  factory _$LocalizationModelCopyWith(_LocalizationModel value, $Res Function(_LocalizationModel) _then) = __$LocalizationModelCopyWithImpl;
@override @useResult
$Res call({
 List<LocalizationMessageModel> messages
});




}
/// @nodoc
class __$LocalizationModelCopyWithImpl<$Res>
    implements _$LocalizationModelCopyWith<$Res> {
  __$LocalizationModelCopyWithImpl(this._self, this._then);

  final _LocalizationModel _self;
  final $Res Function(_LocalizationModel) _then;

/// Create a copy of LocalizationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(_LocalizationModel(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<LocalizationMessageModel>,
  ));
}


}


/// @nodoc
mixin _$LocalizationMessageModel {

 String get code; String get message; String get module; String get locale;
/// Create a copy of LocalizationMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizationMessageModelCopyWith<LocalizationMessageModel> get copyWith => _$LocalizationMessageModelCopyWithImpl<LocalizationMessageModel>(this as LocalizationMessageModel, _$identity);

  /// Serializes this LocalizationMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationMessageModel&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.module, module) || other.module == module)&&(identical(other.locale, locale) || other.locale == locale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,module,locale);

@override
String toString() {
  return 'LocalizationMessageModel(code: $code, message: $message, module: $module, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LocalizationMessageModelCopyWith<$Res>  {
  factory $LocalizationMessageModelCopyWith(LocalizationMessageModel value, $Res Function(LocalizationMessageModel) _then) = _$LocalizationMessageModelCopyWithImpl;
@useResult
$Res call({
 String code, String message, String module, String locale
});




}
/// @nodoc
class _$LocalizationMessageModelCopyWithImpl<$Res>
    implements $LocalizationMessageModelCopyWith<$Res> {
  _$LocalizationMessageModelCopyWithImpl(this._self, this._then);

  final LocalizationMessageModel _self;
  final $Res Function(LocalizationMessageModel) _then;

/// Create a copy of LocalizationMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? module = null,Object? locale = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizationMessageModel].
extension LocalizationMessageModelPatterns on LocalizationMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizationMessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizationMessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizationMessageModel value)  $default,){
final _that = this;
switch (_that) {
case _LocalizationMessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizationMessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizationMessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  String module,  String locale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizationMessageModel() when $default != null:
return $default(_that.code,_that.message,_that.module,_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  String module,  String locale)  $default,) {final _that = this;
switch (_that) {
case _LocalizationMessageModel():
return $default(_that.code,_that.message,_that.module,_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  String module,  String locale)?  $default,) {final _that = this;
switch (_that) {
case _LocalizationMessageModel() when $default != null:
return $default(_that.code,_that.message,_that.module,_that.locale);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _LocalizationMessageModel implements LocalizationMessageModel {
  const _LocalizationMessageModel({required this.code, required this.message, required this.module, required this.locale});
  factory _LocalizationMessageModel.fromJson(Map<String, dynamic> json) => _$LocalizationMessageModelFromJson(json);

@override final  String code;
@override final  String message;
@override final  String module;
@override final  String locale;

/// Create a copy of LocalizationMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizationMessageModelCopyWith<_LocalizationMessageModel> get copyWith => __$LocalizationMessageModelCopyWithImpl<_LocalizationMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizationMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizationMessageModel&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.module, module) || other.module == module)&&(identical(other.locale, locale) || other.locale == locale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,module,locale);

@override
String toString() {
  return 'LocalizationMessageModel(code: $code, message: $message, module: $module, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$LocalizationMessageModelCopyWith<$Res> implements $LocalizationMessageModelCopyWith<$Res> {
  factory _$LocalizationMessageModelCopyWith(_LocalizationMessageModel value, $Res Function(_LocalizationMessageModel) _then) = __$LocalizationMessageModelCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, String module, String locale
});




}
/// @nodoc
class __$LocalizationMessageModelCopyWithImpl<$Res>
    implements _$LocalizationMessageModelCopyWith<$Res> {
  __$LocalizationMessageModelCopyWithImpl(this._self, this._then);

  final _LocalizationMessageModel _self;
  final $Res Function(_LocalizationMessageModel) _then;

/// Create a copy of LocalizationMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? module = null,Object? locale = null,}) {
  return _then(_LocalizationMessageModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
