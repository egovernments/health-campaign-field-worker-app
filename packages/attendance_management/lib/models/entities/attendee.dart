import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';

part 'attendee.mapper.dart';

@MappableClass(ignoreNull: true)
class AttendeeSearchModel extends EntitySearchModel
    with AttendeeSearchModelMappable {
  final String? id;
  final String? registerId;

  AttendeeSearchModel({
    this.id,
    this.registerId,
    super.additionalFields,
    super.auditDetails,
  }) : super(isDeleted: false);

  @MappableConstructor()
  AttendeeSearchModel.ignoreDeleted({
    this.id,
    this.registerId,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class AttendeeModel extends EntityModel with AttendeeModelMappable {
  static const schemaName = 'Attendee';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? enrollmentDate;
  final int? denrollmentDate;
  final bool? nonRecoverableError;
  final String? name;
  final int? rowVersion;
  final double? status;
  final String? identifierID;
  final String? individualNumber;
  final String? tag;
  final AttendeeAdditionalFields? additionalFields;

  AttendeeModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.registerId,
    this.individualId,
    this.enrollmentDate,
    this.denrollmentDate,
    this.nonRecoverableError = false,
    this.rowVersion,
    this.name,
    this.tag,
    this.identifierID,
    this.individualNumber,
    this.status = -1,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();
}

@MappableClass(ignoreNull: true)
class AttendeeAdditionalFields extends AdditionalFields
    with AttendeeAdditionalFieldsMappable {
  AttendeeAdditionalFields(
      {super.schema = 'Attendee', required super.version, super.fields});
}
