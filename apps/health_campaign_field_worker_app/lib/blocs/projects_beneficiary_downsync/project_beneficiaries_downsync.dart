// GENERATED using mason_cli
import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:disk_space_update/disk_space_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:survey_form/models/entities/service.dart';
import 'package:sync_service/sync_service_lib.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
import '../../models/downsync/downsync.dart';
import '../../utils/background_service.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

part 'project_beneficiaries_downsync.freezed.dart';

typedef BeneficiaryDownSyncEmitter = Emitter<BeneficiaryDownSyncState>;

class BeneficiaryDownSyncBloc
    extends Bloc<BeneficiaryDownSyncEvent, BeneficiaryDownSyncState> {
  final LocalRepository<IndividualModel, IndividualSearchModel>
      individualLocalRepository;
  final RemoteRepository<DownsyncModel, DownsyncSearchModel>
      downSyncRemoteRepository;
  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;
  final BandwidthCheckRepository bandwidthCheckRepository;
  final LocalRepository<HouseholdModel, HouseholdSearchModel>
      householdLocalRepository;
  final LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMemberLocalRepository;
  final LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>
      projectBeneficiaryLocalRepository;
  final LocalRepository<TaskModel, TaskSearchModel> taskLocalRepository;
  final LocalRepository<SideEffectModel, SideEffectSearchModel>
      sideEffectLocalRepository;
  final LocalRepository<ReferralModel, ReferralSearchModel>
      referralLocalRepository;
  final LocalRepository<ServiceModel, ServiceSearchModel>
      serviceLocalRepository;

  final RemoteRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>
      projectBeneficiaryRemoteRepository;

  // HF Referral repositories for HF Worker role downsync
  final RemoteRepository<HFReferralModel, HFReferralSearchModel>?
      hfReferralRemoteRepository;
  final LocalRepository<HFReferralModel, HFReferralSearchModel>?
      hfReferralLocalRepository;
  final RemoteRepository<IndividualModel, IndividualSearchModel>
      individualRemoteRepository;

  BeneficiaryDownSyncBloc({
    required this.individualLocalRepository,
    required this.downSyncRemoteRepository,
    required this.downSyncLocalRepository,
    required this.bandwidthCheckRepository,
    required this.householdLocalRepository,
    required this.householdMemberLocalRepository,
    required this.projectBeneficiaryLocalRepository,
    required this.taskLocalRepository,
    required this.sideEffectLocalRepository,
    required this.referralLocalRepository,
    required this.serviceLocalRepository,
    this.hfReferralRemoteRepository,
    this.hfReferralLocalRepository,
    required this.projectBeneficiaryRemoteRepository,
    required this.individualRemoteRepository,
  }) : super(const BeneficiaryDownSyncState._()) {
    on(_handleDownSyncOfBeneficiaries);
    on(_handleCheckTotalCount);
    on(_handleDownSyncResetState);
    on(_handleDownSyncReport);
    on(_handleCheckBandWidth);
    // HF Referral downsync handlers
    on(_handleHFReferralGetBatchSize);
    on(_handleHFReferralCheckTotalCount);
    on(_handleDownSyncOfHFReferrals);
  }

  FutureOr<void> _handleDownSyncResetState(
    DownSyncResetStateEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    emit(const BeneficiaryDownSyncState.resetState());
  }

  FutureOr<void> _handleCheckBandWidth(
    DownSyncGetBatchSizeEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    try {
      emit(const BeneficiaryDownSyncState.resetState());
      emit(const BeneficiaryDownSyncState.loading(false));
      List speedArray = [];

      final double speed = await bandwidthCheckRepository.pingBandwidthCheck(
        bandWidthCheckModel: null,
      );
      speedArray.add(speed);
      double sum = speedArray.fold(0, (p, c) => p + c);
      int configuredBatchSize = getBatchSizeToBandwidth(
        sum / speedArray.length,
        event.appConfiguration,
        isDownSync: true,
      );
      emit(BeneficiaryDownSyncState.getBatchSize(
        configuredBatchSize,
        event.projectId,
        event.boundaryCode,
        event.pendingSyncCount,
        event.boundaryName,
      ));
    } catch (e) {
      emit(const BeneficiaryDownSyncState.resetState());
      emit(const BeneficiaryDownSyncState.totalCountCheckFailed());
    }
  }

  FutureOr<void> _handleCheckTotalCount(
    DownSyncCheckTotalCountEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    if (event.pendingSyncCount > 0) {
      emit(const BeneficiaryDownSyncState.loading(true));
      emit(const BeneficiaryDownSyncState.pendingSync());
    } else {
      emit(const BeneficiaryDownSyncState.loading(true));
      await LocalSecureStore.instance.setManualSyncTrigger(true);
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: event.boundaryCode,
      ));

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      //To get the server totalCount,
      final initialResults = await downSyncRemoteRepository.downSync(
        DownsyncSearchModel(
          locality: event.boundaryCode,
          offset: existingDownSyncData.firstOrNull?.offset ?? 0,
          limit: 0,
          isDeleted: true,
          lastSyncedTime: lastSyncedTime,
          tenantId: envConfig.variables.tenantId,
          projectId: event.projectId,
        ),
      );
      if (initialResults.isNotEmpty) {
        // Current response from server is String, Expecting it to be int
        //[TODO: Need to move the dynamic keys to constants
        int serverTotalCount = initialResults["DownsyncCriteria"]["totalCount"];

        emit(BeneficiaryDownSyncState.dataFound(
          serverTotalCount,
          event.batchSize,
        ));
      } else {
        await LocalSecureStore.instance.setManualSyncTrigger(false);
        emit(const BeneficiaryDownSyncState.resetState());
        emit(const BeneficiaryDownSyncState.totalCountCheckFailed());
      }
    }
  }

  FutureOr<void> _handleDownSyncOfBeneficiaries(
    DownSyncBeneficiaryEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    emit(const BeneficiaryDownSyncState.loading(true));
    double? diskSpace = 0;
    // [TODO: Move the function DiskSpace.getFreeDiskSpace to utils
    diskSpace = await DiskSpace
        .getFreeDiskSpace; // Returns the device available space in MB
    // diskSpace in MB * 1000 comparison with serverTotalCount * 150KB * Number of entities * 2
    if ((diskSpace ?? 0) * 1000 < (event.initialServerCount * 150 * 2)) {
      emit(const BeneficiaryDownSyncState.insufficientStorage());
    } else {
      try {
        while (true) {
          // Check each time, till the loop runs the offset, limit, totalCount, lastSyncTime from Local DB of DownSync Model
          final existingDownSyncData =
              await downSyncLocalRepository.search(DownsyncSearchModel(
            locality: event.boundaryCode,
          ));

          int offset = existingDownSyncData.isEmpty
              ? 0
              : existingDownSyncData.first.offset ?? 0;
          int totalCount = event.initialServerCount;
          int? lastSyncedTime = existingDownSyncData.isEmpty
              ? null
              : existingDownSyncData.first.lastSyncedTime;
          if (existingDownSyncData.isEmpty) {
            await downSyncLocalRepository.create(DownsyncModel(
              offset: offset,
              limit: event.batchSize,
              lastSyncedTime: lastSyncedTime,
              totalCount: totalCount,
              locality: event.boundaryCode,
              boundaryName: event.boundaryName,
            ));
          }

          if (offset < totalCount) {
            emit(BeneficiaryDownSyncState.inProgress(offset, totalCount));
            //Make the batch API call
            final downSyncResults = await downSyncRemoteRepository.downSync(
              DownsyncSearchModel(
                locality: event.boundaryCode,
                offset: offset,
                limit: event.batchSize,
                totalCount: totalCount,
                tenantId: envConfig.variables.tenantId,
                projectId: event.projectId,
                lastSyncedTime: lastSyncedTime,
                isDeleted: true,
              ),
            );
            emit(BeneficiaryDownSyncState.inProgress(
                offset, downSyncResults["DownsyncCriteria"]["totalCount"]));

            // check if the API response is there or it failed
            if (downSyncResults.isNotEmpty) {
              await writeToFile(event.projectId, event.boundaryCode,
                  event.boundaryName, downSyncResults);
              await SyncServiceSingleton()
                  .entityMapper
                  ?.writeToEntityDB(downSyncResults, [
                individualLocalRepository,
                householdLocalRepository,
                householdMemberLocalRepository,
                projectBeneficiaryLocalRepository,
                taskLocalRepository,
                sideEffectLocalRepository,
                referralLocalRepository,
                serviceLocalRepository,
              ]);
              // Update the local downSync data for the boundary with the new values
              totalCount = downSyncResults["DownsyncCriteria"]["totalCount"];

              await downSyncLocalRepository.update(DownsyncModel(
                offset: offset + event.batchSize,
                limit: event.batchSize,
                lastSyncedTime: lastSyncedTime,
                totalCount: totalCount,
                locality: event.boundaryCode,
                boundaryName: event.boundaryName,
              ));
            }
            // When API response failed
            else {
              emit(const BeneficiaryDownSyncState.failed());
              await LocalSecureStore.instance.setManualSyncTrigger(false);
              break;
            }
          } else {
            await downSyncLocalRepository.update(
              existingDownSyncData.first.copyWith(
                offset: 0,
                limit: 0,
                totalCount: totalCount,
                locality: event.boundaryCode,
                boundaryName: event.boundaryName,
                lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
              ),
            );
            final result = DownsyncModel(
              offset: totalCount,
              lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
              totalCount: totalCount,
              locality: event.boundaryCode,
              boundaryName: event.boundaryName,
            );
            await LocalSecureStore.instance.setManualSyncTrigger(false);
            emit(BeneficiaryDownSyncState.success(result));
            break; // If offset is greater than or equal to totalCount, exit the loop
          }
        }
      } catch (e) {
        await LocalSecureStore.instance.setManualSyncTrigger(false);
        emit(const BeneficiaryDownSyncState.failed());
      }
    }
  }

  writeToFile(
    String projectId,
    String selectedBoundaryCode,
    String selectedBoundaryName,
    Map<String, dynamic> response,
  ) async {
    Map<String, dynamic> storedData = {};

    // Get the Downloads directory
    final downloadsDirectory = await getDownloadsDirectory();
    if (downloadsDirectory == null) {
      if (kDebugMode) {
        print("Downloads directory is not available.");
      }
      return;
    }

    final file = await getDownSyncFilePath();

    // Read existing file content if available
    if (file.existsSync()) {
      final content = await file.readAsString();
      if (content.isNotEmpty) {
        storedData = jsonDecode(content);
      }
    } else {
      // Create the file if it doesn't exist
      await file.create(recursive: true);
      await file.writeAsString(jsonEncode({}));
    }
    var downSyncModel = response["DownsyncCriteria"];
    String offsetKey = '${downSyncModel["offset"]}';

    // Prepare the boundary data
    Map<String, dynamic> boundaryData = {
      "boundaryCode": selectedBoundaryCode,
      "boundaryName": selectedBoundaryName,
      "response": DataMapEncryptor().encryptWithRandomKey(response)
    };

    // Initialize the offset entry if it doesn't exist
    storedData[offsetKey] ??= {"totalCount": 0, "boundaries": []};

    // Always update totalCount to reflect latest info
    storedData[offsetKey]["totalCount"] += downSyncModel["totalCount"];

    // Fetch or initialize the list of boundaries
    List<dynamic> boundaries = storedData[offsetKey]["boundaries"];

    // Check if boundary already exists
    bool exists = boundaries
        .any((entry) => entry["boundaryCode"] == selectedBoundaryCode);

    if (!exists) {
      boundaries.add(boundaryData);
      storedData[offsetKey]["boundaries"] = boundaries;

      if (kDebugMode) {
        print(
            "Added new boundary: $selectedBoundaryCode under offset: $offsetKey");
      }
    } else {
      if (kDebugMode) {
        print(
            "Boundary '$selectedBoundaryCode' already exists under offset $offsetKey.");
      }
    }

    // Convert map to JSON string
    String storedDataString = jsonEncode(storedData);
    debugPrint("Stored data: $storedDataString");

    // Write back to file
    await file.writeAsString(storedDataString);

    if (kDebugMode) {
      print("Data successfully written to ${file.path}");
    }
  }

  FutureOr<void> _handleDownSyncReport(
    DownSyncReportEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    final result = await downSyncLocalRepository.search(DownsyncSearchModel());
    emit(BeneficiaryDownSyncState.report(result));
  }

  // ==================== HF Referral Downsync Handlers ====================

  /// Handler for getting batch size for HF Referral downsync (HF Worker role)
  FutureOr<void> _handleHFReferralGetBatchSize(
    HFReferralDownSyncGetBatchSizeEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    try {
      emit(const BeneficiaryDownSyncState.resetState());
      emit(const BeneficiaryDownSyncState.loading(false));

      final double speed = await bandwidthCheckRepository.pingBandwidthCheck(
        bandWidthCheckModel: null,
      );

      int configuredBatchSize = getBatchSizeToBandwidth(
        speed,
        event.appConfiguration,
        isDownSync: true,
      );

      emit(BeneficiaryDownSyncState.hfReferralGetBatchSize(
        configuredBatchSize,
        event.projectId,
        event.boundaryCode,
        event.pendingSyncCount,
        event.boundaryName,
      ));
    } catch (e) {
      debugPrint('[HF_REFERRAL_DOWNSYNC] Error getting batch size: $e');
      emit(const BeneficiaryDownSyncState.resetState());
      emit(const BeneficiaryDownSyncState.totalCountCheckFailed());
    }
  }

  /// Handler for checking total count of HF Referrals on server
  FutureOr<void> _handleHFReferralCheckTotalCount(
    HFReferralDownSyncCheckTotalCountEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    if (event.pendingSyncCount > 0) {
      emit(const BeneficiaryDownSyncState.loading(true));
      emit(const BeneficiaryDownSyncState.pendingSync());
      return;
    }

    if (hfReferralRemoteRepository == null) {
      debugPrint('[HF_REFERRAL_DOWNSYNC] Remote repository not available');
      emit(const BeneficiaryDownSyncState.totalCountCheckFailed());
      return;
    }

    try {
      emit(const BeneficiaryDownSyncState.loading(true));
      await LocalSecureStore.instance.setManualSyncTrigger(true);

      // Get existing downsync data for HF Referral (using a different locality key to avoid conflict)
      final existingDownSyncData = await downSyncLocalRepository.search(
        DownsyncSearchModel(
          locality: 'hf_referral_${event.boundaryCode}',
        ),
      );

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      // Search with limit 1 to check if there's any data
      final initialResults = await hfReferralRemoteRepository!.search(
        HFReferralSearchModel(
          //projectId: [event.projectId],
          // projectFacilityId: ["F-2025-12-22-140835"],
          localityCode: [event.boundaryCode],
        ),
        limit: 1,
        offSet: 0,
        lastChangedSince: lastSyncedTime,
      );

      debugPrint(
          '[HF_REFERRAL_DOWNSYNC] Initial results count: ${initialResults.length}');

      if (initialResults.isNotEmpty || existingDownSyncData.isNotEmpty) {
        // Estimate server count - we'll fetch in batches
        emit(BeneficiaryDownSyncState.hfReferralDataFound(
          100, // Default initial estimate, will be adjusted during sync
          event.batchSize,
        ));
      } else {
        await LocalSecureStore.instance.setManualSyncTrigger(false);
        emit(const BeneficiaryDownSyncState.hfReferralNoData());
      }
    } catch (e) {
      debugPrint('[HF_REFERRAL_DOWNSYNC] Error checking total count: $e');
      await LocalSecureStore.instance.setManualSyncTrigger(false);
      emit(const BeneficiaryDownSyncState.resetState());
      emit(const BeneficiaryDownSyncState.totalCountCheckFailed());
    }
  }

  /// Handler for downloading HF Referrals
  /// Flow: For each batch of HF Referrals -> Fetch Project Beneficiaries -> Fetch Individuals
  /// Downloads all data in a single loop with limit of 10, showing simple "download in progress" UI
  FutureOr<void> _handleDownSyncOfHFReferrals(
    HFReferralDownSyncEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    if (hfReferralRemoteRepository == null ||
        hfReferralLocalRepository == null) {
      debugPrint('[HF_REFERRAL_DOWNSYNC] Repositories not available');
      emit(const BeneficiaryDownSyncState.failed());
      return;
    }

    // Emit simple download in progress state (no counts)
    emit(const BeneficiaryDownSyncState.hfReferralDownloadInProgress());

    // Fixed limit of 10 for downsync
    const int downloadLimit = 10;

    try {
      int offset = 0;
      int totalHFReferralsFetched = 0;
      int totalProjectBeneficiariesFetched = 0;
      int totalIndividualsFetched = 0;
      final String localityKey = 'hf_referral_${event.boundaryCode}';

      // Check existing sync data to resume from last offset
      final existingDownSyncData = await downSyncLocalRepository.search(
        DownsyncSearchModel(locality: localityKey),
      );

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      if (existingDownSyncData.isEmpty) {
        await downSyncLocalRepository.create(DownsyncModel(
          offset: 0,
          limit: downloadLimit,
          lastSyncedTime: lastSyncedTime,
          totalCount: 0,
          locality: localityKey,
          boundaryName: event.boundaryName,
        ));
      } else {
        offset = existingDownSyncData.first.offset ?? 0;
      }

      // ==================== Single Loop: Fetch HF Referrals -> Project Beneficiaries -> Individuals ====================
      debugPrint('[HF_REFERRAL_DOWNSYNC] Starting downsync loop');

      while (true) {
        debugPrint(
            '[HF_REFERRAL_DOWNSYNC] Fetching HF Referrals batch - offset: $offset, limit: $downloadLimit');

        // Step 1: Fetch HF Referrals from server
        final hfReferrals = await hfReferralRemoteRepository!.search(
          HFReferralSearchModel(
            localityCode: [event.boundaryCode],
          ),
          limit: downloadLimit,
          offSet: offset,
          lastChangedSince: lastSyncedTime,
        );

        debugPrint(
            '[HF_REFERRAL_DOWNSYNC] Fetched ${hfReferrals.length} HF Referrals');

        if (hfReferrals.isEmpty) {
          debugPrint(
              '[HF_REFERRAL_DOWNSYNC] No more HF Referral data to fetch');
          break;
        }

        // Store HF Referrals in local repository
        await hfReferralLocalRepository!.bulkCreate(hfReferrals);
        debugPrint(
            '[HF_REFERRAL_DOWNSYNC] Stored ${hfReferrals.length} HF Referrals in local DB');
        totalHFReferralsFetched += hfReferrals.length;

        // Extract beneficiaryIds from this batch of HF Referrals
        List<String> batchBeneficiaryIds = [];
        for (final hfReferral in hfReferrals) {
          if (hfReferral.beneficiaryId != null &&
              hfReferral.beneficiaryId!.isNotEmpty) {
            batchBeneficiaryIds.add(hfReferral.beneficiaryId!);
          }
        }

        // Remove duplicates within this batch
        batchBeneficiaryIds = batchBeneficiaryIds.toSet().toList();

        // Step 2: Fetch Project Beneficiaries for this batch
        if (batchBeneficiaryIds.isNotEmpty) {
          debugPrint(
              '[HF_REFERRAL_DOWNSYNC] Fetching Project Beneficiaries for ${batchBeneficiaryIds.length} beneficiary IDs');

          final projectBeneficiaries =
              await projectBeneficiaryRemoteRepository.search(
            ProjectBeneficiarySearchModel(
              id: batchBeneficiaryIds,
            ),
            limit: downloadLimit ?? 10,
            offSet: offset,
            lastChangedSince: lastSyncedTime,
          );

          debugPrint(
              '[HF_REFERRAL_DOWNSYNC] Fetched ${projectBeneficiaries.length} Project Beneficiaries');

          if (projectBeneficiaries.isNotEmpty) {
            // Store Project Beneficiaries in local repository
            await projectBeneficiaryLocalRepository
                .bulkCreate(projectBeneficiaries);
            debugPrint(
                '[HF_REFERRAL_DOWNSYNC] Stored ${projectBeneficiaries.length} Project Beneficiaries in local DB');
            totalProjectBeneficiariesFetched += projectBeneficiaries.length;

            // Extract individualClientRefIds from Project Beneficiaries
            List<String> batchIndividualClientRefIds = [];
            for (final pb in projectBeneficiaries) {
              if (pb.beneficiaryClientReferenceId != null &&
                  pb.beneficiaryClientReferenceId!.isNotEmpty) {
                batchIndividualClientRefIds
                    .add(pb.beneficiaryClientReferenceId!);
              }
            }

            // Remove duplicates within this batch
            batchIndividualClientRefIds =
                batchIndividualClientRefIds.toSet().toList();

            // Step 3: Fetch Individuals for this batch
            if (batchIndividualClientRefIds.isNotEmpty) {
              debugPrint(
                  '[HF_REFERRAL_DOWNSYNC] Fetching Individuals for ${batchIndividualClientRefIds.length} client reference IDs');

              final individuals = await individualRemoteRepository.search(
                IndividualSearchModel(
                  clientReferenceId: batchIndividualClientRefIds,
                ),
              );

              debugPrint(
                  '[HF_REFERRAL_DOWNSYNC] Fetched ${individuals.length} Individuals');

              if (individuals.isNotEmpty) {
                // Store Individuals in local repository
                await individualLocalRepository.bulkCreate(individuals);
                debugPrint(
                    '[HF_REFERRAL_DOWNSYNC] Stored ${individuals.length} Individuals in local DB');
                totalIndividualsFetched += individuals.length;
              }
            }
          }
        }

        // Update downsync tracking (maintain offset visited)
        await downSyncLocalRepository.update(DownsyncModel(
          offset: offset + downloadLimit,
          limit: downloadLimit,
          lastSyncedTime: lastSyncedTime,
          totalCount: totalHFReferralsFetched,
          locality: localityKey,
          boundaryName: event.boundaryName,
        ));

        // Check if we got less than limit (means we're done)
        if (hfReferrals.length < downloadLimit) {
          debugPrint('[HF_REFERRAL_DOWNSYNC] Completed - fetched all data');
          break;
        }

        offset += downloadLimit;
      }

      // Update final sync status - reset offset to 0 for next sync
      await downSyncLocalRepository.update(DownsyncModel(
        offset: 0,
        limit: 0,
        totalCount: totalHFReferralsFetched,
        locality: localityKey,
        boundaryName: event.boundaryName,
        lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
      ));

      await LocalSecureStore.instance.setManualSyncTrigger(false);

      final result = DownsyncModel(
        offset: totalHFReferralsFetched,
        lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
        totalCount: totalHFReferralsFetched,
        locality: localityKey,
        boundaryName: event.boundaryName,
      );

      debugPrint(
          '[HF_REFERRAL_DOWNSYNC] Downsync completed successfully - HFReferrals: $totalHFReferralsFetched, ProjectBeneficiaries: $totalProjectBeneficiariesFetched, Individuals: $totalIndividualsFetched');

      emit(BeneficiaryDownSyncState.hfReferralSuccess(result));
    } catch (e) {
      debugPrint('[HF_REFERRAL_DOWNSYNC] Error during downsync: $e');
      await LocalSecureStore.instance.setManualSyncTrigger(false);
      emit(const BeneficiaryDownSyncState.failed());
    }
  }
}

