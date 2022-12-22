import 'package:drift/drift.dart';


class TaskResourceTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get productVariantId => text()();
  TextColumn get quantity => text()();
  BoolColumn get isDelivered => boolean()();
  TextColumn get deliveryComment => text().nullable()();
  TextColumn get clientReferenceId => text().unique()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}