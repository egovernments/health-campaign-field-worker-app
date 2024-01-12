import 'package:dart_mappable/dart_mappable.dart';

@MappableClass(ignoreNull: true)
class AttendeeSearchModel {
  final String? id;
  final List<String>? clientReferenceId;
  
  AttendeeSearchModel({
    this.id,
    this.clientReferenceId
  }):  super();

  @MappableConstructor()
  AttendeeSearchModel.ignoreDeleted({
    this.id,
    this.clientReferenceId,
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
  final String clientReferenceId;
  final int? rowVersion;
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
    required this.clientReferenceId,
    this.rowVersion
  }): super();
}

@MappableClass(ignoreNull: true)
class AttendeeAdditionalFields {
  AttendeeAdditionalFields();
}