@freezed
class BeneficiaryDownSyncEvent with _$BeneficiaryDownSyncEvent {
  const factory BeneficiaryDownSyncEvent.downSync({
    required String projectId,
    required String boundaryCode,
    required int batchSize,
    required int initialServerCount,
    required String boundaryName,
  }) = DownSyncBeneficiaryEvent;

  const factory BeneficiaryDownSyncEvent.checkForData({
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required int batchSize,
    required String boundaryName,
  }) = DownSyncCheckTotalCountEvent;

  const factory BeneficiaryDownSyncEvent.getBatchSize({
    required List<AppConfiguration> appConfiguration,
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required String boundaryName,
  }) = DownSyncGetBatchSizeEvent;

  const factory BeneficiaryDownSyncEvent.downSyncReport() = DownSyncReportEvent;

  const factory BeneficiaryDownSyncEvent.resetState() = DownSyncResetStateEvent;

  // ==================== HF Referral Events ====================
  /// Event to get batch size for HF Referral downsync (HF Worker role)
  const factory BeneficiaryDownSyncEvent.hfReferralGetBatchSize({
    required List<AppConfiguration> appConfiguration,
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required String boundaryName,
  }) = HFReferralDownSyncGetBatchSizeEvent;

  /// Event to check total count of HF Referrals on server
  const factory BeneficiaryDownSyncEvent.hfReferralCheckForData({
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required int batchSize,
    required String boundaryName,
  }) = HFReferralDownSyncCheckTotalCountEvent;

