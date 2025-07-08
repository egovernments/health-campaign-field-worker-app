import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';

class ResourceBeneficiaryCard extends LocalizedStatefulWidget {
  final void Function(int) onDelete;
  final int cardIndex;
  final FormGroup form;
  final int totalItems;

  const ResourceBeneficiaryCard({
    super.key,
    super.appLocalizations,
    required this.onDelete,
    required this.cardIndex,
    required this.form,
    required this.totalItems,
  });

  @override
  State<ResourceBeneficiaryCard> createState() =>
      ResourceBeneficiaryCardState();
}

class ResourceBeneficiaryCardState
    extends LocalizedState<ResourceBeneficiaryCard> {
  DeliverInterventionBloc? bloc;
  HouseholdOverviewBloc? overViewbloc;

  @override
  void initState() {
    // TODO: implement initState
    bloc = context.read<DeliverInterventionBloc>();
    overViewbloc = context.read<HouseholdOverviewBloc>();
    super.initState();
  }

  List<ProductVariantModel> filterMatchingElements(
      List<ProductVariantModel> listA, List<DeliveryProductVariant>? listB) {
    final bIds = listB?.map((b) => b.productVariantId).toSet();
    if (bIds == null || bIds.isEmpty) return [];
    return listA.where((a) => bIds.contains(a.id)).toList();
  }

  Future<List<ProductVariantModel>> fetchAndFilterProductVariants() async {
    var data = fetchProductVariant(
      RegistrationDeliverySingleton()
          .selectedProject
          ?.additionalDetails
          ?.projectType
          ?.cycles![bloc!.state.cycle - 1]
          .deliveries?[bloc!.state.dose - 1],
      overViewbloc!.state.selectedIndividual,
      overViewbloc!.state.householdMemberWrapper.household,
    );

    final state = context.read<ProductVariantBloc>().state;
    return state.maybeWhen(
      fetched: (productVariants) {
        return filterMatchingElements(
            productVariants, data['criteria'].productVariants);
      },
      orElse: () => [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DigitCard(cardType: CardType.secondary, children: [
      BlocBuilder<ProductVariantBloc, ProductVariantState>(
        builder: (context, productState) {
          return productState.maybeWhen(
            orElse: () => const Offstage(),
            fetched: (productVariants) {
              // final List<DeliveryProductVariant>? data = fetchProductVariant(
              //         RegistrationDeliverySingleton()
              //             .selectedProject
              //             ?.additionalDetails
              //             ?.projectType
              //             ?.cycles![bloc!.state.cycle - 1]
              //             .deliveries?[bloc!.state.dose - 1],
              //         overViewbloc!.state.selectedIndividual,
              //         overViewbloc!.state.householdMemberWrapper.household)
              //     ?.expand((e) => e.productVariants!)
              //     .toList();
              // final List<ProductVariantModel> filteredProductVariantModel =
              //     filterMatchingElements(productVariants, data);

              return FutureBuilder<List<ProductVariantModel>>(
                  future: fetchAndFilterProductVariants(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: DigitLoaders.inlineLoader());
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    final filteredProductVariantModel =
                        snapshot.data as List<ProductVariantModel> ?? [];
                    return SelectionCard<ProductVariantModel>(
                      width: MediaQuery.of(context).size.width * .8,
                      showParentContainer: true,
                      options: filteredProductVariantModel,
                      onSelectionChanged: (selectedOptions) {
                        if (selectedOptions.isNotEmpty) {
                          var selectedOption = selectedOptions.first;
                          widget.form
                              .control('resourceDelivered.${widget.cardIndex}')
                              .value = selectedOption;
                        } else {
                          widget.form
                              .control('resourceDelivered.${widget.cardIndex}')
                              .value = null;
                        }
                      },
                      initialSelection: widget.form
                                  .control(
                                      'resourceDelivered.${widget.cardIndex}')
                                  .value !=
                              null
                          ? [
                              widget.form
                                  .control(
                                      'resourceDelivered.${widget.cardIndex}')
                                  .value
                            ]
                          : [],
                      valueMapper: (value) {
                        return localizations.translate(
                          value.sku ?? value.id,
                        );
                      },
                      allowMultipleSelection: false,
                    );
                  });
            },
          );
        },
      ),
      ReactiveWrapperField(
        formControlName: 'quantityDistributed.${widget.cardIndex}',
        builder: (field) => LabeledField(
          label: localizations.translate(
            i18.deliverIntervention.quantityDistributedLabel,
          ),
          child: DigitNumericFormInput(
            minValue: 1,
            step: 1,
            initialValue: "0",
            onChange: (value) {
              widget.form
                  .control('quantityDistributed.${widget.cardIndex}')
                  .value = int.parse(value);
            },
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child:
            (widget.cardIndex == widget.totalItems - 1 && widget.totalItems > 1)
                ? DigitButton(
                    onPressed: () async {
                      final submit = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => Popup(
                          title: localizations.translate(
                            i18.deliverIntervention
                                .resourceDeleteBeneficiaryDialogTitle,
                          ),
                          actions: [
                            DigitButton(
                                label: localizations.translate(
                                  i18.deliverIntervention
                                      .resourceDeleteBeneficiaryPrimaryActionLabel,
                                ),
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pop(true);
                                },
                                type: DigitButtonType.primary,
                                size: DigitButtonSize.large),
                            DigitButton(
                                label: localizations.translate(
                                  i18.common.coreCommonCancel,
                                ),
                                onPressed: () => Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop(false),
                                type: DigitButtonType.secondary,
                                size: DigitButtonSize.large),
                          ],
                        ),
                      );
                      if (submit == true) {
                        widget.onDelete(widget.cardIndex);
                      }
                    },
                    label: localizations.translate(
                      i18.deliverIntervention.resourceDeleteBeneficiary,
                    ),
                    prefixIcon: Icons.delete,
                    type: DigitButtonType.tertiary,
                    size: DigitButtonSize.medium,
                  )
                : const Offstage(),
      ),
    ]);
  }
}
