import 'package:dedup_engine/dedup_engine.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

/// Creates a DedupConfig configured for the HCM beneficiary registration
/// schema.
///
/// Column names match the actual Drift/SQLite column names:
///   - individual table: client_reference_id, date_of_birth, father_name,
///     mobile_number, gender (INTEGER enum), is_deleted
///   - name table: given_name, family_name (FK: individual_client_reference_id)
///   - address table: latitude, longitude, locality_boundary_code
///     (FK: related_client_reference_id)
DedupConfig createHcmDedupConfig() {
  return const DedupConfig(
    tableName: 'individual',
    idColumn: 'client_reference_id',
    joins: [
      JoinSpec(
        table: 'name',
        on: 'individual_client_reference_id',
      ),
      JoinSpec(
        table: 'address',
        on: 'related_client_reference_id',
      ),
    ],

    // ── Match fields ──────────────────────────────────────────────────
    matchFields: [
      // Given name: best of JW + containment, plus dedicated phonetic
      MatchField(
        column: 'given_name',
        strategy: Strategy.nameBest,
        weight: 0.20,
      ),
      MatchField(
        column: 'given_name',
        strategy: Strategy.damerau,
        weight: 0.10,
      ),
      MatchField(
        column: 'given_name',
        strategy: Strategy.phonetic,
        weight: 0.08,
      ),
      // Father/guardian name
      MatchField(
        column: 'father_name',
        strategy: Strategy.jaroWinkler,
        weight: 0.16,
      ),
      MatchField(
        column: 'father_name',
        strategy: Strategy.damerau,
        weight: 0.06,
      ),
      MatchField(
        column: 'father_name',
        strategy: Strategy.phonetic,
        weight: 0.04,
      ),
      // Family name
      MatchField(
        column: 'family_name',
        strategy: Strategy.jaroWinkler,
        weight: 0.08,
      ),
      // Date of birth
      MatchField(
        column: 'date_of_birth',
        strategy: Strategy.dateTolerant,
        weight: 0.14,
      ),
    ],

    // ── Cross-field comparison ────────────────────────────────────────
    crossFields: [
      CrossMatchField(
        columnA: 'given_name',
        columnB: 'family_name',
        strategy: CrossStrategy.tokenSorted,
        weight: 0.0, // diagnostic only
      ),
    ],

    // ── GPS proximity ────────────────────────────────────────────────
    proximityFields: [
      ProximityField(
        latColumn: 'latitude',
        lonColumn: 'longitude',
        weight: 0.14,
        maxRadiusKm: 0.5,
      ),
    ],

    // ── Rules ─────────────────────────────────────────────────────────
    shortCircuits: [
      ShortCircuitRule(column: 'mobile_number'),
    ],
    mismatchRules: [
      MismatchRule(
        column: 'gender',
        valueMap: {'0': 'male', '1': 'female', '2': 'other'},
      ),
    ],
    siblingGuard: SiblingGuard(
      familyColumn: 'father_name',
      distinguishingColumn: 'given_name',
    ),

    // ── Blocking ──────────────────────────────────────────────────────
    blockingKeys: [
      BlockingKey(
        columns: ['locality_boundary_code'],
        yearColumn: 'date_of_birth',
      ),
      BlockingKey(
        columns: ['locality_boundary_code'],
        phoneticColumn: 'given_name',
      ),
    ],

    // ── Soft delete ───────────────────────────────────────────────────
    softDeleteColumn: 'is_deleted',

    // ── Thresholds ────────────────────────────────────────────────────
    duplicateThreshold: 0.82,
    reviewThreshold: 0.62,
    maxCandidates: 500,
  );
}

/// Creates a DedupEngine wired to the app's local Drift/SQLite database.
///
/// The [SqlCandidateSource] executes the engine's generated SQL against
/// the same encrypted database the app uses for all its data.
DedupEngine createHcmDedupEngine(LocalSqlDataStore sql) {
  final config = createHcmDedupConfig();

  final source = SqlCandidateSource(
    (sqlQuery, params) async {
      final result = await sql.customSelect(
        sqlQuery,
        variables: [
          for (final p in params)
            if (p is int)
              Variable<int>(p)
            else if (p is double)
              Variable<double>(p)
            else
              Variable<String>(p?.toString() ?? ''),
        ],
      ).get();
      return result.map((row) => row.data).toList();
    },
  );

  final engine = DedupEngine(config: config, source: source);

  // Validate the config at startup.
  final problems = engine.validateConfig();
  if (problems.isNotEmpty) {
    for (final p in problems) {
      // ignore: avoid_print
      print('DedupEngine config warning: $p');
    }
  }

  return engine;
}
