// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_boundary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargetBoundaryWrapperModel _$$_TargetBoundaryWrapperModelFromJson(
        Map<String, dynamic> json) =>
    _$_TargetBoundaryWrapperModel(
      tenantId: json['tenantId'] as String,
      moduleName: json['moduleName'] as String,
      boundaries: (json['TenantBoundary'] as List<dynamic>?)
          ?.map((e) => TenantBoundaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TargetBoundaryWrapperModelToJson(
    _$_TargetBoundaryWrapperModel instance) {
  final val = <String, dynamic>{
    'tenantId': instance.tenantId,
    'moduleName': instance.moduleName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'TenantBoundary', instance.boundaries?.map((e) => e.toJson()).toList());
  return val;
}

_$_TenantBoundaryModel _$$_TenantBoundaryModelFromJson(
        Map<String, dynamic> json) =>
    _$_TenantBoundaryModel(
      hierarchyType: HierarchyTypeModel.fromJson(
          json['hierarchyType'] as Map<String, dynamic>),
      boundary:
          BoundaryModel.fromJson(json['boundary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TenantBoundaryModelToJson(
        _$_TenantBoundaryModel instance) =>
    <String, dynamic>{
      'hierarchyType': instance.hierarchyType.toJson(),
      'boundary': instance.boundary.toJson(),
    };

_$_HierarchyTypeModel _$$_HierarchyTypeModelFromJson(
        Map<String, dynamic> json) =>
    _$_HierarchyTypeModel(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_HierarchyTypeModelToJson(
        _$_HierarchyTypeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_BoundaryModel _$$_BoundaryModelFromJson(Map<String, dynamic> json) =>
    _$_BoundaryModel(
      id: json['id'] as String?,
      boundaryNum: json['boundaryNum'] as int,
      name: json['name'] as String,
      localName: json['localname'] as String,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      label: json['label'] as String,
      code: json['code'] as String,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => BoundaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BoundaryModelToJson(_$_BoundaryModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'boundaryNum': instance.boundaryNum,
    'name': instance.name,
    'localname': instance.localName,
    'longitude': instance.longitude,
    'latitude': instance.latitude,
    'label': instance.label,
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('children', instance.children?.map((e) => e.toJson()).toList());
  return val;
}
