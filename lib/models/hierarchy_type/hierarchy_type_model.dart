import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/models/audit/audit_model.dart';

part 'hierarchy_type_model.freezed.dart';
part 'hierarchy_type_model.g.dart';

@freezed
class HierarchyTypeModel with _$HierarchyTypeModel {
  const factory HierarchyTypeModel({
    required String id,
    required String name,
    required String code,
    required String localName,
    required String tenantId,
    required AuditDetailsModel auditDetails,
  }) = _HierarchyTypeModel;

  factory HierarchyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$HierarchyTypeModelFromJson(json);
}
