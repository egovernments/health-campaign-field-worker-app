import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/entities/product_variant.dart';
import '../localized.dart';
import '../../utils/i18_key_constants.dart' as i18;

class ResourceBeneficiaryCard extends LocalizedStatefulWidget {
  final VoidCallback? onDelete;
  final int? cardIndex;

  const ResourceBeneficiaryCard({
    Key? key,
    super.appLocalizations,
    this.onDelete,
    this.cardIndex,
  }) : super(key: key);

  @override
  State<ResourceBeneficiaryCard> createState() =>
      _ResourceBeneficiaryCardState();
}

class _ResourceBeneficiaryCardState
    extends LocalizedState<ResourceBeneficiaryCard> {
  static const _resourceDeliveredKey = 'resourceDelivered';
  static const _quantityDistributedKey = 'quantityDistributed';

  @override
  Widget build(BuildContext context) {
    final form = buildForm();

    return Container(
      decoration: BoxDecoration(
        color: DigitTheme.instance.colorScheme.background,
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
                  const productVariantId = "";

                  final variant = productState.whenOrNull(
                    fetched: (productVariants) {
                      return productVariants.firstWhereOrNull(
                        (element) => element.id == productVariantId,
                      );
                    },
                  );
                  form.control(_resourceDeliveredKey).value = variant;

                  return DigitReactiveDropdown<ProductVariantModel>(
                    label: localizations.translate(
                      i18.deliverIntervention.resourceDeliveredLabel,
                    ),
                    menuItems: productVariants,
                    formControlName: _resourceDeliveredKey,
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
          DigitIntegerFormPicker(
            incrementer: true,
            formControlName: _quantityDistributedKey,
            form: form,
            label: localizations.translate(
              i18.deliverIntervention.quantityDistributedLabel,
            ),
          ),
          SizedBox(
            child: Align(
              alignment: Alignment.centerLeft,
              child: widget.cardIndex == 0
                  ? const Offstage()
                  : DigitIconButton(
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
                          widget.onDelete?.call();
                        }
                      },
                      iconText: localizations.translate(
                        i18.deliverIntervention.resourceDeleteBeneficiary,
                      ),
                      icon: Icons.delete,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _resourceDeliveredKey: FormControl<String>(
        validators: [],
      ),
      _quantityDistributedKey: FormControl<int>(
        value: 2,
        validators: [Validators.required],
      ),
    });
  }
}
