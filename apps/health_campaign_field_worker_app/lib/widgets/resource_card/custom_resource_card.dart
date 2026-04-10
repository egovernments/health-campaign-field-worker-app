import 'dart:async';

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
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
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

  bool _toastShown = false;

  // Memoized form and subscription management
  FormGroup? _memoizedForm;
  List<DeliveryProductVariant>? _lastProductVariants;
  final List<StreamSubscription> _formSubscriptions = [];

  // Validation messages from schema
  String? _requiredValidationMessage;
  String? _minValidationMessage;
  String? _duplicateValidationMessage;
  dynamic _validationMessages;

  @override
  void dispose() {
    // Cancel all form subscriptions
    for (final subscription in _formSubscriptions) {
      subscription.cancel();
    }
    _formSubscriptions.clear();
    // Dismiss any active toasts when widget is disposed (e.g., page navigation)
    ToastManager().dismissAll(showAnim: false);
    super.dispose();
  }

  /// Validates the resource card data and shows toast messages for errors.
  void _validateAndShowToast(FormGroup form, BuildContext context) {
    final resourceList = (form.control(_resourceDeliveredKey)
            as FormArray<DeliveryProductVariant?>)
        .value;
    final quantityList =
        (form.control(_quantityDistributedKey) as FormArray<int?>).value;

    String? errorMessage;

    // Case 1: Check if at least one product is selected
    final hasAnyProductSelected =
        resourceList?.any((resource) => resource != null) ?? false;

    if (!hasAnyProductSelected) {
      // No product selected at all - show resource error
      errorMessage = _requiredValidationMessage ??
          localizations.translate('CORE_COMMON_REQUIRED_RESOURCE');
    } else {
      // Check each row for specific errors
      for (var i = 0; i < (resourceList ?? []).length; i++) {
        final resource = resourceList?[i];
        final quantity = quantityList?[i];

        // Case 1: Resource not selected - show resource error
        if (resource == null) {
          errorMessage = _requiredValidationMessage ??
              localizations.translate('CORE_COMMON_REQUIRED_RESOURCE');
          break;
        }

        // Case 2: Quantity is 0 or null - show quantity error
        if (quantity == null || quantity <= 0) {
          errorMessage = _minValidationMessage ??
              localizations.translate('CORE_COMMON_MIN_ERROR');
          break;
        }
      }

      // Case 3: Check for duplicate resource selection
      if (errorMessage == null) {
        final selectedProductIds = resourceList
            ?.where((r) => r != null)
            .map((r) => r!.productVariantId)
            .toList();
        if (selectedProductIds != null) {
          final uniqueIds = selectedProductIds.toSet();
          if (uniqueIds.length != selectedProductIds.length) {
            errorMessage = _duplicateValidationMessage ??
                localizations.translate('CORE_COMMON_DUPLICATE_RESOURCE_ERROR');
          }
        }
      }
    }

    if (errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Only show toast if widget is still mounted (not navigated away)
        if (mounted) {
          Toast.showToast(
            position: ToastPosition.aboveOneButtonFooter,
            context,
            message: errorMessage!,
            type: ToastType.error,
          );
        }
      });
    }
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
              if (validation.type == "duplicate" ||
                  validation.type == "unique") {
                _duplicateValidationMessage = validation.message != null
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
              form: () => _getOrCreateForm(context, productVariants),
              builder: (context, form, child) {
                // Attach listeners when form changes
                _attachListenersIfNeeded(form, field);

                // Show toast when field is invalid and touched (via ReactiveWrapperField)
                if (field.control.invalid &&
                    field.control.touched &&
                    !_toastShown) {
                  _toastShown = true;
                  _validateAndShowToast(form, context);
                  // Reset flag after delay to allow showing toast on next submission
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (mounted) {
                      _toastShown = false;
                    }
                  });
                }

                // Reset toast flag and dismiss any active toast when field becomes valid
                if (!field.control.invalid) {
                  _toastShown = false;
                  ToastManager().dismissAll(showAnim: false);
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (labelFromSchema != null &&
                        localizations
                            .translate(labelFromSchema!)
                            .isNotEmpty) ...[
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
                          onProductChanged: (index, product) {
                            setState(() {
                              _maxQuantities[index] = product.quantity;
                            });
                          },
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

  /// Gets the memoized form or creates a new one if product variants changed
  FormGroup _getOrCreateForm(
    BuildContext context,
    List<DeliveryProductVariant>? productVariants,
  ) {
    // Check if we need to create a new form (first time or variants changed)
    final variantsChanged = !_listEquals(_lastProductVariants, productVariants);

    if (_memoizedForm == null || variantsChanged) {
      // Cancel existing subscriptions before creating new form
      for (final subscription in _formSubscriptions) {
        subscription.cancel();
      }
      _formSubscriptions.clear();

      _lastProductVariants =
          productVariants != null ? List.from(productVariants) : null;
      _memoizedForm = _buildForm(context, productVariants);
    }

    return _memoizedForm!;
  }

  /// Compare two lists of DeliveryProductVariant by productVariantId
  bool _listEquals(
    List<DeliveryProductVariant>? a,
    List<DeliveryProductVariant>? b,
  ) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].productVariantId != b[i].productVariantId) return false;
    }
    return true;
  }

  /// Attaches listeners to form controls, managing subscriptions properly
  void _attachListenersIfNeeded(FormGroup form, ReactiveFormFieldState field) {
    // If this is a different form instance, cancel old subscriptions and reattach
    if (_memoizedForm != form) {
      // This shouldn't happen with memoization, but handle it safely
      return;
    }

    // If subscriptions already exist for this form, don't re-attach
    if (_formSubscriptions.isNotEmpty) return;

    // Initial update
    _updateResourceCards(form);

    // Attach listeners and store subscriptions
    _formSubscriptions.add(
      form.control(_resourceDeliveredKey).valueChanges.listen((_) {
        _toastShown = false;
        field.control.markAsUntouched();
        _updateResourceCards(form);
      }),
    );

    _formSubscriptions.add(
      form.control(_quantityDistributedKey).valueChanges.listen((_) {
        _toastShown = false;
        field.control.markAsUntouched();
        _updateResourceCards(form);
      }),
    );
  }

  void addController(FormGroup form) {
    (form.control(_resourceDeliveredKey) as FormArray).add(
      FormControl<DeliveryProductVariant>(),
    );
    (form.control(_quantityDistributedKey) as FormArray).add(
      FormControl<int>(value: 0, validators: [Validators.min(1)]),
    );
  }

  FormGroup _buildForm(
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
      (index) => (productVariants != null && index < productVariants.length)
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
            value: (productVariants != null && index < productVariants.length)
                ? productVariants[index].quantity
                : 0,
            validators: [Validators.min(1)],
          );
        }).toList(),
      ),
    });
  }

  getProductVariants() {
    final projectType = context.selectedProjectType;
    final cycles = projectType?.cycles;

    // Get ALL product variants from project config without eligibility filtering
    final productVariants = cycles
            ?.expand((cycle) => cycle.deliveries ?? <ProjectCycleDelivery>[])
            .expand((delivery) =>
                delivery.doseCriteria ?? <DeliveryDoseCriteria>[])
            .expand((dose) =>
                dose.productVariants ?? <DeliveryProductVariant>[])
            .toList() ??
        [];

    return productVariants;
  }
}
