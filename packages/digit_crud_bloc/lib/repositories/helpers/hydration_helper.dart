/// HydrationHelper provides static utilities for hydrating raw rows with nested model data.
import 'package:digit_crud_bloc/models/global_search_params.dart';

import '../local/search_entity_repository.dart';

class HydrationHelper {
  static Future<List<Map<String, dynamic>>> hydrateRawRows(
    SearchEntityRepository repo,
    List<Map<String, dynamic>> rawRows,
    Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    String currentModelName,
  ) async {
    final enrichedRows = <Map<String, dynamic>>[];
    final modelNestedMapping = nestedModelMapping[currentModelName];
    if (modelNestedMapping == null) return rawRows;
    enrichedRows.addAll(rawRows.map((e) => Map<String, dynamic>.from(e)));
    for (final entry in modelNestedMapping.entries) {
      final targetTable = entry.value.table;
      final field = entry.value;
      final localKeySnake = repo._queryBuilder.camelToSnake(field.localKey);
      final localValues = enrichedRows
          .map((row) => row[localKeySnake])
          .where((v) => v != null)
          .toSet();
      if (localValues.isEmpty) continue;
      final targetResults = await repo._queryRawTable(
        table: targetTable,
        filters: [
          SearchFilter(
            root: targetTable,
            field: repo._queryBuilder.camelToSnake(field.foreignKey),
            operator: 'in',
            value: localValues.toList(),
          ),
        ],
        select: ['*'],
      );
      for (final row in enrichedRows) {
        final localValue = row[localKeySnake];
        if (localValue == null) continue;
        final relatedRows = targetResults.where((targetRow) {
          return targetRow[repo._queryBuilder.camelToSnake(field.foreignKey)] ==
              localValue;
        }).toList();
        row[entry.key] = field.type == NestedMappingType.one
            ? (relatedRows.isNotEmpty ? relatedRows.first : null)
            : relatedRows;
      }
    }
    return enrichedRows;
  }
}
