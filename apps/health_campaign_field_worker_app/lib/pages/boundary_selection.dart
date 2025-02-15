import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../blocs/sync/sync.dart';
import '../models/entities/roles_type.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/localized.dart';

@RoutePage()
class BoundarySelectionPage extends LocalizedStatefulWidget {
  const BoundarySelectionPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<BoundarySelectionPage> createState() => _BoundarySelectionPageState();
}

class _BoundarySelectionPageState
    extends LocalizedState<BoundarySelectionPage> {
  bool shouldPop = false;
  Map<String, FormControl<BoundaryModel>> formControls = {};
  int i = 0;
  int pendingSyncCount = 0;
  final clickedStatus = ValueNotifier<bool>(false);
  var expenseTypeCtrl = TextEditingController();
  StreamController<double> downloadProgress = StreamController<double>();

  Map<String, TextEditingController> dropdownControllers = {};

  @override
  void initState() {
    context.read<SyncBloc>().add(SyncRefreshEvent(context.loggedInUserUuid));
    context.read<BeneficiaryDownSyncBloc>().add(
          const DownSyncResetStateEvent(),
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
  void dispose() {
    clickedStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDistributor = context.loggedInUserRoles
        .where(
          (role) => role.code == RolesType.distributor.toValue(),
        )
        .toList()
        .isNotEmpty;

    return PopScope(
      canPop: shouldPop,
      child: BlocBuilder<BoundaryBloc, BoundaryState>(
        builder: (context, state) {
          final selectedBoundary = state.selectedBoundaryMap.entries
              .lastWhereOrNull((element) => element.value != null);

          return Scaffold(
            body: Builder(
              builder: (context) {
                if (state.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final labelList = state.selectedBoundaryMap.keys.toList();

                return BlocBuilder<AppInitializationBloc,
                    AppInitializationState>(
                  builder: (ctx, initState) {
                    return initState.maybeWhen(
                      orElse: () => const Offstage(),
                      initialized: (appConfiguration, _) => ReactiveFormBuilder(
                        form: () => buildForm(state),
                        builder: (context, form, child) => Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: labelList.length,
                                itemBuilder: (context, labelIndex) {
                                  final label = labelList.elementAt(labelIndex);

                                  final filteredItems =
                                      state.boundaryList.where((element) {
                                    if (element.label != label) return false;

                                    if (labelIndex == 0) return true;
                                    final parentIndex = labelIndex - 1;

                                    final parentBoundaryEntry = state
                                        .selectedBoundaryMap.entries
                                        .elementAtOrNull(parentIndex);
                                    final parentBoundary =
                                        parentBoundaryEntry?.value;
                                    if (parentBoundary == null) return false;

                                    if (element.materializedPathList
                                        .contains(parentBoundary.code)) {
                                      return true;
                                    }

                                    return false;
                                  }).toList();

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: kPadding * 2,
                                    ),
                                    child: DigitReactiveSearchDropdown<
                                        BoundaryModel>(
                                      label: localizations.translate(label),
                                      form: form,
                                      menuItems: filteredItems,
                                      formControlName: label,
                                      valueMapper: (value) {
                                        return localizations.translate(
                                            value.code ??
                                                value.name ??
                                                'No Value');
                                      },
                                      onFieldTap: (value) {
                                        setState(() {
                                          resetChildDropdowns(label, state);
                                        });
                                      },
                                      onSelected: (value) {
                                        if (value == null) return;
                                        value as BoundaryModel;

                                        context.read<BoundaryBloc>().add(
                                              BoundarySearchEvent(
                                                boundaryNum:
                                                    (value).boundaryNum!,
                                                code: (value).code!,
                                              ),
                                            );

                                        context.read<BoundaryBloc>().add(
                                              BoundarySelectEvent(
                                                label: label,
                                                selectedBoundary: value,
                                              ),
                                            );
                                        formControls[label]?.updateValue(value);
                                        // Call the resetChildDropdowns function when a parent dropdown is selected
                                        resetChildDropdowns(label, state);
                                      },
                                      isRequired: true,
                                      validationMessage:
                                          localizations.translate(
                                        i18.common.corecommonRequired,
                                      ),
                                      emptyText: localizations
                                          .translate(i18.common.noMatchFound),
                                    ),
                                  );
                                },
                              ),
                            ),
                            BlocListener<BeneficiaryDownSyncBloc,
                                BeneficiaryDownSyncState>(
                              listener: (context, downSyncState) {
                                downSyncState.maybeWhen(
                                  orElse: () => false,
                                  loading: (isPop) => {
                                    if (isPop)
                                      {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).popUntil(
                                          (route) => route is! PopupRoute,
                                        ),
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
                                    pendingSyncCount,
                                    boundaryName,
                                  ) =>
                                      context
                                          .read<BeneficiaryDownSyncBloc>()
                                          .add(
                                            DownSyncCheckTotalCountEvent(
                                              projectId: context.projectId,
                                              boundaryCode: selectedBoundary!
                                                  .value!.code
                                                  .toString(),
                                              pendingSyncCount:
                                                  pendingSyncCount,
                                              boundaryName: selectedBoundary
                                                  .value!.name
                                                  .toString(),
                                              batchSize: batchSize,
                                            ),
                                          ),
                                  pendingSync: () => showDownloadDialog(
                                    context,
                                    model: DownloadBeneficiary(
                                      title: localizations.translate(
                                        i18.syncDialog.pendingSyncLabel,
                                      ),
                                      projectId: context.projectId,
                                      appConfiguartion: appConfiguration,
                                      boundary: selectedBoundary!.value!.code
                                          .toString(),
                                      content: localizations.translate(
                                        i18.syncDialog.pendingSyncContent,
                                      ),
                                      primaryButtonLabel:
                                          localizations.translate(
                                        i18.acknowledgementSuccess.goToHome,
                                      ),
                                      boundaryName: selectedBoundary.value!.name
                                          .toString(),
                                    ),
                                    dialogType:
                                        DigitProgressDialogType.pendingSync,
                                    isPop: true,
                                  ),
                                  dataFound: (initialServerCount, batchSize) {
                                    clickedStatus.value = false;
                                    showDownloadDialog(
                                      context,
                                      model: DownloadBeneficiary(
                                        title: localizations.translate(
                                          initialServerCount > 0
                                              ? i18.beneficiaryDetails.dataFound
                                              : i18.beneficiaryDetails
                                                  .noDataFound,
                                        ),
                                        appConfiguartion: appConfiguration,
                                        projectId: context.projectId,
                                        boundary: selectedBoundary!.value!.code
                                            .toString(),
                                        batchSize: batchSize,
                                        totalCount: initialServerCount,
                                        content: localizations.translate(
                                          initialServerCount > 0
                                              ? i18.beneficiaryDetails
                                                  .dataFoundContent
                                              : i18.beneficiaryDetails
                                                  .noDataFoundContent,
                                        ),
                                        primaryButtonLabel:
                                            localizations.translate(
                                          initialServerCount > 0
                                              ? i18.common.coreCommonDownload
                                              : i18.common.coreCommonGoback,
                                        ),
                                        secondaryButtonLabel:
                                            localizations.translate(
                                          initialServerCount > 0
                                              ? i18.beneficiaryDetails
                                                  .proceedWithoutDownloading
                                              : i18.acknowledgementSuccess
                                                  .goToHome,
                                        ),
                                        boundaryName: selectedBoundary
                                            .value!.name
                                            .toString(),
                                      ),
                                      dialogType:
                                          DigitProgressDialogType.dataFound,
                                      isPop: true,
                                    );
                                  },
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
                                            i18.beneficiaryDetails
                                                .dataDownloadInProgress,
                                          ),
                                          projectId: context.projectId,
                                          boundary: selectedBoundary!
                                              .value!.code
                                              .toString(),
                                          appConfiguartion: appConfiguration,
                                          syncCount: syncCount,
                                          totalCount: totalCount,
                                          prefixLabel: syncCount.toString(),
                                          suffixLabel: totalCount.toString(),
                                          boundaryName: selectedBoundary
                                              .value!.name
                                              .toString(),
                                        ),
                                        dialogType:
                                            DigitProgressDialogType.inProgress,
                                        isPop: true,
                                        downloadProgressController:
                                            downloadProgress,
                                      );
                                    }
                                  },
                                  success: (result) {
                                    int? epochTime = result.lastSyncedTime;

                                    String date =
                                        '${DigitDateUtils.getTimeFromTimestamp(epochTime!)} on ${DigitDateUtils.getDateFromTimestamp(epochTime)}';
                                    String dataDescription =
                                        "${localizations.translate(
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
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).popUntil(
                                      (route) => route is! PopupRoute,
                                    );
                                    context.router
                                        .popAndPush((AcknowledgementRoute(
                                      isDataRecordSuccess: true,
                                      description: dataDescription,
                                      label: localizations.translate(i18
                                          .acknowledgementSuccess
                                          .dataDownloadedSuccessLabel),
                                      descriptionTableData: {
                                        localizations.translate(
                                          i18.beneficiaryDetails.boundary,
                                        ): result.boundaryName!,
                                        localizations.translate(
                                          i18.beneficiaryDetails.status,
                                        ): localizations.translate(
                                          i18.beneficiaryDetails
                                              .downloadcompleted,
                                        ),
                                        localizations.translate(
                                          i18.beneficiaryDetails.downloadtime,
                                        ): date,
                                        localizations.translate(
                                          i18.beneficiaryDetails
                                              .totalrecorddownload,
                                        ): '${result.totalCount}/${result.totalCount}',
                                      },
                                    )));
                                  },
                                  failed: () => showDownloadDialog(
                                    context,
                                    model: DownloadBeneficiary(
                                      title: localizations.translate(
                                        i18.common.coreCommonDownloadFailed,
                                      ),
                                      appConfiguartion: appConfiguration,
                                      projectId: context.projectId,
                                      pendingSyncCount: pendingSyncCount,
                                      boundary: selectedBoundary!.value!.code
                                          .toString(),
                                      content: localizations.translate(
                                        i18.beneficiaryDetails.dataFoundContent,
                                      ),
                                      primaryButtonLabel:
                                          localizations.translate(
                                        i18.syncDialog.retryButtonLabel,
                                      ),
                                      secondaryButtonLabel:
                                          localizations.translate(
                                        i18.beneficiaryDetails
                                            .proceedWithoutDownloading,
                                      ),
                                      boundaryName: selectedBoundary.value!.name
                                          .toString(),
                                    ),
                                    dialogType: DigitProgressDialogType.failed,
                                    isPop: true,
                                  ),
                                  totalCountCheckFailed: () =>
                                      showDownloadDialog(
                                    context,
                                    model: DownloadBeneficiary(
                                      title: localizations.translate(
                                        i18.beneficiaryDetails
                                            .unableToCheckDataInServer,
                                      ),
                                      appConfiguartion: appConfiguration,
                                      projectId: context.projectId,
                                      pendingSyncCount: pendingSyncCount,
                                      boundary: selectedBoundary!.value!.code
                                          .toString(),
                                      primaryButtonLabel:
                                          localizations.translate(
                                        i18.syncDialog.retryButtonLabel,
                                      ),
                                      secondaryButtonLabel:
                                          localizations.translate(
                                        i18.beneficiaryDetails
                                            .proceedWithoutDownloading,
                                      ),
                                      boundaryName: selectedBoundary.value!.name
                                          .toString(),
                                    ),
                                    dialogType:
                                        DigitProgressDialogType.checkFailed,
                                    isPop: true,
                                  ),
                                  insufficientStorage: () {
                                    clickedStatus.value = false;
                                    showDownloadDialog(
                                      context,
                                      model: DownloadBeneficiary(
                                        title: localizations.translate(
                                          i18.beneficiaryDetails
                                              .insufficientStorage,
                                        ),
                                        content: localizations.translate(i18
                                            .beneficiaryDetails
                                            .insufficientStorageContent),
                                        projectId: context.projectId,
                                        appConfiguartion: appConfiguration,
                                        boundary: selectedBoundary!.value!.code
                                            .toString(),
                                        primaryButtonLabel:
                                            localizations.translate(
                                          i18.common.coreCommonOk,
                                        ),
                                        boundaryName: selectedBoundary
                                            .value!.name
                                            .toString(),
                                      ),
                                      dialogType: DigitProgressDialogType
                                          .insufficientStorage,
                                      isPop: true,
                                    );
                                  },
                                );
                              },
                              child: DigitCard(
                                margin: const EdgeInsets.fromLTRB(
                                    0, kPadding, 0, 0),
                                padding: const EdgeInsets.fromLTRB(
                                    kPadding, 0, kPadding, 0),
                                child: SafeArea(
                                  child: BlocListener<SyncBloc, SyncState>(
                                    listener: (context, syncState) {
                                      setState(() {
                                        pendingSyncCount = syncState.maybeWhen(
                                          orElse: () => 0,
                                          pendingSync: (count) => count,
                                        );
                                      });
                                    },
                                    child: ValueListenableBuilder(
                                      valueListenable: clickedStatus,
                                      builder: (context, bool isClicked, _) {
                                        return DigitElevatedButton(
                                          onPressed: selectedBoundary == null ||
                                                  isClicked
                                              ? null
                                              : () async {
                                                  if (!form.valid ||
                                                      validateAllBoundarySelection()) {
                                                    clickedStatus.value = false;
                                                    await DigitToast.show(
                                                      context,
                                                      options:
                                                          DigitToastOptions(
                                                        localizations.translate(i18
                                                            .common
                                                            .corecommonRequired),
                                                        true,
                                                        Theme.of(context),
                                                      ),
                                                    );
                                                  } else {
                                                    setState(() {
                                                      shouldPop = true;
                                                    });

                                                    context
                                                        .read<BoundaryBloc>()
                                                        .add(
                                                          const BoundarySubmitEvent(),
                                                        );
                                                    bool isOnline =
                                                        await getIsConnected();

                                                    if (context.mounted) {
                                                      if (isOnline &&
                                                          isDistributor) {
                                                        context
                                                            .read<
                                                                BeneficiaryDownSyncBloc>()
                                                            .add(
                                                              DownSyncGetBatchSizeEvent(
                                                                appConfiguration: [
                                                                  appConfiguration,
                                                                ],
                                                                projectId: context
                                                                    .projectId,
                                                                boundaryCode:
                                                                    selectedBoundary
                                                                        .value!
                                                                        .code
                                                                        .toString(),
                                                                pendingSyncCount:
                                                                    pendingSyncCount,
                                                                boundaryName:
                                                                    selectedBoundary
                                                                        .value!
                                                                        .name
                                                                        .toString(),
                                                              ),
                                                            );
                                                      } else {
                                                        Future.delayed(
                                                          const Duration(
                                                            milliseconds: 100,
                                                          ),
                                                          () => context.router
                                                              .maybePop(),
                                                        );
                                                      }
                                                      clickedStatus.value =
                                                          true;
                                                    }
                                                  }
                                                },
                                          child: Text(localizations.translate(
                                            i18.common.coreCommonSubmit,
                                          )),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  void resetChildDropdowns(String parentLabel, BoundaryState state) {
    final labelList = state.selectedBoundaryMap.keys.toList();
    final parentIndex = labelList.indexOf(parentLabel);

    for (int i = parentIndex + 1; i < labelList.length; i++) {
      final label = labelList[i];
      formControls[label]?.updateValue(null);
    }
  }

  FormGroup buildForm(BoundaryState state) {
    formControls = {};
    final labelList = state.selectedBoundaryMap.keys.toList();

    for (final label in labelList) {
      formControls[label] = FormControl<BoundaryModel>(
        value: state.selectedBoundaryMap[label],
      );
    }

    return fb.group(formControls);
  }

  bool validateAllBoundarySelection() {
    // Iterate through the map entries
    for (final entry in formControls.entries) {
      // Access the form control
      final formControl = entry.value;

      // Check if the form control value is null
      if (formControl.value == null) {
        formControl.setErrors({'': true});

        // Return true if any form control has a null value
        return true;
      }
    }

    // Return false if none of the form controls have a null value
    return false;
  }
}
