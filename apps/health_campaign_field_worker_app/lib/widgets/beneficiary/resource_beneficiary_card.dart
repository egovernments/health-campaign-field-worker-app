import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/product_variant/product_variant.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';

class ResourceBeneficiaryCard extends LocalizedStatefulWidget {
  final void Function(int) onDelete;
  final int cardIndex;
  final FormGroup form;
  final int totalItems;
  final bool isAdministered;
  final void Function(bool) checkDoseAdministration;

  const ResourceBeneficiaryCard({
    Key? key,
    super.appLocalizations,
    required this.onDelete,
    required this.cardIndex,
    required this.form,
    required this.totalItems,
    this.isAdministered = false,
    required this.checkDoseAdministration,
  }) : super(key: key);

  @override
  State<ResourceBeneficiaryCard> createState() =>
      _ResourceBeneficiaryCardState();
}

class _ResourceBeneficiaryCardState
    extends LocalizedState<ResourceBeneficiaryCard> {
  bool doseAdministered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DigitTheme.instance.colorScheme.surface,
        border: Border.all(
          color: DigitTheme.instance.colorScheme.outline,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      margin: DigitTheme.instance.containerMargin,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          BlocBuilder<ProductVariantBloc, ProductVariantState>(
            builder: (context, productState) {
              return productState.maybeWhen(
                orElse: () => const Offstage(),
                fetched: (productVariants) {
                  return DigitReactiveDropdown(
                    label: '${localizations.translate(
                      i18.deliverIntervention.resourceDeliveredLabel,
                    )}*',
                    readOnly: true,
                    menuItems: productVariants,
                    formControlName: 'resourceDelivered.${widget.cardIndex}',
                    valueMapper: (value) {
                      return localizations.translate(
                        value.sku ?? value.id,
                      );
                    },
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: DigitCheckbox(
              label: localizations.translate(
                i18.deliverIntervention.deliverInteventionAdministeredLabel,
              ),
              value: doseAdministered,
              onChanged: (value) {
                setState(() {
                  doseAdministered = value!;
                  widget.checkDoseAdministration(value);
                });
              },
            ),
          ),
          DigitTextFormField(
            formControlName: 'quantityWasted.${widget.cardIndex}',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              LengthLimitingTextInputFormatter(3),
              FilteringTextInputFormatter.allow(
                RegExp(r'^(1000|[1-9][0-9]{0,2}|0)$'),
              ),
            ],
            label: localizations.translate(
              i18.deliverIntervention.quantityWastedLabel,
            ),
            validationMessages: {
              "required": (control) {
                return localizations.translate(
                  i18.common.corecommonRequired,
                );
              },
            },
          ),
        ],
      ),
    );
  }
}
