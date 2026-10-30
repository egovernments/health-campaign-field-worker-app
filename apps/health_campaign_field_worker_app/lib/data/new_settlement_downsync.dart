import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../utils/new_settlement_utils.dart';

/// Downloads a project's NEW_SETTLEMENT records from the userLocation search
/// API into the local user-action table, so settlements added on another
/// device (or before a reinstall) are listed on boundary selection.
///
/// Calls the API directly instead of [RemoteRepository.search], which
/// swallows request errors and returns an empty list: a failed download has
/// to reach the caller so it can be shown and retried.
class NewSettlementDownsync {
  final RemoteRepository<UserActionModel, UserActionSearchModel> remote;
  final UserActionLocalRepository local;

  /// Called with the number of settlements downloaded so far.
  final void Function(int downloaded)? onProgress;

  static const int _limit = 100;

  const NewSettlementDownsync({
    required this.remote,
    required this.local,
    this.onProgress,
  });

  /// Throws when a page cannot be fetched or read.
  Future<void> run(String projectId) async {
    final criteria = UserActionSearchModel(
      action: newSettlementAction,
      projectId: projectId,
    ).toMap();

    var downloaded = 0;
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
      final records = body is Map<String, dynamic>
          ? body[remote.entityNamePlural]
          : null;
      if (records is! List) {
        throw InvalidApiResponseException(
          data: criteria,
          path: remote.searchPath,
          response: body,
        );
      }

      // Filtered here too: the same API also holds location-tracker records.
      final settlements = records
          .whereType<Map<String, dynamic>>()
          .map(UserActionModelMapper.fromMap)
          .where((a) => a.action == newSettlementAction);

      for (final settlement in settlements) {
        final existing = await local.search(
          UserActionSearchModel(
            clientReferenceId: [settlement.clientReferenceId],
          ),
        );
        // A local row is either identical or still waiting to sync up.
        if (existing.isNotEmpty) continue;

        await local.create(
          settlement.copyWith(isSync: true),
          createOpLog: false,
        );
        downloaded++;
      }
      onProgress?.call(downloaded);

      final totalCount = (body as Map<String, dynamic>)['totalCount'];
      final fetched = offset + records.length;
      if (records.length < _limit ||
          (totalCount is int && fetched >= totalCount)) {
        break;
      }
    }
  }
}
