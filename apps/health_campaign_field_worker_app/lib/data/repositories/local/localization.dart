import 'dart:async';

import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_data_model/utils/utils.dart';
import 'package:drift/drift.dart';

import '../../../utils/utils.dart';
import '../../local_store/no_sql/schema/localization.dart';

class LocalizationLocalRepository {
  FutureOr<List<Localization>> returnLocalizationFromSQL(
      LocalSqlDataStore sql) async {
    final selectQuery = sql.select(sql.localization).join([]);

    // List to hold the AND conditions
    final andConditions = <Expression<bool>>[];

    // Add condition for locale if provided
    if (LocalizationParams().locale != null) {
      final localeString = '${LocalizationParams().locale!}';
      andConditions.add(sql.localization.locale.equals(localeString));
    }

    // Add conditions for modules and codes
    if (LocalizationParams().module != null &&
        LocalizationParams().module!.isNotEmpty) {
      final moduleToExclude = LocalizationParams().module!;

      if (LocalizationParams().exclude == true) {
        // Exclude modules but include records where the code matches
        final moduleCondition =
            sql.localization.module.contains(moduleToExclude).not();
        final codeCondition = LocalizationParams().code != null &&
                LocalizationParams().code!.isNotEmpty
            ? sql.localization.code.isIn(LocalizationParams().code!.toList())
            : const Constant(false); // True if no code filter

        // Combine conditions: exclude module unless code matches
        andConditions.add(buildAnd([moduleCondition | codeCondition]));
      } else {
        // Include specified modules and optionally filter by code
        final moduleCondition =
            sql.localization.module.contains(moduleToExclude);
        final codeCondition = LocalizationParams().code != null &&
                LocalizationParams().code!.isNotEmpty
            ? sql.localization.code.isIn(LocalizationParams().code!.toList())
            : const Constant(false);

        // Combine conditions: module matches and optionally code filter
        andConditions.add(buildAnd([moduleCondition | codeCondition]));
      }
    } else if (LocalizationParams().code != null &&
        LocalizationParams().code!.isNotEmpty) {
      // If no module filter, just apply code filter
      andConditions
          .add(sql.localization.code.isIn(LocalizationParams().code!.toList()));
    }

    // Apply the combined conditions to the query
    if (andConditions.isNotEmpty) {
      selectQuery.where(buildAnd(andConditions));
    }

    final result = await selectQuery.get();

    return result.map((row) {
      final data = row.readTableOrNull(sql.localization);

      return Localization()
        ..code = data!.code
        ..locale = data.locale
        ..module = data.module
        ..message = data.message;
    }).toList();
  }
}
