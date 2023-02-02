import 'package:dart_mappable/dart_mappable.dart';

import '../data_model.dart';

@MappableClass()
class OpLogEntry<T extends DataModel> {
  final int? id;
  final T entity;
  final DataModelType type;
  final ApiOperation operation;
  final bool isSynced;
  final DateTime dateCreated;

  const OpLogEntry(
    this.entity,
    this.operation, {
    this.id,
    required this.type,
    this.isSynced = false,
    required this.dateCreated,
  });
}

@MappableEnum()
enum ApiOperation { create, search, update }
