import 'package:drift/drift.dart';

class {{name.pascalCase()}}Table extends Table {
  {{#sqlAttributes}}{{columnType.pascalCase()}}Column get {{name}} => {{type.camelCase()}}(){{#nullable}}.nullable(){{/nullable}}{{#isPk}}.unique(){{/isPk}}();
  {{/sqlAttributes}}

  @override
  Set<Column>? get primaryKey => { {{#sqlAttributes}}{{#isPk}}{{.}}, {{/isPk}}{{/sqlAttributes}} };
}