import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sync_service/data/repositories/sync/sync_up.dart';

/// Uploads outside-household sites: facilities created on the phone
/// (Transit Posts / Outside Household Places) and the project-facility links
/// that record their use in this campaign.
///
/// Both go through the bulk `_create` endpoints, which return no ids. Within
/// one sync pass facilities are pushed before links ([DataModelType] order);
/// a facility's server id is looked up by clientReferenceId during sync-down
/// (`SyncServiceMapper.syncDownEntityResponse`), which also points the queued
/// link at it. A link whose facility has no server id yet is left pending and
/// retried on the next pass.
class OutsideHouseholdSiteSyncRegistry implements SyncUpOperation {
  final RemoteRepository remote;

  /// Oplog entries pushed by [create] whose sync-up still has to be
  /// recorded by [localMarkSyncUp]. Anything not in this set was skipped and
  /// stays pending.
  final Set<int> _pushedEntryIds = {};

  OutsideHouseholdSiteSyncRegistry(this.remote);

  /// Schema every site link must carry; it keeps the link out of the
  /// project-facility dashboard index on the server.
  static const linkSchema = 'OutsideHouseholdAssignment';

  /// Keys the app adds to a link for its own use; never sent.
  static const _localOnlyLinkFieldKeys = {
    'facilityLevel',
    'facilityClientReferenceId',
  };

  @override
  Future<void> create({
    required List<OpLogEntry<EntityModel>> entry,
    required List<EntityModel> entities,
    required LocalRepository<EntityModel, EntitySearchModel> local,
    required MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
        operationGroupedEntity,
    required MapEntry<DataModelType, List<OpLogEntry<EntityModel>>>
        typeGroupedEntity,
  }) async {
    switch (typeGroupedEntity.key) {
      case DataModelType.facility:
        await _createFacilities(
          entry,
          entities.whereType<FacilityModel>().toList(),
        );
      case DataModelType.projectFacility:
        await _createLinks(
          entry,
          entities.whereType<ProjectFacilityModel>().toList(),
          local,
        );
      default:
        await remote.bulkCreate(entities);
        _pushedEntryIds.addAll(entry.map((e) => e.id).whereType<int>());
    }
  }

  Future<void> _createFacilities(
    List<OpLogEntry<EntityModel>> entry,
    List<FacilityModel> facilities,
  ) async {
    final bulk = <Map<String, dynamic>>[];
    final bulkEntryIds = <int>[];

    for (final facility in facilities) {
      final clientReferenceId = facility.clientReferenceId;
      final opLog = entry.firstWhereOrNull(
          (e) => e.clientReferenceId == clientReferenceId);
      if (clientReferenceId == null || opLog == null || opLog.id == null) {
        continue;
      }

      bulk.add(_facilityPayload(facility));
      bulkEntryIds.add(opLog.id!);
    }

    if (bulk.isNotEmpty) {
      await remote.dio.post(
        remote.bulkCreatePath,
        options: Options(headers: {'content-type': 'application/json'}),
        queryParameters: {'tenantId': DigitDataModelSingleton().tenantId},
        data: {'Facilities': bulk},
      );
      _pushedEntryIds.addAll(bulkEntryIds);
    }
  }

