import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class IndividualDetailsPage extends LocalizedStatefulWidget {
  final bool isHeadOfHousehold;

  const IndividualDetailsPage({
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  @override
  State<IndividualDetailsPage> createState() => _IndividualDetailsPageState();
}

class _IndividualDetailsPageState
    extends LocalizedState<IndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _idTypeKey = 'idType';
  static const _headOfHousehold = 'headOfHousehold';
  static const _idNumberKey = 'idNumber';
  static const _dobKey = 'dob';
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(context),
        builder: (context, form, child) {
          return BlocBuilder<BeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
            builder: (context, beneficiaryRegistrationState) {
              return ScrollableContent(
                header: Column(children: const [
                  BackNavigationHelpHeaderWidget(),
                ]),
                footer: Offstage(
                  offstage: false,
                  child: SizedBox(
                    height: 90,
                    child: DigitCard(
                      child: DigitElevatedButton(
                        onPressed: () async {
                          form.markAllAsTouched();
                          if (!form.valid) return;

                          final previousIndividual =
                              beneficiaryRegistrationState.individualModel;

                          final dob = form.control(_dobKey).value as DateTime?;
                          String? dobString;
                          if (dob != null) {
                            dobString = DateFormat('yyyy/MM/dd').format(dob);
                          }

                          IndividualModel individual = previousIndividual ??
                              IndividualModel(
                                clientReferenceId: IdGen.i.identifier,
                                tenantId: envConfig.variables.tenantId,
                                rowVersion: 1,
                              );

                          individual = individual.copyWith(
                            name: (previousIndividual?.name ??
                                    NameModel(
                                      clientReferenceId: IdGen.i.identifier,
                                      tenantId: envConfig.variables.tenantId,
                                      rowVersion: 1,
                                    ))
                                .copyWith(
                              givenName: form.control(_individualNameKey).value,
                            ),
                            gender: form.control(_genderKey).value == null
                                ? null
                                : Gender.values.byName(form
                                    .control(_genderKey)
                                    .value
                                    .toString()
                                    .toLowerCase()),
                            mobileNumber: form.control(_mobileNumberKey).value,
                            dateOfBirth: dobString,
                            identifiers: [
                              ((previousIndividual?.identifiers?.isEmpty ??
                                          true)
                                      ? IdentifierModel(
                                          clientReferenceId: IdGen.i.identifier,
                                          tenantId:
                                              envConfig.variables.tenantId,
                                          rowVersion: 1,
                                        )
                                      : previousIndividual!.identifiers!.first)
                                  .copyWith(
                                identifierId: form.control(_idNumberKey).value,
                                identifierType: form.control(_idTypeKey).value,
                              ),
                            ],
                          );

                          final bloc =
                              context.read<BeneficiaryRegistrationBloc>();
                          bloc.add(
                            BeneficiaryRegistrationSaveIndividualDetailsEvent(
                              model: individual,
                              projectBeneficiary: beneficiaryRegistrationState
                                      .projectBeneficiary ??
                                  ProjectBeneficiaryModel(
                                    tenantId: envConfig.variables.tenantId,
                                    clientReferenceId: IdGen.i.identifier,
                                    rowVersion: 1,
                                    projectId: '13',
                                    beneficiaryClientReferenceId:
                                        beneficiaryRegistrationState
                                            .householdModel?.clientReferenceId,
                                    dateOfRegistration:
                                        beneficiaryRegistrationState
                                            .registrationDate
                                            ?.millisecondsSinceEpoch,
                                  ),
                            ),
                          );

                          final router = context.router;
                          final submit = await DigitDialog.show<bool>(
                            context,
                            options: DigitDialogOptions(
                              titleText: localizations.translate(
                                i18.deliverIntervention.dialogTitle,
                              ),
                              contentText: localizations.translate(
                                i18.deliverIntervention.dialogContent,
                              ),
                              primaryAction: DigitDialogActions(
                                label: localizations
                                    .translate(i18.common.coreCommonSubmit),
                                action: (context) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(true);
                                },
                              ),
                              secondaryAction: DigitDialogActions(
                                label: localizations
                                    .translate(i18.common.coreCommonCancel),
                                action: (context) =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(false),
                              ),
                            ),
                          );

                          if (submit ?? false) {
                            bloc.add(
                              const BeneficiaryRegistrationSubmitEvent(),
                            );
                            router.push(AcknowledgementRoute());
                          }
                        },
                        child: Center(
                          child: Text(
                            localizations
                                .translate(i18.common.coreCommonSubmit),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                children: [
                  DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          localizations.translate(
                            i18.individualDetails.individualsDetailsLabelText,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                        Column(
                          children: [
                            DigitTextFormField(
                              formControlName: 'individualName',
                              label: localizations.translate(
                                i18.individualDetails.nameLabelText,
                              ),
                              maxLength: 200,
                              isRequired: true,
                              validationMessages: {
                                'required': (object) => 'Name is required',
                              },
                            ),
                            Offstage(
                              offstage: !widget.isHeadOfHousehold,
                              child: DigitCheckbox(
                                label: localizations.translate(
                                  i18.individualDetails.checkboxLabelText,
                                ),
                                value: widget.isHeadOfHousehold,
                              ),
                            ),
                            BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (appConfiguration, _) {
                                  final idTypeOptions =
                                      appConfiguration.idTypeOptions ??
                                          <IdTypeOptions>[];

                                  return DigitDropdown(
                                    isRequired: true,
                                    label: localizations.translate(
                                      i18.individualDetails.idTypeLabelText,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form
                                            .control(_idNumberKey)
                                            .setValidators(
                                          [
                                            if (value == 'DEFAULT')
                                              Validators.required,
                                          ],
                                        );
                                      });
                                    },
                                    initialValue:
                                        idTypeOptions.firstOrNull?.name,
                                    menuItems: idTypeOptions
                                        .map((e) => MenuItemModel(
                                              e.code,
                                              localizations.translate(e.name),
                                            ))
                                        .toList(),
                                    formControlName: _idTypeKey,
                                    validationMessages: {
                                      'required': (object) =>
                                          'ID Type is required',
                                    },
                                  );
                                },
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReactiveFormConsumer(
                                  builder: (context, formGroup, child) {
                                    return DigitTextFormField(
                                      isRequired: true,
                                      formControlName: _idNumberKey,
                                      label: localizations.translate(
                                        i18.individualDetails.idNumberLabelText,
                                      ),
                                      validationMessages: {
                                        'required': (object) =>
                                            'ID Number is required',
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  localizations.translate(
                                    i18.individualDetails
                                        .idNumberSuggestionText,
                                  ),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            DigitDobPicker(
                              datePickerFormControl: _dobKey,
                              datePickerLabel: localizations.translate(
                                i18.individualDetails.dobLabelText,
                              ),
                              ageFieldLabel: localizations.translate(
                                i18.individualDetails.ageLabelText,
                              ),
                              separatorLabel: localizations.translate(
                                i18.individualDetails.separatorLabelText,
                              ),
                            ),
                            BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (appConfiguration, _) {
                                  final genderOptions =
                                      appConfiguration.genderOptions ??
                                          <GenderOptions>[];

                                  return DigitDropdown(
                                    label: localizations.translate(
                                      i18.individualDetails.genderLabelText,
                                    ),
                                    initialValue:
                                        genderOptions.firstOrNull?.name,
                                    menuItems: genderOptions
                                        .map((e) => MenuItemModel(
                                              e.code,
                                              localizations.translate(e.name),
                                            ))
                                        .toList(),
                                    formControlName: _genderKey,
                                  );
                                },
                              ),
                            ),
                            DigitTextFormField(
                              keyboardType: TextInputType.number,
                              formControlName: _mobileNumberKey,
                              label: localizations.translate(
                                i18.individualDetails.mobileNumberLabelText,
                              ),
                              maxLength: 10,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm(BuildContext context) => fb.group(<String, Object>{
        _individualNameKey: FormControl<String>(
          validators: [Validators.required],
          value: context.read<BeneficiaryRegistrationBloc>().state.searchQuery,
        ),
        _headOfHousehold: FormControl<bool>(),
        _idTypeKey: FormControl<String>(
          validators: [Validators.required],
        ),
        _idNumberKey: FormControl<String>(),
        _dobKey: FormControl<DateTime>(),
        _genderKey: FormControl<String>(),
        _mobileNumberKey: FormControl<String>(),
      });
}
