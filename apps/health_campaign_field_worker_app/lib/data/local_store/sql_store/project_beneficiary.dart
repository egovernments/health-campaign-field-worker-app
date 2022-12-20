import 'package:drift/drift.dart';

class ProjectBeneficiaryTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  TextColumn get beneficiaryId => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => {  };
}