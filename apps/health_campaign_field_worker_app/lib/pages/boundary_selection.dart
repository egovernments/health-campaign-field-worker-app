import 'dart:math';

import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/boundary/boundary.dart';
import '../blocs/search_households/project_beneficiaries_downsync.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/localized.dart';
import '../widgets/progress_indicator/progress_indicator.dart';
import 'acknowledgement.dart';

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

  @override
  void initState() {
    super.initState();
    initDiskSpace();
  }

  @override
  void deactivate() {
    context.read<BeneficiaryDownSyncBloc>().add(
          const DownSyncResetStateEvent(),
        );
    super.deactivate();
  }

  Future<void> initDiskSpace() async {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => shouldPop,
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

                return ReactiveFormBuilder(
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
                              final parentBoundary = parentBoundaryEntry?.value;
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
                              child: DigitDropdown<BoundaryModel>(
                                initialValue: formControls[label]?.value,
                                label: label,
                                menuItems: filteredItems,
                                onChanged: (value) {
                                  if (value == null) return;

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
                                valueMapper: (value) {
                                  return value.name ?? value.code ?? 'No Value';
                                },
                                formControlName: label,
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
                            dataFound: (initialServerCount) => DigitDialog.show(
                              context,
                              //[TODO: Localizations need to be added
                              options: DigitDialogOptions(
                                titleText: 'Data Found!',
                                contentText:
                                    'There are records found for the selected boundary. If you wish to download, Kindly, ensure stable internet connection and while the downloading is in progress, please donot minimize or close the app',
                                primaryAction: DigitDialogActions(
                                  label: localizations.translate(
                                    i18.common.coreCommonDownload,
                                  ),
                                  action: (ctx) {
                                    context.read<BeneficiaryDownSyncBloc>().add(
                                          DownSyncBeneficiaryEvent(
                                            projectId: context.projectId,
                                            boundaryCode: selectedBoundary!
                                                .value!.code
                                                .toString(),
                                            // Batch Size need to be defined based on Internet speed.
                                            batchSize: 5,
                                            initialServerCount:
                                                initialServerCount,
                                          ),
                                        );
                                  },
                                ),
                                secondaryAction: DigitDialogActions(
                                  label: localizations.translate(
                                    i18.beneficiaryDetails
                                        .proceedWithoutDownloading,
                                  ),
                                  action: (ctx) {
                                    Navigator.pop(ctx);
                                    context.router.pop();
                                  },
                                ),
                              ),
                              // TODO: Secondary action button need to be added to route to Home screen
                            ),
                            inProgress: (syncCount, totalCount) {
                              // TODO: Need to emit the Progress bar in the dialog
                              Navigator.of(context, rootNavigator: true).pop();
                              DigitDialog.show(
                                context,
                                options: DigitDialogOptions(
                                  title: ProgressIndicatorContainer(
                                    label: '',
                                    prefixLabel: '$syncCount Completed',
                                    suffixLabel: totalCount.toStringAsFixed(0),
                                    value: totalCount == 0
                                        ? 0
                                        : min(syncCount / totalCount, 1),
                                  ),
                                ),
                              );
                            },
                            success: (result) {
                              Navigator.of(context, rootNavigator: true).pop();
                              context.router.popAndPush((AcknowledgementRoute(
                                  isDataRecordSuccess: true,
                                result : result,
                              )));
                            },
                            failed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              DigitSyncDialog.show(
                                context,
                                type: DigitSyncDialogType.failed,
                                label: 'Downloading Failed',
                                primaryAction: DigitDialogActions(
                                  label: localizations.translate(
                                    i18.syncDialog.retryButtonLabel,
                                  ),
                                  action: (ctx) {
                                    Navigator.pop(ctx);
                                    context.read<BeneficiaryDownSyncBloc>().add(
                                          DownSyncCheckTotalCountEvent(
                                            projectId: context.projectId,
                                            boundaryCode: selectedBoundary!
                                                .value!.code
                                                .toString(),
                                          ),
                                        );
                                  },
                                ),
                                secondaryAction: DigitDialogActions(
                                  label: localizations.translate(
                                    i18.beneficiaryDetails
                                        .proceedWithoutDownloading,
                                  ),
                                  action: (ctx) {
                                    Navigator.pop(ctx);
                                    context.router.pop();
                                  },
                                ),
                              );
                            },
                            insufficientStorage: () => DigitSyncDialog.show(
                              context,
                              type: DigitSyncDialogType.failed,
                              label: 'Insufficient Storage',
                              primaryAction: DigitDialogActions(
                                label: localizations.translate(
                                  i18.syncDialog.closeButtonLabel,
                                ),
                                action: (ctx) {
                                  Navigator.pop(ctx);
                                  context.router.pop();
                                },
                              ),
                              secondaryAction: DigitDialogActions(
                                label: localizations.translate(
                                  i18.beneficiaryDetails
                                      .proceedWithoutDownloading,
                                ),
                                action: (ctx) {
                                  Navigator.pop(ctx);
                                  context.router.pop();
                                },
                              ),
                            ),
                          );
                        },
                        child: DigitCard(
                          margin:
                              const EdgeInsets.only(left: 0, right: 0, top: 10),
                          child: SafeArea(
                            child: DigitElevatedButton(
                              onPressed: selectedBoundary == null
                                  ? null
                                  : () async {
                                      setState(() {
                                        shouldPop = true;
                                      });

                                      context.read<BoundaryBloc>().add(
                                            const BoundarySubmitEvent(),
                                          );
                                      bool isOnline = await getIsConnected();

                                      if (context.mounted) {
                                        if (isOnline) {
                                          context
                                              .read<BeneficiaryDownSyncBloc>()
                                              .add(
                                                DownSyncCheckTotalCountEvent(
                                                  projectId: context.projectId,
                                                  boundaryCode: selectedBoundary
                                                      .value!.code
                                                      .toString(),
                                                ),
                                              );
                                        } else {
                                          Future.delayed(
                                            const Duration(milliseconds: 100),
                                            () => context.router.pop(),
                                          );
                                        }
                                      }
                                    },
                              child: const Text('Submit'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
        validators: [],
        value: state.selectedBoundaryMap[label],
      );
    }

    return fb.group(formControls);
  }
}
