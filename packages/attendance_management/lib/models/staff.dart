import 'package:dart_mappable/dart_mappable.dart';

part 'staff.mapper.dart';

@MappableClass(ignoreNull: true)
class StaffSearchModel with StaffSearchModelMappable {
  final String? id;
  final List<String>? userId;

  StaffSearchModel({this.id, this.userId}) : super();

  @MappableConstructor()
  StaffSearchModel.ignoreDeleted({
    this.id,
    this.userId,
  });
}

@MappableClass(ignoreNull: true)
class StaffModel with StaffModelMappable {
  static const schemaName = 'Staff';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? userId;
  final int? enrollmentDate;
  final int? denrollmentDate;
  final bool? nonRecoverableError;
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
      this.rowVersion})
      : super();
}

@MappableClass(ignoreNull: true)
class StaffAdditionalFields with StaffAdditionalFieldsMappable {
  StaffAdditionalFields();
}
