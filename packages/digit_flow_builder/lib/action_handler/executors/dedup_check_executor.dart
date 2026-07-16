import 'dart:async';

import 'package:dedup_engine/dedup_engine.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../action_config.dart';
import 'action_executor.dart';

/// Executor for DEDUP_CHECK action type.
///
/// Runs after FETCH_TRANSFORMER_CONFIG to check the newly built entities
/// against existing records in the local SQLite database. If potential
/// duplicates are found, shows a popup to the field worker.
///
/// Sets `contextData['dedupDecision']` to one of:
///   - 'CREATE'   — no duplicates found, proceed normally
///   - 'OVERRIDE' — duplicates found but user chose to create new
///   - 'CANCEL'   — user closed the popup; aborts the action chain so
///                   the form stays on screen without registering
class DedupCheckExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'DEDUP_CHECK';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    debugPrint('DEDUP_CHECK: ========== STARTING ==========');

    final rawEntities = contextData['entities'];
    debugPrint('DEDUP_CHECK: rawEntities type: ${rawEntities.runtimeType}');
    if (rawEntities == null || (rawEntities is List && rawEntities.isEmpty)) {
      debugPrint('DEDUP_CHECK: No entities found, skipping');
      contextData['dedupDecision'] = 'CREATE';
      return contextData;
    }

    final entities = rawEntities is List
        ? rawEntities.whereType<EntityModel>().toList()
        : [rawEntities as EntityModel];

    debugPrint('DEDUP_CHECK: Found ${entities.length} entities:');
    for (final e in entities) {
      debugPrint('  - ${e.runtimeType}');
    }

    // Find the IndividualModel from the transformed entities.
    final individual = _findIndividual(entities);
    if (individual == null) {
      debugPrint('DEDUP_CHECK: No IndividualModel found in entities');
      contextData['dedupDecision'] = 'CREATE';
      return contextData;
    }
    debugPrint('DEDUP_CHECK: Found IndividualModel: ${individual.runtimeType}');

    // Find the HouseholdModel for GPS coordinates.
    final household = _findHousehold(entities);
    debugPrint('DEDUP_CHECK: HouseholdModel found: ${household != null}');

    // Build the record map for the dedup engine.
    final boundaryCode = FlowBuilderSingleton().boundary?.code ?? '';
    debugPrint('DEDUP_CHECK: Boundary code: "$boundaryCode"');
    final newRecord = _buildRecordMap(individual, household, boundaryCode);

    debugPrint('DEDUP_CHECK: ---- NEW RECORD ----');
    for (final entry in newRecord.entries) {
      debugPrint('  ${entry.key}: ${entry.value}');
    }

    // Get the dedup engine from the widget tree.
    DedupEngine? engine;
    try {
      engine = context.read<DedupEngine>();
      debugPrint('DEDUP_CHECK: DedupEngine obtained from widget tree');
      debugPrint('DEDUP_CHECK: Config tableName: ${engine.config.tableName}');
      debugPrint('DEDUP_CHECK: Config idColumn: ${engine.config.idColumn}');
      debugPrint('DEDUP_CHECK: Config joins: ${engine.config.joins.length}');
      debugPrint('DEDUP_CHECK: Config matchFields: ${engine.config.matchFields.length}');
      debugPrint('DEDUP_CHECK: Config blockingKeys: ${engine.config.blockingKeys.length}');
      for (final bk in engine.config.blockingKeys) {
        debugPrint('  BlockingKey columns: ${bk.columns}, '
            'yearColumn: ${bk.yearColumn}, phoneticColumn: ${bk.phoneticColumn}');
      }
      debugPrint('DEDUP_CHECK: Config duplicateThreshold: ${engine.config.duplicateThreshold}');
      debugPrint('DEDUP_CHECK: Config reviewThreshold: ${engine.config.reviewThreshold}');
    } catch (e) {
      debugPrint('DEDUP_CHECK: DedupEngine not found in widget tree: $e');
      contextData['dedupDecision'] = 'CREATE';
      return contextData;
    }

    // Run the dedup check.
    try {
      final minProbability =
          (action.properties['minProbability'] as num?)?.toDouble() ?? 70.0;
      final maxResults = (action.properties['maxResults'] as int?) ?? 5;

      debugPrint('DEDUP_CHECK: Calling checkForDuplicates...');
      debugPrint('DEDUP_CHECK: minProbability=$minProbability, maxResults=$maxResults');

      final matches = await engine.checkForDuplicates(newRecord);

      debugPrint('DEDUP_CHECK: Engine returned ${matches.length} raw match(es)');
      for (int i = 0; i < matches.length; i++) {
        final m = matches[i];
        debugPrint('  Match[$i]: score=${m.score.toStringAsFixed(4)}, '
            'id=${m.matchedRecord[engine.config.idColumn]}');
        final signals = m.topSignals(10);
        for (final s in signals) {
          debugPrint('    Signal: ${s.key} = ${s.value.toStringAsFixed(4)}');
        }
      }

      // Filter by minimum probability (convert threshold to 0-1 scale).
      final threshold = minProbability / 100.0;
      debugPrint('DEDUP_CHECK: Filtering with threshold=$threshold');
      final significantMatches = matches
          .where((m) => m.score >= threshold)
          .take(maxResults)
          .toList();

      if (significantMatches.isEmpty) {
        debugPrint('DEDUP_CHECK: No matches above threshold $threshold');
        if (matches.isNotEmpty) {
          debugPrint('DEDUP_CHECK: Best score was ${matches.first.score.toStringAsFixed(4)} '
              '(below threshold $threshold)');
        }
        contextData['dedupDecision'] = 'CREATE';
        return contextData;
      }

      debugPrint('DEDUP_CHECK: Found ${significantMatches.length} potential '
          'duplicate(s), highest score: '
          '${significantMatches.first.score.toStringAsFixed(3)}');

      // Show the duplicate review popup and await the user's decision.
      final decision = await _showDuplicateReviewPopup(
        context,
        significantMatches,
        newRecord,
      );

      contextData['dedupDecision'] = decision;
      debugPrint('DEDUP_CHECK: User decision: $decision');

      if (decision == 'CANCEL') {
        // User tapped Close — abort the entire action chain so the app
        // stays on the current form page without registering.
        contextData['_abortActionChain'] = true;
        return contextData;
      }

      if (decision == 'LINK' && significantMatches.isNotEmpty) {
        contextData['linkedIndividualId'] =
            significantMatches.first.matchedRecord[engine.config.idColumn];
      }
    } catch (e, stackTrace) {
      debugPrint('DEDUP_CHECK: !!!! ERROR during dedup check !!!!');
      debugPrint('DEDUP_CHECK: Error: $e');
      debugPrint('DEDUP_CHECK: Stack trace: $stackTrace');
      // On error, don't block registration.
      contextData['dedupDecision'] = 'CREATE';
    }

    return contextData;
  }

  /// Extract an IndividualModel from the entity list.
  EntityModel? _findIndividual(List<EntityModel> entities) {
    for (final e in entities) {
      final typeName = e.runtimeType.toString();
      if (typeName.contains('Individual')) return e;
    }
    return null;
  }

  /// Extract a HouseholdModel from the entity list.
  EntityModel? _findHousehold(List<EntityModel> entities) {
    for (final e in entities) {
      final typeName = e.runtimeType.toString();
      if (typeName.contains('Household') && !typeName.contains('Member')) {
        return e;
      }
    }
    return null;
  }

  /// Build a generic record map from HCM entities for the dedup engine.
  Map<String, dynamic> _buildRecordMap(
    EntityModel individual,
    EntityModel? household,
    String boundaryCode,
  ) {
    final individualMap = individual.toMap();
    final householdMap = household?.toMap();

    // Extract name fields from nested structure or flat map.
    final name = individualMap['name'];
    String? givenName;
    String? familyName;

    if (name is Map) {
      givenName = name['givenName']?.toString();
      familyName = name['familyName']?.toString();
    } else {
      givenName = individualMap['givenName']?.toString() ??
          individualMap['given_name']?.toString();
      familyName = individualMap['familyName']?.toString() ??
          individualMap['family_name']?.toString();
    }

    return {
      'client_reference_id':
          individualMap['clientReferenceId']?.toString() ?? '',
      'given_name': givenName ?? '',
      'family_name': familyName ?? '',
      'father_name': individualMap['fatherName']?.toString() ??
          individualMap['father_name']?.toString() ??
          '',
      'date_of_birth': individualMap['dateOfBirth']?.toString() ??
          individualMap['date_of_birth']?.toString() ??
          '',
      'gender': individualMap['gender']?.toString() ?? '',
      'mobile_number': individualMap['mobileNumber']?.toString() ??
          individualMap['mobile_number']?.toString() ??
          '',
      'locality_boundary_code': boundaryCode,
      'latitude': householdMap?['latitude'] ??
          householdMap?['address']?['latitude'],
      'longitude': householdMap?['longitude'] ??
          householdMap?['address']?['longitude'],
    };
  }

  /// Show the duplicate review popup and return the user's decision.
  Future<String> _showDuplicateReviewPopup(
    BuildContext context,
    List<DedupResult> matches,
    Map<String, dynamic> newRecord,
  ) async {
    final completer = Completer<String>();

    await showCustomPopup(
      context: context,
      barrierDismissible: false,
      builder: (popupContext) {
        return Popup(
          title: '${matches.length} Possible Duplicate${matches.length > 1 ? 's' : ''} Found',
          titleIcon: Icon(
            Icons.warning_amber_rounded,
            color: const DigitColors().light.alertWarning,
          ),
          onCrossTap: null, // No dismiss via cross button
          additionalWidgets: [
            ...matches.map((match) => _buildMatchCard(match, newRecord)),
          ],
          actions: [
            DigitButton(
              label: 'Close',
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              onPressed: () {
                Navigator.of(popupContext, rootNavigator: true).pop();
                if (!completer.isCompleted) completer.complete('CANCEL');
              },
            ),
            DigitButton(
              label: 'Skip and Register',
              type: DigitButtonType.secondary,
              size: DigitButtonSize.large,
              onPressed: () {
                Navigator.of(popupContext, rootNavigator: true).pop();
                if (!completer.isCompleted) completer.complete('OVERRIDE');
              },
            ),
          ],
          inlineActions: true,
        );
      },
    );

    // If the popup was dismissed without a decision, default to OVERRIDE.
    if (!completer.isCompleted) {
      completer.complete('OVERRIDE');
    }

    return completer.future;
  }

  /// Build a card widget displaying one potential duplicate match.
  Widget _buildMatchCard(
    DedupResult match,
    Map<String, dynamic> newRecord,
  ) {
    final existing = match.matchedRecord;
    final scorePercent = (match.score * 100).round();
    final signals = match.topSignals(3);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: scorePercent >= 90
              ? Colors.red.shade300
              : Colors.orange.shade300,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Existing Record',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: scorePercent >= 90
                      ? Colors.red.shade100
                      : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$scorePercent% match',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: scorePercent >= 90
                        ? Colors.red.shade800
                        : Colors.orange.shade800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _infoRow('Name',
              '${existing['given_name'] ?? ''} ${existing['family_name'] ?? ''}'),
          if (existing['father_name'] != null &&
              existing['father_name'].toString().isNotEmpty)
            _infoRow('Guardian', existing['father_name'].toString()),
          if (existing['date_of_birth'] != null)
            _infoRow('DOB', existing['date_of_birth'].toString()),
          if (existing['gender'] != null)
            _infoRow('Gender', existing['gender'].toString()),
          const SizedBox(height: 8),
          Text(
            'Matched on: ${signals.map((s) => '${s.key.split(":").first} (${(s.value * 100).round()}%)').join(', ')}',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    if (value.trim().isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
