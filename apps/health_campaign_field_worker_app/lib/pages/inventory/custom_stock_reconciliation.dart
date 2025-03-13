import 'package:auto_route/auto_route.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/widgets/inventory/no_facilities_assigned_dialog.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/blocs/stock_reconciliation.dart';
import 'package:inventory_management/widgets/back_navigation_help_header.dart';
import 'package:inventory_management/widgets/component_wrapper/facility_bloc_wrapper.dart';
import 'package:inventory_management/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18Local;

@RoutePage()
class CustomStockReconciliationPage extends LocalizedStatefulWidget {
  const CustomStockReconciliationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomStockReconciliationPage> createState() =>
      CustomStockReconciliationPageState();
}

class CustomStockReconciliationPageState
    extends LocalizedState<CustomStockReconciliationPage> {
  static const _facilityKey = 'facility';
  static const _productVariantKey = 'productVariant';
  static const _manualCountKey = 'manualCountKey';
  static const _reconciliationCommentsKey = 'reconciliationCommentsKey';
  String? selectedFacilityId;
  bool isFacilitySelected = false;
  TextEditingController controller1 = TextEditingController();

  FormGroup _form(
      bool isDistributor, List<ProductVariantModel> productVariants) {
    return fb.group({
      _facilityKey: FormControl<String>(
        validators: isDistributor ? [] : [Validators.required],
      ),
      _productVariantKey:
          FormControl<ProductVariantModel>(value: productVariants.first),
      _manualCountKey: FormControl<String>(
        value: '0',
        validators: [
          Validators.number(),
          Validators.required,
          Validators.delegate(StockCustomValidator.validStockCount)
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

    // Added the route here to allow multiple submission
    onSubmissionCompleted() {
      Future.delayed(const Duration(milliseconds: 300)).then((value) {
        context.router.replace(
          InventoryAcknowledgementRoute(),
        );
      });
    }

    return InventorySingleton().projectId.isEmpty
        ? Center(
            child: Text(localizations
                .translate(i18.stockReconciliationDetails.noProjectSelected)),
          )
        : FacilityBlocWrapper(
            projectId: InventorySingleton().projectId,
            child: ProductVariantBlocWrapper(
              projectId: InventorySingleton().projectId,
              child: BlocConsumer<StockReconciliationBloc,
                  StockReconciliationState>(
                listener: (context, stockState) {
                  // if (!stockState.persisted) return;

                  // context.router.replace(
                  //   InventoryAcknowledgementRoute(),
                  // );
                },
                builder: (context, stockState) {
                  return BlocBuilder<InventoryProductVariantBloc,
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
                          return ReactiveFormBuilder(
                            form: () => _form(
                                InventorySingleton().isDistributor! &&
                                    !InventorySingleton().isWareHouseMgr!,
                                productVariants),
                            builder: (ctx, form, child) {
                              return Scaffold(
                                body: ScrollableContent(
                                  enableFixedDigitButton: true,
                                  header: const BackNavigationHelpHeaderWidget(
                                    showHelp: false,
                                  ),
                                  footer: SizedBox(
                                    child: DigitCard(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, spacer2, 0, 0),
                                        children: [
                                          ReactiveFormConsumer(
                                            builder: (ctx, form, child) =>
                                                DigitButton(
                                              mainAxisSize: MainAxisSize.max,
                                              size: DigitButtonSize.large,
                                              type: DigitButtonType.primary,
                                              onPressed: !form.valid ||
                                                      (form
                                                              .control(
                                                                  _productVariantKey)
                                                              .value ==
                                                          null)
                                                  ? () {}
                                                  : () async {
                                                      form.markAllAsTouched();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                      if (!form.valid) return;
                                                      // get manual count entered and show toast if manualcount != stockInHand ,checking for double as stockInHand is a double
                                                      var manualCount =
                                                          int.tryParse(form
                                                              .control(
                                                                  _manualCountKey)
                                                              .value as String);
                                                      final comments = form
                                                          .control(
                                                            _reconciliationCommentsKey,
                                                          )
                                                          .value as String?;

                                                      if (manualCount != null &&
                                                          manualCount !=
                                                              stockState
                                                                  .stockInHand
                                                                  .toInt() &&
                                                          (comments == null ||
                                                              comments
                                                                      .trim()
                                                                      .length <
                                                                  2)) {
                                                        await DigitToast.show(
                                                          context,
                                                          options:
                                                              DigitToastOptions(
                                                            localizations
                                                                .translate(i18Local
                                                                    .stockDetails
                                                                    .reconciliationCommentRequired),
                                                            true,
                                                            theme,
                                                          ),
                                                        );

                                                        return;
                                                      }

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
                                                              .control(
                                                                  _productVariantKey)
                                                              .value
                                                          as ProductVariantModel;

                                                      final calculatedCount = form
                                                          .control(
                                                              _manualCountKey)
                                                          .value as String;

                                                      final model =
                                                          StockReconciliationModel(
                                                        clientReferenceId:
                                                            IdGen.i.identifier,
                                                        dateOfReconciliation: stockState
                                                            .dateOfReconciliation
                                                            .millisecondsSinceEpoch,
                                                        facilityId:
                                                            facilityId.id,
                                                        productVariantId:
                                                            productVariant.id,
                                                        calculatedCount:
                                                            stockState
                                                                .stockInHand
                                                                .toInt(),
                                                        commentsOnReconciliation:
                                                            comments,
                                                        physicalCount:
                                                            int.tryParse(
                                                                  calculatedCount,
                                                                ) ??
                                                                0,
                                                        auditDetails:
                                                            AuditDetails(
                                                          createdBy:
                                                              InventorySingleton()
                                                                  .loggedInUserUuid,
                                                          createdTime: context
                                                              .millisecondsSinceEpoch(),
                                                        ),
                                                        clientAuditDetails:
                                                            ClientAuditDetails(
                                                          createdBy:
                                                              InventorySingleton()
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
                                                          await showCustomPopup(
                                                        context: context,
                                                        builder:
                                                            (popupContext) =>
                                                                Popup(
                                                          title: localizations
                                                              .translate(
                                                            i18.stockReconciliationDetails
                                                                .dialogTitle,
                                                          ),
                                                          onOutsideTap: () {
                                                            Navigator.of(
                                                              popupContext,
                                                              rootNavigator:
                                                                  true,
                                                            ).pop(false);
                                                          },
                                                          description:
                                                              localizations
                                                                  .translate(
                                                            i18.stockReconciliationDetails
                                                                .dialogContent,
                                                          ),
                                                          type:
                                                              PopUpType.simple,
                                                          actions: [
                                                            DigitButton(
                                                              label:
                                                                  localizations
                                                                      .translate(
                                                                i18.common
                                                                    .coreCommonSubmit,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                  popupContext,
                                                                  rootNavigator:
                                                                      true,
                                                                ).pop(true);
                                                              },
                                                              type:
                                                                  DigitButtonType
                                                                      .primary,
                                                              size:
                                                                  DigitButtonSize
                                                                      .large,
                                                            ),
                                                            DigitButton(
                                                              label:
                                                                  localizations
                                                                      .translate(
                                                                i18.common
                                                                    .coreCommonCancel,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                  popupContext,
                                                                  rootNavigator:
                                                                      true,
                                                                ).pop(false);
                                                              },
                                                              type:
                                                                  DigitButtonType
                                                                      .secondary,
                                                              size:
                                                                  DigitButtonSize
                                                                      .large,
                                                            ),
                                                          ],
                                                        ),
                                                      ) as bool;

                                                      if (submit ?? false) {
                                                        bloc.add(
                                                          StockReconciliationCreateEvent(
                                                            model,
                                                          ),
                                                        );
                                                        onSubmissionCompleted();
                                                      }
                                                    },
                                              label: localizations.translate(
                                                i18.common.coreCommonSubmit,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  children: [
                                    DigitCard(
                                      margin: const EdgeInsets.all(spacer2),
                                      children: [
                                        Text(
                                          localizations.translate(
                                            i18.stockReconciliationDetails
                                                .reconciliationPageTitle,
                                          ),
                                          style: Theme.of(context)
                                              .digitTextTheme(context)
                                              .headingXl,
                                        ),
                                        if (InventorySingleton()
                                            .isWareHouseMgr!)
                                          BlocConsumer<FacilityBloc,
                                              FacilityState>(
                                            listener: (context, state) =>
                                                state.whenOrNull(
                                              empty: () =>
                                                  NoFacilitiesAssignedDialog
                                                      .show(
                                                context,
                                                localizations,
                                              ),
                                            ),
                                            builder: (context, state) {
                                              return state.maybeWhen(
                                                  orElse: () =>
                                                      const Offstage(),
                                                  loading: () => const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                  fetched: (facilities,
                                                      allFacilities) {
                                                    return Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            final stockReconciliationBloc =
                                                                context.read<
                                                                    StockReconciliationBloc>();
                                                            final facility = await context
                                                                    .router
                                                                    .push(CustomInventoryFacilitySelectionRoute(
                                                                        facilities:
                                                                            facilities))
                                                                as FacilityModel?;

                                                            if (facility ==
                                                                null) return;
                                                            setState(() {
                                                              isFacilitySelected =
                                                                  true;
                                                            });
                                                            form
                                                                    .control(
                                                                        _facilityKey)
                                                                    .value =
                                                                localizations
                                                                    .translate(
                                                              'FAC_${facility.id}',
                                                            );
                                                            controller1.text =
                                                                localizations
                                                                    .translate(
                                                              'FAC_${facility.id}',
                                                            );
                                                            setState(() {
                                                              selectedFacilityId =
                                                                  facility.id;
                                                            });

                                                            final productVariant = form
                                                                    .control(
                                                                        _productVariantKey)
                                                                    .value
                                                                as ProductVariantModel;

                                                            stockReconciliationBloc
                                                                .add(
                                                              StockReconciliationSelectProductEvent(
                                                                productVariant
                                                                    .id,
                                                                isDistributor: InventorySingleton()
                                                                        .isDistributor! &&
                                                                    !InventorySingleton()
                                                                        .isWareHouseMgr!,
                                                              ),
                                                            );

                                                            stockReconciliationBloc
                                                                .add(
                                                              StockReconciliationSelectFacilityEvent(
                                                                facility,
                                                              ),
                                                            );
                                                          },
                                                          child: IgnorePointer(
                                                            child:
                                                                ReactiveWrapperField(
                                                              formControlName:
                                                                  _facilityKey,
                                                              builder: (field) {
                                                                return InputField(
                                                                  type: InputType
                                                                      .search,
                                                                  isRequired:
                                                                      true,
                                                                  controller:
                                                                      controller1,
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
                                                      ],
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
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              empty: () => Center(
                                                child: Text(
                                                  i18.stockDetails
                                                      .noProductsFound,
                                                ),
                                              ),
                                              fetched: (productVariants) {
                                                return ReactiveWrapperField(
                                                  formControlName:
                                                      _productVariantKey,
                                                  validationMessages: {
                                                    'required': (error) =>
                                                        localizations.translate(i18
                                                            .common
                                                            .corecommonRequired),
                                                  },
                                                  showErrors: (control) =>
                                                      control.invalid &&
                                                      control.touched,
                                                  builder: (field) {
                                                    return LabeledField(
                                                      isRequired: true,
                                                      label: localizations
                                                          .translate(
                                                        i18.stockReconciliationDetails
                                                            .productLabel,
                                                      ),
                                                      child: DigitDropdown(
                                                        // Info : setting first object as product variant for bednet campaign as only one variant
                                                        selectedOption:
                                                            DropdownItem(
                                                          name: localizations
                                                              .translate(
                                                            productVariants
                                                                    .first
                                                                    .sku ??
                                                                productVariants
                                                                    .first.id,
                                                          ),
                                                          code: productVariants
                                                              .first.id,
                                                        ),
                                                        emptyItemText:
                                                            localizations
                                                                .translate(
                                                          i18.common
                                                              .noMatchFound,
                                                        ),
                                                        items: productVariants
                                                            .map((variant) {
                                                          return DropdownItem(
                                                            name: localizations
                                                                .translate(
                                                              variant.sku ??
                                                                  variant.id,
                                                            ),
                                                            code: variant.id,
                                                          );
                                                        }).toList(),
                                                        onSelect: (value) {
                                                          setDefaultProductVariant(
                                                              field,
                                                              productVariants,
                                                              value,
                                                              ctx);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        LabelValueItem(
                                          label: localizations.translate(i18
                                              .stockReconciliationDetails
                                              .dateOfReconciliation),
                                          value: DateFormat('dd MMMM yyyy')
                                              .format(stockState
                                                  .dateOfReconciliation),
                                          labelFlex: 5,
                                        ),
                                        const DigitDivider(),
                                        LabelValueItem(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .stockReceived,
                                          ),
                                          value: isFacilitySelected
                                              ? stockState.stockReceived
                                                  .toStringAsFixed(0)
                                              : "0",
                                          labelFlex: 5,
                                        ),
                                        const DigitDivider(),
                                        LabelValueItem(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .stockIssued,
                                          ),
                                          value: isFacilitySelected
                                              ? stockState.stockIssued
                                                  .toStringAsFixed(0)
                                              : "0",
                                          labelFlex: 5,
                                        ),
                                        const DigitDivider(),
                                        LabelValueItem(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .stockReturned,
                                          ),
                                          value: isFacilitySelected
                                              ? stockState.stockReturned
                                                  .toStringAsFixed(0)
                                              : "0",
                                          labelFlex: 5,
                                        ),
                                        const DigitDivider(),
                                        LabelValueItem(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .stockLost,
                                          ),
                                          value: isFacilitySelected
                                              ? stockState.stockLost
                                                  .toStringAsFixed(0)
                                              : "0",
                                          labelFlex: 5,
                                        ),
                                        const DigitDivider(),
                                        LabelValueItem(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .stockDamaged,
                                          ),
                                          value: isFacilitySelected
                                              ? stockState.stockDamaged
                                                  .toStringAsFixed(0)
                                              : "0",
                                          labelFlex: 5,
                                        ),
                                        const DigitDivider(),
                                        LabelValueItem(
                                          label: localizations.translate(i18
                                              .stockReconciliationDetails
                                              .stockOnHand),
                                          value: isFacilitySelected
                                              ? stockState.stockInHand
                                                  .toStringAsFixed(0)
                                              : "0",
                                          labelFlex: 5,
                                        ),
                                        InfoCard(
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
                                        const DigitDivider(),
                                        ReactiveWrapperField(
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
                                            showErrors: (control) =>
                                                control.invalid &&
                                                control.touched,
                                            builder: (field) {
                                              return LabeledField(
                                                label: localizations.translate(
                                                  i18.stockReconciliationDetails
                                                      .manualCountLabel,
                                                ),
                                                isRequired: true,
                                                child: BaseDigitFormInput(
                                                  errorMessage: field.errorText,
                                                  keyboardType:
                                                      const TextInputType
                                                          .numberWithOptions(
                                                    decimal: false,
                                                  ),
                                                  initialValue: '0',
                                                  onChange: (value) {
                                                    field.control
                                                        .markAsTouched();
                                                    field.control.value = value;
                                                  },
                                                ),
                                              );
                                            }),
                                        ReactiveWrapperField<String>(
                                          formControlName:
                                              _reconciliationCommentsKey,
                                          builder: (field) {
                                            return InputField(
                                              type: InputType.textArea,
                                              label: localizations.translate(
                                                i18.stockReconciliationDetails
                                                    .commentsLabel,
                                              ),
                                              textAreaScroll:
                                                  TextAreaScroll.smart,
                                              onChange: (value) {
                                                field.control.value = value;
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          );
  }

  void setDefaultProductVariant(
      ReactiveFormFieldState<dynamic, dynamic> field,
      List<ProductVariantModel> productVariants,
      DropdownItem value,
      BuildContext ctx) {
    field.control.markAsTouched();

    /// Find the selected product variant model by matching the id
    final selectedVariant = productVariants.firstWhere(
      (variant) => variant.id == value.code,
    );

    /// Update the form control with the selected product variant model
    field.control.value = selectedVariant;

    ctx.read<StockReconciliationBloc>().add(
          StockReconciliationSelectProductEvent(
            value.code,
            isDistributor: InventorySingleton().isDistributor! &&
                !InventorySingleton().isWareHouseMgr!,
          ),
        );
  }
}

class StockCustomValidator {
  /// Validates that the control's value is a valid stock count.
  /// The value must be a non-negative integer less than or equal to 10000.
  static Map<String, dynamic>? validStockCount(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return {'required': true};
    }

    var parsed = int.tryParse(control.value) ?? 0;
    if (parsed < 0) {
      return {'min': true};
    } else if (parsed > 10000 || (parsed == 0 && parsed.toString() != control.value.toString())) {
      return {'max': true};
    }
    return null;
  }
}
