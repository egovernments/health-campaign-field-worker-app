import 'package:collection/collection.dart';
import 'package:digit_data_model/blocs/product_variant/product_variant.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/helper/validation_message_helper.dart';
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
  final String pageSchema;

  const ResourceCard(
      {super.key,
      super.appLocalizations,
      this.label,
      this.readOnly = false,
      this.stateData,
      required this.pageSchema});

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends LocalizedState<ResourceCard> {
  final List<ProductVariantModel?> selectedVariants = [];
  final List<int?> selectedQuantities = [];
  final List _controllers = [];

  static const _resourceDeliveredKey = 'resourceDelivered';
  static const _quantityDistributedKey = 'quantityDistributed';
  static const _resourceCardKey = 'resourceCard';
  late List<int?> _maxQuantities;

  bool _listenersAdded = false;
  bool _toastShown = false;

  // Validation messages from schema
  String? _requiredValidationMessage;
  String? _minValidationMessage;
  dynamic _validationMessages;

  /// Validates the resource card data and shows toast messages for errors.
  /// Returns true if valid, false otherwise.
  void _validateAndShowToast(FormGroup form, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast.showToast(
        position: ToastPosition.aboveOneButtonFooter,
        context,
        message: _minValidationMessage ??
            localizations.translate('CORE_COMMON_RESOURCE_SELECTION_ERROR'),
        type: ToastType.error,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    final pages =
        context.read<FormsBloc>().state.cachedSchemas[widget.pageSchema]?.pages;

    bool isReadOnlyFromSchema = false;
    String? labelFromSchema;

    void walk(Map<String, PropertySchema> node, List<String> pathSoFar) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        final currentPath = [...pathSoFar, key];

        if (key == _resourceCardKey) {
          // Found it; pull values
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;

          // Extract validation messages from schema
          if (schema.validations != null) {
            _validationMessages =
                buildValidationMessages(schema.validations, localizations);
            for (final validation in schema.validations!) {
              if (validation.type == "required" && validation.value == true) {
                _requiredValidationMessage = validation.message != null
                    ? localizations.translate(validation.message!)
                    : null;
              }
              if (validation.type == "min") {
                _minValidationMessage = validation.message != null
                    ? localizations.translate(validation.message!)
                    : null;
              }
            }
          }
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

    return ReactiveWrapperField<dynamic>(
      formControlName: _resourceCardKey,
      validationMessages: _validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
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
                    _toastShown = false; // Reset toast flag on data change
                    _updateResourceCards(form);
                  });

                  form.control(_quantityDistributedKey).valueChanges.listen((_) {
                    _toastShown = false; // Reset toast flag on data change
                    _updateResourceCards(form);
                  });
                }

                // Show toast when field is invalid and touched (via ReactiveWrapperField)
                if (field.control.invalid && field.control.touched && !_toastShown) {
                  _toastShown = true;
                    // if (mounted) {
                      _validateAndShowToast(form, context);
                    // }
                }

                // Reset toast flag when field becomes valid
                if (!field.control.invalid) {
                  _toastShown = false;
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
      },
    );
  }

  void _updateResourceCards(FormGroup form, {bool? isValid}) {
    final resourceList = (form.control(_resourceDeliveredKey)
            as FormArray<DeliveryProductVariant?>)
        .value;
    final quantityList =
        (form.control(_quantityDistributedKey) as FormArray<int?>).value;

    // Calculate validity if not explicitly provided
    final validity = isValid ?? _calculateValidity(resourceList, quantityList);

    // Only update the parent form when data is valid
    if (!validity) {
      // Clear the parent form value when invalid
      context.read<FormsBloc>().add(
            FormsEvent.updateField(
              schemaKey: widget.pageSchema,
              context: context,
              key: _resourceCardKey,
              value: null,
            ),
          );
      return;
    }

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
            schemaKey: widget.pageSchema,
            context: context,
            key: _resourceCardKey,
            value: updatedCards,
          ),
        );
  }

  /// Calculates if the resource card data is valid
  bool _calculateValidity(
    List<DeliveryProductVariant?>? resourceList,
    List<int?>? quantityList,
  ) {
    // Check if at least one product is selected
    final hasAnyProductSelected =
        resourceList?.any((resource) => resource != null) ?? false;

    if (!hasAnyProductSelected) {
      return false;
    }

    // Check if any selected product has quantity <= 0
    for (var i = 0; i < (resourceList ?? []).length; i++) {
      final resource = resourceList?[i];
      final quantity = quantityList?[i];

      if (resource == null || (quantity == null || quantity <= 0)) {
        return false;
      }
    }

    // Check for duplicate resource selection
    final selectedProductIds = resourceList
        ?.where((r) => r != null)
        .map((r) => r!.productVariantId)
        .toList();
    if (selectedProductIds != null) {
      final uniqueIds = selectedProductIds.toSet();
      if (uniqueIds.length != selectedProductIds.length) {
        return false; // Duplicate resources selected
      }
    }

    return true;
  }

  void addController(FormGroup form) {
    (form.control(_resourceDeliveredKey) as FormArray).add(
      FormControl<DeliveryProductVariant>(),
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
          (index) => (productVariants != null &&
          index < productVariants.length)
          ? productVariants[index].quantity
          : null,
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
          final index = _controllers.indexOf(e);
          return FormControl<int>(
            value: (productVariants != null &&
                index < productVariants.length)
                ? productVariants[index].quantity
                : 0,
            validators: [Validators.min(1)],
          );
        }).toList(),
      ),
    });
  }

  getProductVariants() {
    final data = widget.stateData;
    final projectType = context.selectedProjectType;
    final cycles = projectType?.cycles;
    final eligible =
        data?.stateWrapper?.first?['eligibleProductVariants'] as List?;
    final productVariants = (eligible != null && eligible.isNotEmpty)
        ? eligible
        .whereType<Map<String, dynamic>>() // safety
        .expand((item) =>
    (item['ProductVariants'] as List?)
        ?.whereType<Map<String, dynamic>>()
        .map((e) => DeliveryProductVariantMapper.fromMap(e)) ??
        const <DeliveryProductVariant>[])
        .toList()
        : (data?.stateWrapper?.first?['ProductVariants'] as List?)
                ?.map((e) => DeliveryProductVariantMapper.fromMap(
                    e as Map<String, dynamic>))
                .toList() ??
            [];

    return productVariants;
  }
}
