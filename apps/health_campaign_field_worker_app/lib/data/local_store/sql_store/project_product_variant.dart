import 'package:drift/drift.dart';

class ProjectProductVariantTable extends Table {
  TextColumn get productVariantId => text()();
  TextColumn get type => text()();
  BoolColumn get isBaseUnitVariant => boolean()();
  

  @override
  Set<Column>? get primaryKey => {  };
}