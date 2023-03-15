import 'package:dart_mappable/dart_mappable.dart';

import '../data_model.dart';

@MappableClass()
class OpLogEntry<T extends EntityModel> {
  final int? id;
  final T entity;
  final DataModelType type;
  final DataOperation operation;
  final bool isSynced;
  final DateTime dateCreated;
  final String createdBy;
  final DateTime? syncedOn;

  const OpLogEntry(
    this.entity,
    this.operation, {
    this.id,
    required this.createdBy,
    required this.type,
    this.isSynced = false,
    required this.dateCreated,
    this.syncedOn,
  });
}

@MappableEnum()
enum DataOperation {
  create,
  search,
  update,
  delete,
  singleCreate,
}

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum ApiOperation {
  login,
  create,
  search,
  update,
  delete,
  bulkCreate,
  bulkUpdate,
  bulkDelete,
  singleCreate
}
