// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_boundary_model.freezed.dart';
part 'tenant_boundary_model.g.dart';

@freezed
class TargetBoundaryWrapperModel with _$TargetBoundaryWrapperModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory TargetBoundaryWrapperModel({
    required String tenantId,
    required String moduleName,
    @JsonKey(name: 'TenantBoundary') List<TenantBoundaryModel>? boundaries,
  }) = _TargetBoundaryWrapperModel;

  factory TargetBoundaryWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$TargetBoundaryWrapperModelFromJson(json);
}

@freezed
class TenantBoundaryModel with _$TenantBoundaryModel {
  @JsonSerializable(explicitToJson: true)
  const factory TenantBoundaryModel({
    required HierarchyTypeModel hierarchyType,
    required BoundaryModel boundary,
  }) = _TenantBoundaryModel;

  factory TenantBoundaryModel.fromJson(Map<String, dynamic> json) =>
      _$TenantBoundaryModelFromJson(json);
}

@freezed
class HierarchyTypeModel with _$HierarchyTypeModel {
  @JsonSerializable(explicitToJson: true)
  const factory HierarchyTypeModel({
    required String name,
    required String code,
  }) = _HierarchyTypeModel;

  factory HierarchyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$HierarchyTypeModelFromJson(json);
}

@freezed
class BoundaryModel with _$BoundaryModel {
  @JsonSerializable(explicitToJson: true)
  const factory BoundaryModel({
    String? id,
    required int boundaryNum,
    required String name,
    @JsonKey(name: 'localname') required String localName,
    String? longitude,
    String? latitude,
    required String label,
    required String code,
    @JsonKey(includeIfNull: false) List<BoundaryModel>? children,
  }) = _BoundaryModel;

  factory BoundaryModel.fromJson(Map<String, dynamic> json) =>
      _$BoundaryModelFromJson(json);
}
