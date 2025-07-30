import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../blocs/app_localization.dart';
import '../json_forms.dart';
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
      pageValues = JsonForms.getFormValues(currentForm, pageSchema);
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
