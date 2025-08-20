import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';

class ResourceBeneficiaryCard extends LocalizedStatefulWidget {
  final void Function(int) onDelete;
  final int cardIndex;
  final FormGroup form;
  final int totalItems;
  final bool readOnly;
  final int? maxQuantity;

  const ResourceBeneficiaryCard({
    super.key,
    super.appLocalizations,
    required this.onDelete,
    required this.cardIndex,
    required this.form,
    required this.totalItems,
    this.maxQuantity,
    this.readOnly = false,
  });

  @override
  State<ResourceBeneficiaryCard> createState() =>
      ResourceBeneficiaryCardState();
}

class ResourceBeneficiaryCardState
    extends LocalizedState<ResourceBeneficiaryCard> {
  @override
  Widget build(BuildContext context) {
    return DigitCard(cardType: CardType.secondary, children: [
      BlocBuilder<ProductVariantBloc, ProductVariantState>(
        builder: (context, productState) {
          return productState.maybeWhen(
            orElse: () => const Offstage(),
            fetched: (productVariants) {
              return SelectionCard<ProductVariantModel>(
                width: MediaQuery.of(context).size.width * .8,
                showParentContainer: true,
                options: productVariants,
                readOnly: widget.readOnly,
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
                            .control('resourceDelivered.${widget.cardIndex}')
                            .value !=
                        null
                    ? [
                        widget.form
                            .control('resourceDelivered.${widget.cardIndex}')
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
            readOnly: widget.readOnly,
            maxValue: widget.maxQuantity ?? 1000,
            initialValue: widget.form
                        .control('quantityDistributed.${widget.cardIndex}')
                        .value !=
                    null
                ? widget.form
                    .control('quantityDistributed.${widget.cardIndex}')
                    .value
                    .toString()
                : '0',
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
                      final submit = await showCustomPopup(
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
