import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/digit_components.dart' as components;
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
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
  TextEditingController controller1 = TextEditingController();
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
      projectId: widget.projectId,
      isDistributor: widget.isDistributor!,
      isWareHouseMgr: widget.isWareHouseMgr!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return widget.projectId.isEmpty
        ? Center(
            child: Text(localizations
                .translate(i18.stockReconciliationDetails.noProjectSelected)),
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
                                padding: const EdgeInsets.all(kPadding),
                                child: ReactiveFormConsumer(
                                  builder: (ctx, form, child) =>
                                      components.Button(
                                        size: ButtonSize.large,
                                        type: ButtonType.primary,
                                        isDisabled: !form.valid ||
                                            (form
                                                .control(_productVariantKey)
                                                .value ==
                                                null),
                                    onPressed: () async {
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
                                    label: localizations.translate(
                                      i18.common.coreCommonSubmit,
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
                                              fetched: (facilities) {
                                                return Column(
                                                  children: [
                                                    const SizedBox(height: 16,),
                                                    InkWell(
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
                                                        controller1.text = localizations.translate(
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
                                                        child: components.ReactiveWrapperField(
                                                          formControlName: _facilityKey,
                                                          builder: (field){
                                                            return InputField(
                                                              type: InputType.search,
                                                              isRequired: true,
                                                              controller: controller1,
                                                              label: localizations
                                                                  .translate(
                                                                i18.stockReconciliationDetails
                                                                    .facilityLabel,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 16,),
                                                  ],
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
                                          empty: () => Center(
                                            child: Text(
                                              i18.stockDetails.noProductsFound,
                                            ),
                                          ),
                                          fetched: (productVariants) {
                                            return components.ReactiveWrapperField(
                                              formControlName: _productVariantKey,
                                              validationMessages: {
                                                'required': (error) => localizations.translate(i18
                                                .common
                                                .corecommonRequired),
                                              },
                                              showErrors: (control) => control.invalid && control.touched,
                                              builder: (field) {
                                                return components.LabeledField(
                                                   isRequired: true,
                                                  label: localizations
                                                      .translate(
                                                    i18
                                                        .stockReconciliationDetails
                                                        .productLabel,
                                                  ),
                                                  child: components.DigitDropdown(
                                                    emptyItemText: localizations.translate(
                                                      i18.common.noMatchFound,
                                                    ),
                                                    items: productVariants.map((
                                                        variant) {
                                                      return components.DropdownItem(
                                                        name: localizations
                                                            .translate(
                                                          variant.sku ??
                                                              variant.id,
                                                        ),
                                                        code: variant.id,
                                                      );
                                                    }).toList(),
                                                    onSelect: (value) {
                                                      field.control.markAsTouched();
                                                      /// Find the selected product variant model by matching the id
                                                      final selectedVariant = productVariants.firstWhere(
                                                            (variant) => variant.id == value.code,
                                                      );
                                                      /// Update the form control with the selected product variant model
                                                      field.control.value = selectedVariant;

                                                                                                          ctx
                                                          .read<
                                                          StockReconciliationBloc>()
                                                          .add(
                                                        StockReconciliationSelectProductEvent(
                                                          value.code,
                                                          isDistributor: widget
                                                              .isDistributor! &&
                                                              !widget
                                                                  .isWareHouseMgr!,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
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
                                    components.InfoCard(
                                      type: InfoType.info,
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
                                      height: kPadding*2,
                                    ),
                                    components.ReactiveWrapperField(
                                      formControlName: _manualCountKey,
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
                                        showErrors: (control) => control.invalid && control.touched,
                                      builder: (field) {
                                        return components.LabeledField(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .manualCountLabel,
                                          ),
                                          isRequired: true,
                                          child: components.BaseDigitFormInput(
                                            errorMessage: field.errorText,
                                            keyboardType:
                                            const TextInputType
                                                .numberWithOptions(
                                              decimal: false,
                                            ),
                                            initialValue: '0',
                                            onChange: (value){
                                              field.control.markAsTouched();
                                              field.control.value = value;
                                            },
                                          ),
                                        );
                                      }
                                    ),
                                    const SizedBox(height: 16,),
                                    components.ReactiveWrapperField<String>(
                                      formControlName: _reconciliationCommentsKey,
                                      builder: (field){
                                        return InputField(
                                          type: InputType.textArea,
                                          label: localizations
                                              .translate(
                                            i18.stockReconciliationDetails
                                                .commentsLabel,
                                          ),
                                          textAreaScroll: TextAreaScroll.smart,
                                          onChange: (value){
                                            field.control.value= value;
                                          },
                                        );
                                      },
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
