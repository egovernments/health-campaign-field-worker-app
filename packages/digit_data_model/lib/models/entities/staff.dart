import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';

part 'staff.mapper.dart';

@MappableClass(
  ignoreNull: true,
  discriminatorValue: MappableClass.useAsDefault,
)
class StaffSearchModel extends EntitySearchModel with StaffSearchModelMappable {
  final String? id;
  final List<String>? userId;

  StaffSearchModel({
    this.id,
    this.userId,
    super.additionalFields,
    super.auditDetails,
  }) : super(isDeleted: false);

  @MappableConstructor()
  StaffSearchModel.ignoreDeleted({
    this.id,
    this.userId,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(
  ignoreNull: true,
  discriminatorValue: MappableClass.useAsDefault,
)
class StaffModel extends EntityModel with StaffModelMappable {
  static const schemaName = 'Staff';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? userId;
  final int? enrollmentDate;
  final int? denrollmentDate;
  final String? staffType;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final StaffAdditionalFields? additionalFields;

  StaffModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.registerId,
    this.userId,
    this.enrollmentDate,
    this.denrollmentDate,
    this.staffType,
    this.nonRecoverableError = false,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();
}

@MappableClass(
  ignoreNull: true,
  discriminatorValue: MappableClass.useAsDefault,
)
class StaffAdditionalFields extends AdditionalFields
    with StaffAdditionalFieldsMappable {
  StaffAdditionalFields({
    super.schema = 'Staff',
    required super.version,
    super.fields,
  });
}
