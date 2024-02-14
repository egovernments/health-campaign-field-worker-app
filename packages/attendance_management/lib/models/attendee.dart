import 'package:dart_mappable/dart_mappable.dart';

@MappableClass(ignoreNull: true)
class AttendeeSearchModel {
  final String? id;
  final String? registerId;

  AttendeeSearchModel({
    this.id,
    this.registerId,
  }) : super();

  @MappableConstructor()
  AttendeeSearchModel.ignoreDeleted({
    this.id,
    this.registerId,
  });
}

@MappableClass(ignoreNull: true)
class AttendeeModel {
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
    this.identifierID,
    this.individualNumber,
    this.status = -1,
  }) : super();
}

@MappableClass(ignoreNull: true)
class AttendeeAdditionalFields {
  AttendeeAdditionalFields();
}
