// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_boundary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TargetBoundaryWrapperModelImpl _$$TargetBoundaryWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TargetBoundaryWrapperModelImpl(
      tenantId: json['tenantId'] as String,
      moduleName: json['moduleName'] as String,
      boundaries: (json['TenantBoundary'] as List<dynamic>?)
          ?.map((e) => TenantBoundaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TargetBoundaryWrapperModelImplToJson(
    _$TargetBoundaryWrapperModelImpl instance) {
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

_$TenantBoundaryModelImpl _$$TenantBoundaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TenantBoundaryModelImpl(
      hierarchyType: HierarchyTypeModel.fromJson(
          json['hierarchyType'] as Map<String, dynamic>),
      boundary:
          BoundaryModel.fromJson(json['boundary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TenantBoundaryModelImplToJson(
        _$TenantBoundaryModelImpl instance) =>
    <String, dynamic>{
      'hierarchyType': instance.hierarchyType.toJson(),
      'boundary': instance.boundary.toJson(),
    };

_$HierarchyTypeModelImpl _$$HierarchyTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HierarchyTypeModelImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$HierarchyTypeModelImplToJson(
        _$HierarchyTypeModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$BoundaryModelImpl _$$BoundaryModelImplFromJson(Map<String, dynamic> json) =>
    _$BoundaryModelImpl(
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

Map<String, dynamic> _$$BoundaryModelImplToJson(_$BoundaryModelImpl instance) {
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
