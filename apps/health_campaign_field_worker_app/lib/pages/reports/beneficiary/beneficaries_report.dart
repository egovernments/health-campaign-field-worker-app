import 'dart:async';
import 'dart:math';

import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_initialization/app_initialization.dart';
import '../../../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../../../blocs/sync/sync.dart';
import '../../../models/downsync/downsync.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';
import '../../../widgets/no_result_card/no_result_card.dart';

@RoutePage()
class BeneficiariesReportPage extends LocalizedStatefulWidget {
  const BeneficiariesReportPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BeneficiariesReportState();
  }
}

class BeneficiariesReportState extends LocalizedState<BeneficiariesReportPage> {
  List<DownsyncModel> downSyncList = [];
  int pendingSyncCount = 0;
  BoundaryModel? selectedBoundary;
  StreamController<double> downloadProgress = StreamController<double>();

  @override
  void initState() {
    final syncBloc = context.read<SyncBloc>();
    syncBloc.add(SyncRefreshEvent(context.loggedInUserUuid));

    final bloc = context.read<BeneficiaryDownSyncBloc>();
    bloc.add(
      const BeneficiaryDownSyncEvent.downSyncReport(),
    );
    super.initState();
  }

  @override
  void deactivate() {
    context.read<BeneficiaryDownSyncBloc>().add(
          const DownSyncResetStateEvent(),
        );
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<AppInitializationBloc, AppInitializationState>(
        builder: (ctx, initState) {
          return initState.maybeWhen(
            orElse: () => const Offstage(),
            initialized: (
              appConfiguration,
              _,
              __,
            ) =>
                ScrollableContent(
              footer: SizedBox(
                child: DigitCard(
                  margin: const EdgeInsets.only(top: kPadding),
                  padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: DigitElevatedButton(
                    onPressed: () {
                      context.router.replace(HomeRoute());
                    },
                    child: Text(localizations.translate(
                      i18.acknowledgementSuccess.goToHome,
                    )),
                  ),
                ),
              ),
              header: const BackNavigationHelpHeaderWidget(),
              children: [
                BlocListener<SyncBloc, SyncState>(
                  listener: (ctx, syncState) {
                    setState(() {
                      pendingSyncCount = syncState.maybeWhen(
                        orElse: () => 0,
                        pendingSync: (count) => count,
                      );
                    });
                  },
                  child: BlocListener<BeneficiaryDownSyncBloc,
                      BeneficiaryDownSyncState>(
                    listener: (ctx, state) {
                      state.maybeWhen(
                        orElse: () => false,
                        loading: (isPop) => {
                          if (isPop)
                            {
                              Navigator.of(context, rootNavigator: true)
                                  .popUntil((route) => route is! PopupRoute),
                            },
                          DigitSyncDialog.show(
                            context,
                            type: DigitSyncDialogType.inProgress,
                            label: 'Loading',
                            barrierDismissible: false,
                          ),
                        },
                        getBatchSize: (
                          batchSize,
                          projectId,
                          boundaryCode,
                          pendingSync,
                          boundaryName,
                        ) =>
                            context.read<BeneficiaryDownSyncBloc>().add(
                                  DownSyncCheckTotalCountEvent(
                                    projectId: context.projectId,
                                    boundaryCode: boundaryCode,
                                    pendingSyncCount: pendingSyncCount,
                                    boundaryName: boundaryName,
                                    batchSize: batchSize,
                                  ),
                                ),
                        report: (downSyncCriteriaList) {
                          setState(() {
                            downSyncList = downSyncCriteriaList;
                          });
                        },
                        pendingSync: () => showDownloadDialog(
                          context,
                          model: DownloadBeneficiary(
                            title: localizations.translate(
                              i18.syncDialog.pendingSyncLabel,
                            ),
                            projectId: context.projectId,
                            appConfiguartion: appConfiguration,
                            boundary: selectedBoundary!.code.toString(),
                            batchSize: 5,
                            totalCount: 0,
                            content: localizations.translate(
                              i18.syncDialog.pendingSyncContent,
                            ),
                            primaryButtonLabel: localizations.translate(
                              i18.acknowledgementSuccess.goToHome,
                            ),
                            boundaryName: selectedBoundary!.name.toString(),
                          ),
                          dialogType: DigitProgressDialogType.pendingSync,
                          isPop: true,
                        ),
                        dataFound: (initialServerCount, batchSize) =>
                            showDownloadDialog(
                          context,
                          model: DownloadBeneficiary(
                            title: localizations.translate(
                              initialServerCount > 0
                                  ? i18.beneficiaryDetails.dataFound
                                  : i18.beneficiaryDetails.noDataFound,
                            ),
                            projectId: context.projectId,
                            appConfiguartion: appConfiguration,
                            boundary: selectedBoundary!.code.toString(),
                            batchSize: 5,
                            totalCount: initialServerCount,
                            content: localizations.translate(
                              initialServerCount > 0
                                  ? i18.beneficiaryDetails.dataFoundContent
                                  : i18.beneficiaryDetails.noDataFoundContent,
                            ),
                            primaryButtonLabel: localizations.translate(
                              initialServerCount > 0
                                  ? i18.common.coreCommonDownload
                                  : i18.common.coreCommonGoback,
                            ),
                            secondaryButtonLabel: localizations.translate(
                              initialServerCount > 0
                                  ? i18.beneficiaryDetails
                                      .proceedWithoutDownloading
                                  : i18.acknowledgementSuccess.goToHome,
                            ),
                            boundaryName: selectedBoundary!.name.toString(),
                          ),
                          dialogType: DigitProgressDialogType.dataFound,
                          isPop: true,
                        ),
                        inProgress: (syncCount, totalCount) {
                          downloadProgress.add(
                            min(
                              (syncCount) / (totalCount),
                              1,
                            ),
                          );
                          if (syncCount < 1) {
                            showDownloadDialog(
                              context,
                              model: DownloadBeneficiary(
                                title: localizations.translate(
                                  i18.beneficiaryDetails.dataDownloadInProgress,
                                ),
                                projectId: context.projectId,
                                boundary: selectedBoundary!.code.toString(),
                                appConfiguartion: appConfiguration,
                                syncCount: syncCount,
                                totalCount: totalCount,
                                prefixLabel: syncCount.toString(),
                                suffixLabel: totalCount.toString(),
                                boundaryName: selectedBoundary!.name.toString(),
                              ),
                              dialogType: DigitProgressDialogType.inProgress,
                              isPop: true,
                              downloadProgressController: downloadProgress,
                            );
                          }
                        },
                        success: (result) {
                          int? epochTime = result.lastSyncedTime;

                          String date =
                              '${DigitDateUtils.getTimeFromTimestamp(epochTime!)} on ${DigitDateUtils.getDateFromTimestamp(epochTime)}';
                          String dataDescription = "${localizations.translate(
                            i18.beneficiaryDetails.downloadreport,
                          )}\n\n\n${localizations.translate(
                            i18.beneficiaryDetails.boundary,
                          )} ${result.boundaryName}\n${localizations.translate(
                            i18.beneficiaryDetails.status,
                          )} ${localizations.translate(
                            i18.beneficiaryDetails.downloadcompleted,
                          )}\n${localizations.translate(
                            i18.beneficiaryDetails.downloadedon,
                          )} $date\n${localizations.translate(
                            i18.beneficiaryDetails.recordsdownload,
                          )} ${result.totalCount}/${result.totalCount}";
                          Navigator.of(context, rootNavigator: true).pop();
                          context.router.popAndPush((AcknowledgementRoute(
                            isDataRecordSuccess: true,
                            description: dataDescription,
                            descriptionTableData: {
                              localizations.translate(
                                i18.beneficiaryDetails.boundary,
                              ): result.boundaryName!,
                              localizations.translate(
                                i18.beneficiaryDetails.status,
                              ): localizations.translate(
                                i18.beneficiaryDetails.downloadcompleted,
                              ),
                              localizations.translate(
                                i18.beneficiaryDetails.downloadtime,
                              ): date,
                              localizations.translate(
                                i18.beneficiaryDetails.totalrecorddownload,
                              ): '${result.totalCount}/${result.totalCount}',
                            },
                            label: localizations.translate(i18
                                .acknowledgementSuccess
                                .dataDownloadedSuccessLabel),
                          )));
                        },
                        failed: () => showDownloadDialog(
                          context,
                          model: DownloadBeneficiary(
                            title: localizations.translate(
                              i18.common.coreCommonDownloadFailed,
                            ),
                            projectId: context.projectId,
                            pendingSyncCount: pendingSyncCount,
                            appConfiguartion: appConfiguration,
                            boundary: selectedBoundary!.code.toString(),
                            content: localizations.translate(
                              i18.beneficiaryDetails.dataFoundContent,
                            ),
                            primaryButtonLabel: localizations.translate(
                              i18.syncDialog.retryButtonLabel,
                            ),
                            secondaryButtonLabel: localizations.translate(
                              i18.beneficiaryDetails.proceedWithoutDownloading,
                            ),
                            boundaryName: selectedBoundary!.name.toString(),
                          ),
                          dialogType: DigitProgressDialogType.failed,
                          isPop: true,
                        ),
                        totalCountCheckFailed: () => showDownloadDialog(
                          context,
                          model: DownloadBeneficiary(
                            title: localizations.translate(
                              i18.beneficiaryDetails.unableToCheckDataInServer,
                            ),
                            projectId: context.projectId,
                            pendingSyncCount: pendingSyncCount,
                            appConfiguartion: appConfiguration,
                            boundary: selectedBoundary!.code.toString(),
                            primaryButtonLabel: localizations.translate(
                              i18.syncDialog.retryButtonLabel,
                            ),
                            secondaryButtonLabel: localizations.translate(
                              i18.beneficiaryDetails.proceedWithoutDownloading,
                            ),
                            boundaryName: selectedBoundary!.name.toString(),
                          ),
                          dialogType: DigitProgressDialogType.checkFailed,
                          isPop: true,
                        ),
                        insufficientStorage: () => showDownloadDialog(
                          context,
                          model: DownloadBeneficiary(
                            title: localizations.translate(
                              i18.beneficiaryDetails.insufficientStorage,
                            ),
                            content: localizations.translate(i18
                                .beneficiaryDetails.insufficientStorageContent),
                            projectId: context.projectId,
                            appConfiguartion: appConfiguration,
                            boundary: selectedBoundary!.code.toString(),
                            primaryButtonLabel: localizations.translate(
                              i18.common.coreCommonOk,
                            ),
                            boundaryName: selectedBoundary!.name.toString(),
                          ),
                          dialogType:
                              DigitProgressDialogType.insufficientStorage,
                          isPop: true,
                        ),
                      );
                    },
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            localizations.translate(
                              i18.beneficiaryDetails.datadownloadreport,
                            ),
                            style: theme.textTheme.displayMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      ...downSyncList.map(
                        (e) => DigitCard(
                          child: Column(
                            children: [
                              DigitTableCard(
                                element: {
                                  localizations.translate(
                                    i18.beneficiaryDetails.boundary,
                                  ): e.boundaryName!,
                                  localizations.translate(
                                    i18.beneficiaryDetails.status,
                                  ): e.offset == 0 && e.limit == 0
                                      ? localizations.translate(
                                          i18.beneficiaryDetails
                                              .downloadcompleted,
                                        )
                                      : localizations.translate(
                                          i18.beneficiaryDetails
                                              .partialdownloaded,
                                        ),
                                  localizations.translate(
                                    i18.beneficiaryDetails.downloadtime,
                                  ): e.lastSyncedTime != null
                                      ? '${DigitDateUtils.getTimeFromTimestamp(e.lastSyncedTime!)} on ${DigitDateUtils.getDateFromTimestamp(e.lastSyncedTime!)}'
                                      : '--',
                                  localizations.translate(
                                    i18.beneficiaryDetails.totalrecorddownload,
                                  ): e.offset == 0 && e.limit == 0
                                      ? '${e.totalCount}/${e.totalCount}'
                                      : '${e.offset}/${e.totalCount}',
                                },
                              ),
                              DigitOutLineButton(
                                label: localizations.translate(
                                  i18.beneficiaryDetails.download,
                                ),
                                buttonStyle: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                    width: 1.0,
                                    color: theme.colorScheme.secondary,
                                  ),
                                  minimumSize: Size(
                                    MediaQuery.of(context).size.width,
                                    50,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedBoundary = BoundaryModel(
                                      code: e.locality,
                                      name: e.boundaryName,
                                    );
                                  });
                                  context.read<BeneficiaryDownSyncBloc>().add(
                                        DownSyncGetBatchSizeEvent(
                                          appConfiguration: [
                                            appConfiguration,
                                          ],
                                          projectId: context.projectId,
                                          boundaryCode: e.locality!,
                                          pendingSyncCount: pendingSyncCount,
                                          boundaryName:
                                              e.boundaryName.toString(),
                                        ),
                                      );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      downSyncList.isEmpty
                          ? NoResultCard(
                              align: Alignment.center,
                              label: localizations.translate(
                                i18.common.noResultsFound,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
