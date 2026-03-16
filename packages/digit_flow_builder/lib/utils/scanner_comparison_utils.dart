import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:flutter/foundation.dart';

/// Thrown when a duplicate check cannot complete due to infrastructure issues
/// (e.g., CrudService not initialized, DB query failure, entity parse error).
///
/// Callers should treat this as "check inconclusive" and block the scan
/// rather than allowing it to proceed unchecked.
class DuplicateCheckException implements Exception {
  final String message;
  const DuplicateCheckException(this.message);

  @override
  String toString() => 'DuplicateCheckException: $message';
}

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

    // Build merged params from three sources (lowest to highest priority):
    // 1. allSchemaValues — facility fields cached from earlier pages
    // 2. formValues — current page's form control values (covers same-page
    //    fields or values not yet flushed to the schema cache)
    // 3. navigationParams — explicit navigation data (highest priority)
    final allSchemaValues = extractAllSchemaValues(schema);
    final mergedNavParams = <String, dynamic>{
      ...allSchemaValues,
      ...formValues,
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
    final service = CrudBlocSingleton().crudService;
    if (!service.isInitialized) {
      throw const DuplicateCheckException('CrudService not initialized');
    }

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
    // Normalize the scanned value so key ordering doesn't matter
    final normalizedScanned = _normalizeBarcode(scannedValue);
    for (final entity in entities) {
      try {
        final additionalFields = (entity as dynamic).additionalFields;
        if (additionalFields == null) continue;
        for (final field in additionalFields.fields) {
          if (field.key == config.extractKey && field.value != null) {
            final existingValues =
                extractComparisonValues(field.value.toString());
            if (existingValues.contains(scannedValue) ||
                existingValues.contains(normalizedScanned)) {
              return true;
            }
          }
        }
      } catch (e) {
        throw DuplicateCheckException('Entity parse failed: $e');
      }
    }
    return false;
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
  /// Supports both new format (`01:GTIN|10:BATCH|17:EXPIRY|21:SERIAL`)
  /// and legacy format (`GTIN,SERIAL,BATCH,EXPIRY`). For legacy entries,
  /// a normalized new-format string is also emitted so cross-format
  /// matching works correctly.
  static List<String> extractComparisonValues(String serializedData) {
    final values = <String>[];
    for (final barcode in serializedData.split(';')) {
      final trimmed = barcode.trim();
      if (trimmed.isEmpty) continue;
      // Always add the full barcode string for full-match comparison
      values.add(trimmed);

      final isNewFormat =
          trimmed.contains('|') || RegExp(r'^\d{2}:').hasMatch(trimmed);

      if (isNewFormat) {
        // New format: key:value|key:value
        // Also emit a key-sorted normalized form for order-insensitive matching
        final normalized = _normalizeBarcode(trimmed);
        if (normalized != trimmed) {
          values.add(normalized);
        }
        for (final pair in trimmed.split('|')) {
          final colonIdx = pair.indexOf(':');
          if (colonIdx > 0) {
            final key = pair.substring(0, colonIdx).trim();
            final value = pair.substring(colonIdx + 1).trim();
            if (key == '21' && value.isNotEmpty) {
              values.add(value);
            }
          }
        }
      } else {
        // Legacy format: GTIN,SERIAL,BATCH,EXPIRY (positional)
        final parts = trimmed.split(',');
        final gtin = parts.isNotEmpty ? parts[0].trim() : '';
        final serial = parts.length > 1 ? parts[1].trim() : '';
        final batch = parts.length > 2 ? parts[2].trim() : '';
        final expiry = parts.length > 3 ? parts[3].trim() : '';

        // Extract serial for serial-based matching
        if (serial.isNotEmpty) {
          values.add(serial);
        }
        // Emit a normalized new-format string so a new-format scan
        // can match against this legacy DB row
        final normalized = <String>[];
        if (gtin.isNotEmpty) normalized.add('01:$gtin');
        if (expiry.isNotEmpty) normalized.add('17:$expiry');
        if (batch.isNotEmpty) normalized.add('10:$batch');
        if (serial.isNotEmpty) normalized.add('21:$serial');
        if (normalized.isNotEmpty) {
          values.add(normalized.join('|'));
        }
      }
    }
    return values;
  }

  /// Normalizes a new-format barcode by sorting key-value pairs by AI code.
  ///
  /// Ensures `01:GTIN|10:BATCH|17:EXPIRY` and `01:GTIN|17:EXPIRY|10:BATCH`
  /// produce the same string for order-insensitive comparison.
  static String _normalizeBarcode(String barcode) {
    if (!barcode.contains('|') && !RegExp(r'^\d{2}:').hasMatch(barcode)) {
      return barcode;
    }
    final pairs = barcode.split('|').map((p) => p.trim()).toList();
    pairs.sort();
    return pairs.join('|');
  }
}
