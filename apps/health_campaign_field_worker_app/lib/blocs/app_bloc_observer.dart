import 'package:digit_data_model/data_model.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_service/sync_service_lib.dart';

import '../utils/analytics_service.dart';
import 'app_initialization/app_initialization.dart';
import 'auth/auth.dart';
import 'localization/localization.dart';
import 'peer_to_peer/peer_to_peer.dart';
import 'project/project.dart';
import 'projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import 'unique_beneficiary_id/unique_id.dart';

/// Global bloc observer. Besides debug logging it is the single place where
/// bloc transitions are turned into product analytics events, so the blocs
/// themselves stay free of any analytics dependency.
class AppBlocObserver extends BlocObserver {
  /// Last pending-record count reported by [SyncBloc]; attached to the
  /// `data_synced` / `sync_failed` event that follows it.
  int _pendingSyncRecords = 0;

  /// Readable name of the area the current beneficiary download is for.
  String _downloadArea = '';

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logAnalytics(bloc, transition);

    if (!kDebugMode) return;
    if (bloc is LocationBloc) return;

    AppLogger.instance.info(
      transition.nextState,
      title: '${bloc.runtimeType}.onTransition: ${transition.event}',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (!kDebugMode || bloc.runtimeType.toString().endsWith('Bloc')) return;

    AppLogger.instance.info(
      change.nextState,
      title: '${bloc.runtimeType}.onChange',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    // LocationBloc reports permission/service/fetch failures as thrown
    // exceptions rather than states, so this is the only place to see them.
    if (bloc is LocationBloc) {
      AnalyticsService.instance.logLocationUnavailable(reason: error.toString());
    }

    if (!kDebugMode) return;

    AppLogger.instance.error(
      title: bloc.runtimeType.toString(),
      stackTrace: stackTrace,
    );
  }

  void _logAnalytics(Bloc bloc, Transition transition) {
    final prev = transition.currentState;
    final next = transition.nextState;
    final event = transition.event;

    if (bloc is AppInitializationBloc) {
      if (next is AppInitialized) {
        AnalyticsService.instance.logAppStartup(success: true);
      } else if (next is AppInitializationFailed) {
        AnalyticsService.instance.logAppStartup(success: false);
      }
    } else if (bloc is AuthBloc) {
      _logAuth(next, event);
    } else if (bloc is LocalizationBloc &&
        event is OnUpdateLocalizationIndexEvent) {
      AnalyticsService.instance.logLanguageSelected(locale: event.code);
    } else if (bloc is ProjectBloc && next is ProjectState) {
      _logProject(next, event);
    } else if (bloc is BoundaryBloc &&
        prev is BoundaryState &&
        next is BoundaryState) {
      _logBoundary(prev, next);
    } else if (bloc is SyncBloc) {
      _logSync(next);
    } else if (bloc is BeneficiaryDownSyncBloc &&
        next is BeneficiaryDownSyncState) {
      _logDownload(next, event);
    } else if (bloc is FormsBloc && event is FormsSubmitEvent) {
      // Every submit path in the forms engine goes through this event.
      AnalyticsService.instance.logFormSubmitted(schemaKey: event.schemaKey);
    } else if (bloc is DigitScannerBloc &&
        prev is DigitScannerState &&
        next is DigitScannerState) {
      _logScanner(prev, next);
    } else if (bloc is PeerToPeerBloc) {
      _logDataShare(next);
    } else if (bloc is UniqueIdBloc) {
      _logBeneficiaryIds(next, event);
    }
  }

  void _logDataShare(dynamic next) {
    if (next is CompletedDataTransfer) {
      AnalyticsService.instance.logDataShared(direction: 'send');
    } else if (next is DataReceived) {
      AnalyticsService.instance.logDataShared(
        direction: 'receive',
        areas: next.receivedBoundaries.length,
      );
    } else if (next is FailedToTransfer) {
      AnalyticsService.instance
          .logDataShareFailed(direction: 'send', reason: next.error);
    } else if (next is FailedDataTransfer) {
      AnalyticsService.instance
          .logDataShareFailed(direction: 'receive', reason: next.error);
    }
  }

  void _logBeneficiaryIds(dynamic next, dynamic event) {
    if (event is FetchUniqueIdsEvent && next is LoadingState) {
      AnalyticsService.instance.markBeneficiaryIdDownloadStarted();
    } else if (next is FetchedUniqueIdsState) {
      AnalyticsService.instance
          .logBeneficiaryIdsDownloaded(count: next.ids.length);
    } else if (next is FailedState) {
      AnalyticsService.instance
          .logBeneficiaryIdDownloadFailed(reason: next.error ?? 'unknown');
    } else if (next is LimitExceeded) {
      AnalyticsService.instance
          .logBeneficiaryIdDownloadFailed(reason: 'limit exceeded');
    } else if (next is NoInternetState) {
      AnalyticsService.instance
          .logBeneficiaryIdDownloadFailed(reason: 'no internet');
    }
  }

  void _logAuth(dynamic next, dynamic event) {
    if (next is AuthAuthenticatedState) {
      if (event is AuthLoginEvent) {
        AnalyticsService.instance.setUser(
          userId: next.userModel.uuid,
          tenantId: event.tenantId,
        );
        AnalyticsService.instance.logLogin(
          roles: next.userModel.roles.map((r) => r.code).toList(),
        );
      } else if (event is AuthSwitchDeviceEventSwitchDevice) {
        AnalyticsService.instance.logDeviceSwitch(
          reason: event.deviceSwitchComment?.isNotEmpty == true
              ? event.deviceSwitchComment!
              : event.selectedReason,
        );
      }
    } else if (next is AuthErrorState && event is AuthLoginEvent) {
      AnalyticsService.instance.logLoginFailed();
    } else if (next is AuthUnauthenticatedState && event is AuthLogoutEvent) {
      AnalyticsService.instance.logLogout();
      AnalyticsService.instance.clearUser();
    }
  }

  /// ProjectBloc loads campaign master data at login. This is *not* the
  /// record sync, which is tracked from [SyncBloc] below.
  void _logProject(ProjectState next, dynamic event) {
    if (next.loading) return;
    if (next.syncError != null) {
      AnalyticsService.instance.logCampaignDataLoadFailed(
        reason: next.syncError!.name,
      );
    } else if (event is ProjectInitializeEvent) {
      AnalyticsService.instance.logCampaignDataLoaded();
    } else if (event is ProjectSelectProjectEvent &&
        next.selectedProject != null) {
      AnalyticsService.instance.logCampaignSelected(
        campaignId: next.selectedProject!.id,
        campaignName: next.selectedProject!.name,
      );
    }
  }

  /// Fires once when the worker confirms an area (hasSubmitted false→true).
  void _logBoundary(BoundaryState prev, BoundaryState next) {
    if (prev.hasSubmitted || !next.hasSubmitted) return;

    // selectedBoundaryMap is keyed by hierarchy level in insertion order, so
    // the last non-null entry is the deepest area chosen.
    final selected =
        next.selectedBoundaryMap.values.whereType<BoundaryModel>().toList();
    final deepest = selected.isNotEmpty ? selected.last : null;
    if (deepest == null) return;

    AnalyticsService.instance.logWorkAreaSelected(
      areaCode: deepest.code ?? '',
      areaName: deepest.name ?? deepest.label ?? deepest.code ?? '',
      level: selected.length,
    );
  }

  void _logSync(dynamic next) {
    if (next is SyncPendingState) {
      _pendingSyncRecords = next.count;
    } else if (next is SyncInProgressState) {
      AnalyticsService.instance
          .markSyncStarted(pendingRecords: _pendingSyncRecords);
    } else if (next is SyncCompletedState) {
      AnalyticsService.instance.logDataSynced();
    } else if (next is SyncNothingPendingState) {
      AnalyticsService.instance.logNothingToSync();
    } else if (next is UpSyncFailedState) {
      AnalyticsService.instance
          .logSyncFailed(message: next.message, step: 'upload');
    } else if (next is DownSyncFailedState) {
      AnalyticsService.instance
          .logSyncFailed(message: next.message, step: 'download');
    } else if (next is SyncFailedState) {
      AnalyticsService.instance
          .logSyncFailed(message: next.message, step: 'sync');
    }
  }

  void _logDownload(BeneficiaryDownSyncState next, dynamic event) {
    // Start markers come from the events, since the bloc's first emitted
    // state is a generic loading/inProgress.
    if (event is DownSyncBeneficiaryEvent) {
      _downloadArea = event.boundaryName.isNotEmpty
          ? event.boundaryName
          : event.boundaryCode;
      AnalyticsService.instance.markDownloadStarted();
    } else if (event is DownSyncDownloadAllEvent) {
      _downloadArea = 'all ${event.boundaries.length} areas';
      AnalyticsService.instance.markDownloadStarted();
    }

    // State classes are private to the bloc file, so match by union case.
    next.maybeWhen(
      success: (result) => AnalyticsService.instance.logBeneficiariesDownloaded(
        area: result.boundaryName ?? _downloadArea,
        records: result.totalCount ?? 0,
      ),
      multiBoundarySuccess: (results) =>
          AnalyticsService.instance.logBeneficiariesDownloaded(
        area: _downloadArea,
        records: results.fold(0, (a, r) => a + (r.totalCount ?? 0)),
      ),
      failed: () => AnalyticsService.instance.logBeneficiaryDownloadFailed(
        area: _downloadArea,
        reason: 'download error',
      ),
      insufficientStorage: () =>
          AnalyticsService.instance.logBeneficiaryDownloadFailed(
        area: _downloadArea,
        reason: 'not enough storage on device',
      ),
      totalCountCheckFailed: () =>
          AnalyticsService.instance.logBeneficiaryDownloadFailed(
        area: _downloadArea,
        reason: 'could not check server count',
      ),
      orElse: () {},
    );
  }

  /// The scanner bloc emits one state per scan attempt: `error` set on
  /// rejection, otherwise the code lists grow by the accepted item.
  void _logScanner(DigitScannerState prev, DigitScannerState next) {
    final error = next.error;
    if (error != null && error.isNotEmpty) {
      AnalyticsService.instance.logScanFailed(reason: error);
    } else if (next.qrCodes.length > prev.qrCodes.length) {
      AnalyticsService.instance.logScanSucceeded(type: 'qr');
    } else if (next.barCodes.length > prev.barCodes.length) {
      AnalyticsService.instance.logScanSucceeded(type: 'barcode');
    }
  }
}
