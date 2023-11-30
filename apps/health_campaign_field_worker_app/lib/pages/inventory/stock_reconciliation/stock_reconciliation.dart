import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/boundary/boundary.dart';
import '../../../blocs/facility/facility.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../blocs/project/project.dart';
import '../../../blocs/stock_reconciliation/stock_reconciliation.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../../widgets/localized.dart';
import '../facility_selection.dart';

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

  FormGroup _form(bool isDistributor) {
    return fb.group({
      _facilityKey: FormControl<FacilityModel>(
        validators: isDistributor ? [] : [Validators.required],
      ),
      _productVariantKey: FormControl<ProductVariantModel>(),
      _manualCountKey: FormControl<String>(
        value: '0',
        validators: [
          Validators.number,
          Validators.required,
          CustomValidator.validStockCount,
        ],
      ),
      _reconciliationCommentsKey: FormControl<String>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDistributor = context.loggedInUserRoles
        .where(
          (role) => role.code == RolesType.distributor.toValue(),
        )
        .toList()
        .isNotEmpty;

    return BlocListener<BoundaryBloc, BoundaryState>(
      listener: (context, state) {
        if (state.hasSubmitted) {
          context.navigateTo(HomeRoute());
        }
      },
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, projectState) {
          final noProjectSelected = Center(
            child: Text(AppLocalizations.of(context)
                .translate(i18.stockReconciliationDetails.noProjectSelected)),
          );

          final selectedProject = projectState.selectedProject;

          if (projectState.loading) {
            const Center(child: CircularProgressIndicator());
          }

          if (selectedProject == null) {
            return noProjectSelected;
          }

          final projectId = selectedProject.id;

          return FacilityBlocWrapper(
            child: ProductVariantBlocWrapper(
              child: BlocProvider(
                create: (context) => StockReconciliationBloc(
                  stockRepository:
                      context.repository<StockModel, StockSearchModel>(),
                  stockReconciliationRepository: context.repository<
                      StockReconciliationModel,
                      StockReconciliationSearchModel>(),
                  StockReconciliationState(
                    projectId: projectId,
                    dateOfReconciliation: DateTime.now(),
                  ),
                ),
                child: BlocConsumer<StockReconciliationBloc,
                    StockReconciliationState>(
                  listener: (context, stockState) {
                    if (!stockState.persisted) return;

                    context.router.replace(AcknowledgementRoute());
                  },
                  builder: (context, stockState) {
                    return ReactiveFormBuilder(
                      form: () => _form(isDistributor),
                      builder: (ctx, form, child) {
                        return Scaffold(
                          body: ScrollableContent(
                            enableFixedButton: true,
                            header: const Column(children: [
                              BackNavigationHelpHeaderWidget(),
                            ]),
                            footer: SizedBox(
                              child: DigitCard(
                                margin: const EdgeInsets.fromLTRB(
                                    0, kPadding, 0, 0),
                                padding: const EdgeInsets.fromLTRB(
                                    kPadding, 0, kPadding, 0),
                                child: ReactiveFormConsumer(
                                  builder: (ctx, form, child) =>
                                      DigitElevatedButton(
                                    onPressed: !form.valid ||
                                            (form
                                                    .control(_productVariantKey)
                                                    .value ==
                                                null)
                                        ? null
                                        : () async {
                                            form.markAllAsTouched();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            if (!form.valid) return;

                                            final bloc = ctx.read<
                                                StockReconciliationBloc>();

                                            final facilityId = isDistributor
                                                ? FacilityModel(
                                                    id: context
                                                        .loggedInUserUuid,
                                                    additionalFields:
                                                        FacilityAdditionalFields(
                                                      version: 1,
                                                      fields: [
                                                        const AdditionalField(
                                                          'type',
                                                          'deliveryTeam',
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : form
                                                    .control(_facilityKey)
                                                    .value as FacilityModel;

                                            final productVariant = form
                                                .control(_productVariantKey)
                                                .value as ProductVariantModel;

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
                                                  productVariant.id,
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
                                              clientAuditDetails:
                                                  ClientAuditDetails(
                                                createdBy:
                                                    context.loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                                lastModifiedBy:
                                                    context.loggedInUserUuid,
                                                lastModifiedTime: context
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
                                    if (!isDistributor)
                                      BlocConsumer<FacilityBloc, FacilityState>(
                                        listener: (context, state) =>
                                            state.whenOrNull(
                                          empty: () =>
                                              NoFacilitiesAssignedDialog.show(
                                            context,
                                          ),
                                        ),
                                        builder: (context, state) {
                                          final facilities = state.whenOrNull(
                                                fetched: (facilities, _) =>
                                                    facilities,
                                              ) ??
                                              [];

                                        return InkWell(
                                          onTap: () async {
                                            final stockReconciliationBloc =
                                                context.read<
                                                    StockReconciliationBloc>();

                                              final facility = await context
                                                  .router
                                                  .push<FacilityModel>(
                                                FacilitySelectionRoute(
                                                  facilities: facilities,
                                                ),
                                              );

                                              if (facility == null) return;
                                              form.control(_facilityKey).value =
                                                  facility;
                                              stockReconciliationBloc.add(
                                                StockReconciliationSelectFacilityEvent(
                                                  facility,
                                                ),
                                              );
                                            },
                                            child: IgnorePointer(
                                              child: DigitTextFormField(
                                                hideKeyboard: true,
                                                valueAccessor:
                                                    FacilityValueAccessor(
                                                  facilities,
                                                ),
                                                label: localizations.translate(
                                                  i18.stockReconciliationDetails
                                                      .facilityLabel,
                                                ),
                                                suffix: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(Icons.search),
                                                ),
                                                formControlName: _facilityKey,
                                                readOnly: true,
                                                isRequired: true,
                                                onTap: () async {
                                                  final stockReconciliationBloc =
                                                      context.read<
                                                          StockReconciliationBloc>();

                                                  final facility = await context
                                                      .router
                                                      .push<FacilityModel>(
                                                    FacilitySelectionRoute(
                                                      facilities: facilities,
                                                    ),
                                                  );

                                                  if (facility == null) return;
                                                  form
                                                      .control(_facilityKey)
                                                      .value = facility;
                                                  stockReconciliationBloc.add(
                                                    StockReconciliationSelectFacilityEvent(
                                                      facility,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    BlocBuilder<ProductVariantBloc,
                                        ProductVariantState>(
                                      builder: (context, state) {
                                        return state.maybeWhen(
                                          orElse: () => const Offstage(),
                                          fetched: (productVariants) {
                                            return DigitReactiveSearchDropdown<
                                                ProductVariantModel>(
                                              label: localizations.translate(
                                                i18.stockReconciliationDetails
                                                    .productLabel,
                                              ),
                                              form: form,
                                              menuItems: productVariants,
                                              formControlName:
                                                  _productVariantKey,
                                              isRequired: true,
                                              valueMapper: (value) {
                                                return localizations.translate(
                                                  value.sku ?? value.id,
                                                );
                                              },
                                              onSelected: (value) {
                                                ctx
                                                    .read<
                                                        StockReconciliationBloc>()
                                                    .add(
                                                      StockReconciliationSelectProductEvent(
                                                        value.id,
                                                        isDistributor:
                                                            isDistributor,
                                                      ),
                                                    );
                                              },
                                              validationMessage:
                                                  localizations.translate(i18
                                                      .common
                                                      .corecommonRequired),
                                              emptyText:
                                                  localizations.translate(
                                                i18.common.noMatchFound,
                                              ),
                                            );
                                          },
                                        );
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
                                        ): stockState.stockReceived
                                            .toStringAsFixed(0),
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
                                        ): stockState.stockIssued
                                            .toStringAsFixed(0),
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
                                        ): stockState.stockReturned
                                            .toStringAsFixed(0),
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
                                        ): stockState.stockLost
                                            .toStringAsFixed(0),
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
                                        ): stockState.stockDamaged
                                            .toStringAsFixed(0),
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
                                        ): stockState.stockInHand
                                            .toStringAsFixed(0),
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
                                    const SizedBox(
                                      height: kPadding * 2,
                                    ),
                                    const DigitDivider(),
                                    const SizedBox(
                                      height: kPadding,
                                    ),
                                    DigitTextFormField(
                                      isRequired: true,
                                      label: localizations.translate(
                                        i18.stockReconciliationDetails
                                            .manualCountLabel,
                                      ),
                                      formControlName: _manualCountKey,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: false,
                                      ),
                                      validationMessages: {
                                        "required": (object) => i18
                                            .stockReconciliationDetails
                                            .manualCountRequiredError,
                                        "number": (object) => i18
                                            .stockReconciliationDetails
                                            .manualCountInvalidType,
                                        "min": (object) => i18
                                            .stockReconciliationDetails
                                            .manualCountMinError,
                                        "max": (object) => i18
                                            .stockReconciliationDetails
                                            .manualCountMaxError,
                                      },
                                    ),
                                    DigitTextFormField(
                                      label: localizations.translate(
                                        i18.stockReconciliationDetails
                                            .commentsLabel,
                                      ),
                                      maxLines: 3,
                                      minLines: 3,
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
            ),
          );
        },
      ),
    );
  }
}
