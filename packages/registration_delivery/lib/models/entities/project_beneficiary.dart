// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'project_beneficiary.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectBeneficiarySearchModel extends EntitySearchModel
    with ProjectBeneficiarySearchModelMappable {
  final List<String>? id;
  final List<String>? projectId;
  final List<String>? beneficiaryId;
  final List<String>? tag;
  final List<String>? beneficiaryClientReferenceId;
  final DateTime? beneficiaryRegistrationDateLte;
  final DateTime? beneficiaryRegistrationDateGte;
  final int? offset;
  final int? limit;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final DateTime? dateOfRegistrationTime;

  ProjectBeneficiarySearchModel({
    this.id,
    this.projectId,
    this.beneficiaryId,
    this.tag,
    this.beneficiaryClientReferenceId,
    this.beneficiaryRegistrationDateLte,
    this.beneficiaryRegistrationDateGte,
    this.offset,
    this.limit,
    this.clientReferenceId,
    this.tenantId,
    int? dateOfRegistration,
    super.boundaryCode,
    super.isDeleted,
  })  : dateOfRegistrationTime = dateOfRegistration == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
        super();

  @MappableConstructor()
  ProjectBeneficiarySearchModel.ignoreDeleted({
    this.id,
    this.projectId,
    this.beneficiaryId,
    this.tag,
    this.beneficiaryClientReferenceId,
    this.beneficiaryRegistrationDateLte,
    this.beneficiaryRegistrationDateGte,
    this.offset,
    this.limit,
    this.clientReferenceId,
    this.tenantId,
    int? dateOfRegistration,
    super.boundaryCode,
  })  : dateOfRegistrationTime = dateOfRegistration == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
        super(isDeleted: false);

  int? get dateOfRegistration => dateOfRegistrationTime?.millisecondsSinceEpoch;
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectBeneficiaryModel extends EntityModel
    with ProjectBeneficiaryModelMappable {
  static const schemaName = 'ProjectBeneficiary';

  final String? id;
  final String? projectId;
  final String? beneficiaryId;
  final String? tag;
  final String? beneficiaryClientReferenceId;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final DateTime dateOfRegistrationTime;
  final ProjectBeneficiaryAdditionalFields? additionalFields;

  ProjectBeneficiaryModel({
    this.additionalFields,
    this.id,
    this.projectId,
    this.beneficiaryId,
    this.tag,
    this.beneficiaryClientReferenceId,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    required int dateOfRegistration,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  })  : dateOfRegistrationTime =
            DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
        super();

  int get dateOfRegistration => dateOfRegistrationTime.millisecondsSinceEpoch;

  ProjectBeneficiaryCompanion get companion {
    return ProjectBeneficiaryCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      projectId: Value(projectId),
      beneficiaryId: Value(beneficiaryId),
      tag: Value(tag),
      beneficiaryClientReferenceId: Value(beneficiaryClientReferenceId),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      dateOfRegistration: Value(dateOfRegistration),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectBeneficiaryAdditionalFields extends AdditionalFields
    with ProjectBeneficiaryAdditionalFieldsMappable {
  ProjectBeneficiaryAdditionalFields({
    super.schema = 'ProjectBeneficiary',
    required super.version,
    super.fields,
  });
}
