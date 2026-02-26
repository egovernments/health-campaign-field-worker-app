import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:flutter/foundation.dart';

/// Utility class for scanner duplicate detection via DB queries.
///
/// Used by [ScannerComparisonProvider] in screen_builder to perform
/// per-scan duplicate checks against the local database when a barcode
/// or QR code is scanned.
class ScannerComparisonUtils {
  const ScannerComparisonUtils._();

  /// Finds the [ComparisonConfig] for a given scanner field name in the schema.
  ///
  /// Handles multiEntityConfig suffix stripping: form control names like
  /// `scanResource_item_0` are matched against schema key `scanResource`.
  static ComparisonConfig? findComparisonConfig(
      SchemaObject schema, String fieldName) {
    // Strip _item_N suffix added by multiEntityConfig
    final baseFieldName = fieldName.replaceAll(RegExp(r'_item_\d+$'), '');
    for (final page in schema.pages.values) {
      final properties = page.properties;
      if (properties == null) continue;
      for (final entry in properties.entries) {
        if ((entry.key == fieldName || entry.key == baseFieldName) &&
            entry.value.format == PropertySchemaFormat.scanner) {
          return entry.value.comparisonConfig;
        }
      }
    }
    return null;
  }

  /// Gets the error message for duplicate detection for a given field.
  static String? getDuplicateErrorMessage(
      SchemaObject schema, String fieldName) {
    final config = findComparisonConfig(schema, fieldName);
    return config?.errorMessage;
  }

  /// Extracts all field values from all pages in the cached schema.
  /// Returns a flat map of fieldName -> value (across all pages).
  static Map<String, dynamic> extractAllSchemaValues(SchemaObject schema) {
    final allValues = <String, dynamic>{};
    for (final page in schema.pages.values) {
      final properties = page.properties;
      if (properties == null) continue;
      for (final entry in properties.entries) {
        final value = entry.value.value;
        if (value != null) {
          allValues[entry.key] = value;
        }
      }
    }
    return allValues;
  }

  /// Executes a per-scan duplicate check by querying the local DB.
  ///
  /// Looks up the [ComparisonConfig] for [fieldName] in the [schema],
  /// resolves filter values from [formValues] and [navigationParams],
  /// then queries the DB for matching entities.
  ///
  /// For `extractFrom: "column"` configs, the scanned value is added as
  /// a direct column filter — any result means duplicate.
  ///
  /// For `extractFrom: "additionalFields"` configs, results are fetched
  /// by senderId/receiverId filters, then each entity's additionalFields
  /// are checked for a matching extractKey value.
  static Future<bool> executeDuplicateCheck(
    SchemaObject schema,
    String compositeKey,
    String fieldName,
    String scannedValue,
    Map<String, dynamic> formValues,
    Map<String, dynamic> navigationParams,
  ) async {
    // 1. Find comparisonConfig for fieldName in schema
    final config = findComparisonConfig(schema, fieldName);
    if (config == null) return false;

    // Build merged navigation params that include values from ALL schema pages.
    // This is needed because facility fields (e.g., facilityFromWhich, facilityToWhich)
    // are filled on earlier form pages and stored in the cached schema, not in
    // the navigation params or current page's form values.
    final allSchemaValues = extractAllSchemaValues(schema);
    final mergedNavParams = <String, dynamic>{
      ...allSchemaValues,
      ...navigationParams,
    };

    // 2. Resolve filter values with switchOn/cases support
    final resolvedFilters = <SearchFilter>[];
    for (final filter in config.filters) {
      final resolvedValue =
          resolveFilterValue(filter, formValues, mergedNavParams);
      if (resolvedValue == null || resolvedValue.isEmpty) continue;
      resolvedFilters.add(SearchFilter(
        field: filter.key,
        operator: filter.operation,
        value: resolvedValue,
        root: config.model,
      ));
    }

    // 3. For "column" match, add scanned value as direct filter
    if (config.extractFrom == 'column') {
      resolvedFilters.add(SearchFilter(
        field: config.extractKey,
        operator: 'equals',
        value: scannedValue,
        root: config.model,
      ));
    }

    if (resolvedFilters.isEmpty) return false;

    // 4. Execute search
    try {
      final service = CrudBlocSingleton().crudService;
      if (!service.isInitialized) return false;

      final (results, _) = await service.searchEntities(
        query: GlobalSearchParameters(
          filters: resolvedFilters,
          select: [config.model],
          primaryModel: config.model,
        ),
      );

      final entities = results[config.model] ?? [];

      // 5. For "column" match: any result = duplicate
      if (config.extractFrom == 'column') {
        return entities.isNotEmpty;
      }

      // 6. For "additionalFields" match: compare scanned value
      for (final entity in entities) {
        try {
          final additionalFields = (entity as dynamic).additionalFields;
          if (additionalFields == null) continue;
          for (final field in additionalFields.fields) {
            if (field.key == config.extractKey && field.value != null) {
              final existingValues =
                  extractComparisonValues(field.value.toString());
              if (existingValues.contains(scannedValue)) {
                return true;
              }
            }
          }
        } catch (_) {
          continue;
        }
      }
      return false;
    } catch (e) {
      debugPrint('Duplicate check failed: $e');
      return false;
    }
  }