  Future<void> _createLinks(
    List<OpLogEntry<EntityModel>> entry,
    List<ProjectFacilityModel> links,
    LocalRepository<EntityModel, EntitySearchModel> local,
  ) async {
    final bulk = <Map<String, dynamic>>[];
    final bulkEntryIds = <int>[];

    for (final queued in links) {
      final clientReferenceId = queued.clientReferenceId;
      final opLog = entry.firstWhereOrNull(
          (e) => e.clientReferenceId == clientReferenceId);
      if (clientReferenceId == null || opLog == null || opLog.id == null) {
        continue;
      }

      // The oplog copy still carries the facility placeholder. The current
      // row has the server id once FacilityLocalRepository.applyServerGeneratedId
      // has run.
      final current = (await local.search(
        ProjectFacilitySearchModel(clientReferenceId: [clientReferenceId]),
      ))
          .whereType<ProjectFacilityModel>()
          .firstOrNull;
      if (current == null) continue;

      final facilityClientReferenceId =
          _fieldValue(current, 'facilityClientReferenceId') ?? queued.facilityId;
      if (current.facilityId == facilityClientReferenceId) {
        debugPrint('SITE SYNC: link $clientReferenceId waits for facility '
            '$facilityClientReferenceId to get a server id');
        continue;
      }

      bulk.add(_linkPayload(current));
      bulkEntryIds.add(opLog.id!);
    }

    if (bulk.isNotEmpty) {
      await remote.dio.post(
        remote.bulkCreatePath,
        options: Options(headers: {'content-type': 'application/json'}),
        queryParameters: {'tenantId': DigitDataModelSingleton().tenantId},
        data: {'ProjectFacilities': bulk},
      );
      _pushedEntryIds.addAll(bulkEntryIds);
    }
  }

  /// The facility as the server expects it: no placeholder id (the server
  /// generates one), everything else as modelled.
  static Map<String, dynamic> _facilityPayload(FacilityModel facility) {
    final map = Map<String, dynamic>.from(facility.toMap());
    if (map['id'] == facility.clientReferenceId) map.remove('id');
    map.remove('nonRecoverableError');
    final address = map['address'];
    if (address is Map) {
      final addressMap = Map<String, dynamic>.from(address);
      addressMap.remove('relatedClientReferenceId');
      map['address'] = addressMap;
    }
    return map;
  }

  /// The link as the server expects it: no placeholder id, no app-local
  /// clientReferenceId, the OutsideHouseholdAssignment schema, and only the
  /// worker fields (app-local keys dropped).
  static Map<String, dynamic> _linkPayload(ProjectFacilityModel link) {
    final map = Map<String, dynamic>.from(link.toMap());
    if (map['id'] == link.clientReferenceId) map.remove('id');
    map.remove('clientReferenceId');
    map.remove('nonRecoverableError');
    final fields = (link.additionalFields?.fields ?? const [])
        .where((f) => !_localOnlyLinkFieldKeys.contains(f.key))
        .where((f) => f.value != null && f.value.toString().trim().isNotEmpty)
        .map((f) => {'key': f.key, 'value': f.value})
        .toList();
    map['additionalFields'] = {
      'schema': linkSchema,
      'version': link.additionalFields?.version ?? 1,
      'fields': fields,
    };
    return map;
  }

  static String? _fieldValue(ProjectFacilityModel link, String key) {
    final value = link.additionalFields?.fields
        .firstWhereOrNull((f) => f.key == key)
        ?.value;
    return value?.toString();
  }

  @override
  Future<void> update(
      List<EntityModel> entities, LocalRepository local) async {
    await remote.bulkUpdate(entities);
  }

  @override
  Future<void> delete(
      List<EntityModel> entities, LocalRepository local) async {
    await remote.bulkDelete(entities);
  }

  @override
  Future<void> singleCreate(EntityModel entity, LocalRepository local) async {
    await remote.singleCreate(entity);
  }

  @override
  Future<void> singleUpdate(EntityModel entity, LocalRepository local) async {
    await remote.singleUpdate(entity);
  }

  @override
  Future<void> localMarkSyncUp(
    List<OpLogEntry<EntityModel>> entity,
    LocalRepository<EntityModel, EntitySearchModel> local,
  ) async {
    for (final syncedEntity in entity) {
      final id = syncedEntity.id;
      if (id == null) continue;
      if (!_pushedEntryIds.contains(id)) continue; // skipped: stays pending

      await local.markSyncedUp(
        entry: syncedEntity,
        id: id,
        nonRecoverableError: syncedEntity.nonRecoverableError,
        clientReferenceId: syncedEntity.clientReferenceId,
      );
    }
  }
}
