import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';

/// Downloads the logged-in user's AEFI cases from the HFReferral search API
/// into the local HFReferral table, so cases reported before a reinstall or
/// "clear storage" are listed (and counted) on the AEFI home screen again.
///
/// An AEFI case is an HFReferral saved with `symptom = AEFI` and
/// `additionalFields.formType = AEFI` (transformer `aefiCreation`). The AEFI
/// screen lists only the user's own cases, so only those are stored; other
/// workers' patient data stays off the device.
///
/// Calls the API directly instead of [RemoteRepository.search], which
/// swallows request errors and returns an empty list: a failed download has
/// to reach the caller so it can be shown and retried.
class AefiDownsync {
  final RemoteRepository<HFReferralModel, HFReferralSearchModel> remote;
  final LocalRepository<HFReferralModel, HFReferralSearchModel> local;

  /// Called with the number of cases downloaded so far.
  final void Function(int downloaded)? onProgress;

  static const String aefiType = 'AEFI';
  static const int _limit = 100;

  const AefiDownsync({
    required this.remote,
    required this.local,
    this.onProgress,
  });

  /// Throws when a page cannot be fetched or read.
  Future<void> run({
    required String projectId,
    required String userUuid,
  }) async {
    // The server can filter by project and symptom, not by creator.
    final criteria = HFReferralSearchModel(
      projectId: projectId,
      symptom: [aefiType],
    ).toMap();

    var downloaded = 0;
    final seen = <Object>{};
    for (var offset = 0;; offset += _limit) {
      final response = await remote.dio.post(
        remote.searchPath,
        queryParameters: {
          'offset': offset,
          'limit': _limit,
          'tenantId': DigitDataModelSingleton().tenantId,
        },
        data: {remote.entityName: criteria},
      );

      final body = response.data;
      final records =
          body is Map<String, dynamic> ? body[remote.entityNamePlural] : null;
      if (records is! List) {
        throw InvalidApiResponseException(
          data: criteria,
          path: remote.searchPath,
          response: body,
        );
      }

      final myCases = records
          .whereType<Map<String, dynamic>>()
          .map(HFReferralModelMapper.fromMap)
          .where((referral) =>
              referral.clientAuditDetails?.createdBy == userUuid &&
              _isAefi(referral))
          .toList();

      if (myCases.isNotEmpty) {
        // A local row is either identical or still waiting to sync up.
        final existing = await local.search(
          HFReferralSearchModel(
            clientReferenceId:
                myCases.map((e) => e.clientReferenceId).toList(),
          ),
        );
        final existingIds = existing.map((e) => e.clientReferenceId).toSet();
        final newCases = myCases
            .where((e) => !existingIds.contains(e.clientReferenceId))
            .toList();

        // bulkCreate writes no oplog entry, so these are not synced up again.
        if (newCases.isNotEmpty) {
          await local.bulkCreate(newCases);
          downloaded += newCases.length;
        }
      }
      onProgress?.call(downloaded);

      // The search response spells it `TotalCount`.
      final map = body as Map<String, dynamic>;
      final totalCount = map['TotalCount'] ?? map['totalCount'];
      final fetched = offset + records.length;
      if (records.length < _limit ||
          (totalCount is int && fetched >= totalCount)) {
        break;
      }

      // A full page made only of records already seen in this run means
      // the server isn't advancing with `offset`; stop rather than loop.
      final ids = records
          .whereType<Map<String, dynamic>>()
          .map((r) => r['clientReferenceId'] ?? r['id'])
          .whereType<Object>();
      if (ids.every(seen.contains)) break;
      seen.addAll(ids);
    }
  }

  static bool _isAefi(HFReferralModel referral) =>
      referral.additionalFields?.fields
          .any((f) => f.key == 'formType' && f.value == aefiType) ??
      false;
}