  /// Resolves filter value, handling switchOn/cases for conditional values.
  ///
  /// When a filter has `switchOn` and `cases`, the switchOn template is resolved
  /// first to determine which case applies. For example, with stock entry types:
  /// - `switchOn: "{{navigation.stockEntryType}}"`
  /// - `cases: {"ISSUED": "{{navigation.facilityToWhich}}"}`
  /// - `value: "{{navigation.facilityFromWhich}}"` (default)
  ///
  /// If stockEntryType is "ISSUED", uses the ISSUED case template.
  /// Otherwise falls back to the default value template.
  static String? resolveFilterValue(
    ComparisonFilter filter,
    Map<String, dynamic> formValues,
    Map<String, dynamic> navigationParams,
  ) {
    String template = filter.value;

    // Handle switchOn/cases for conditional filter values
    if (filter.switchOn != null && filter.cases != null) {
      final switchKey =
          resolveTemplate(filter.switchOn!, formValues, navigationParams);
      if (switchKey != null && filter.cases!.containsKey(switchKey)) {
        template = filter.cases![switchKey]!;
      }
    }

    return resolveTemplate(template, formValues, navigationParams);
  }

  /// Resolves a template string like `{{navigation.facilityFromWhich}}` to its value.
  ///
  /// Supports two prefixes:
  /// - `form.` — looks up value in [formValues]
  /// - `navigation.` — looks up value in [navigationParams]
  ///
  /// Static strings (without `{{`) are returned as-is.
  static String? resolveTemplate(
    String template,
    Map<String, dynamic> formValues,
    Map<String, dynamic> navigationParams,
  ) {
    if (!template.contains('{{')) return template;

    final match = RegExp(r'^\{\{(.+?)\}\}$').firstMatch(template);
    if (match == null) return template;
    final path = match.group(1)!.trim();

    if (path.startsWith('form.')) {
      return formValues[path.substring(5)]?.toString();
    }
    if (path.startsWith('navigation.')) {
      return navigationParams[path.substring(11)]?.toString();
    }
    return null;
  }

  /// Extracts comparison values from serialized GS1 barcode strings.
  ///
  /// Uses serial number (AI 21) when available, otherwise uses the full
  /// serialized barcode string as the comparison fingerprint.
  ///
  /// Format: `01:GTIN|10:BATCH|17:EXPIRY|21:SERIAL;01:GTIN|...`
  static List<String> extractComparisonValues(String serializedData) {
    final values = <String>[];
    for (final barcode in serializedData.split(';')) {
      if (barcode.trim().isEmpty) continue;
      // Always add the full barcode string for full-match comparison
      values.add(barcode.trim());
      // Also add serial number (AI 21) separately if present
      for (final pair in barcode.split('|')) {
        final colonIdx = pair.indexOf(':');
        if (colonIdx > 0) {
          final key = pair.substring(0, colonIdx).trim();
          final value = pair.substring(colonIdx + 1).trim();
          if (key == '21' && value.isNotEmpty) {
            values.add(value);
          }
        }
      }
    }
    return values;
  }
}
