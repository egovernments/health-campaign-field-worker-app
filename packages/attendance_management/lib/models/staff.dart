import 'package:dart_mappable/dart_mappable.dart';

@MappableClass(ignoreNull: true)
class StaffSearchModel {
  final String? id;
  final List<String>? staffId;

  StaffSearchModel({this.id, this.staffId}) : super();

  @MappableConstructor()
  StaffSearchModel.ignoreDeleted({
    this.id,
    this.staffId,
  });
}

@MappableClass(ignoreNull: true)
class StaffModel {
  static const schemaName = 'Staff';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? userId;
  final int? enrollmentDate;
  final int? denrollmentDate;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final StaffAdditionalFields? additionalFields;

  StaffModel(
      {this.additionalFields,
      this.id,
      this.tenantId,
      this.registerId,
      this.userId,
      this.enrollmentDate,
      this.denrollmentDate,
      this.nonRecoverableError = false,
      required this.clientReferenceId,
      this.rowVersion})
      : super();
}

@MappableClass(ignoreNull: true)
class StaffAdditionalFields {
  StaffAdditionalFields();
}
