import 'package:drift/drift.dart';

import 'project_product_variant.dart';

class ProjectTypeTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get name => text()();
  TextColumn get code => text()();
  TextColumn get group => text()();
  TextColumn get beneficiaryType => text()();
  TextColumn get eligibilityCriteria => text()();
  TextColumn get taskProcedure => text()();
  TextColumn get clientReferenceId => text().unique()();
  
  TextColumn get resources => text().references(ProjectProductVariantTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}