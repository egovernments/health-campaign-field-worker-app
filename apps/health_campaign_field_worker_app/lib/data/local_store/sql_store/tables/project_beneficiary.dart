import 'package:drift/drift.dart';


class ProjectBeneficiaryTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  TextColumn get beneficiaryId => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text().unique()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}