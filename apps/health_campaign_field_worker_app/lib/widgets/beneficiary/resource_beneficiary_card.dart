import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/product_variant/product_variant.dart';
import '../../models/data_model.dart';
import '../../utils/constants.dart';
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
      _ResourceBeneficiaryCardState();
}

class _ResourceBeneficiaryCardState
    extends LocalizedState<ResourceBeneficiaryCard> {

  bool show = false;




  @override
  Widget build(BuildContext context) {
    // print((widget.form.control("quantityWastedRadio.${widget.cardIndex}").value as KeyValue).key);
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
      margin: const EdgeInsets.only(
        top: kPadding,
        bottom: kPadding,
      ),
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        children: [
          BlocBuilder<ProductVariantBloc, ProductVariantState>(
            builder: (context, productState) {
              return productState.maybeWhen(
                orElse: () => const Offstage(),
                fetched: (productVariants) {
                  return DigitReactiveSearchDropdown<ProductVariantModel>(
                    label: localizations.translate(
                      i18.deliverIntervention.resourceDeliveredLabel,
                    ),
                    enabled: false,
                    form: widget.form,
                    menuItems: productVariants,
                    formControlName: 'resourceDelivered.${widget.cardIndex}',
                    valueMapper: (value) {
                      return localizations.translate(
                        value.sku ?? value.id,
                      );
                    },
                    isRequired: true,
                    validationMessage: localizations.translate(
                      i18.common.corecommonRequired,
                    ),
                    emptyText: localizations.translate(i18.common.noMatchFound),
                  );
                },
              );
            },
          ),
          DigitIntegerFormPicker(
            incrementer: false,
            formControlName: 'quantityDistributed.${widget.cardIndex}',
            form: widget.form,
            readOnly: true,
            label: localizations.translate(
              i18.deliverIntervention.quantityDistributedLabel,
            ),
            minimum: 0,
          ),
          // TODO:develop
          // DigitTextFormField(
          //   formControlName: 'quantityWasted.${widget.cardIndex}',
          //   keyboardType: const TextInputType.numberWithOptions(decimal: true),
          //   inputFormatters: [
          //     FilteringTextInputFormatter.allow(
          //       RegExp('[0-9]'),
          //     ),
          //     LengthLimitingTextInputFormatter(3),
          //   ],
          //   label: localizations.translate(
          //     i18.deliverIntervention.quantityWastedLabel,
          //   ),
          //   validationMessages: {
          //     "required": (control) {
          //       return localizations.translate(
          //         i18.common.corecommonRequired,
          //       );
          //     },
          //   },
          // ),
//old
          DigitRadioButtonList<KeyValue>(
            
            labelStyle: DigitTheme.instance.mobileTheme.textTheme.bodyLarge,
            labelText: localizations.translate(
              i18.deliverIntervention.wasDrugWasted,
            ),
            isEnabled: true,
            formControlName: 'quantityWastedRadio.${widget.cardIndex}',
            valueMapper: (value) {
              return localizations.translate(value.label);
            },
            options: Constants.yesNo,
            errorMessage: '',
            onValueChange: (value) {
            //  print((widget.form.control("quantityWastedRadio.${widget.cardIndex}").value as KeyValue).key);
              // widget.form
              //     .control(
              //       'quantityWastedRadio.${widget.cardIndex}',
              //     )
              //     .value = value;

              setState(() {
                show = value.key;
              });
            },
          ),
          // RadioGroup<KeyValue>.builder(
          //   groupValue:  KeyValue('CORE_COMMON_YES', true),
          //   onChanged: (changedValue) {
          //     setState(() {
          //       widget.form
          //           .control("quantityWastedRadio.${widget.cardIndex}")
          //           .value = changedValue!;
          //       show = changedValue.key;
          //     });
          //   },
          //   items: Constants.yesNo,
          //   itemBuilder: (item) => RadioButtonBuilder(
          //     localizations.translate(item.label),
          //   ),
          // ),

          show
              ? DigitIntegerFormPicker(
                  minimum: 0,
                  decimal: true,
                  form: widget.form,
                  formControlName: 'quantityWasted.${widget.cardIndex}',
                  label: localizations.translate(
                    i18.deliverIntervention.enterDrugQTYWasted,
                  ),
                  incrementer: true,
                )
              : const SizedBox.shrink(),

          // Solution customization
          // SizedBox(
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: (widget.cardIndex == widget.totalItems - 1 &&
          //             widget.totalItems > 1)
          //         ? DigitIconButton(
          //             onPressed: () async {
          //               final submit = await DigitDialog.show<bool>(
          //                 context,
          //                 options: DigitDialogOptions(
          //                   titleText: localizations.translate(
          //                     i18.deliverIntervention
          //                         .resourceDeleteBeneficiaryDialogTitle,
          //                   ),
          //                   primaryAction: DigitDialogActions(
          //                     label: localizations.translate(
          //                       i18.deliverIntervention
          //                           .resourceDeleteBeneficiaryPrimaryActionLabel,
          //                     ),
          //                     action: (context) {
          //                       Navigator.of(
          //                         context,
          //                         rootNavigator: true,
          //                       ).pop(true);
          //                     },
          //                   ),
          //                   secondaryAction: DigitDialogActions(
          //                     label: localizations.translate(
          //                       i18.common.coreCommonCancel,
          //                     ),
          //                     action: (context) => Navigator.of(
          //                       context,
          //                       rootNavigator: true,
          //                     ).pop(false),
          //                   ),
          //                 ),
          //               );
          //               if (submit == true) {
          //                 widget.onDelete(widget.cardIndex);
          //               }
          //             },
          //             iconText: localizations.translate(
          //               i18.deliverIntervention.resourceDeleteBeneficiary,
          //             ),
          //             icon: Icons.delete,
          //           )
          //         : const Offstage(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
