import 'package:drift/drift.dart';

import 'project_product_variant.dart';

class ProjectResource extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  
  TextColumn get resources => text().references(ProjectProductVariant, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}