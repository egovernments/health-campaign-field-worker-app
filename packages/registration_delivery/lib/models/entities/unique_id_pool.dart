// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'unique_id_pool.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UniqueIdPoolSearchModel extends EntitySearchModel
    with UniqueIdPoolSearchModelMappable {
  final String? id;
  final String? userUUID;
  final String? clientReferenceId;
  final String? status;

  UniqueIdPoolSearchModel({
    this.id,
    this.status,
    this.clientReferenceId,
    this.userUUID,
    super.isDeleted,
    super.boundaryCode,
  }) : super();

  @MappableConstructor()
  UniqueIdPoolSearchModel.ignoreDeleted({
    this.id,
    this.status,
    this.clientReferenceId,
    this.userUUID,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UniqueIdPoolModel extends EntityModel with UniqueIdPoolModelMappable {
  static const schemaName = 'UniqueIds';

  final String id;
  final String userUUID;
  final String clientReferenceId;
  final String status;

  UniqueIdPoolModel({
    required this.id,
    required this.status,
    required this.clientReferenceId,
    required this.userUUID,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  UniqueIdPoolCompanion get companion {
    return UniqueIdPoolCompanion(
      id: Value(id),
      userUUID: Value(userUUID),
      clientReferenceId: Value(clientReferenceId),
      status: Value(status),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UniqueIdPoolAdditionalFields extends AdditionalFields
    with UniqueIdPoolAdditionalFieldsMappable {
  UniqueIdPoolAdditionalFields({
    super.schema = 'UniqueIds',
    required super.version,
    super.fields,
  });
}
