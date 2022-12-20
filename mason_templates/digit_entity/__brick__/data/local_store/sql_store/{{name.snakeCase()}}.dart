import 'package:drift/drift.dart';

class {{name.pascalCase()}}Table extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => { {{#sqlAttributes}}{{#primaryKeys}}{{.}}, {{/primaryKeys}}{{/sqlAttributes}} };
}