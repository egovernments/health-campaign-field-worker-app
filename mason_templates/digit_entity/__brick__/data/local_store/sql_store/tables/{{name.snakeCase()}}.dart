{{^isEnum}}import 'package:drift/drift.dart';

class {{name.pascalCase()}}Table extends Table {
  {{#sqlAttributes}}{{^isEnum}}{{columnType.pascalCase()}}Column get {{name.camelCase()}} => {{type.camelCase()}}(){{#nullable}}.nullable(){{/nullable}}{{#isPk}}.unique(){{/isPk}}();{{/isEnum}}{{#isEnum}}IntColumn get {{name.camelCase()}} => intEnum<name.pascalCase()>()();{{/isEnum}}
  {{/sqlAttributes}}

  @override
  Set<Column>? get primaryKey => { {{#sqlAttributes}}{{#isPk}}{{.}}, {{/isPk}}{{/sqlAttributes}} };
}{{/isEnum}}{{#isEnum}}// No table generated for Enum{{/isEnum}}