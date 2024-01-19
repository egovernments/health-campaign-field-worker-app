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

  final String id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? enrollmentDate;
  final int? denrollmentDate;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final AttendeeAdditionalFields? additionalFields;

  AttendeeModel(
      {this.additionalFields,
      required this.id,
      this.tenantId,
      this.registerId,
      this.individualId,
      this.enrollmentDate,
      this.denrollmentDate,
      this.nonRecoverableError = false,
      this.rowVersion})
      : super();
}

@MappableClass(ignoreNull: true)
class AttendeeAdditionalFields {
  AttendeeAdditionalFields();
}
