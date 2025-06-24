import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/blocs/product_variant/product_variant.dart';
import 'package:digit_data_model/models/entities/beneficiary_type.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_stepper.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/atoms/reactive_fields.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/beneficiary/resource_beneficiary_card.dart';
import 'package:registration_delivery/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import 'package:registration_delivery/widgets/localized.dart';

import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;

class CustomDeliverResourceCard extends LocalizedStatefulWidget {
  const CustomDeliverResourceCard({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomDeliverResourceCard> createState() =>
      _CustomDeliverResourceCardState();
}

class _CustomDeliverResourceCardState
    extends LocalizedState<CustomDeliverResourceCard> {
  final List<ProductVariantModel?> selectedVariants = [];
  final List<int?> selectedQuantities = [];

  final List _controllers = [];

  static const _resourceDeliveredKey = 'resourceDelivered';
  static const _quantityDistributedKey = 'quantityDistributed';
  static const _deliveryCommentKey = 'deliveryComment';
  static const _doseAdministrationKey = 'doseAdministered';
  static const _dateOfAdministrationKey = 'dateOfAdministration';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    List<StepperData> generateSteps(int numberOfDoses) {
      return List.generate(numberOfDoses, (index) {
        return StepperData(
          title:
              '${localizations.translate(i18.deliverIntervention.dose)}${index + 1}',
        );
      });
    }

    return ProductVariantBlocWrapper(
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (context, state) {
          final householdMemberWrapper = state.householdMemberWrapper;

          final projectBeneficiary =
              RegistrationDeliverySingleton().beneficiaryType !=
                      BeneficiaryType.individual
                  ? [householdMemberWrapper.projectBeneficiaries!.first]
                  : householdMemberWrapper.projectBeneficiaries
                      ?.where(
                        (element) =>
                            element.beneficiaryClientReferenceId ==
                            state.selectedIndividual?.clientReferenceId,
                      )
                      .toList();

          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : BlocBuilder<DeliverInterventionBloc,
                    DeliverInterventionState>(
                    builder: (context, deliveryInterventionState) {
                      var checkForFormulaErrors =
                          getProductVariants(deliveryInterventionState, state);

                      List<DeliveryProductVariant>? productVariants =
                          RegistrationDeliverySingleton()
                                      .selectedProject
                                      ?.additionalDetails
                                      ?.projectType
                                      ?.cycles
                                      ?.isNotEmpty ==
                                  true
                              ? getProductVariants(deliveryInterventionState,
                                      state)['criteria']
                                  ?.productVariants
                              : RegistrationDeliverySingleton()
                                  .selectedProject
                                  ?.additionalDetails
                                  ?.projectType
                                  ?.resources
                                  ?.map((r) => DeliveryProductVariant(
                                      productVariantId: r.productVariantId))
                                  .toList();

                      final int numberOfDoses = (RegistrationDeliverySingleton()
                                  .projectType
                                  ?.cycles
                                  ?.isNotEmpty ==
                              true)
                          ? (RegistrationDeliverySingleton()
                                  .projectType
                                  ?.cycles?[deliveryInterventionState.cycle - 1]
                                  .deliveries
                                  ?.length) ??
                              0
                          : 0;

                      final steps = generateSteps(numberOfDoses);

                      return BlocBuilder<ProductVariantBloc,
                          ProductVariantState>(
                        builder: (context, productState) {
                          return productState.maybeWhen(
                            orElse: () => const Offstage(),
                            fetched: (productVariantsValue) {
                              final variant = productState.whenOrNull(
                                fetched: (productVariants) {
                                  return productVariants;
                                },
                              );

                              return ReactiveFormBuilder(
                                form: () => buildForm(
                                  context,
                                  productVariants,
                                  variant,
                                ),
                                builder: (context, form, child) {
                                  return ScrollableContent(
                                    enableFixedDigitButton: true,
                                    header: const Column(children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: spacer2),
                                        child: BackNavigationHelpHeaderWidget(
                                          showHelp: false,
                                        ),
                                      ),
                                    ]),
                                    children: [
                                      Column(
                                        children: [
                                          DigitCard(
                                              margin:
                                                  const EdgeInsets.all(spacer2),
                                              children: [
                                                Text(
                                                  localizations.translate(
                                                    i18.deliverIntervention
                                                        .deliverInterventionLabel,
                                                  ),
                                                  style: textTheme.headingXl
                                                      .copyWith(
                                                          color: theme
                                                              .colorTheme
                                                              .primary
                                                              .primary2),
                                                ),
                                                if (RegistrationDeliverySingleton()
                                                        .beneficiaryType ==
                                                    BeneficiaryType.individual)
                                                  ReactiveWrapperField(
                                                    formControlName:
                                                        _doseAdministrationKey,
                                                    builder: (field) =>
                                                        LabeledField(
                                                      label: localizations
                                                          .translate(i18
                                                              .deliverIntervention
                                                              .currentCycle),
                                                      child: DigitTextFormInput(
                                                        readOnly: true,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        initialValue: form
                                                            .control(
                                                                _doseAdministrationKey)
                                                            .value,
                                                      ),
                                                    ),
                                                  ),
                                                if (numberOfDoses > 1)
                                                  SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.07,
                                                    child: DigitStepper(
                                                      activeIndex:
                                                          deliveryInterventionState
                                                                  .dose -
                                                              1,
                                                      stepperList: steps,
                                                      inverted: true,
                                                    ),
                                                  ),
                                                ReactiveWrapperField(
                                                  formControlName:
                                                      _dateOfAdministrationKey,
                                                  builder: (field) =>
                                                      LabeledField(
                                                    label:
                                                        localizations.translate(
                                                      i18.householdDetails
                                                          .dateOfRegistrationLabel,
                                                    ),
                                                    child: DigitDateFormInput(
                                                      readOnly: true,
                                                      initialValue: DateFormat(
                                                              'dd MMM yyyy')
                                                          .format(form
                                                              .control(
                                                                  _dateOfAdministrationKey)
                                                              .value)
                                                          .toString(),
                                                      confirmText: localizations
                                                          .translate(
                                                        i18.common.coreCommonOk,
                                                      ),
                                                      cancelText: localizations
                                                          .translate(
                                                        i18.common
                                                            .coreCommonCancel,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                          // TODO:test
                                          DigitCard(
                                              margin:
                                                  const EdgeInsets.all(spacer2),
                                              children: [
                                                Text(
                                                  localizations.translate(
                                                    i18.deliverIntervention
                                                        .deliverInterventionResourceLabel,
                                                  ),
                                                  style: textTheme.headingXl
                                                      .copyWith(
                                                          color: theme
                                                              .colorTheme
                                                              .primary
                                                              .primary2),
                                                ),
                                                ..._controllers.map((e) =>
                                                    ResourceBeneficiaryCard(
                                                      form: form,
                                                      cardIndex: _controllers
                                                          .indexOf(e),
                                                      totalItems:
                                                          _controllers.length,
                                                      onDelete: (index) {
                                                        (form.control(
                                                          _resourceDeliveredKey,
                                                        ) as FormArray)
                                                            .removeAt(
                                                          index,
                                                        );
                                                        (form.control(
                                                          _quantityDistributedKey,
                                                        ) as FormArray)
                                                            .removeAt(
                                                          index,
                                                        );
                                                        _controllers.removeAt(
                                                          index,
                                                        );
                                                        setState(() {
                                                          _controllers;
                                                        });
                                                      },
                                                    )),
                                                Center(
                                                  child: DigitButton(
                                                    label:
                                                        localizations.translate(
                                                      i18.deliverIntervention
                                                          .resourceAddBeneficiary,
                                                    ),
                                                    type: DigitButtonType
                                                        .tertiary,
                                                    size:
                                                        DigitButtonSize.medium,
                                                    isDisabled: ((form.control(_resourceDeliveredKey)
                                                                            as FormArray)
                                                                        .value ??
                                                                    [])
                                                                .length <
                                                            (productVariants ??
                                                                    [])
                                                                .length
                                                        ? false
                                                        : true,
                                                    onPressed: () async {
                                                      addController(form);
                                                      setState(() {
                                                        _controllers.add(
                                                          _controllers.length,
                                                        );
                                                      });
                                                    },
                                                    prefixIcon:
                                                        Icons.add_circle,
                                                  ),
                                                ),
                                              ]),
                                          DigitCard(
                                              margin:
                                                  const EdgeInsets.all(spacer2),
                                              children: [
                                                Text(
                                                  localizations.translate(
                                                    i18.deliverIntervention
                                                        .deliveryCommentHeading,
                                                  ),
                                                  style: textTheme.headingXl
                                                      .copyWith(
                                                          color: theme
                                                              .colorTheme
                                                              .primary
                                                              .primary2),
                                                ),
                                                ReactiveWrapperField(
                                                  formControlName:
                                                      _deliveryCommentKey,
                                                  builder: (field) =>
                                                      LabeledField(
                                                    label:
                                                        localizations.translate(
                                                      i18.deliverIntervention
                                                          .deliveryCommentLabel,
                                                    ),
                                                    child:
                                                        DigitDropdown<String>(
                                                      items:
                                                          RegistrationDeliverySingleton()
                                                              .deliveryCommentOptions!
                                                              .map((e) =>
                                                                  DropdownItem(
                                                                    name: localizations
                                                                        .translate(
                                                                            e),
                                                                    code: e,
                                                                  ))
                                                              .toList()
                                                            ..sort((a, b) => a
                                                                .code
                                                                .compareTo(
                                                                    b.code)),
                                                      emptyItemText:
                                                          localizations
                                                              .translate(i18
                                                                  .common
                                                                  .noMatchFound),
                                                      onChange: (value) {
                                                        form
                                                            .control(
                                                                _deliveryCommentKey)
                                                            .value = value;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
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

  addController(FormGroup form) {
    (form.control(_resourceDeliveredKey) as FormArray)
        .add(FormControl<ProductVariantModel>());
    (form.control(_quantityDistributedKey) as FormArray)
        .add(FormControl<int>(value: 0, validators: [Validators.min(1)]));
  }

  bool hasEmptyOrZeroQuantity(FormGroup form) {
    final quantityDistributedArray =
        form.control(_quantityDistributedKey) as FormArray;

    // Check if any quantity is zero or null
    return quantityDistributedArray.value?.any((e) => e == 0 || e == null) ??
        true;
  }

  List<ProductVariantModel> productVariantCount(
    DeliverInterventionState deliverInterventionState,
    BuildContext context,
    List<ProductVariantModel>? productVariants,
    IndividualModel? individualModel,
    HouseholdModel? householdModel,
  ) {
    final currentCycle = deliverInterventionState.cycle >= 0
        ? deliverInterventionState.cycle
        : 0;
    final currentDose =
        deliverInterventionState.dose >= 0 ? deliverInterventionState.dose : 0;

    final ProjectTypeModel projectType =
        RegistrationDeliverySingleton().projectType!;
    final delivery =
        projectType.cycles?[currentCycle - 1].deliveries?[currentDose - 1];

    final variants = getProductVariant(
      delivery,
      individualModel,
      householdModel,
      context,
    )['criteria']
        ?.productVariants;

    return variants ?? [];
  }

  FormGroup buildForm(
    BuildContext context,
    List<DeliveryProductVariant>? productVariants,
    List<ProductVariantModel>? variants,
  ) {
    final bloc = context.read<DeliverInterventionBloc>().state;
    final overViewbloc = context.read<HouseholdOverviewBloc>().state;
    _controllers.forEachIndexed((index, element) {
      _controllers.removeAt(index);
    });

    // Add controllers for each product variant to the _controllers list.
    if (_controllers.isEmpty) {
      final int r = RegistrationDeliverySingleton()
                  .selectedProject
                  ?.additionalDetails
                  ?.projectType
                  ?.cycles ==
              null
          ? 1
          : getProductVariants(bloc, overViewbloc) != null
              ? getProductVariants(bloc, overViewbloc)['criteria']
                  .productVariants
                  .length
              : 0;

      _controllers.addAll(List.generate(r, (index) => index)
          .mapIndexed((index, element) => index));
    }

    return fb.group(<String, Object>{
      _resourceDeliveredKey: FormArray<ProductVariantModel>(
        [
          ..._controllers.map((e) => FormControl<ProductVariantModel>(
                value: variants != null && variants.length < _controllers.length
                    ? variants.last
                    : (variants != null &&
                            _controllers.indexOf(e) < variants.length
                        ? variants.firstWhereOrNull(
                            (element) =>
                                element.id ==
                                productVariants
                                    ?.elementAt(_controllers.indexOf(e))
                                    .productVariantId,
                          )
                        : null),
              )),
        ],
      ),
      _quantityDistributedKey: FormArray<int>([
        ..._controllers.mapIndexed(
          (i, e) => FormControl<int>(
            value: RegistrationDeliverySingleton().beneficiaryType !=
                    BeneficiaryType.individual
                ? int.tryParse(
                    bloc.tasks?.lastOrNull?.resources?.elementAt(i).quantity ??
                        '0',
                  )
                : 0,
            validators: [Validators.min(1)],
          ),
        ),
      ]),
    });
  }

  getProductVariants(DeliverInterventionState deliveryInterventionState,
      HouseholdOverviewState state) {
    var result = (fetchProductVariant(
        RegistrationDeliverySingleton()
            .selectedProject
            ?.additionalDetails
            ?.projectType
            ?.cycles![deliveryInterventionState.cycle - 1]
            .deliveries?[deliveryInterventionState.dose - 1],
        state.selectedIndividual,
        state.householdMemberWrapper.household,
        context: context));

    return result;
  }
}

// class _CustomDeliverResourceCardState
//     extends LocalizedState<CustomDeliverResourceCard> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
//       builder: (context, houseHoldOverViewState) {
//         return BlocBuilder<DeliverInterventionBloc, DeliverInterventionState>(
//           builder: (context, deliverInterventionState) {
//             return ProductVariantBlocWrapper(
//               child: DigitCard(
//                 cardType: CardType.secondary,
//                 children: [
//                   BlocBuilder<ProductVariantBloc, ProductVariantState>(
//                     builder: (context, state) {
//                       return state.maybeWhen(
//                         orElse: () => const Offstage(),
//                         fetched: (productVariants) {
//                           final selectedVariants = productVariantCount(
//                             deliverInterventionState,
//                             context,
//                             productVariants,
//                             houseHoldOverViewState.selectedIndividual,
//                             houseHoldOverViewState
//                                 .householdMemberWrapper.household,
//                           );

//                           return Column(
//                             children:
//                                 selectedVariants.asMap().entries.map((entry) {
//                               final index = entry.key;
//                               final productVariant = entry.value;

//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SelectionCard<ProductVariantModel>(
//                                     width:
//                                         MediaQuery.of(context).size.width * .8,
//                                     showParentContainer: true,
//                                     options: productVariants,
//                                     onSelectionChanged: (selectedOptions) {
//                                       if (selectedOptions.isNotEmpty) {
//                                         final selected = selectedOptions.first;
//                                         // Save to form if needed
//                                       }
//                                     },
//                                     initialSelection: [productVariant],
//                                     valueMapper: (value) =>
//                                         value.sku ?? value.id,
//                                     allowMultipleSelection: false,
//                                   ),
//                                   const SizedBox(height: 8),
//                                   LabeledField(
//                                     label: localizations.translate(
//                                       i18.deliverIntervention
//                                           .quantityDistributedLabel,
//                                     ),
//                                     child: DigitNumericFormInput(
//                                       minValue: 1,
//                                       step: 1,
//                                       initialValue: '0',
//                                       onChange: (value) {
//                                         // Save to form if needed
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(height: 16),
//                                 ],
//                               );
//                             }).toList(),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   List<ProductVariantModel> productVariantCount(
//     DeliverInterventionState deliverInterventionState,
//     BuildContext context,
//     List<ProductVariantModel>? productVariants,
//     IndividualModel? individualModel,
//     HouseholdModel? householdModel,
//   ) {
//     final currentCycle = deliverInterventionState.cycle >= 0
//         ? deliverInterventionState.cycle
//         : 0;
//     final currentDose =
//         deliverInterventionState.dose >= 0 ? deliverInterventionState.dose : 0;

//     final ProjectTypeModel projectType =
//         RegistrationDeliverySingleton().projectType!;
//     final delivery =
//         projectType.cycles?[currentCycle - 1].deliveries?[currentDose - 1];

//     final variants = getProductVariant(
//       delivery,
//       individualModel,
//       householdModel,
//       context,
//     )['criteria']
//         ?.productVariants;

//     return variants ?? [];
//   }
// }
