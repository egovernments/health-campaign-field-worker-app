import 'package:dart_mappable/dart_mappable.dart';
import 'package:health_campaigns_flutter/models/data_model.dart';

@MappableClass()
class OpLogEntry<T extends DataModel> {
  final T entity;
  final ApiOperation operation;
  final bool isSynced;

  const OpLogEntry(
    this.entity,
    this.operation, {
    this.isSynced = false,
  });
}

@MappableEnum()
enum ApiOperation { create, search, update }