  /// Event to trigger HF Referral downsync
  const factory BeneficiaryDownSyncEvent.hfReferralDownSync({
    required String projectId,
    required String boundaryCode,
    required int batchSize,
    required int initialServerCount,
    required String boundaryName,
  }) = HFReferralDownSyncEvent;
}

@freezed
class BeneficiaryDownSyncState with _$BeneficiaryDownSyncState {
  const BeneficiaryDownSyncState._();

  const factory BeneficiaryDownSyncState.inProgress(
    int syncedCount,
    int totalCount,
  ) = _DownSyncInProgressState;

  const factory BeneficiaryDownSyncState.success(
    DownsyncModel downSyncResult,
  ) = _DownSyncSuccessState;

  const factory BeneficiaryDownSyncState.getBatchSize(
    int batchSize,
    String projectId,
    String boundaryCode,
    int pendingSyncCount,
    String boundaryName,
  ) = _DownSyncGetBatchSizeState;

  const factory BeneficiaryDownSyncState.loading(bool isPop) =
      _DownSyncLoadingState;

  const factory BeneficiaryDownSyncState.insufficientStorage() =
      _DownSyncInsufficientStorageState;

  const factory BeneficiaryDownSyncState.dataFound(
    int initialServerCount,
    int batchSize,
  ) = _DownSyncDataFoundState;

