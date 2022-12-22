import 'package:drift/drift.dart';


class ProjectProductVariantTable extends Table {
  TextColumn get productVariantId => text()();
  TextColumn get type => text()();
  BoolColumn get isBaseUnitVariant => boolean()();
  TextColumn get clientReferenceId => text().unique()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}