import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class IndividualDetailsPage extends LocalizedStatefulWidget {
  const IndividualDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<IndividualDetailsPage> createState() => _IndividualDetailsPageState();
}

class _IndividualDetailsPageState
    extends LocalizedState<IndividualDetailsPage> {
  static const _individualNameKey = 'individualName';
  static const _idTypeKey = 'idType';
  static const _idNumberKey = 'idNumber';
  static const _dobKey = 'dob';
  static const _ageKey = 'age';
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
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
                      if (!form.valid) return;

                      final router = context.router;
                      final bloc = context.read<BeneficiaryRegistrationBloc>();
                      final address = bloc.state.addressModel;

                      if (address == null) return;

                      final model = IndividualModel(
                        dateOfBirth: '1992-09-29',
                        gender: Gender.male,
                        identifiers: [
                          IdentifierModel(
                            clientReferenceId: const Uuid().v1(),
                            type: 'System Generated',
                            id: const Uuid().v1(),
                          ),
                        ],
                        clientReferenceId: const Uuid().v1(),
                        name: NameModel(
                          clientReferenceId: const Uuid().v1(),
                          givenName: 'Ajil',
                          familyName: 'Oommen',
                        ),
                        address: [address],
                        bloodGroup: BloodGroup.aPositive,
                        mobileNumber: '',
                        rowVersion: 1,
                        tenantId: 'default',
                      );

                      bloc.add(
                        BeneficiaryRegistrationSaveIndividualDetailsEvent(
                          model,
                        ),
                      );

                      final isSuccess = await DigitDialog.show<bool>(
                        context,
                        options: DigitDialogOptions(
                          titleText: localizations
                              .translate(i18.deliverIntervention.dialogTitle),
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

                      if (isSuccess ?? false) {
                        bloc.add(const BeneficiaryRegistrationSubmitEvent());
                        router.push(AcknowledgementRoute());
                      }
                    },
                    child: Center(
                      child: Text(
                        localizations.translate(i18.common.coreCommonSubmit),
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
                    Column(children: [
                      DigitTextFormField(
                        formControlName: 'individualName',
                        label: localizations
                            .translate(i18.individualDetails.nameLabelText),
                      ),
                      DigitCheckbox(
                        label: localizations.translate(
                          i18.individualDetails.checkboxLabelText,
                        ),
                        value: true,
                      ),
                      BlocBuilder<AppInitializationBloc,
                          AppInitializationState>(
                        builder: (context, state) {
                          if (state is! AppInitialized) return const Offstage();

                          final idTypeOptions =
                              state.appConfiguration.idTypeOptions ??
                                  <IdTypeOptions>[];

                          return DigitDropdown(
                            label: localizations.translate(
                              i18.individualDetails.idTypeLabelText,
                            ),
                            initialValue: idTypeOptions.firstOrNull?.name,
                            menuItems: idTypeOptions.map((e) {
                              return MenuItemModel(
                                e.code,
                                localizations.translate(e.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              // TODO: Complete implementation
                            },
                            formControlName: 'idType',
                          );
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DigitTextFormField(
                            formControlName: 'idNumber',
                            label: localizations.translate(
                              i18.individualDetails.idNumberLabelText,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            localizations.translate(
                              i18.individualDetails.idNumberSuggestionText,
                            ),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      DigitDobPicker(
                        datePickerFormControl: 'dob',
                        ageInputFormControl: 'age',
                        onChangeDate: (dateTime) {
                          // TODO: Complete implementation
                        },
                        datePickerLabel: localizations
                            .translate(i18.individualDetails.dobLabelText),
                        ageFieldLabel: localizations
                            .translate(i18.individualDetails.ageLabelText),
                        separatorLabel: localizations.translate(
                          i18.individualDetails.separatorLabelText,
                        ),
                      ),
                      BlocBuilder<AppInitializationBloc,
                          AppInitializationState>(
                        builder: (context, state) {
                          if (state is! AppInitialized) return const Offstage();

                          final genderOptions =
                              state.appConfiguration.genderOptions ??
                                  <GenderOptions>[];

                          return DigitDropdown(
                            label: localizations.translate(
                              i18.individualDetails.genderLabelText,
                            ),
                            initialValue: genderOptions.firstOrNull?.name,
                            menuItems: genderOptions.map((e) {
                              return MenuItemModel(
                                e.code,
                                localizations.translate(e.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              // TODO: Complete implementation
                            },
                            formControlName: 'gender',
                          );
                        },
                      ),
                      DigitTextFormField(
                        formControlName: 'mobileNumber',
                        label: localizations.translate(
                          i18.individualDetails.mobileNumberLabelText,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _individualNameKey: FormControl<String>(value: ''),
        _idTypeKey: FormControl<String>(value: ''),
        _idNumberKey: FormControl<String>(value: ''),
        _dobKey: FormControl<DateTime>(),
        _ageKey: FormControl<String>(value: ''),
        _genderKey: FormControl<String>(value: ''),
        _mobileNumberKey: FormControl<String>(value: ''),
      });
}
