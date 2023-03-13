import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/facility/facility.dart';
import '../../../blocs/project/project.dart';
import '../../../blocs/stock_reconciliation/stock_reconciliation.dart';
import '../../../data/network_manager.dart';
import '../../../models/data_model.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/facility_wrapper/facility_wrapper.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class StockReconciliationPage extends LocalizedStatefulWidget {
  const StockReconciliationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<StockReconciliationPage> createState() =>
      _StockReconciliationPageState();
}

class _StockReconciliationPageState
    extends LocalizedState<StockReconciliationPage> {
  static const _facilityKey = 'facility';
  static const _productVariantKey = 'productVariant';
  static const _manualCountKey = 'manualCountKey';
  static const _reconciliationCommentsKey = 'reconciliationCommentsKey';

  FormGroup _form() {
    return fb.group({
      _facilityKey: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
      _productVariantKey: FormControl<MenuItemModel>(
        validators: [Validators.required],
      ),
      _manualCountKey: FormControl<String>(
        value: '0',
        validators: [
          Validators.number,
          Validators.required,
        ],
      ),
      _reconciliationCommentsKey: FormControl<String>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final networkManager = context.read<NetworkManager>();

    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        const noProjectSelected = Center(
          child: Text('No project selected'),
        );

        return projectState.maybeWhen(
          orElse: () => noProjectSelected,
          loading: () => const Center(child: CircularProgressIndicator()),
          fetched: (projects, selectedProject) {
            final projectId = selectedProject?.id;

            if (projectId == null) {
              return noProjectSelected;
            }

            if (selectedProject == null) {
              return const Center(
                child: Text('Project not selected'),
              );
            }

            return FacilityBlocWrapper(
              child: BlocProvider(
                create: (context) => StockReconciliationBloc(
                  stockRepository: networkManager
                      .repository<StockModel, StockSearchModel>(context),
                  stockReconciliationRepository: networkManager.repository<
                      StockReconciliationModel,
                      StockReconciliationSearchModel>(context),
                  StockReconciliationState(
                    projectId: projectId,
                    dateOfReconciliation: DateTime.now(),
                  ),
                ),
                child: BlocBuilder<StockReconciliationBloc,
                    StockReconciliationState>(
                  builder: (context, stockState) {
                    return ReactiveFormBuilder(
                      form: _form,
                      builder: (ctx, form, child) {
                        return Scaffold(
                          body: ScrollableContent(
                            header: Column(children: const [
                              BackNavigationHelpHeaderWidget(),
                            ]),
                            footer: SizedBox(
                              height: 90,
                              child: DigitCard(
                                child: ReactiveFormConsumer(
                                  builder: (ctx, form, child) =>
                                      DigitElevatedButton(
                                    onPressed: !form.valid
                                        ? null
                                        : () async {
                                            form.markAllAsTouched();
                                            if (!form.valid) return;

                                            final bloc = ctx.read<
                                                StockReconciliationBloc>();

                                            final facilityId = form
                                                .control(_facilityKey)
                                                .value as FacilityModel;

                                            final productVariantId = form
                                                .control(_productVariantKey)
                                                .value as MenuItemModel;

                                            final calculatedCount = form
                                                .control(_manualCountKey)
                                                .value as String;

                                            final comments = form
                                                .control(
                                                  _reconciliationCommentsKey,
                                                )
                                                .value as String?;

                                            final model =
                                                StockReconciliationModel(
                                              clientReferenceId:
                                                  IdGen.i.identifier,
                                              dateOfReconciliation: stockState
                                                  .dateOfReconciliation
                                                  .millisecondsSinceEpoch,
                                              facilityId: facilityId.id,
                                              productVariantId:
                                                  productVariantId.code,
                                              calculatedCount: stockState
                                                  .stockInHand
                                                  .toInt(),
                                              commentsOnReconciliation:
                                                  comments,
                                              physicalCount: int.tryParse(
                                                    calculatedCount,
                                                  ) ??
                                                  0,
                                              auditDetails: AuditDetails(
                                                createdBy:
                                                    context.loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                              ),
                                            );

                                            final submit =
                                                await DigitDialog.show<bool>(
                                              context,
                                              options: DigitDialogOptions(
                                                titleText:
                                                    localizations.translate(
                                                  i18.stockReconciliationDetails
                                                      .dialogTitle,
                                                ),
                                                contentText:
                                                    localizations.translate(
                                                  i18.stockReconciliationDetails
                                                      .dialogContent,
                                                ),
                                                primaryAction:
                                                    DigitDialogActions(
                                                  label:
                                                      localizations.translate(
                                                    i18.common.coreCommonSubmit,
                                                  ),
                                                  action: (context) {
                                                    Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop(true);
                                                  },
                                                ),
                                                secondaryAction:
                                                    DigitDialogActions(
                                                  label:
                                                      localizations.translate(
                                                    i18.common.coreCommonCancel,
                                                  ),
                                                  action: (context) =>
                                                      Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  ).pop(false),
                                                ),
                                              ),
                                            );

                                            if (submit ?? false) {
                                              bloc.add(
                                                StockReconciliationCreateEvent(
                                                  model,
                                                ),
                                              );
                                            }
                                          },
                                    child: Center(
                                      child: Text(
                                        localizations.translate(
                                          i18.common.coreCommonSubmit,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            children: [
                              DigitCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      localizations.translate(
                                        i18.stockReconciliationDetails
                                            .reconciliationPageTitle,
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    BlocBuilder<FacilityBloc, FacilityState>(
                                      builder: (context, state) {
                                        return DigitSearchDropdown<
                                            FacilityModel>(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .facilityLabel,
                                          ),
                                          onSuggestionSelected: (suggestion) {
                                            ctx
                                                .read<StockReconciliationBloc>()
                                                .add(
                                                  StockReconciliationSelectFacilityEvent(
                                                    suggestion,
                                                  ),
                                                );
                                          },
                                          suggestionsCallback:
                                              (items, pattern) {
                                            return items.where(
                                              (e) => e.id.contains(pattern),
                                            );
                                          },
                                          menuItems: state.maybeWhen(
                                            orElse: () => [],
                                            fetched: (facilities) => facilities,
                                          ),
                                          formControlName: _facilityKey,
                                          valueMapper: (value) => value.id,
                                        );
                                      },
                                    ),
                                    DigitDropdown<MenuItemModel>(
                                      formControlName: _productVariantKey,
                                      label: localizations.translate(
                                        i18.stockReconciliationDetails
                                            .productLabel,
                                      ),
                                      onChanged: (value) {
                                        ctx.read<StockReconciliationBloc>().add(
                                              StockReconciliationSelectProductEvent(
                                                value.code,
                                              ),
                                            );
                                      },
                                      valueMapper: (value) {
                                        return localizations
                                            .translate(value.name);
                                      },
                                      menuItems: tempProductVariants,
                                      validationMessages: {
                                        'required': (object) =>
                                            'Field is required',
                                      },
                                    ),
                                    DigitTableCard(
                                      fraction: 2.5,
                                      gap: kPadding,
                                      element: {
                                        localizations.translate(i18
                                                .stockReconciliationDetails
                                                .dateOfReconciliation):
                                            DateFormat('dd MMMM yyyy').format(
                                          stockState.dateOfReconciliation,
                                        ),
                                      },
                                    ),
                                    const DigitDivider(),
                                    DigitTableCard(
                                      fraction: 2.5,
                                      gap: kPadding,
                                      element: {
                                        localizations.translate(
                                          i18.stockReconciliationDetails
                                              .stockReceived,
                                        ): stockState.stockReceived,
                                      },
                                    ),
                                    const DigitDivider(),
                                    DigitTableCard(
                                      fraction: 2.5,
                                      gap: kPadding,
                                      element: {
                                        localizations.translate(
                                          i18.stockReconciliationDetails
                                              .stockIssued,
                                        ): stockState.stockIssued,
                                      },
                                    ),
                                    const DigitDivider(),
                                    DigitTableCard(
                                      fraction: 2.5,
                                      gap: kPadding,
                                      element: {
                                        localizations.translate(
                                          i18.stockReconciliationDetails
                                              .stockReturned,
                                        ): stockState.stockReturned,
                                      },
                                    ),
                                    const DigitDivider(),
                                    DigitTableCard(
                                      fraction: 2.5,
                                      gap: kPadding,
                                      element: {
                                        localizations.translate(
                                          i18.stockReconciliationDetails
                                              .stockLost,
                                        ): stockState.stockLost,
                                      },
                                    ),
                                    const DigitDivider(),
                                    DigitTableCard(
                                      fraction: 2.5,
                                      gap: kPadding,
                                      element: {
                                        localizations.translate(
                                          i18.stockReconciliationDetails
                                              .stockDamaged,
                                        ): stockState.stockDamaged,
                                      },
                                    ),
                                    const DigitDivider(),
                                    DigitTableCard(
                                      fraction: 2.5,
                                      gap: kPadding,
                                      element: {
                                        localizations.translate(
                                          i18.stockReconciliationDetails
                                              .stockOnHand,
                                        ): stockState.stockInHand,
                                      },
                                    ),
                                    DigitInfoCard(
                                      margin: EdgeInsets.zero,
                                      icon: Icons.info,
                                      backgroundColor:
                                          theme.colorScheme.tertiaryContainer,
                                      iconColor: theme.colorScheme.surfaceTint,
                                      description: localizations.translate(
                                        i18.stockReconciliationDetails
                                            .infoCardContent,
                                      ),
                                      title: localizations.translate(
                                        i18.stockReconciliationDetails
                                            .infoCardTitle,
                                      ),
                                    ),
                                    const DigitDivider(),
                                    DigitTextFormField(
                                      isRequired: true,
                                      label: localizations.translate(
                                        i18.stockReconciliationDetails
                                            .manualCountLabel,
                                      ),
                                      formControlName: _manualCountKey,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                    ),
                                    DigitTextFormField(
                                      label: localizations.translate(
                                        i18.stockReconciliationDetails
                                            .commentsLabel,
                                      ),
                                      formControlName:
                                          _reconciliationCommentsKey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
