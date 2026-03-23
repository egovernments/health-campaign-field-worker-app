// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';

class ProjectFacilityRemoteRepository
    extends RemoteRepository<ProjectFacilityModel, ProjectFacilitySearchModel> {
  ProjectFacilityRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectFacility',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<ProjectFacilityModel>> search(
    ProjectFacilitySearchModel query, {
    int? offSet,
    int? limit,
    int? lastChangedSince,
  }) async {
    int defaultBatchSize = limit ?? 100;
    int currentOffset = offSet ?? 0;

    List<ProjectFacilityModel> allResults = [];
    bool hasMoreData = true;
    List<Map<String, dynamic>>? lastResponse;

    final projectId = query.projectId?.firstOrNull ?? '';

    while (hasMoreData) {
      Response response;

      try {
        response = await executeFuture(
          future: () async {
            return await dio.post(
              searchPath,
              queryParameters: {
                'offset': currentOffset,
                'limit': defaultBatchSize,
                'tenantId': DigitDataModelSingleton().tenantId,
                if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
              },
              data: entityName == 'User'
                  ? query.toMap()
                  : {
                      isPlural
                              ? entityNamePlural
                              : entityName == 'ServiceDefinition'
                                  ? 'ServiceDefinitionCriteria'
                                  : entityName == 'Downsync'
                                      ? 'DownsyncCriteria'
                                      : entityName:
                          isPlural ? [query.toMap()] : query.toMap(),
                    },
            );
          },
        );
      } catch (error) {
        rethrow;
      }

      final responseMap = response.data;

      if (responseMap is! Map<String, dynamic>) {
        throw InvalidApiResponseException(
          data: query.toMap(),
          path: searchPath,
          response: responseMap,
        );
      }

      String key = (isSearchResponsePlural || entityName == 'ServiceDefinition')
          ? entityNamePlural
          : entityName;

      if (!responseMap.containsKey(key)) {
        throw InvalidApiResponseException(
          data: query.toMap(),
          path: searchPath,
          response: responseMap,
        );
      }

      final entityResponse = await responseMap[key];

      if (entityResponse is! List) {
        throw InvalidApiResponseException(
          data: query.toMap(),
          path: searchPath,
          response: responseMap,
        );
      }

      final entityList =
          entityResponse.whereType<Map<String, dynamic>>().toList();

      if (lastResponse != null &&
          lastResponse.toString() == entityList.toString()) {
        break;
      }

      List<ProjectFacilityModel> currentBatch;

      try {
        currentBatch = entityList.map((e) {
          final model =
              MapperContainer.globals.fromMap<ProjectFacilityModel>(e);
          // Tag ProjectFacilities entries as 'current' level
          return ProjectFacilityModel(
            id: model.id,
            facilityId: model.facilityId,
            projectId: model.projectId,
            nonRecoverableError: model.nonRecoverableError,
            tenantId: model.tenantId,
            rowVersion: model.rowVersion,
            auditDetails: model.auditDetails,
            clientAuditDetails: model.clientAuditDetails,
            isDeleted: model.isDeleted,
            additionalFields: ProjectFacilityAdditionalFields(
              version: 1,
              fields: [
                ...?model.additionalFields?.fields,
                AdditionalField('facilityLevel', 'current'),
              ],
            ),
          );
        }).toList();
      } catch (e) {
        rethrow;
      }

      // Parse FacilityMap from response
      // boundaryTypes order: [parent, current, child]
      final queryBoundaryTypes = query.boundaryTypes;
      final facilityMap = responseMap['FacilityMap'];
      if (facilityMap is Map<String, dynamic>) {
        for (final entry in facilityMap.entries) {
          final boundaryType = entry.key;
          final facilityIds = entry.value;

          // Determine facility level based on position in boundaryTypes
          String facilityLevel = 'current';
          if (queryBoundaryTypes != null && queryBoundaryTypes.isNotEmpty) {
            if (boundaryType == queryBoundaryTypes.first &&
                queryBoundaryTypes.length > 1) {
              facilityLevel = 'parent';
            } else if (boundaryType == queryBoundaryTypes.last &&
                queryBoundaryTypes.length > 1) {
              facilityLevel = 'child';
            }
          }

          if (facilityIds is List) {
            for (final facilityId in facilityIds) {
              if (facilityId is String) {
                final alreadyExists =
                    allResults.any((e) => e.facilityId == facilityId) ||
                        currentBatch.any((e) => e.facilityId == facilityId);
                if (!alreadyExists) {
                  final now = DateTime.now().millisecondsSinceEpoch;
                  currentBatch.add(ProjectFacilityModel(
                    id: facilityId,
                    facilityId: facilityId,
                    projectId: projectId,
                    auditDetails: AuditDetails(
                      createdBy: '',
                      createdTime: now,
                    ),
                    clientAuditDetails: ClientAuditDetails(
                      createdBy: '',
                      createdTime: now,
                    ),
                    additionalFields: ProjectFacilityAdditionalFields(
                      version: 1,
                      fields: [
                        AdditionalField('facilityLevel', facilityLevel),
                      ],
                    ),
                  ));
                }
              }
            }
          }
        }
      }

      if (currentBatch.isEmpty) {
        hasMoreData = false;
      } else {
        allResults.addAll(currentBatch);
        currentOffset += defaultBatchSize;
        lastResponse = entityList;
      }
    }

    return allResults;
  }

  @override
  DataModelType get type => DataModelType.projectFacility;
}
