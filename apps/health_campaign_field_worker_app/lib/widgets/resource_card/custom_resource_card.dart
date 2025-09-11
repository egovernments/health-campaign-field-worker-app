import 'package:collection/collection.dart';
import 'package:digit_data_model/blocs/product_variant/product_variant.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/utils.dart';
import '../localized.dart';
import 'resource_beneficiary_card.dart';

class ResourceCard extends LocalizedStatefulWidget {
  final String? label;
  final bool readOnly;
  final dynamic stateData;

  const ResourceCard({
    super.key,
    super.appLocalizations,
    this.label,
    this.readOnly = false,
    this.stateData,
  });

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends LocalizedState<ResourceCard> {
  final List<ProductVariantModel?> selectedVariants = [];
  final List<int?> selectedQuantities = [];
  final List _controllers = [];

  static const _resourceDeliveredKey = 'resourceDelivered';
  static const _quantityDistributedKey = 'quantityDistributed';
  late List<int?> _maxQuantities;

  bool _listenersAdded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    final pages =
        context.read<FormsBloc>().state.cachedSchemas['DELIVERY']?.pages;

    bool isReadOnlyFromSchema = false;
    String? labelFromSchema;

    void walk(Map<String, PropertySchema> node, List<String> pathSoFar) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        final currentPath = [...pathSoFar, key];

        if (key == 'resourceCard') {
          // Found it; pull values
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
          return; // stop once found
        }

        if (schema.properties != null && schema.properties!.isNotEmpty) {
          walk(schema.properties!, currentPath);
          if (labelFromSchema != null || isReadOnlyFromSchema)
            return; // early exit
        }
      }
    }

// Kick off the recursive search
    walk(pages!, []);

    return BlocBuilder<ProductVariantBloc, ProductVariantState>(
      builder: (context, productState) {
        final productVariants = getProductVariants();

        return ReactiveFormBuilder(
          form: () => buildForm(context, productVariants),
          builder: (context, form, child) {
            // Add listeners just once
            if (!_listenersAdded) {
              _listenersAdded = true;

              _updateResourceCards(form); // Initial update

              form.control(_resourceDeliveredKey).valueChanges.listen((_) {
                _updateResourceCards(form);
              });

              form.control(_quantityDistributedKey).valueChanges.listen((_) {
                _updateResourceCards(form);
              });
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (labelFromSchema != null &&
                    localizations.translate(labelFromSchema!).isNotEmpty) ...[
                  Text(
                    localizations.translate(labelFromSchema!),
                    style: textTheme.bodyL.copyWith(
                      color: theme.colorTheme.text.primary,
                    ),
                  ),
                  const SizedBox(
                    height: spacer1,
                  ),
                ],
                Column(
                  children: List.generate(_controllers.length * 2 - 1, (i) {
                    if (i.isOdd) {
                      return const SizedBox(height: 16); // Middle spacing
                    }
                    final index = i ~/ 2;
                    final controller = _controllers[index];
                    return ResourceBeneficiaryCard(
                      maxQuantity: _maxQuantities[index],
                      readOnly: isReadOnlyFromSchema,
                      form: form,
                      cardIndex: index,
                      totalItems: _controllers.length,
                      variants: productVariants,
                      onDelete: (index) {
                        (form.control(_resourceDeliveredKey) as FormArray)
                            .removeAt(index);
                        (form.control(_quantityDistributedKey) as FormArray)
                            .removeAt(index);
                        _controllers.removeAt(index);
                        setState(() {});
                      },
                    );
                  }),
                ),
                const SizedBox(
                  height: spacer4,
                ),
                Center(
                  child: DigitButton(
                    label: localizations.translate(
                      'Add items',
                    ),
                    type: DigitButtonType.tertiary,
                    size: DigitButtonSize.medium,
                    isDisabled:
                        ((form.control(_resourceDeliveredKey) as FormArray)
                                        .value ??
                                    [])
                                .length >=
                            (productVariants ?? []).length,
                    onPressed: () {
                      addController(form);
                      setState(() {
                        _controllers.add(_controllers.length);
                      });
                    },
                    prefixIcon: Icons.add_circle,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _updateResourceCards(FormGroup form) {
    final resourceList = (form.control(_resourceDeliveredKey)
            as FormArray<DeliveryProductVariant?>)
        .value;
    final quantityList =
        (form.control(_quantityDistributedKey) as FormArray<int?>).value;

    final updatedCards = <Map<String, dynamic>>[];

    for (var i = 0; i < (resourceList ?? []).length; i++) {
      final resource = resourceList?[i];
      final quantity = quantityList?[i];

      if (resource != null && quantity != null && quantity > 0) {
        updatedCards.add({
          'resourceDelivered': {
            'name': resource.name,
            'productId': resource.productVariantId,
          },
          'quantityDistributed': quantity
        });
      }
    }

    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: 'DELIVERY',
            key: 'resourceCard',
            value: updatedCards,
          ),
        );
  }

  void addController(FormGroup form) {
    (form.control(_resourceDeliveredKey) as FormArray).add(
      FormControl<ProductVariantModel>(),
    );
    (form.control(_quantityDistributedKey) as FormArray).add(
      FormControl<int>(value: 0, validators: [Validators.min(1)]),
    );
  }

  FormGroup buildForm(
    BuildContext context,
    List<DeliveryProductVariant>? productVariants,
  ) {
    _controllers.clear();
    final variants = productVariants;

    final int count =
        context.selectedProject.additionalDetails?.projectType?.cycles == null
            ? 1
            : productVariants?.length ?? 0;

    _controllers.addAll(List.generate(count, (index) => index));

    _maxQuantities = List<int?>.generate(
      _controllers.length,
      (_) => productVariants?.first.quantity,
    );

    return fb.group(<String, Object>{
      _resourceDeliveredKey: FormArray<DeliveryProductVariant>(
        _controllers.map((e) {
          return FormControl<DeliveryProductVariant>(
              value: variants != null && variants.length < _controllers.length
                  ? variants.last
                  : (variants != null &&
                          _controllers.indexOf(e) < variants.length
                      ? variants.firstWhereOrNull(
                          (element) =>
                              element.productVariantId ==
                              productVariants
                                  ?.elementAt(_controllers.indexOf(e))
                                  .productVariantId,
                        )
                      : null));
        }).toList(),
      ),
      _quantityDistributedKey: FormArray<int>(
        _controllers.map((e) {
          return FormControl<int>(
            value: int.tryParse('0'),
            validators: [Validators.min(1)],
          );
        }).toList(),
      ),
    });
  }

  getProductVariants() {
    final projectType = context.selectedProjectType;
    final cycles = projectType?.cycles;

    if (cycles != null) {
      ProjectCycle? currentCycle = cycles
          .where((c) =>
              DateTime.now().millisecondsSinceEpoch <= c.endDate &&
              DateTime.now().millisecondsSinceEpoch >= c.startDate)
          .firstOrNull;

      final currentRunningCycle = (cycles.firstWhereOrNull(
            (e) =>
                (e.startDate) < DateTime.now().millisecondsSinceEpoch &&
                (e.endDate) > DateTime.now().millisecondsSinceEpoch,
          ))?.id ??
          0;

      // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
      final currentDose = 1;

      final items = context.selectedProjectType?.cycles
          ?.firstWhere((c) => c.id == currentRunningCycle)
          .deliveries
          ?.firstWhere((d) => d.id == currentDose);
//// TODO: NEED TO ADD DOSE CRITERIA CONDITION LATER
      return items?.doseCriteria?.first.productVariants;
    }
  }
}
