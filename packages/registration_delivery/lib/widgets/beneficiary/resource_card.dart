import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/blocs/product_variant/product_variant.dart';
import 'package:digit_data_model/models/entities/beneficiary_type.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_stepper.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/atoms/reactive_fields.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/beneficiary/resource_beneficiary_card.dart';
import 'package:registration_delivery/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import 'package:registration_delivery/widgets/localized.dart';

import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;

class ResourceCard extends LocalizedStatefulWidget {
  const ResourceCard({
    super.key,
    super.appLocalizations,
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
  static const _deliveryCommentKey = 'deliveryComment';
  static const _doseAdministrationKey = 'doseAdministered';
  static const _dateOfAdministrationKey = 'dateOfAdministration';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return ProductVariantBlocWrapper(
      child: BlocBuilder<RegistrationWrapperBloc, RegistrationWrapperState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return BlocBuilder<ProductVariantBloc, ProductVariantState>(
            builder: (context, productState) {
              final productVariants =
                  getProductVariants(state)['criteria']?.productVariants;

              return productState.maybeWhen(
                orElse: () => const Offstage(),
                fetched: (productVariantsValue) {
                  final variant = productState.whenOrNull(
                    fetched: (productVariants) => productVariants,
                  );

                  return ReactiveFormBuilder(
                    form: () => buildForm(context, productVariants, variant),
                    builder: (context, form, child) {
                      return Column(
                        children: [
                          Text(
                            localizations.translate(
                              i18.deliverIntervention
                                  .deliverInterventionResourceLabel,
                            ),
                            style: textTheme.headingXl.copyWith(
                              color: theme.colorTheme.primary.primary2,
                            ),
                          ),
                          ..._controllers.map((e) => ResourceBeneficiaryCard(
                                form: form,
                                cardIndex: _controllers.indexOf(e),
                                totalItems: _controllers.length,
                                onDelete: (index) {
                                  (form.control(_resourceDeliveredKey)
                                          as FormArray)
                                      .removeAt(index);
                                  (form.control(_quantityDistributedKey)
                                          as FormArray)
                                      .removeAt(index);
                                  _controllers.removeAt(index);
                                  setState(() {});
                                },
                              )),
                          Center(
                            child: DigitButton(
                              label: localizations.translate(
                                i18.deliverIntervention.resourceAddBeneficiary,
                              ),
                              type: DigitButtonType.tertiary,
                              size: DigitButtonSize.medium,
                              isDisabled: ((form.control(_resourceDeliveredKey)
                                                  as FormArray)
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
        },
      ),
    );
  }

  addController(FormGroup form) {
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
    List<ProductVariantModel>? variants,
  ) {
    final bloc = context.read<RegistrationWrapperBloc>().state;

    _controllers.clear();

    final int count = RegistrationDeliverySingleton()
                .selectedProject
                ?.additionalDetails
                ?.projectType
                ?.cycles ==
            null
        ? 1
        : getProductVariants(bloc)?['criteria']?.productVariants.length ?? 0;

    _controllers.addAll(List.generate(count, (index) => index));

    return fb.group(<String, Object>{
      _resourceDeliveredKey: FormArray<ProductVariantModel>(
        _controllers.map((e) {
          return FormControl<ProductVariantModel>(
            value: variants != null && variants.length < _controllers.length
                ? variants.last
                : (variants != null && _controllers.indexOf(e) < variants.length
                    ? variants.firstWhereOrNull(
                        (element) =>
                            element.id ==
                            productVariants
                                ?.elementAt(_controllers.indexOf(e))
                                .productVariantId,
                      )
                    : null),
          );
        }).toList(),
      ),
      _quantityDistributedKey: FormArray<int>(
        _controllers.map((e) {
          return FormControl<int>(
            value: RegistrationDeliverySingleton().beneficiaryType !=
                    BeneficiaryType.individual
                ? int.tryParse('0')
                : 0,
            validators: [Validators.min(1)],
          );
        }).toList(),
      ),
    });
  }

  getProductVariants(RegistrationWrapperState state) {
    return fetchProductVariant(
      RegistrationDeliverySingleton()
          .selectedProject
          ?.additionalDetails
          ?.projectType
          ?.cycles?[0]
          .deliveries?[0],
      state.selectedIndividual,
      state.householdMembers.first.household,
      context: context,
    );
  }
}
