import 'package:drift/drift.dart';

class ProjectBeneficiaryTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}