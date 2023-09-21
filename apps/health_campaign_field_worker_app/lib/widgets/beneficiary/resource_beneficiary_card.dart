import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/entities/product_variant.dart';
import '../../models/project_type/project_type_model.dart';
import '../localized.dart';
import '../../utils/i18_key_constants.dart' as i18;

class ResourceBeneficiaryCard extends LocalizedStatefulWidget {
  final void Function(int) onDelete;
  final int cardIndex;
  final FormGroup form;

  const ResourceBeneficiaryCard({
    Key? key,
    super.appLocalizations,
    required this.onDelete,
    required this.cardIndex,
    required this.form,
  }) : super(key: key);

  @override
  State<ResourceBeneficiaryCard> createState() =>
      _ResourceBeneficiaryCardState();
}

class _ResourceBeneficiaryCardState
    extends LocalizedState<ResourceBeneficiaryCard> {
  @override
  Widget build(BuildContext context) {
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
                  return DigitReactiveDropdown(
                    label: localizations.translate(
                      i18.deliverIntervention.resourceDeliveredLabel,
                    ),
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
          DigitIntegerFormPicker(
            incrementer: true,
            formControlName: 'quantityDistributed.${widget.cardIndex}',
            form: widget.form,
            label: localizations.translate(
              i18.deliverIntervention.quantityDistributedLabel,
            ),
            minimum: 1,
          ),
          BlocBuilder<AppInitializationBloc, AppInitializationState>(
            builder: (context, state) {
              if (state is! AppInitialized) {
                return const Offstage();
              }

              final deliveryCommentOptions =
                  state.appConfiguration.deliveryCommentOptions ??
                      <DeliveryCommentOptions>[];

              return DigitReactiveDropdown<String>(
                label: localizations.translate(
                  i18.deliverIntervention.deliveryCommentLabel,
                ),
                valueMapper: (value) => value,
                initialValue: deliveryCommentOptions.firstOrNull?.name,
                menuItems: deliveryCommentOptions.map((e) {
                  return localizations.translate(e.name);
                }).toList(),
                formControlName: 'deliveryComment.${widget.cardIndex}',
              );
            },
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
                          widget.onDelete(widget.cardIndex);
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
}
