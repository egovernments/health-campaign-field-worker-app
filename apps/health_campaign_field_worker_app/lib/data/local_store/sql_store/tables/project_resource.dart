import 'package:drift/drift.dart';

import 'project_product_variant.dart';

class ProjectResourceTable extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  
  TextColumn get resources => text().references(ProjectProductVariantTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}