// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncObjectModel<T> _$SyncObjectModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SyncObjectModel<T>(
      type: json['type'] as String,
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$SyncObjectModelToJson<T>(
  SyncObjectModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'type': instance.type,
      'items': instance.items.map(toJsonT).toList(),
    };

_$_SyncDataModel _$$_SyncDataModelFromJson(Map<String, dynamic> json) =>
    _$_SyncDataModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => SyncObjectModel<dynamic>.fromJson(
              e as Map<String, dynamic>, (value) => value))
          .toList(),
    );

Map<String, dynamic> _$$_SyncDataModelToJson(_$_SyncDataModel instance) =>
    <String, dynamic>{
      'data': instance.data
          .map((e) => e.toJson(
                (value) => value,
              ))
          .toList(),
    };
