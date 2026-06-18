import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
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
  final List<DeliveryProductVariant>? variants;
  final void Function(int index, DeliveryProductVariant product)? onProductChanged;

  const ResourceBeneficiaryCard({
    super.key,
    super.appLocalizations,
    required this.onDelete,
    required this.cardIndex,
    required this.form,
    required this.totalItems,
    this.maxQuantity,
    this.readOnly = false,
    this.variants,
    this.onProductChanged,
  });

  @override
  State<ResourceBeneficiaryCard> createState() =>
      ResourceBeneficiaryCardState();
}

class ResourceBeneficiaryCardState
    extends LocalizedState<ResourceBeneficiaryCard> {
  @override
  Widget build(BuildContext context) {
    final initialSelection =
        widget.form.control('resourceDelivered.${widget.cardIndex}').value;

    return DigitCard(cardType: CardType.secondary, children: [
      _ProductSelector(
        options: widget.variants ?? [],
        initialSelection: initialSelection != null ? [initialSelection] : [],
        valueMapper: (value) => localizations.translate(value.name),
        readOnly: widget.readOnly,
        onSelectionChanged: (selectedOptions) {
          if (selectedOptions.isNotEmpty) {
            final selected = selectedOptions.first;
            widget.form.control('resourceDelivered.${widget.cardIndex}').value =
                selected;
            widget.form
                .control('quantityDistributed.${widget.cardIndex}')
                .value = selected.quantity ?? 0;
            widget.onProductChanged?.call(widget.cardIndex, selected);
          } else {
            widget.form.control('resourceDelivered.${widget.cardIndex}').value =
                null;
          }
        },
      ),
      ReactiveWrapperField(
        formControlName: 'quantityDistributed.${widget.cardIndex}',
        builder: (field) => LabeledField(
          label: localizations.translate(
            i18.common.coreCommonQuantityDistributed,
          ),
          capitalizedFirstLetter: false,
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
                            i18.common.coreCommonDeleteResourceConfirmation,
                          ),
                          actions: [
                            DigitButton(
                                label: localizations.translate(
                                  i18.common.coreCommonDelete,
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
                      i18.common.coreCommonDeleteResource,
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

class _ProductSelector extends StatefulWidget {
  final List<DeliveryProductVariant> options;
  final List<DeliveryProductVariant> initialSelection;
  final String Function(DeliveryProductVariant) valueMapper;
  final void Function(List<DeliveryProductVariant>) onSelectionChanged;
  final bool readOnly;

  const _ProductSelector({
    required this.options,
    required this.initialSelection,
    required this.valueMapper,
    required this.onSelectionChanged,
    required this.readOnly,
  });

  @override
  State<_ProductSelector> createState() => _ProductSelectorState();
}

class _ProductSelectorState extends State<_ProductSelector> {
  DeliveryProductVariant? _selected;

  @override
  void initState() {
    super.initState();
    _selected =
        widget.initialSelection.isNotEmpty ? widget.initialSelection.first : null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorTheme.primary.primary1;
    final textTheme = theme.digitTextTheme(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.options.map((option) {
        final isSelected = _selected == option;
        return GestureDetector(
          onTap: widget.readOnly
              ? null
              : () {
                  setState(() => _selected = option);
                  widget.onSelectionChanged([option]);
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              border: Border.all(
                color: isSelected ? primaryColor : theme.colorTheme.generic.divider,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              widget.valueMapper(option),
              style: textTheme.bodyS.copyWith(
                color: isSelected
                    ? Colors.white
                    : theme.colorTheme.text.primary,
              ),
              softWrap: true,
            ),
          ),
        );
      }).toList(),
    );
  }
}
