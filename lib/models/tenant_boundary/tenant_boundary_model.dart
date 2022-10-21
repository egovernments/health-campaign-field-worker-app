import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/models/boundary/boundary_model.dart';
import 'package:health_campaigns_flutter/models/hierarchy_type/hierarchy_type_model.dart';

part 'tenant_boundary_model.freezed.dart';
part 'tenant_boundary_model.g.dart';

@freezed
class TenantBoundaryModel with _$TenantBoundaryModel {
  const factory TenantBoundaryModel({
    String? tenantId,
    HierarchyTypeModel? hierarchyType,
    List<BoundaryModel>? boundary,
  }) = _TenantBoundaryModel;

  factory TenantBoundaryModel.fromJson(Map<String, dynamic> json) =>
      _$TenantBoundaryModelFromJson(json);
}
