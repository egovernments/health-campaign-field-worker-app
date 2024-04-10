import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../../widgets/localized.dart';
import '../../blocs/facility.dart';
import '../../blocs/inventory_listener.dart';
import '../../blocs/product_variant.dart';
import '../../blocs/stock_reconciliation.dart';
import '../../models/entities/inventory_facility.dart';
import '../../models/entities/product_variant.dart';
import '../../models/entities/stock_reconciliation.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';

@RoutePage()
class StockReconciliationPage extends LocalizedStatefulWidget {
  final InventoryListener inventoryListener;
  final String projectId;
  final bool? isDistributor;
  final bool? isWareHouseMgr;
  final String? loggedInUserUuid;
  const StockReconciliationPage({
    required this.inventoryListener,
    required this.projectId,
    required this.isDistributor,
    required this.isWareHouseMgr,
    required this.loggedInUserUuid,
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
          Validators.number,
          Validators.required,
          CustomValidator.validStockCount,
        ],
      ),
      _reconciliationCommentsKey: FormControl<String>(),
    });
  }

  @override
  void initState() {
    InventorySingleton().setInitialData(
      inventoryListener: widget.inventoryListener,
      transportTypes: [],
      userId: '',
      projectId: widget.projectId,
      isDistributor: widget.isDistributor!,
      isWareHouseMgr: widget.isWareHouseMgr!,
      boundaryName: '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return widget.projectId.isEmpty
        ? const Center(
            child: Text('No project selected'),
          )
        : FacilityBlocWrapper(
            projectId: widget.projectId,
            child: ProductVariantBlocWrapper(
              projectId: widget.projectId,
              child: BlocProvider(
                create: (context) => StockReconciliationBloc(
                  StockReconciliationState(
                    projectId: widget.projectId,
                    dateOfReconciliation: DateTime.now(),
                  ),
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
                      form: () => _form(
                          widget.isDistributor! && !widget.isWareHouseMgr!),
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
                                                widget.isDistributor! &&
                                                        !widget.isWareHouseMgr!
                                                    ? InventoryFacilityModel(
                                                        id: widget
                                                            .loggedInUserUuid!,
                                                      )
                                                    : InventoryFacilityModel(
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
                                    if (widget.isWareHouseMgr!)
                                      BlocConsumer<FacilityBloc, FacilityState>(
                                        listener: (context, state) =>
                                            state.whenOrNull(
                                          empty: () =>
                                              NoFacilitiesAssignedDialog.show(
                                            context,
                                          ),
                                        ),
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                              orElse: () => const Offstage(),
                                              loading: () => const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                              fetched: (facilities) {
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
                                                        as InventoryFacilityModel?;

                                                    if (facility == null)
                                                      return;
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
                                                            as InventoryFacilityModel?;

                                                        if (facility == null)
                                                          return;
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
                                    BlocBuilder<ProductVariantBloc,
                                        ProductVariantState>(
                                      builder: (context, state) {
                                        return state.maybeWhen(
                                          orElse: () => const Offstage(),
                                          loading: () => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          empty: () => const Center(
                                            child: Text(
                                                'No products found'),
                                          ),
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
                                                        isDistributor: widget
                                                                .isDistributor! &&
                                                            !widget
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
  }
}
