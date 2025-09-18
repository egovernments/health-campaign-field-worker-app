import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../blocs/app_localization.dart';
import '../models/property_schema/property_schema.dart';

class Constants {
  static RegExp mobileNumberRegExp =
      RegExp(r'^(?=.{10}$)[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  final String dateFormat = 'dd/MM/yyyy';
  final String communityHealthWorker = 'Community Health Worker';
  final String deliveryTeam = 'Delivery Team';
  final String notAvailable = 'N/A';
  final String dateTimeExtFormat = 'dd-MM-yyyy';
  final String dateMonthYearFormat = 'dd MMM yyyy';
  static const String checklistViewDateFormat = 'dd/MM/yyyy hh:mm a';
}

/// `IdGen` is a singleton class that generates unique identifiers.
/// It uses the `Uuid` package to generate version 1 UUIDs.
class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  /// Generates a version 1 UUID and returns it as a string.
  String get identifier => uuid.v1();
}

String? translateIfPresent(String? key, FormLocalization localizations) {
  if (key == null || key == "" || key.trim().isEmpty) return null;

  final value = localizations.translate(key);
  if (value == "" || value.trim().isEmpty) return null;
  return value.trim();
}

TextInputFormatter? getPatternFormatter(List<ValidationRule>? validations) {
  final patternRule = validations?.firstWhere(
    (rule) => rule.type == 'pattern' && rule.value is String,
    orElse: () => const ValidationRule(type: '', value: ''),
  );

  if (patternRule != null && patternRule.type == 'pattern') {
    final originalPattern = patternRule.value;

    // Try to extract allowed character class from patterns like ^[0-9]{10}$
    final match =
        RegExp(r'^\^?\[?([^\]]+)\]?\{\d+\}\$?$').firstMatch(originalPattern);

    if (match != null) {
      final characterClass = match.group(1); // e.g. 0-9

      if (characterClass != null) {
        // Allow only individual characters from the class
        final perCharPattern = RegExp('[$characterClass]');
        return FilteringTextInputFormatter.allow(perCharPattern);
      }
    }

    // Fallback: allow pattern without anchors and braces (not full-string match)
    final fallbackPattern = originalPattern
        .replaceAll(RegExp(r'\^|\$'), '') // remove ^ and $
        .replaceAll(RegExp(r'\{.*?\}'), ''); // remove {n} if present

    final fallbackRegex = RegExp(fallbackPattern);
    return FilteringTextInputFormatter.allow(fallbackRegex);
  }

  return null;
}

bool shouldHideField(PropertySchema schema, FormGroup form) {
  final hidden = schema.hidden;
  if (hidden == true) return true;

  final display = schema.displayBehavior;
  if (display == null) return false;

  final oneOf = display.oneOf;
  final allOf = display.allOf;

  final values = (oneOf ?? allOf!).map((e) {
    final value = form.control(e).value;
    if (value is bool?) return !(value ?? false);
    if (value is String?) return value?.isNotEmpty ?? false;
    return false;
  }).toList();

  final result = oneOf != null && oneOf.isNotEmpty
      ? values.fold(true, (prev, curr) => prev && curr)
      : values.fold(false, (prev, curr) => prev || curr);

  return display.behavior == FormulaBehavior.hide && result;
}

bool isHidden(PropertySchema property) {
  return property.hidden == true;
}

/// Checks if the string can be parsed as a DateTime
bool isDateTime(String input) {
  try {
    DateTime.parse(input);
    return true;
  } catch (_) {
    return false;
  }
}

bool isDateLike(String input) {
  // Checks for common date-like patterns
  final isoPattern = RegExp(r'^\d{4}-\d{2}-\d{2}');
  final slashPattern = RegExp(r'^\d{2}/\d{2}/\d{4}$');

  return isoPattern.hasMatch(input) || slashPattern.hasMatch(input);
}

DateTime parseDate(String input) {
  if (RegExp(r'^\d{4}-\d{2}-\d{2}').hasMatch(input)) {
    return DateTime.parse(input); // ISO 8601
  } else if (RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(input)) {
    final parts = input.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }
  throw FormatException('Unsupported date format');
}

bool isDotSeparatedKey(String input) {
  // Match only things like 'enum.value.subvalue', not decimal numbers or lat/long
  if (input.contains(',') && RegExp(r'\d+\.\d+').hasMatch(input)) {
    // Looks like "12.45, 13.45" → treat as raw value
    return false;
  }

  // Allow only alphabetic dot-separated keys like "enum.value.type"
  return RegExp(r'^[a-zA-Z]+(\.[a-zA-Z]+)+$').hasMatch(input);
}

String formatDateLocalized(
    BuildContext context, DateTime date, String pattern) {
  final locale = Localizations.localeOf(context).toString();
  return DateFormat(pattern, locale).format(date);
}

