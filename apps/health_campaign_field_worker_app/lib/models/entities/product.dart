// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'product.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductSearchModel extends EntitySearchModel with ProductSearchModelMappable {
  final String? id;
  final String? type;
  final String? name;
  final String? manufacturer;
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  ProductSearchModel({
    this.id,
    this.type,
    this.name,
    this.manufacturer,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ProductSearchModel.ignoreDeleted({
    this.id,
    this.type,
    this.name,
    this.manufacturer,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductModel extends EntityModel with ProductModelMappable {

  static const schemaName = 'Product';

  final String? id;
  final String? type;
  final String? name;
  final String? manufacturer;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final ProductAdditionalFields? additionalFields;

  ProductModel({
    this.additionalFields,
    this.id,
    this.type,
    this.name,
    this.manufacturer,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ProductCompanion get companion {
    return ProductCompanion(
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
      type: Value(type),
      name: Value(name),
      manufacturer: Value(manufacturer),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductAdditionalFields extends AdditionalFields with ProductAdditionalFieldsMappable {
  ProductAdditionalFields({
    super.schema = 'Product',
    required super.version,
    super.fields,
  });
}

