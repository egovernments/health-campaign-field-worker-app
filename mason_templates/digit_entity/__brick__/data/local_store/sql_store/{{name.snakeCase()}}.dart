import 'package:drift/drift.dart';

class {{name.pascalCase()}}Table extends Table {
  {{#sqlAttributes}}{{type.pascalCase()}}Column get {{name}} => {{type.camelCase()}}()();
  {{/sqlAttributes}}
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => { {{#sqlAttributes}}{{#isPk}}{{.}}, {{/isPk}}{{/sqlAttributes}} };
}