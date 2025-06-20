import 'package:digit_data_model/blocs/product_variant/product_variant.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/app_localization.dart';
import 'package:forms_engine/helper/validation_message_helper.dart';
import 'package:forms_engine/widgets/json_schema_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/widgets/component_wrapper/product_variant_bloc_wrapper.dart';

class JsonSchemaResourceCardBuilder extends JsonSchemaBuilder<String> {
  final int cardIndex;

  const JsonSchemaResourceCardBuilder(
    this.cardIndex, {
    required super.formControlName,
    required super.form,
    super.label,
    super.key,
    super.value,
    super.helpText,
    super.validations,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);
    return ProductVariantBlocWrapper(
      child: DigitCard(cardType: CardType.secondary, children: [
        BlocBuilder<ProductVariantBloc, ProductVariantState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Offstage(),
              fetched: (productVariants) {
                return SelectionCard<ProductVariantModel>(
                  width: MediaQuery.of(context).size.width * .8,
                  showParentContainer: true,
                  options: productVariants,
                  onSelectionChanged: (selectedOptions) {
                    if (selectedOptions.isNotEmpty) {
                      var selectedOption = selectedOptions.first;
                      form.control(formControlName).value = selectedOption;
                    } else {
                      form.control(formControlName).value = null;
                    }
                  },
                  initialSelection: form.control(formControlName).value != null
                      ? [form.control(formControlName).value]
                      : [],
                  valueMapper: (value) {
                    return value.sku ?? value.id;
                  },
                  allowMultipleSelection: false,
                );
              },
            );
          },
        ),

        // ReactiveWrapperField(
        //   formControlName: 'quantityDistributed.${cardIndex}',
        //   builder: (field) => LabeledField(
        //     label: label,
        //     child: DigitNumericFormInput(
        //       minValue: 1,
        //       step: 1,
        //       initialValue: "0",
        //       onChange: (value) {
        //         form.control('quantityDistributed.${cardIndex}').value =
        //             int.parse(value);
        //       },
        //     ),
        //   ),
        // ),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child:
        //       (widget.cardIndex == widget.totalItems - 1 && widget.totalItems > 1)
        //           ? DigitButton(
        //               onPressed: () async {
        //                 final submit = await showDialog<bool>(
        //                   context: context,
        //                   builder: (ctx) => Popup(
        //                     title: localizations.translate(
        //                       i18.deliverIntervention
        //                           .resourceDeleteBeneficiaryDialogTitle,
        //                     ),
        //                     actions: [
        //                       DigitButton(
        //                           label: localizations.translate(
        //                             i18.deliverIntervention
        //                                 .resourceDeleteBeneficiaryPrimaryActionLabel,
        //                           ),
        //                           onPressed: () {
        //                             Navigator.of(
        //                               context,
        //                               rootNavigator: true,
        //                             ).pop(true);
        //                           },
        //                           type: DigitButtonType.primary,
        //                           size: DigitButtonSize.large),
        //                       DigitButton(
        //                           label: localizations.translate(
        //                             i18.common.coreCommonCancel,
        //                           ),
        //                           onPressed: () => Navigator.of(
        //                                 context,
        //                                 rootNavigator: true,
        //                               ).pop(false),
        //                           type: DigitButtonType.secondary,
        //                           size: DigitButtonSize.large),
        //                     ],
        //                   ),
        //                 );
        //                 if (submit == true) {
        //                   widget.onDelete(widget.cardIndex);
        //                 }
        //               },
        //               label: localizations.translate(
        //                 i18.deliverIntervention.resourceDeleteBeneficiary,
        //               ),
        //               prefixIcon: Icons.delete,
        //               type: DigitButtonType.tertiary,
        //               size: DigitButtonSize.medium,
        //             )
        //           : const Offstage(),
        // ),
      ]),
    );
  }
}
