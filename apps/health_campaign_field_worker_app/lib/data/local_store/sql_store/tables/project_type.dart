import 'package:drift/drift.dart';

import 'project_product_variant.dart';

class ProjectType extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get name => text()();
  TextColumn get code => text()();
  TextColumn get group => text()();
  TextColumn get beneficiaryType => text()();
  TextColumn get eligibilityCriteria => text()();
  TextColumn get taskProcedure => text()();
  TextColumn get clientReferenceId => text()();
  
  TextColumn get resources => text().references(ProjectProductVariant, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}