bool evaluateVisibilityExpression(
    String expression, Map<String, dynamic> values) {
  final value = FormulaParser(
    expression,
    values.isEmpty ? {'dummy': {}} : values,
  );

  final error = value.parse;
  return error["value"] == true;
}

Map<String, dynamic> buildVisibilityEvaluationContext({
  required String currentPageKey,
  required FormGroup currentForm,
  required Map<String, PropertySchema> pages,
}) {
  final Map<String, dynamic> flatContext = {};
  bool isPastCurrentPage = false;

  for (final entry in pages.entries) {
    final pageKey = entry.key;
    final pageSchema = entry.value;

    Map<String, dynamic> pageValues;

    if (pageKey == currentPageKey) {
      pageValues = getFormValues(currentForm, pageSchema);
    } else if (!isPastCurrentPage) {
      pageValues = {
        for (final propEntry in pageSchema.properties!.entries)
          propEntry.key: propEntry.value.value,
      };
    } else {
      pageValues = {
        for (final propEntry in pageSchema.properties!.entries)
          propEntry.key: null,
      };
    }

    // Flatten into dot notation (e.g., beneficiaryLocation.first = 'RACHANA')
    for (final entry in pageValues.entries) {
      flatContext['$pageKey.${entry.key}'] = entry.value ?? '';
    }

    if (pageKey == currentPageKey) {
      isPastCurrentPage = true;
    }
  }

  return flatContext;
}

Map<String, dynamic> getFormValues(
  FormGroup form,
  PropertySchema schema,
) {
  final values = schema.properties!.entries
      .map((e) => getParsedValues(form, e.key, e.value))
      .whereType<MapEntry<String, dynamic>>()
      .toList();

  return Map.fromEntries(values);
}

MapEntry<String, dynamic>? getParsedValues(
  FormGroup form,
  String name,
  PropertySchema schema,
) {
  if (schema.type == PropertySchemaType.object) {
    final results = schema.properties!.entries.map((e) {
      return getParsedValues(form, e.key, e.value);
    });
    return MapEntry(
      name,
      Map.fromEntries(results.whereType<MapEntry<String, dynamic>>()),
    );
  } else {
    final value = form.control(name).value;
    if (value == null) {
      return MapEntry(name, "");
    }
    return MapEntry(name, value);
  }
}

/// Resolves template variables in a string using the format {{key.subkey}}
///
/// This method replaces placeholders in the format {{key}} or {{key.subkey}}
/// with actual values from the provided context maps.
///
/// @param template The template string containing {{key}} placeholders
/// @param formValues Current form values from the active page
/// @param defaultValues Default values that may contain template variables
/// @param allPageValues Combined values from all form pages
/// @return The resolved string with placeholders replaced by actual values
String resolveTemplateVariables(
  String template, {
  Map<String, dynamic>? formValues,
  Map<String, dynamic>? defaultValues,
  Map<String, dynamic>? allPageValues,
}) {
  if (template.isEmpty) return template;

  // Regular expression to match {{key}} or {{key.subkey.subsubkey}}
  final regex = RegExp(r'\{\{([^}]+)\}\}');

  return template.replaceAllMapped(regex, (match) {
    final fullKey = match.group(1)?.trim() ?? '';
    if (fullKey.isEmpty) return match.group(0) ?? '';

    // Try to resolve the value from different sources
    dynamic resolvedValue;

    // Split the key by dots for nested access
    final keyParts = fullKey.split('.');

    // Priority 1: Check current form values
    if (formValues != null) {
      resolvedValue = _getNestedValue(formValues, keyParts);
    }

    // Priority 2: Check all page values if not found
    if (resolvedValue == null && allPageValues != null) {
      resolvedValue = _getNestedValue(allPageValues, keyParts);
    }

    // Priority 3: Check default values
    if (resolvedValue == null && defaultValues != null) {
      // First check if the default value itself contains the key
      resolvedValue = _getNestedValue(defaultValues, keyParts);

      // If not found, check if there's an exact match for special keys like eToken
      if (resolvedValue == null && keyParts.length == 1) {
        // Check if the key exists directly in default values
        resolvedValue = defaultValues[fullKey];
      }
    }

    // Return the resolved value or the original placeholder if not found
    if (resolvedValue != null) {
      return resolvedValue.toString();
    }

    // Return original placeholder if value not found
    return match.group(0) ?? '';
  });
}

/// Helper method to get nested value from a map using dot notation
dynamic _getNestedValue(Map<String, dynamic> map, List<String> keys) {
  // First try direct key lookup (for keys stored with dots like "beneficiaryDetails.nameOfIndividual")
  final fullKey = keys.join('.');
  if (map.containsKey(fullKey)) {
    return map[fullKey];
  }

  // Then try nested lookup
  dynamic current = map;

  for (final key in keys) {
    if (current is Map<String, dynamic>) {
      current = current[key];
    } else {
      return null;
    }

    if (current == null) {
      return null;
    }
  }

  return current;
}
