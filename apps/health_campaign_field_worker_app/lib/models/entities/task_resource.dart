// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'task_resource.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TaskResourceSearchModel extends EntitySearchModel with TaskResourceSearchModelMappable {
  final String? id;
  final String? tenantId;
  
  TaskResourceSearchModel({
    this.id,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  TaskResourceSearchModel.ignoreDeleted({
    this.id,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TaskResourceModel extends EntityModel with TaskResourceModelMappable {

  static const schemaName = 'TaskResource';

  final String clientReferenceId;
  final String? taskclientReferenceId;
  final String? taskId;
  final String? id;
  final String? productVariantId;
  final String? quantity;
  final bool? isDelivered;
  final String? deliveryComment;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final TaskResourceAdditionalFields? additionalFields;

  TaskResourceModel({
    this.additionalFields,
    required this.clientReferenceId,
    this.taskclientReferenceId,
    this.taskId,
    this.id,
    this.productVariantId,
    this.quantity,
    this.isDelivered,
    this.deliveryComment,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  TaskResourceCompanion get companion {
    return TaskResourceCompanion(
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
      clientReferenceId: Value(clientReferenceId),
      taskclientReferenceId: Value(taskclientReferenceId),
      taskId: Value(taskId),
      id: Value(id),
      productVariantId: Value(productVariantId),
      quantity: Value(quantity),
      isDelivered: Value(isDelivered),
      deliveryComment: Value(deliveryComment),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TaskResourceAdditionalFields extends AdditionalFields with TaskResourceAdditionalFieldsMappable {
  TaskResourceAdditionalFields({
    super.schema = 'TaskResource',
    required super.version,
    super.fields,
  });
}

