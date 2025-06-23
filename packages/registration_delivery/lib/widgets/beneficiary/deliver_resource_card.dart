import 'package:collection/collection.dart';
import 'package:digit_data_model/blocs/product_variant/product_variant.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/atoms/reactive_fields.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import 'package:registration_delivery/widgets/localized.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
      builder: (context, houseHoldOverViewState) {
        return BlocBuilder<DeliverInterventionBloc, DeliverInterventionState>(
          builder: (context, deliverInterventionState) {
            return ProductVariantBlocWrapper(
              child: DigitCard(
                cardType: CardType.secondary,
                children: [
                  BlocBuilder<ProductVariantBloc, ProductVariantState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const Offstage(),
                        fetched: (productVariants) {
                          final variants = productVariantCount(
                            deliverInterventionState,
                            context,
                            productVariants,
                            houseHoldOverViewState.selectedIndividual,
                            houseHoldOverViewState
                                .householdMemberWrapper.household,
                          );

                          // Initialize state lists
                          while (selectedVariants.length < variants.length) {
                            selectedVariants.add(null);
                            selectedQuantities.add(1);
                          }

                          return Column(
                            children: [
                              ...variants.asMap().entries.map((entry) {
                                final index = entry.key;
                                final productVariant = entry.value;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectionCard<ProductVariantModel>(
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                      showParentContainer: true,
                                      options: productVariants,
                                      onSelectionChanged: (selectedOptions) {
                                        setState(() {
                                          selectedVariants[index] =
                                              selectedOptions.firstOrNull;
                                        });
                                      },
                                      initialSelection: [],
                                      valueMapper: (value) =>
                                          value.sku ?? value.id,
                                      allowMultipleSelection: false,
                                    ),
                                    const SizedBox(height: 8),
                                    LabeledField(
                                      label: localizations.translate(
                                        i18.deliverIntervention
                                            .quantityDistributedLabel,
                                      ),
                                      child: DigitNumericFormInput(
                                        minValue: 1,
                                        step: 1,
                                        initialValue: selectedQuantities[index]
                                            ?.toString(),
                                        onChange: (value) {
                                          setState(() {
                                            selectedQuantities[index] =
                                                int.tryParse(value);
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                );
                              }).toList(),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
