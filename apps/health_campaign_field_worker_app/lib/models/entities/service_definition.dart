// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';
import 'attributes.dart';

@MappableClass(ignoreNull: true)
class ServiceDefinitionSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final List<String>? code;
  final bool? isActive;
  final bool? isDeleted;

  ServiceDefinitionSearchModel({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    this.isDeleted,
    super.boundaryCode,
  }) : super();
}

@MappableClass(ignoreNull: true)
class ServiceDefinitionModel extends EntityModel {
  final String? id;
  final String? tenantId;
  final String? code;
  final bool? isActive;
  final bool? isDeleted;
  final int? rowVersion;
  final List<AttributesModel>? attributes;

  ServiceDefinitionModel({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    this.isDeleted,
    this.rowVersion,
    this.attributes,
    super.auditDetails,
  }) : super();

  ServiceDefinitionCompanion get companion {
    return ServiceDefinitionCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      code: Value(code),
      isActive: Value(isActive),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
    );
  }
}