  const factory BeneficiaryDownSyncState.resetState() = _DownSyncResetState;

  const factory BeneficiaryDownSyncState.totalCountCheckFailed() =
      _DownSynnCountCheckFailedState;

  const factory BeneficiaryDownSyncState.failed() = _DownSyncFailureState;

  const factory BeneficiaryDownSyncState.report(
    List<DownsyncModel> downsyncCriteriaList,
  ) = _DownSyncReportState;

  const factory BeneficiaryDownSyncState.pendingSync() =
      _DownSyncPendingSyncState;

  // ==================== HF Referral States ====================
  /// State when HF Referral batch size is calculated
  const factory BeneficiaryDownSyncState.hfReferralGetBatchSize(
    int batchSize,
    String projectId,
    String boundaryCode,
    int pendingSyncCount,
    String boundaryName,
  ) = _HFReferralDownSyncGetBatchSizeState;

  /// State when HF Referral data is found on server
  const factory BeneficiaryDownSyncState.hfReferralDataFound(
    int initialServerCount,
    int batchSize,
  ) = _HFReferralDownSyncDataFoundState;

  /// State when no HF Referral data is found
  const factory BeneficiaryDownSyncState.hfReferralNoData() =
      _HFReferralDownSyncNoDataState;

  /// State when HF Referral downsync is in progress (simple - no counts)
  const factory BeneficiaryDownSyncState.hfReferralDownloadInProgress() =
      _HFReferralDownSyncDownloadInProgressState;

  /// State when HF Referral downsync is in progress with counts (legacy)
  const factory BeneficiaryDownSyncState.hfReferralInProgress(
    int syncedCount,
    int totalCount,
  ) = _HFReferralDownSyncInProgressState;

  /// State when HF Referral downsync is successful
  const factory BeneficiaryDownSyncState.hfReferralSuccess(
    DownsyncModel downSyncResult,
  ) = _HFReferralDownSyncSuccessState;
}
