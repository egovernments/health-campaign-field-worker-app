import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_dob_picker.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';
import 'package:registration_delivery/widgets/component_wrapper/product_variant_bloc_wrapper.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class IndividualDetailsPage extends LocalizedStatefulWidget {
  final bool isHeadOfHousehold;
  final bool isChild;
  final String? parentClientReferenceId;

  const IndividualDetailsPage({
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
    this.isChild = false,
    this.parentClientReferenceId,
  });

  @override
  State<IndividualDetailsPage> createState() => IndividualDetailsPageState();
}

class IndividualDetailsPageState extends LocalizedState<IndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _idTypeKey = 'idType';
  static const _idNumberKey = 'idNumber';
  static const _dobKey = 'dob';
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';
  static const _isPregnantKey = 'isPregnant';
  static const _ttVaccinesTakenKey = 'ttVaccinesTaken';
  static const _noOfPregnantMonthsKey = 'noOfMonthsPregnant';
  static const _noOfTimesVisitedHFKey = 'noOfTimesVisitedHF';
  static const _noOfChildrenLessThan5Key = 'noOfChildrenLessThan5';
  static const _isVaccinationConditionKey = 'isVaccinationCondition';
  static const _antigensKey = 'antigens';

  bool isDuplicateTag = false;
  static const maxLength = 200;
  final clickedStatus = ValueNotifier<bool>(false);
  DateTime now = DateTime.now();

  @override
  void initState() {
    RegistrationDeliverySingleton().idTypeOptions!.add(IdentifierTypes
        .uniqueBeneficiaryID.name
        .toString()); // TODO: Remove this once it is added in MDMS
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);
    DateTime before150Years = DateTime(now.year - 150, now.month, now.day);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child)  {
          return BlocConsumer<
            BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
          listener: (context, state) {
            state.mapOrNull(
              persisted: (value) async {
                if (value.navigateToRoot) {
                  final overviewBloc = context.read<HouseholdOverviewBloc>();

                  overviewBloc.add(
                    HouseholdOverviewReloadEvent(
                      projectId:
                          RegistrationDeliverySingleton().projectId.toString(),
                      projectBeneficiaryType:
                          RegistrationDeliverySingleton().beneficiaryType ??
                              BeneficiaryType.household,
                    ),
                  );

                  await overviewBloc.stream.firstWhere((element) =>
                      element.loading == false &&
                      element.householdMemberWrapper.household != null);
                  HouseholdMemberWrapper memberWrapper =
                      overviewBloc.state.householdMemberWrapper;
                  final route = router.parent() as StackRouter;
                  route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
                  route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
                }
              },
            );
          },
          builder: (context, state) {
            return ScrollableContent(
              enableFixedDigitButton: true,
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  showcaseButton: ShowcaseButton(),
                ),
              ]),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    ValueListenableBuilder(
                      valueListenable: clickedStatus,
                      builder: (context, bool isClicked, _) {
                        return DigitButton(
                          label: state.mapOrNull(
                                editIndividual: (value) => localizations
                                    .translate(i18.common.coreCommonSave),
                              ) ??
                              localizations
                                  .translate(i18.common.coreCommonSubmit),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () async {
                            if (form.control(_dobKey).value == null) {
                              form.control(_dobKey).setErrors({'': true});
                            } else {
                              final age = DigitDateUtils.calculateAge(
                                form.control(_dobKey).value as DateTime,
                              );
                              if ((age.years == 0 && age.months == 0) ||
                                  age.years >= 150 && age.months > 0) {
                                form.control(_dobKey).setErrors({'': true});
                              }
                            }
                            if (form.control(_idTypeKey).value == null) {
                              form.control(_idTypeKey).setErrors({'': true});
                            }
                            if (form.control(_genderKey).value == null) {
                              setState(() {
                                form.control(_genderKey).setErrors({'': true});
                              });
                            }
                            final userId = RegistrationDeliverySingleton()
                                .loggedInUserUuid;
                            final projectId =
                                RegistrationDeliverySingleton().projectId;
                            form.markAllAsTouched();
                            if (!form.valid) return;
                            FocusManager.instance.primaryFocus?.unfocus();

                            state.maybeWhen(
                              orElse: () {
                                return;
                              },
                              create: (
                                addressModel,
                                householdModel,
                                individualModel,
                                projectBeneficiaryModel,
                                registrationDate,
                                searchQuery,
                                loading,
                                isHeadOfHousehold,
                              ) async {
                                final individual = _getIndividualModel(
                                  context,
                                  form: form,
                                  oldIndividual: null,
                                );

                                final boundary =
                                    RegistrationDeliverySingleton().boundary;

                                bloc.add(
                                  BeneficiaryRegistrationSaveIndividualDetailsEvent(
                                    model: individual,
                                    isHeadOfHousehold: widget.isHeadOfHousehold,
                                  ),
                                );
                                final scannerBloc =
                                    context.read<DigitScannerBloc>();
                                scannerBloc.add(
                                  const DigitScannerEvent.handleScanner(),
                                );

                                if (scannerBloc.state.duplicate) {
                                  Toast.showToast(context,
                                      message: localizations.translate(
                                        i18.deliverIntervention
                                            .resourceAlreadyScanned,
                                      ),
                                      type: ToastType.error);
                                } else {
                                  clickedStatus.value = true;
                                  final scannerBloc =
                                      context.read<DigitScannerBloc>();
                                  scannerBloc.add(
                                    const DigitScannerEvent.handleScanner(),
                                  );
                                  bloc.add(
                                    BeneficiaryRegistrationSummaryEvent(
                                      projectId: projectId!,
                                      userUuid: userId!,
                                      boundary: boundary!,
                                      tag: scannerBloc.state.qrCodes.isNotEmpty
                                          ? scannerBloc.state.qrCodes.first
                                          : null,
                                    ),
                                  );
                                  router.push(SummaryRoute());
                                }
                              },
                              editIndividual: (
                                householdModel,
                                individualModel,
                                addressModel,
                                projectBeneficiaryModel,
                                loading,
                              ) {
                                final scannerBloc =
                                    context.read<DigitScannerBloc>();
                                scannerBloc.add(
                                  const DigitScannerEvent.handleScanner(),
                                );
                                final individual = _getIndividualModel(
                                  context,
                                  form: form,
                                  oldIndividual: individualModel,
                                );
                                final tag = scannerBloc.state.qrCodes.isNotEmpty
                                    ? scannerBloc.state.qrCodes.first
                                    : null;

                                if (tag != null &&
                                    tag != projectBeneficiaryModel?.tag &&
                                    scannerBloc.state.duplicate) {
                                  Toast.showToast(context,
                                      message: localizations.translate(
                                        i18.deliverIntervention
                                            .resourceAlreadyScanned,
                                      ),
                                      type: ToastType.error);
                                } else {
                                  bloc.add(
                                    BeneficiaryRegistrationUpdateIndividualDetailsEvent(
                                      addressModel: addressModel,
                                      householdModel: householdModel,
                                      model: individual.copyWith(
                                        clientAuditDetails: (individual
                                                        .clientAuditDetails
                                                        ?.createdBy !=
                                                    null &&
                                                individual.clientAuditDetails
                                                        ?.createdTime !=
                                                    null)
                                            ? ClientAuditDetails(
                                                createdBy: individual
                                                    .clientAuditDetails!
                                                    .createdBy,
                                                createdTime: individual
                                                    .clientAuditDetails!
                                                    .createdTime,
                                                lastModifiedBy:
                                                    RegistrationDeliverySingleton()
                                                        .loggedInUserUuid,
                                                lastModifiedTime: context
                                                    .millisecondsSinceEpoch(),
                                              )
                                            : null,
                                      ),
                                      tag: scannerBloc.state.qrCodes.isNotEmpty
                                          ? scannerBloc.state.qrCodes.first
                                          : null,
                                    ),
                                  );
                                }
                              },
                              addMember: (
                                addressModel,
                                householdModel,
                                loading,
                              ) {
                                final individual = _getIndividualModel(
                                  context,
                                  form: form,
                                );

                                if (context.mounted) {
                                  final scannerBloc =
                                      context.read<DigitScannerBloc>();
                                  scannerBloc.add(
                                    const DigitScannerEvent.handleScanner(),
                                  );
                                  if (scannerBloc.state.duplicate) {
                                    Toast.showToast(
                                      context,
                                      message: localizations.translate(
                                        i18.deliverIntervention
                                            .resourceAlreadyScanned,
                                      ),
                                      type: ToastType.error,
                                    );
                                  } else {
                                    bloc.add(
                                      BeneficiaryRegistrationAddMemberEvent(
                                        beneficiaryType:
                                            RegistrationDeliverySingleton()
                                                .beneficiaryType!,
                                        householdModel: householdModel,
                                        individualModel: individual,
                                        addressModel: addressModel,
                                        userUuid:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid!,
                                        projectId:
                                            RegistrationDeliverySingleton()
                                                .projectId!,
                                        tag: scannerBloc
                                                .state.qrCodes.isNotEmpty
                                            ? scannerBloc.state.qrCodes.first
                                            : null,
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ]),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                      margin: const EdgeInsets.all(spacer2),
                      children: [
                        Text(
                          localizations.translate(
                            i18.individualDetails.individualsDetailsLabelText,
                          ),
                          style: textTheme.headingXl,
                        ),
                        individualDetailsShowcaseData.nameOfIndividual
                            .buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _individualNameKey,
                            validationMessages: {
                              'required': (object) => localizations.translate(
                                    '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                  ),
                              'maxLength': (object) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', maxLength.toString()),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.individualDetails.nameLabelText,
                              ),
                              isRequired: true,
                              child: DigitTextFormInput(
                                initialValue:
                                    form.control(_individualNameKey).value,
                                onChange: (value) {
                                  form.control(_individualNameKey).value =
                                      value;
                                },
                                errorMessage: field.errorText,
                              ),
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: !widget.isHeadOfHousehold,
                          child: DigitCheckbox(
                            label: localizations.translate(
                              i18.individualDetails.checkboxLabelText,
                            ),
                            value: widget.isHeadOfHousehold,
                            readOnly: widget.isHeadOfHousehold,
                            onChanged: (_) {},
                          ),
                        ),
                        ReactiveWrapperField(
                          formControlName: _idTypeKey,
                          validationMessages: {
                            'required': (_) => localizations.translate(
                                  i18.common.corecommonRequired,
                                ),
                          },
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18.individualDetails.idTypeLabelText,
                            ),
                            isRequired: true,
                            child: DigitDropdown<String>(
                              selectedOption:
                                  (form.control(_idTypeKey).value != null)
                                      ? DropdownItem(
                                          name: localizations.translate(
                                              form.control(_idTypeKey).value),
                                          code: form.control(_idTypeKey).value)
                                      : const DropdownItem(name: '', code: ''),
                              items: RegistrationDeliverySingleton()
                                  .idTypeOptions!
                                  .map(
                                    (e) => DropdownItem(
                                        name: localizations.translate(e),
                                        code: e),
                                  )
                                  .toList(),
                              onSelect: (value) {
                                form.control(_idTypeKey).value = value.code;
                                setState(() {
                                  if (value.code ==
                                      IdentifierTypes.defaultID.toValue()) {
                                    form.control(_idNumberKey).value =
                                        IdGen.i.identifier.toString();
                                  } else if (value ==
                                      IdentifierTypes.uniqueBeneficiaryID
                                          .toValue()) {
                                    setUniqueBeneficiaryId(form);
                                  } else {
                                    form.control(_idNumberKey).value = null;
                                  }
                                });
                              },
                              emptyItemText: localizations
                                  .translate(i18.common.noMatchFound),
                              errorMessage: form.control(_idTypeKey).hasErrors
                                  ? localizations.translate(
                                      i18.common.corecommonRequired,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        if (form.control(_idTypeKey).value !=
                                IdentifierTypes.defaultID.toValue() &&
                            form.control(_idTypeKey).value !=
                                IdentifierTypes.uniqueBeneficiaryID.toValue())
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReactiveFormConsumer(
                                builder: (context, formGroup, child) {
                                  return ReactiveWrapperField(
                                    formControlName: _idNumberKey,
                                    validationMessages: {
                                      'required': (object) =>
                                          localizations.translate(
                                            '${i18.individualDetails.idNumberLabelText}_IS_REQUIRED',
                                          ),
                                    },
                                    builder: (field) => LabeledField(
                                      label: localizations.translate(
                                        i18.individualDetails.idNumberLabelText,
                                      ),
                                      isRequired: form
                                          .control(_idNumberKey)
                                          .validators
                                          .isNotEmpty,
                                      child: DigitTextFormInput(
                                        readOnly: form
                                                    .control(_idTypeKey)
                                                    .value ==
                                                IdentifierTypes.defaultID
                                                    .toValue() ||
                                            form.control(_idTypeKey).value ==
                                                IdentifierTypes
                                                    .uniqueBeneficiaryID
                                                    .toValue(),
                                        initialValue:
                                            form.control(_idNumberKey).value,
                                        onChange: (value) {
                                          form.control(_idNumberKey).value =
                                              value;
                                        },
                                        errorMessage: field.errorText,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        if (form.control(_idTypeKey).value ==
                                IdentifierTypes.defaultID.toValue() ||
                            form.control(_idTypeKey).value ==
                                IdentifierTypes.uniqueBeneficiaryID.toValue())
                          const SizedBox(
                            height: spacer2,
                          ),
                        individualDetailsShowcaseData.dateOfBirth.buildWith(
                          child: DigitDobPicker(
                            datePickerFormControl: _dobKey,
                            datePickerLabel: localizations.translate(
                              i18.individualDetails.dobLabelText,
                            ),
                            ageFieldLabel: localizations.translate(
                              i18.individualDetails.ageLabelText,
                            ),
                            yearsHintLabel: localizations.translate(
                              i18.individualDetails.yearsHintText,
                            ),
                            monthsHintLabel: localizations.translate(
                              i18.individualDetails.monthsHintText,
                            ),
                            separatorLabel: localizations.translate(
                              i18.individualDetails.separatorLabelText,
                            ),
                            yearsAndMonthsErrMsg: localizations.translate(
                              i18.individualDetails.yearsAndMonthsErrorText,
                            ),
                            errorMessage: form.control(_dobKey).hasErrors
                                ? localizations
                                    .translate(i18.common.corecommonRequired)
                                : null,
                            initialDate: before150Years,
                            initialValue: getInitialDateValue(form),
                            onChangeOfFormControl: (value) {
                              if (value == null) {
                                form.control(_dobKey).setErrors({'': true});
                              } else {
                                DigitDOBAgeConvertor age =
                                    DigitDateUtils.calculateAge(value);
                                if ((age.years == 0 && age.months == 0) ||
                                    age.months > 11 ||
                                    (age.years >= 150 && age.months >= 0)) {
                                  form.control(_dobKey).setErrors({'': true});
                                } else {
                                  form.control(_dobKey).removeError('');
                                }
                              }
                              // Handle changes to the control's value here
                              form.control(_dobKey).value = value;
                            },
                            cancelText: localizations
                                .translate(i18.common.coreCommonCancel),
                            confirmText: localizations
                                .translate(i18.common.coreCommonOk),
                          ),
                        ),
                        SelectionCard<String>(
                          isRequired: true,
                          showParentContainer: true,
                          title: localizations.translate(
                            i18.individualDetails.genderLabelText,
                          ),
                          allowMultipleSelection: false,
                          width: 126,
                          initialSelection:
                              form.control(_genderKey).value != null
                                  ? [form.control(_genderKey).value]
                                  : [],
                          options: RegistrationDeliverySingleton()
                              .genderOptions!
                              .map(
                                (e) => e,
                              )
                              .toList(),
                          onSelectionChanged: (value) {
                            setState(() {
                              if (value.isNotEmpty) {
                                form.control(_genderKey).value = value.first;
                              } else {
                                form.control(_genderKey).value = null;
                                setState(() {
                                  form
                                      .control(_genderKey)
                                      .setErrors({'': true});
                                });
                              }
                            });
                          },
                          valueMapper: (value) {
                            return localizations.translate(value);
                          },
                          errorMessage: form.control(_genderKey).hasErrors
                              ? localizations
                                  .translate(i18.common.corecommonRequired)
                              : null,
                        ),
                        individualDetailsShowcaseData.mobile.buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _mobileNumberKey,
                            validationMessages: {
                              'maxLength': (object) => localizations.translate(
                                  i18.individualDetails
                                      .mobileNumberLengthValidationMessage),
                              'minLength': (object) => localizations.translate(
                                  i18.individualDetails
                                      .mobileNumberLengthValidationMessage),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.individualDetails.mobileNumberLabelText,
                              ),
                              child: DigitTextFormInput(
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                initialValue:
                                    form.control(_mobileNumberKey).value,
                                onChange: (value) {
                                  form.control(_mobileNumberKey).value = value;
                                },
                              ),
                            ),
                          ),
                        ),
                        Offstage(
                        offstage: !widget.isChild,
                          child: ReactiveWrapperField(
                            formControlName: _isVaccinationConditionKey,
                            builder: (field) => LabeledField(
                              label: localizations.translate(i18.individualDetails.doesChildHaveVaccinationCondition) ,
                              child: RadioList(
                                errorMessage: form.control(_isVaccinationConditionKey).hasErrors
                                    ? localizations.translate(
                                  i18.individualDetails.doesChildHaveVaccinationConditionError,
                                )
                                    : null,
                                radioDigitButtons: [
                                  KeyValue(i18.common.coreCommonYes, true),
                                  KeyValue(i18.common.coreCommonNo, false),
                                ]
                                    .map((e) => RadioButtonModel(
                                  code: e.key.toString(),
                                  name: localizations.translate(e.label),
                                ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    form.control(_isVaccinationConditionKey).value =
                                    value.code == "true"
                                        ? true
                                        : false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),

                        Offstage(
                        offstage: !widget.isChild || !(form.control(_isVaccinationConditionKey).value as bool? ?? false),
                          child: ProductVariantBlocWrapper(
                            child: BlocBuilder<ProductVariantBloc,
                                ProductVariantState>(
                                builder: (context, productState) {
                                return productState.maybeWhen(
                                  orElse: () => const Offstage(),
                                  fetched: (productVariantsValue) {
                                    final variants = productState.whenOrNull(
                                      fetched: (productVariants) {
                                        return productVariants;
                                      },
                                    );

                                    return SelectionCard<ProductVariantModel>(
                                      isRequired: form.control(_isVaccinationConditionKey).value == true ,
                                      showParentContainer: true,
                                      title: localizations.translate(
                                        i18.individualDetails.selectAntigensLabel,
                                      ),
                                      allowMultipleSelection: true,
                                      width: 126,
                                      initialSelection:
                                      form.control(_antigensKey).value != null
                                          ? (form.control(_antigensKey).value as String?)?.split('|').map((id) {
                                            final existingVariant = variants?.firstWhere((v) => v.id == id,
                                            orElse: () => ProductVariantModel(id: id));

                                            return existingVariant?.copyWith(id: id) ?? ProductVariantModel(id: id);
                                      }).toList()
                                          : [],
                                      options: (variants?.map(
                                            (e) => e,
                                      )?? [])
                                          .toList(),
                                      onSelectionChanged: (value) {
                                        setState(() {
                                          if (value.isNotEmpty) {
                                            form.control(_antigensKey).value = value.map((v) => v.id).join("|") ;
                                          } else {
                                            form.control(_antigensKey).value = null;
                                            setState(() {
                                              form
                                                  .control(_antigensKey)
                                                  .setErrors({'': true});
                                            });
                                          }
                                        });
                                      },
                                      valueMapper: (value) {
                                        return localizations.translate(value.sku.toString());
                                      },
                                      errorMessage: form.control(_antigensKey).hasErrors
                                          ? localizations
                                          .translate(i18.common.corecommonRequired)
                                          : null,
                                    );
                                  },
                                );
                              }
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: !(form.control(_genderKey).value == Gender.female.toValue()) || widget.isChild,
                          child: ReactiveWrapperField(
                            formControlName: _isPregnantKey,
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.individualDetails.isPregnant,
                              ),
                              child: DigitCheckbox(
                                label: localizations.translate(
                                  i18.individualDetails.isPregnant,
                                ),
                                value: form.control(_isPregnantKey).value,
                                onChanged: (value) {
                                  setState(() {
                                    form.control(_isPregnantKey).value = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(height: spacer4),

                        Offstage(
                            offstage: !(form.control(_isPregnantKey).value == true) || widget.isChild,
                            child: ReactiveWrapperField(
                          formControlName: _ttVaccinesTakenKey,
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18.individualDetails.howManyTTVaccinesTaken,
                            ),
                            child: DigitNumericFormInput(
                              minValue: 0,
                              initialValue: form
                                  .control(_ttVaccinesTakenKey)
                                  .value
                                  .toString(),
                              step: 1,
                              onChange: (value) {
                                form.control(_ttVaccinesTakenKey).value =
                                    int.parse(value);
                              },
                            ),
                          ),
                        ),
                        ),

                        Offstage(
                          offstage: !(form.control(_isPregnantKey).value == true) || widget.isChild,
                          child: ReactiveWrapperField(
                            formControlName: _noOfPregnantMonthsKey,
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.individualDetails.noOfMonthsPregnant,
                              ),
                              child: DigitNumericFormInput(
                                minValue: 0,
                                initialValue: form
                                    .control(_noOfPregnantMonthsKey)
                                    .value
                                    .toString(),
                                step: 1,
                                onChange: (value) {
                                  form.control(_noOfPregnantMonthsKey).value =
                                      int.parse(value);
                                },
                              ),
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: !(form.control(_isPregnantKey).value == true) || widget.isChild,
                          child: ReactiveWrapperField(
                            formControlName: _noOfTimesVisitedHFKey,
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.individualDetails.noOfTimesVisitedHF,
                              ),
                              child: DigitNumericFormInput(
                                minValue: 0,
                                initialValue: form
                                    .control(_noOfTimesVisitedHFKey)
                                    .value
                                    .toString(),
                                step: 1,
                                onChange: (value) {
                                  form.control(_noOfTimesVisitedHFKey).value =
                                      int.parse(value);
                                },
                              ),
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: !(form.control(_isPregnantKey).value == true),
                          child: ReactiveWrapperField(
                            formControlName: _noOfChildrenLessThan5Key,
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.individualDetails.noChildrenLessThan5,
                              ),
                              child: DigitNumericFormInput(
                                minValue: 0,
                                initialValue: form
                                    .control(_noOfChildrenLessThan5Key)
                                    .value
                                    .toString(),
                                step: 1,
                                onChange: (value) {
                                  form.control(_noOfChildrenLessThan5Key).value =
                                      int.parse(value);
                                },
                              ),
                            ),
                          ),
                        ),

                        if ((RegistrationDeliverySingleton().beneficiaryType ==
                            BeneficiaryType.household &&
                            widget.isHeadOfHousehold) ||
                            (RegistrationDeliverySingleton().beneficiaryType ==
                                BeneficiaryType.individual))
                          BlocBuilder<DigitScannerBloc, DigitScannerState>(
                            buildWhen: (p, c) {
                              return true;
                            },
                            builder: (context, state) => state
                                .qrCodes.isNotEmpty
                                ? Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width /
                                      3,
                                  child: Text(
                                    localizations.translate(
                                      i18.deliverIntervention.voucherCode,
                                    ),
                                    style: textTheme.headingS,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    localizations
                                        .translate(state.qrCodes.last),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: spacer2 * 2,
                                  ),
                                  child: IconButton(
                                    color:
                                    theme.colorTheme.primary.primary1,
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        //[TODO: Add the route to auto_route]
                                        MaterialPageRoute(
                                          builder: (context) =>
                                          const DigitScannerPage(
                                            quantity: 1,
                                            isGS1code: false,
                                            singleValue: true,
                                            isEditEnabled: true,
                                          ),
                                          settings: const RouteSettings(
                                              name: '/qr-scanner'),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],

                              // ignore: no-empty-block
                            )
                                : DigitButton(
                              type: DigitButtonType.secondary,
                              size: DigitButtonSize.large,
                              mainAxisSize: MainAxisSize.max,
                              onPressed: () {
                                Navigator.of(context).push(
                                  // [TODO: Add the route to auto_route]
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const DigitScannerPage(
                                      quantity: 1,
                                      isGS1code: false,
                                      singleValue: true,
                                    ),
                                    settings: const RouteSettings(
                                        name: '/qr-scanner'),
                                  ),
                                );
                              },
                              prefixIcon: Icons.qr_code,
                              label: localizations.translate(
                                i18.individualDetails
                                    .linkVoucherToIndividual,
                              ),
                            ),
                          ),
                      ]),
                ),
              ],
            );
          },
        );
  }
      ),
    );
  }

  IndividualModel _getIndividualModel(
    BuildContext context, {
    required FormGroup form,
    IndividualModel? oldIndividual,
  }) {
    final dob = form.control(_dobKey).value as DateTime?;
    String? dobString;
    if (dob != null) {
      dobString = DateFormat(Constants().dateFormat).format(dob);
    }

    var individual = oldIndividual;
    individual ??= IndividualModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var name = individual.name;
    name ??= NameModel(
      individualClientReferenceId: individual.clientReferenceId,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var identifier = (individual.identifiers?.isNotEmpty ?? false)
        ? individual.identifiers!.first
        : null;

    identifier ??= IdentifierModel(
      clientReferenceId: individual.clientReferenceId,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    bool isPregnant = form.control(_isPregnantKey).value as bool? ?? false;
    int noOfMonthsPregnant =  form.control(_noOfPregnantMonthsKey).value as int? ?? 0;
    int noOfTimesVisitedHF =  form.control(_noOfTimesVisitedHFKey).value as int? ?? 0;
    int ttVaccinesTaken =  form.control(_ttVaccinesTakenKey).value as int? ?? 0;
    int noOfChildrenLessThan5 =  form.control(_noOfChildrenLessThan5Key).value as int? ?? 0;

    IndividualAdditionalFields additionalFields = IndividualAdditionalFields(
      version: 1,
      fields: [
        if(isPregnant) ...[
          AdditionalField(_isPregnantKey, isPregnant.toString()),
          AdditionalField(_ttVaccinesTakenKey, ttVaccinesTaken.toString()),
          AdditionalField(_noOfPregnantMonthsKey, noOfMonthsPregnant.toString()),
          AdditionalField(_noOfTimesVisitedHFKey, noOfTimesVisitedHF.toString()),
          AdditionalField(_noOfChildrenLessThan5Key, noOfChildrenLessThan5.toString()),
        ],
        if(widget.parentClientReferenceId != null)
          AdditionalField('parentClientReferenceId', widget.parentClientReferenceId),
      ]
    );

    String? individualName = form.control(_individualNameKey).value as String?;
    individual = individual.copyWith(
      name: name.copyWith(
        givenName: individualName?.trim(),
      ),
      gender: form.control(_genderKey).value == null
          ? null
          : Gender.values
              .byName(form.control(_genderKey).value.toString().toLowerCase()),
      mobileNumber: form.control(_mobileNumberKey).value,
      parentClientReferenceId: widget.parentClientReferenceId,
      dateOfBirth: dobString,
      identifiers: [
        identifier.copyWith(
          identifierId: form.control(_idNumberKey).value,
          identifierType: form.control(_idTypeKey).value,
        ),
      ],
      additionalFields: additionalFields,
    );

    return individual;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context.read<DigitScannerBloc>().add(DigitScannerScanEvent(
              barCode: [], qrCode: [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
      create: (value) {
        return value.individualModel;
      },
      summary: (value) {
        return value.individualModel;
      },
    );

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    return fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.delegate(
              (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(200),
        ],
        value: individual?.name?.givenName ?? searchQuery?.trim(),
      ),
      _idTypeKey: FormControl<String>(
        value: individual?.identifiers?.firstOrNull?.identifierType,
      ),
      _isPregnantKey: FormControl<bool>(
        value: (individual?.additionalFields?.fields.where((field) => field.key == _isPregnantKey) ?? []).isNotEmpty ?
            bool.tryParse((individual?.additionalFields?.fields.where((field) => field.key == _isPregnantKey).firstOrNull?.value ?? false).toString()) ?? false : false,
      ),
      _isVaccinationConditionKey: FormControl<bool>(
        value: (individual?.additionalFields?.fields.where((field) => field.key == _isVaccinationConditionKey) ?? []).isNotEmpty ?
        bool.tryParse((individual?.additionalFields?.fields.where((field) => field.key == _isVaccinationConditionKey).firstOrNull?.value ?? false).toString()) ?? false : false,
      ),
      _antigensKey: FormControl<String>(),
      _idNumberKey: FormControl<String>(
        validators: [Validators.required],
        value: individual?.identifiers?.firstOrNull?.identifierId,
      ),
      _dobKey: FormControl<DateTime>(
        value: individual?.dateOfBirth != null
            ? DateFormat(Constants().dateFormat).parse(
                individual!.dateOfBirth!,
              )
            : null,
      ),
      _genderKey: FormControl<String>(value: getGenderOptions(individual)),
      _mobileNumberKey:
          FormControl<String>(value: individual?.mobileNumber, validators: [
        Validators.pattern(Constants.mobileNumberRegExp,
            validationMessage:
                localizations.translate(i18.common.coreCommonMobileNumber)),
        Validators.maxLength(10)
      ]),
      _ttVaccinesTakenKey:  FormControl<int>(
        value: int.tryParse((individual?.additionalFields?.fields.where((field) => field.key == _ttVaccinesTakenKey).firstOrNull?.value ?? 0).toString()) ?? 0,
      ),
      _noOfPregnantMonthsKey :  FormControl<int>(
        value: int.tryParse((individual?.additionalFields?.fields.where((field) => field.key == _noOfPregnantMonthsKey).firstOrNull?.value ?? 0).toString()) ?? 0,
      ),
      _noOfTimesVisitedHFKey:  FormControl<int>(
        value: int.tryParse((individual?.additionalFields?.fields.where((field) => field.key == _noOfTimesVisitedHFKey).firstOrNull?.value ?? 0).toString()) ?? 0,
      ),
      _noOfChildrenLessThan5Key:  FormControl<int>(
        value: int.tryParse((individual?.additionalFields?.fields.where((field) => field.key == _noOfChildrenLessThan5Key).firstOrNull?.value ?? 0).toString()) ?? 0,
      ),
    });
  }

  getGenderOptions(IndividualModel? individual) {
    final options = RegistrationDeliverySingleton().genderOptions;

    return options?.map((e) => e).firstWhereOrNull(
          (element) => element.toLowerCase() == individual?.gender?.name,
        );
  }

  getInitialDateValue(FormGroup form) {
    var date = form.control(_dobKey).value != null
        ? DateFormat(Constants().dateTimeExtFormat)
            .format(form.control(_dobKey).value)
        : null;

    return date;
  }

  void setUniqueBeneficiaryId(FormGroup form) async {
    var beneficiaryId = await UniqueIdGeneration().generateUniqueId(
        localityCode: RegistrationDeliverySingleton().boundary!.code!,
        loggedInUserId: RegistrationDeliverySingleton().loggedInUserUuid!,
        returnCombinedIds: false);

    form.control(_idNumberKey).value = beneficiaryId.first.toString();
  }
}
