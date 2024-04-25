import 'dart:async';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/boundary/boundary.dart';
import '../blocs/sync/sync.dart';
import 'package:digit_data_model/data_model.dart';
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
    // context.read<BeneficiaryDownSyncBloc>().add(
    //       const DownSyncResetStateEvent(),
    //     );
    super.initState();
  }

  @override
  void deactivate() {
    // context.read<BeneficiaryDownSyncBloc>().add(
    //       const DownSyncResetStateEvent(),
    //     );
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
                                        return value.name ??
                                            value.code ??
                                            'No Value';
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
                                                    (value).boundaryNum! + 1,
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
                            DigitCard(
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
                                                      // context
                                                      //     .read<
                                                      //         BeneficiaryDownSyncBloc>()
                                                      //     .add(
                                                      //       DownSyncGetBatchSizeEvent(
                                                      //         appConfiguration: [
                                                      //           appConfiguration,
                                                      //         ],
                                                      //         projectId: context
                                                      //             .projectId,
                                                      //         boundaryCode:
                                                      //             selectedBoundary
                                                      //                 .value!
                                                      //                 .code
                                                      //                 .toString(),
                                                      //         pendingSyncCount:
                                                      //             pendingSyncCount,
                                                      //         boundaryName:
                                                      //             selectedBoundary
                                                      //                 .value!
                                                      //                 .name
                                                      //                 .toString(),
                                                      //       ),
                                                      //     );
                                                      Future.delayed(
                                                        const Duration(
                                                          milliseconds: 100,
                                                        ),
                                                            () => context.router
                                                            .pop(),
                                                      );
                                                    } else {
                                                      Future.delayed(
                                                        const Duration(
                                                          milliseconds: 100,
                                                        ),
                                                        () => context.router
                                                            .pop(),
                                                      );
                                                    }
                                                    clickedStatus.value =
                                                        true;
                                                  }
                                                }
                                              },
                                        child: const Text('Submit'),
                                      );
                                    },
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
