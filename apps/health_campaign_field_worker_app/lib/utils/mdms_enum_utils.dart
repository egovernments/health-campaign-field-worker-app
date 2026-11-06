/// Helpers that fill a form field's `enums` from MDMS masters named in its
/// `schemaCode`, used when the FormConfig is downloaded
/// (ProjectBloc.enrichFormSchemasWithEnumsForForms).
///
/// A `schemaCode` can name one master (`module.master`) or several,
/// separated by commas, e.g.
/// `common-masters.GroupVaccinationLocations,common-masters.GroupVaccinationLocationsCLF`.
/// With several masters, their records are merged in the listed order and a
/// code that appears again in a later master is dropped (first one wins).
library mdms_enum_utils;

import 'package:collection/collection.dart';

/// The valid `module.master` names in [schemaCode], trimmed, in order and
/// without repeats. Parts that aren't exactly `module.master` are skipped.
List<String> splitSchemaCodes(dynamic schemaCode) {
  if (schemaCode is! String || schemaCode.trim().isEmpty) return const [];

  final codes = <String>[];
  for (final part in schemaCode.split(',')) {
    final code = part.trim();
    final pieces = code.split('.');
    if (pieces.length != 2 || pieces.any((p) => p.trim().isEmpty)) continue;
    if (!codes.contains(code)) codes.add(code);
  }
  return codes;
}

/// Adds every master named by a `schemaCode` anywhere under [node] to
/// [schemaCodes].
void collectSchemaCodes(dynamic node, Set<String> schemaCodes) {
  if (node is Map) {
    schemaCodes.addAll(
        splitSchemaCodes(node['schemaCode']).map(baseSchemaCode));
    for (final value in node.values) {
      collectSchemaCodes(value, schemaCodes);
    }
  } else if (node is List) {
    for (final item in node) {
      collectSchemaCodes(item, schemaCodes);
    }
  }
}

/// A `schemaCode` may name one record of a master and take that record's
/// `categories` list as the options, written `module.master:RECORD_CODE`.
/// Used for the outside-household site types master
/// (`HCM.OUTSIDE_HOUSEHOLD_TYPES:TRANSIT_POST`), where each site type lists
/// the categories a site of that type can have.
///
/// Returns the `module.master` part, which is what MDMS is queried with.
String baseSchemaCode(String schemaCode) {
  final i = schemaCode.indexOf(':');
  return i == -1 ? schemaCode : schemaCode.substring(0, i);
}

/// The record code after `:` in a `module.master:RECORD_CODE` schemaCode,
/// or null for a plain `module.master`.
String? schemaCodeRecord(String schemaCode) {
  final i = schemaCode.indexOf(':');
  return i == -1 ? null : schemaCode.substring(i + 1).trim();
}

/// Localisation key of a category of a `<module>.<NAME>_TYPES` master, as
/// the admin console defines it: `HCM_ADMIN_CONSOLE_<NAME>_CATEGORY_<code>`.
String categoryLabelKey(String baseCode, String category) {
  final master = baseCode.split('.').last;
  final name = master.endsWith('_TYPES')
      ? master.substring(0, master.length - '_TYPES'.length)
      : master;
  return 'HCM_ADMIN_CONSOLE_${name}_CATEGORY_$category';
}

/// The `enums` list for a field whose `schemaCode` is [schemaCode], built
/// from the downloaded records in [enumsBySchemaCode]. Returns null when no
/// named master returned any record, so the field keeps its own `enums`.
///
/// One master: every record is kept as is (same as before multi-master
/// support). Several masters: records are merged in order and a repeated
/// code is dropped.
List<Map<String, dynamic>>? mergeEnumsForSchemaCode(
  dynamic schemaCode,
  Map<String, List<dynamic>> enumsBySchemaCode,
) {
  final codes = splitSchemaCodes(schemaCode);
  if (codes.isEmpty) return null;

  final merged = <Map<String, dynamic>>[];
  final seenCodes = <String>{};
  final dedupe = codes.length > 1;

  for (final code in codes) {
    final base = baseSchemaCode(code);
    final recordCode = schemaCodeRecord(code);

    if (recordCode != null) {
      // `module.master:RECORD`: the options are that record's categories.
      final record = (enumsBySchemaCode[base] ?? const [])
          .whereType<Map>()
          .where((r) => r['code']?.toString() == recordCode)
          .firstOrNull;
      final categories = record?['categories'];
      if (categories is! List) continue;
      for (final category in categories) {
        final value = category?.toString();
        if (value == null || value.isEmpty) continue;
        if (dedupe) {
          if (seenCodes.contains(value)) continue;
          seenCodes.add(value);
        }
        merged.add({
          'code': value,
          'name': categoryLabelKey(base, value),
        });
      }
      continue;
    }

    for (final record in enumsBySchemaCode[code] ?? const []) {
      if (record is! Map) continue;
      final value = record['code'];
      if (dedupe && value != null) {
        if (seenCodes.contains(value.toString())) continue;
        seenCodes.add(value.toString());
      }
      merged.add({
        'code': value,
        'name': record['name'] ?? value,
      });
    }
  }

  return merged.isEmpty ? null : merged;
}

/// Replaces the `enums` of every node under [node] whose `schemaCode`
/// returned records. Nodes whose masters returned nothing keep their `enums`.
void applyEnumsToSchemaCodes(
  dynamic node,
  Map<String, List<dynamic>> enumsBySchemaCode,
) {
  if (node is Map) {
    final enums =
        mergeEnumsForSchemaCode(node['schemaCode'], enumsBySchemaCode);
    if (enums != null) {
      node['enums'] = enums;
    }
    for (final value in node.values) {
      applyEnumsToSchemaCodes(value, enumsBySchemaCode);
    }
  } else if (node is List) {
    for (final item in node) {
      applyEnumsToSchemaCodes(item, enumsBySchemaCode);
    }
  }
}
