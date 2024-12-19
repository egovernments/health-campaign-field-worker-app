import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:digit_data_model/data_model.dart';

import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18_local;
import '../custom_digit_integer_form_picker.dart';
import '../custom_digit_reactive_dropdown.dart';

class CustomResourceBeneficiaryCard extends LocalizedStatefulWidget {
  final void Function(int) onDelete;
  final int cardIndex;
  final FormGroup form;
  final int totalItems;
  final bool isAdministered;

  const CustomResourceBeneficiaryCard({
    super.key,
    super.appLocalizations,
    required this.onDelete,
    required this.cardIndex,
    required this.form,
    required this.totalItems,
    this.isAdministered = false,
  });

  @override
  State<CustomResourceBeneficiaryCard> createState() =>
      CustomResourceBeneficiaryCardState();
}

class CustomResourceBeneficiaryCardState
    extends LocalizedState<CustomResourceBeneficiaryCard> {
  bool doseAdministered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  return CustomDigitReactiveDropdown(
                    label: '${localizations.translate(
                      i18.deliverIntervention.deliverInterventionResourceLabel,
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
          CustomDigitIntegerFormPicker(
            incrementer: true,
            readOnly: true,
            formControlName: 'quantityDistributed.${widget.cardIndex}',
            form: widget.form,
            label: localizations.translate(
              i18.deliverIntervention.quantityDistributedLabel,
            ),
            minimum: 1,
            buttonWidth: 50,
          ),
          SizedBox(
            child: Align(
              alignment: Alignment.centerLeft,
              child: (widget.cardIndex == widget.totalItems - 1 &&
                      widget.totalItems > 1)
                  ? DigitIconButton(
                      onPressed: () async {
                        final submit = await DigitDialog.show<bool>(
                          context,
                          options: DigitDialogOptions(
                            titleText: localizations.translate(
                              i18.deliverIntervention
                                  .resourceDeleteBeneficiaryDialogTitle,
                            ),
                            primaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.deliverIntervention
                                    .resourceDeleteBeneficiaryPrimaryActionLabel,
                              ),
                              action: (context) {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(true);
                              },
                            ),
                            secondaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.common.coreCommonCancel,
                              ),
                              action: (context) => Navigator.of(
                                context,
                                rootNavigator: true,
                              ).pop(false),
                            ),
                          ),
                        );
                        if (submit == true) {
                          widget.onDelete(widget.cardIndex);
                        }
                      },
                      iconText: localizations.translate(
                        i18.deliverIntervention.resourceDeleteBeneficiary,
                      ),
                      icon: Icons.delete,
                    )
                  : const Offstage(),
            ),
          ),
        ],
      ),
    );
  }
}
