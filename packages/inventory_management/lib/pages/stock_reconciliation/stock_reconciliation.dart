import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../../widgets/localized.dart';
import '../../blocs/product_variant.dart';
import '../../blocs/stock_reconciliation.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';

@RoutePage()
class StockReconciliationPage extends LocalizedStatefulWidget {
  const StockReconciliationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<StockReconciliationPage> createState() =>
      StockReconciliationPageState();
}

class StockReconciliationPageState
    extends LocalizedState<StockReconciliationPage> {
  static const _facilityKey = 'facility';
  static const _productVariantKey = 'productVariant';
  static const _manualCountKey = 'manualCountKey';
  static const _reconciliationCommentsKey = 'reconciliationCommentsKey';
  String? selectedFacilityId;

  FormGroup _form(bool isDistributor) {
    return fb.group({
      _facilityKey: FormControl<String>(
        validators: isDistributor ? [] : [Validators.required],
      ),
      _productVariantKey: FormControl<ProductVariantModel>(),
      _manualCountKey: FormControl<String>(
        value: '0',
        validators: [
          Validators.number(),
          Validators.required,
          Validators.delegate(CustomValidator.validStockCount)
        ],
      ),
      _reconciliationCommentsKey: FormControl<String>(),
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InventorySingleton().projectId.isEmpty
        ? Center(
            child: Text(localizations
                .translate(i18.stockReconciliationDetails.noProjectSelected)),
          )
        : FacilityBlocWrapper(
            projectId: InventorySingleton().projectId,
            child: ProductVariantBlocWrapper(
              projectId: InventorySingleton().projectId,
              child: BlocProvider(
                create: (context) => StockReconciliationBloc(
                  StockReconciliationState(
                    projectId: InventorySingleton().projectId,
                    dateOfReconciliation: DateTime.now(),
                  ),
                  stockRepository:
                      context.repository<StockModel, StockSearchModel>(context),
                  stockReconciliationRepository: context.repository<
                      StockReconciliationModel,
                      StockReconciliationSearchModel>(context),
                ),
                child: BlocConsumer<StockReconciliationBloc,
                    StockReconciliationState>(
                  listener: (context, stockState) {
                    if (!stockState.persisted) return;

                    context.router.replace(
                      InventoryAcknowledgementRoute(),
                    );
                  },
                  builder: (context, stockState) {
                    return ReactiveFormBuilder(
                      form: () => _form(InventorySingleton().isDistributor! &&
                          !InventorySingleton().isWareHouseMgr!),
                      builder: (ctx, form, child) {
                        return Scaffold(
                          body: ScrollableContent(
                            enableFixedButton: true,
                            header: const BackNavigationHelpHeaderWidget(),
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

                                            final facilityId =
                                                InventorySingleton()
                                                            .isDistributor! &&
                                                        !InventorySingleton()
                                                            .isWareHouseMgr!
                                                    ? FacilityModel(
                                                        id: InventorySingleton()
                                                            .loggedInUserUuid!,
                                                      )
                                                    : FacilityModel(
                                                        id: selectedFacilityId
                                                            .toString(),
                                                      );

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
                                                createdBy: InventorySingleton()
                                                    .loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                              ),
                                              clientAuditDetails:
                                                  ClientAuditDetails(
                                                createdBy: InventorySingleton()
                                                    .loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                                lastModifiedBy:
                                                    InventorySingleton()
                                                        .loggedInUserUuid,
                                                lastModifiedTime: context
                                                    .millisecondsSinceEpoch(),
                                              ),
                                            );

                                            final submit =
                                                await DigitDialog.show<bool>(
                                              context,
                                              options: DigitDialogOptions(
                                                key: const Key('submitDialog'),
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
                                    if (InventorySingleton().isWareHouseMgr!)
                                      BlocConsumer<FacilityBloc, FacilityState>(
                                        listener: (context, state) =>
                                            state.whenOrNull(
                                          empty: () =>
                                              NoFacilitiesAssignedDialog.show(
                                            context,
                                            localizations,
                                          ),
                                        ),
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                              orElse: () => const Offstage(),
                                              loading: () => const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                              fetched:
                                                  (facilities, allFacilities) {
                                                return InkWell(
                                                  onTap: () async {
                                                    final stockReconciliationBloc =
                                                        context.read<
                                                            StockReconciliationBloc>();
                                                    final facility = await context
                                                            .router
                                                            .push(InventoryFacilitySelectionRoute(
                                                                facilities:
                                                                    facilities))
                                                        as FacilityModel?;

                                                    if (facility == null) {
                                                      return;
                                                    }
                                                    form
                                                            .control(_facilityKey)
                                                            .value =
                                                        localizations.translate(
                                                      'FAC_${facility.id}',
                                                    );
                                                    setState(() {
                                                      selectedFacilityId =
                                                          facility.id;
                                                    });
                                                    stockReconciliationBloc.add(
                                                      StockReconciliationSelectFacilityEvent(
                                                        facility,
                                                      ),
                                                    );
                                                  },
                                                  child: IgnorePointer(
                                                    child: DigitTextFormField(
                                                      key: const Key(
                                                          _facilityKey),
                                                      hideKeyboard: true,
                                                      label: localizations
                                                          .translate(
                                                        i18.stockReconciliationDetails
                                                            .facilityLabel,
                                                      ),
                                                      suffix: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child:
                                                            Icon(Icons.search),
                                                      ),
                                                      formControlName:
                                                          _facilityKey,
                                                      readOnly: true,
                                                      isRequired: true,
                                                      onTap: () async {
                                                        final stockReconciliationBloc =
                                                            context.read<
                                                                StockReconciliationBloc>();

                                                        final facility = await context
                                                                .router
                                                                .push(InventoryFacilitySelectionRoute(
                                                                    facilities:
                                                                        facilities))
                                                            as FacilityModel?;

                                                        if (facility == null) {
                                                          return;
                                                        }
                                                        form
                                                                .control(
                                                                    _facilityKey)
                                                                .value =
                                                            localizations
                                                                .translate(
                                                          'FAC_${facility.id}',
                                                        );
                                                        setState(() {
                                                          selectedFacilityId =
                                                              facility.id;
                                                        });
                                                        stockReconciliationBloc
                                                            .add(
                                                          StockReconciliationSelectFacilityEvent(
                                                            facility,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    BlocBuilder<InventoryProductVariantBloc,
                                        InventoryProductVariantState>(
                                      builder: (context, state) {
                                        return state.maybeWhen(
                                          orElse: () => const Offstage(),
                                          loading: () => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          empty: () => Center(
                                            child: Text(
                                              i18.stockDetails.noProductsFound,
                                            ),
                                          ),
                                          fetched: (productVariants) {
                                            return DigitReactiveSearchDropdown<
                                                ProductVariantModel>(
                                              key:
                                                  const Key(_productVariantKey),
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
                                                        isDistributor: InventorySingleton()
                                                                .isDistributor! &&
                                                            !InventorySingleton()
                                                                .isWareHouseMgr!,
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
                                      key: const Key('stockReconStockReceived'),
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
                                      key: const Key('stockReconStockIssued'),
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
                                      key: const Key('stockReconStockReturned'),
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
                                      key: const Key('stockReconStockLost'),
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
                                      key: const Key('stockReconStockDamaged'),
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
                                      key: const Key('stockReconStockOnHand'),
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
                                      key: const Key(_manualCountKey),
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
                                        "required": (object) =>
                                            localizations.translate(i18
                                                .stockReconciliationDetails
                                                .manualCountRequiredError),
                                        "number": (object) =>
                                            localizations.translate(i18
                                                .stockReconciliationDetails
                                                .manualCountInvalidType),
                                        "min": (object) =>
                                            localizations.translate(i18
                                                .stockReconciliationDetails
                                                .manualCountMinError),
                                        "max": (object) =>
                                            localizations.translate(i18
                                                .stockReconciliationDetails
                                                .manualCountMaxError),
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
  }
}
