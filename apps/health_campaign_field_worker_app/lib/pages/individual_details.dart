import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

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
                    onPressed: () {
                      if (form.valid) {
                        DigitDialog.show(
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
                                    .pop();
                                context.router.push(AcknowledgementRoute());
                              },
                            ),
                            secondaryAction: DigitDialogActions(
                              label: localizations
                                  .translate(i18.common.coreCommonCancel),
                              action: (context) =>
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(),
                            ),
                          ),
                        );
                      } else {
                        form.markAllAsTouched();
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
                      DigitDropdown(
                        label: localizations
                            .translate(i18.individualDetails.idTypeLabelText),
                        initialValue: '',
                        menuItems: [
                          MenuItemModel('ID Type 1', 'code'),
                          MenuItemModel('ID Type 2', 'code1'),
                        ],
                        onChanged: (value) {
                          // TODO: Complete implementation
                        },
                        formControlName: 'idType',
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
        'individualName': FormControl<String>(value: ''),
        'idType': FormControl<String>(value: ''),
        'idNumber': FormControl<String>(value: ''),
        'dob': FormControl<DateTime>(),
        'age': FormControl<String>(value: ''),
        'gender': FormControl<String>(value: ''),
        'mobileNumber': FormControl<String>(value: ''),
      });
}
