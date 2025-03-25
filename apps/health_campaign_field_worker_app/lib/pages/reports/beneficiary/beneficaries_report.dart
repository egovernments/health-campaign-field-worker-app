import 'dart:async';
import 'dart:math';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_initialization/app_initialization.dart';
import '../../../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
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
  late StreamSubscription? syncSubscription;

  @override
  void initState() {
    context.syncRefresh();
    final bloc = context.read<BeneficiaryDownSyncBloc>();
    bloc.add(
      const BeneficiaryDownSyncEvent.downSyncReport(),
    );
    super.initState();
    listenToSyncCount();
  }

  @override
  void deactivate() {
    context.read<BeneficiaryDownSyncBloc>().add(
          const DownSyncResetStateEvent(),
        );
    super.deactivate();
  }

  @override
  void dispose() {
    syncSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

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
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      mainAxisSize: MainAxisSize.max,
                      label: localizations.translate(
                        i18.acknowledgementSuccess.goToHome,
                      ),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      onPressed: () {
                        context.router.replace(HomeRoute());
                      },
                    ),
                  ]),
              header: const BackNavigationHelpHeaderWidget(),
              children: [
                BlocListener<BeneficiaryDownSyncBloc, BeneficiaryDownSyncState>(
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
                          type: DialogType.inProgress,
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
                        )} ${localizations.translate(result.locality!)}\n${localizations.translate(
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
                            ): localizations.translate(result.locality!),
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
                        dialogType: DigitProgressDialogType.insufficientStorage,
                        isPop: true,
                      ),
                    );
                  },
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(spacer2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          localizations.translate(
                            i18.beneficiaryDetails.datadownloadreport,
                          ),
                          style: textTheme.headingXl,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ...downSyncList.map(
                      (e) => DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          padding: const EdgeInsets.all(spacer1),
                          children: [
                            LabelValueSummary(items: [
                              LabelValueItem(
                                  labelFlex: 5,
                                  label: localizations.translate(
                                    i18.beneficiaryDetails.boundary,
                                  ),
                                  value: localizations.translate(e.locality!)),
                              LabelValueItem(
                                  labelFlex: 5,
                                  label: localizations.translate(
                                    i18.beneficiaryDetails.status,
                                  ),
                                  value: e.offset == 0 && e.limit == 0
                                      ? localizations.translate(
                                          i18.beneficiaryDetails
                                              .downloadcompleted,
                                        )
                                      : localizations.translate(
                                          i18.beneficiaryDetails
                                              .partialdownloaded,
                                        )),
                              LabelValueItem(
                                  labelFlex: 5,
                                  label: localizations.translate(
                                    i18.beneficiaryDetails.downloadtime,
                                  ),
                                  value: e.lastSyncedTime != null
                                      ? '${DigitDateUtils.getTimeFromTimestamp(e.lastSyncedTime!)} on ${DigitDateUtils.getDateFromTimestamp(e.lastSyncedTime!)}'
                                      : '--'),
                              LabelValueItem(
                                  labelFlex: 5,
                                  label: localizations.translate(
                                    i18.beneficiaryDetails.totalrecorddownload,
                                  ),
                                  value: e.offset == 0 && e.limit == 0
                                      ? '${e.totalCount}/${e.totalCount}'
                                      : '${e.offset}/${e.totalCount}')
                            ]),
                            DigitButton(
                              label: localizations.translate(
                                i18.beneficiaryDetails.download,
                              ),
                              mainAxisSize: MainAxisSize.max,
                              type: DigitButtonType.secondary,
                              size: DigitButtonSize.large,
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
                                        boundaryName: e.boundaryName.toString(),
                                      ),
                                    );
                              },
                            ),
                          ]),
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
              ],
            ),
          );
        },
      ),
    );
  }

  void listenToSyncCount() async {
    syncSubscription = context.syncCount().listen((state) {
      state.maybeWhen(
          orElse: () {},
          pendingSync: (count) {
            setState(() {
              pendingSyncCount = count;
            });
          });
    });
  }
}
