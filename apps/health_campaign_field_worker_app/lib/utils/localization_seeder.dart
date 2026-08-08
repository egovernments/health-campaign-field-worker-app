import 'dart:convert';

import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../data/local_store/app_shared_preferences.dart';

/// Seeds the local SQL localization table with keys from
/// `lib/utils/localization_strings.json`.
///
/// The app fetches localizations from the MDMS localization service at
/// runtime; keys added to the JSON aren't picked up unless MDMS is also
/// updated. This dev-only seeder writes the JSON rows into the local table
/// on startup so keys resolve offline until MDMS catches up.
///
/// **Locale-scoped**: only rows whose `locale` matches the app's currently-
/// active locale (from `AppSharedPreferences().getSelectedLocale`) are
/// inserted. That avoids polluting the DB with unrelated env locales
/// (e.g. `pt_DEMO` rows when the SL tenant is running under `en_MZ`).
///
/// If no locale is persisted yet (first launch, before language picker),
/// the seed is skipped — the next boot will seed once the app has stored
/// its selection.
///
/// Uses `insertAllOnConflictUpdate`, so re-running on every boot is safe
/// and MDMS-fetched rows overwrite seed rows on refresh.
Future<void> seedLocalLocalizations(LocalSqlDataStore sql) async {
  try {
    final activeLocale = AppSharedPreferences().getSelectedLocale;
    if (activeLocale == null || activeLocale.isEmpty) {
      debugPrint(
          'Localization seed: no active locale in prefs, skipping seed');
      return;
    }

    final jsonStr =
        await rootBundle.loadString('lib/utils/localization_strings.json');
    final raw = json.decode(jsonStr);
    if (raw is! List) return;

    final companions = <LocalizationCompanion>[];
    int skippedByLocale = 0;
    for (final row in raw) {
      if (row is! Map) continue;
      final code = row['code']?.toString();
      final locale = row['locale']?.toString();
      final message = row['message']?.toString();
      final module = row['module']?.toString();
      if (code == null ||
          locale == null ||
          message == null ||
          module == null) {
        continue;
      }
      if (locale != activeLocale) {
        skippedByLocale++;
        continue;
      }
      companions.add(LocalizationCompanion(
        code: Value(code),
        locale: Value(locale),
        message: Value(message),
        module: Value(module),
      ));
    }

    if (companions.isEmpty) {
      debugPrint(
          'Localization seed: no rows match locale $activeLocale '
          '(skipped $skippedByLocale non-matching)');
      return;
    }

    await sql.batch((batch) {
      batch.insertAllOnConflictUpdate(sql.localization, companions);
    });
    debugPrint(
        'Localization seed: upserted ${companions.length} rows for '
        '$activeLocale (skipped $skippedByLocale non-matching)');
  } catch (e) {
    debugPrint('Local localization seed failed: $e');
  }
}
