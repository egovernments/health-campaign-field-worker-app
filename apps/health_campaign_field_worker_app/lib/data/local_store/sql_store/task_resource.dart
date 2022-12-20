import 'package:drift/drift.dart';

class TaskResourceTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get productVariantId => text()();
  TextColumn get quantity => text()();
  BoolColumn get isDelivered => boolean()();
  TextColumn get deliveryComment => text()();
  

  @override
  Set<Column>? get primaryKey => {  };
}