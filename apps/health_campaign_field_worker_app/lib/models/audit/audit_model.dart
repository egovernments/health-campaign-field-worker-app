import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_model.freezed.dart';
part 'audit_model.g.dart';

@freezed
class AuditDetailsModel with _$AuditDetailsModel {
  const factory AuditDetailsModel({
    required String createdBy,
    required int createdTime,
    String? lastModifiedBy,
    String? lastModifiedTime,
  }) = _AuditDetailsModel;

  factory AuditDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AuditDetailsModelFromJson(json);
}
