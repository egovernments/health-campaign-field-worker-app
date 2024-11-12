import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseholdLocationPage extends LocalizedStatefulWidget {
  final Map<String, Map<String, dynamic>> widgetConfig;

  HouseholdLocationPage({
    Map<String, Map<String, dynamic>>? widgetConfig,
    super.key,
    super.appLocalizations,
  }) : widgetConfig = widgetConfig ??
            {
              'administrationArea': {
                'isEnabled': false,
                'readOnly': true,
                'isRequired': false,
                'order': 3,
              },
              'accuracy': {
                'isEnabled': true,
                'readOnly': true,
                'isRequired': true,
                'order': 2,
              },
              'addressLine1': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': false,
                'order': 1,
              },
              'postalCode': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': false,
                'order': 1,
              }
            };

  @override
  State<HouseholdLocationPage> createState() => HouseholdLocationPageState();
}

class HouseholdLocationPageState extends LocalizedState<HouseholdLocationPage> {
  static const _administrationAreaKey = 'administrationArea';
  static const _addressLine1Key = 'addressLine1';
  static const _addressLine2Key = 'addressLine2';
  static const _landmarkKey = 'landmark';
  static const _postalCodeKey = 'postalCode';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;

  @override
  void initState() {
    final regState = context.read<BeneficiaryRegistrationBloc>().state;
    context.read<LocationBloc>().add(const LoadLocationEvent());
    regState.maybeMap(
        orElse: () => false,
        editHousehold: (value) => false,
        create: (value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Show the dialog after the first frame is built
            DigitComponentsUtils().showLocationCapturingDialog(
              context,
              localizations.translate(i18.common.locationCapturing),
              DigitSyncDialogType.inProgress,
            );
          });
          return true;
        });
    super.initState();
  }

  List<Widget> buildWidgetsFromConfig(WidgetConfigModel model) {
    List<Widget> widgets = [];

    // Sort the config keys by the 'order' key
    var sortedKeys = model.config.keys.toList();
    sortedKeys.sort(
        (a, b) => model.config[a]['order'].compareTo(model.config[b]['order']));

    for (var key in sortedKeys) {
      var fieldConfig = model.config[key];

      if (fieldConfig['isEnabled'] == true) {
        Widget widget;

        // Generate the widget based on the fieldConfig['type'] using a switch case
        switch (key) {
          case _administrationAreaKey:
            widget = householdLocationShowcaseData.administrativeArea.buildWith(
                child: DigitTextFormField(
              formControlName: _administrationAreaKey,
              label: localizations.translate(
                i18.householdLocation.administrationAreaFormLabel,
              ),
              isRequired: fieldConfig['isRequired'] ?? false,
              readOnly: fieldConfig['readOnly'] ?? false,
              validationMessages: {
                'required': (_) => localizations.translate(
                      i18.householdLocation
                          .administrationAreaRequiredValidation,
                    ),
                'customError': (object) => localizations.translate(
                  fieldConfig['errorMessage'] ?? '',
                )
              },
            ));
            break;
          case _accuracyKey:
            widget = householdLocationShowcaseData.gpsAccuracy.buildWith(
              child: DigitTextFormField(
                key: const Key(_accuracyKey),
                formControlName: _accuracyKey,
                label: localizations.translate(
                  i18.householdLocation.gpsAccuracyLabel,
                ),
                readOnly: fieldConfig['readOnly'] ?? false,
                isRequired: fieldConfig['isRequired'] ?? false,
                validationMessages: {
                  'required': (_) => localizations.translate(
                        i18.common.corecommonRequired,
                      ),
                  'customError': (object) => localizations.translate(
                    fieldConfig['errorMessage'] ?? '',
                  )
                },
              ),
            );
            break;
          case _addressLine1Key:
            widget = householdLocationShowcaseData.addressLine1.buildWith(
              child: DigitTextFormField(
                formControlName: _addressLine1Key,
                label: localizations.translate(
                  i18.householdLocation.householdAddressLine1LabelText,
                ),
                readOnly: fieldConfig['readOnly'] ?? false,
                isRequired: fieldConfig['isRequired'] ?? false,
                validationMessages: {
                  'required': (_) => localizations.translate(
                        i18.common.min2CharsRequired,
                      ),
                  'maxLength': (object) => localizations
                      .translate(i18.common.maxCharsRequired)
                      .replaceAll('{}', maxLength.toString()),
                  'customError': (object) => localizations.translate(
                    fieldConfig['errorMessage'] ?? '',
                  )
                },
              ),
            );
            break;
          case _addressLine2Key:
            widget = householdLocationShowcaseData.addressLine2.buildWith(
              child: DigitTextFormField(
                formControlName: _addressLine2Key,
                label: localizations.translate(
                  i18.householdLocation.householdAddressLine2LabelText,
                ),
                readOnly: fieldConfig['readOnly'] ?? false,
                isRequired: fieldConfig['isRequired'] ?? false,
                validationMessages: {
                  'required': (_) => localizations.translate(
                        i18.common.min2CharsRequired,
                      ),
                  'maxLength': (object) => localizations
                      .translate(i18.common.maxCharsRequired)
                      .replaceAll('{}', maxLength.toString()),
                  'customError': (object) => localizations.translate(
                    fieldConfig['errorMessage'] ?? '',
                  )
                },
              ),
            );
            break;
          case _landmarkKey:
            widget = householdLocationShowcaseData.postalCode.buildWith(
              child: DigitTextFormField(
                keyboardType: TextInputType.text,
                formControlName: _postalCodeKey,
                label: localizations.translate(
                  i18.householdLocation.postalCodeFormLabel,
                ),
                readOnly: fieldConfig['readOnly'] ?? false,
                isRequired: fieldConfig['isRequired'] ?? false,
                validationMessages: {
                  'required': (_) => localizations.translate(
                        i18.common.min2CharsRequired,
                      ),
                  'maxLength': (object) => localizations
                      .translate(i18.common.maxCharsRequired)
                      .replaceAll('{}', '6'),
                  'customError': (object) => localizations.translate(
                    fieldConfig['errorMessage'] ?? '',
                  )
                },
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                // ],
              ),
            );
            break;
          case _postalCodeKey:
            widget = householdLocationShowcaseData.postalCode.buildWith(
              child: DigitTextFormField(
                keyboardType: TextInputType.number,
                formControlName: _postalCodeKey,
                label: localizations.translate(
                  i18.householdLocation.postalCodeFormLabel,
                ),
                readOnly: fieldConfig['readOnly'] ?? false,
                isRequired: fieldConfig['isRequired'] ?? false,
                validationMessages: {
                  'required': (_) => localizations.translate(
                        i18.common.min2CharsRequired,
                      ),
                  'maxLength': (object) => localizations
                      .translate(i18.common.maxCharsRequired)
                      .replaceAll('{}', '6'),
                  'customError': (object) => localizations.translate(
                        fieldConfig['errorMessage'] ?? '',
                  )
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            );
            break;
          default:
            throw Exception("Unsupported widget type: ${key}");
        }

        widgets.add(widget);
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: BlocBuilder<BeneficiaryRegistrationBloc,
          BeneficiaryRegistrationState>(builder: (context, registrationState) {
        return ReactiveFormBuilder(
          form: () => buildForm(bloc.state),
          builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
            listener: (context, locationState) {
              registrationState.maybeMap(
                  orElse: () => false,
                  create: (value) {
                    if (locationState.accuracy != null) {
                      //Hide the dialog after 1 seconds
                      Future.delayed(const Duration(seconds: 1), () {
                        DigitComponentsUtils().hideDialog(context);
                      });
                    }
                  });
              if (locationState.accuracy != null) {
                final lat = locationState.latitude;
                final lng = locationState.longitude;
                final accuracy = locationState.accuracy;

                form.control(_latKey).value ??= lat;
                form.control(_lngKey).value ??= lng;
                form.control(_accuracyKey).value ??= accuracy;
              }
            },
            listenWhen: (previous, current) {
              final lat = form.control(_latKey).value;
              final lng = form.control(_lngKey).value;
              final accuracy = form.control(_accuracyKey).value;

              return lat != null || lng != null || accuracy != null
                  ? false
                  : true;
            },
            child: ScrollableContent(
              enableFixedButton: true,
              header: const Column(
                children: [
                  BackNavigationHelpHeaderWidget(
                    showcaseButton: ShowcaseButton(),
                    showHelp: false,
                  ),
                ],
              ),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, locationState) {
                    return DigitElevatedButton(
                      onPressed: () {
                        form.markAllAsTouched();
                        if (!form.valid) return;

                        final addressLine1 =
                            form.control(_addressLine1Key).value as String?;
                        final addressLine2 =
                            form.control(_addressLine2Key).value as String?;
                        final landmark =
                            form.control(_landmarkKey).value as String?;
                        final postalCode =
                            form.control(_postalCodeKey).value as String?;
                        registrationState.maybeWhen(
                          orElse: () {
                            return;
                          },
                          create: (
                            address,
                            householdModel,
                            individualModel,
                            projectBeneficiaryModel,
                            registrationDate,
                            searchQuery,
                            loading,
                            isHeadOfHousehold,
                          ) {
                            var addressModel = AddressModel(
                              addressLine1: addressLine1 != null &&
                                      addressLine1.trim().isNotEmpty
                                  ? addressLine1
                                  : null,
                              addressLine2: addressLine2 != null &&
                                      addressLine2.trim().isNotEmpty
                                  ? addressLine2
                                  : null,
                              landmark:
                                  landmark != null && landmark.trim().isNotEmpty
                                      ? landmark
                                      : null,
                              pincode: postalCode != null &&
                                      postalCode.trim().isNotEmpty
                                  ? postalCode
                                  : null,
                              type: AddressType.correspondence,
                              latitude: form.control(_latKey).value ??
                                  locationState.latitude,
                              longitude: form.control(_lngKey).value ??
                                  locationState.longitude,
                              locationAccuracy:
                                  form.control(_accuracyKey).value ??
                                      locationState.accuracy,
                              locality: LocalityModel(
                                code: RegistrationDeliverySingleton()
                                    .boundary!
                                    .code!,
                                name: RegistrationDeliverySingleton()
                                    .boundary!
                                    .name,
                              ),
                              tenantId:
                                  RegistrationDeliverySingleton().tenantId,
                              rowVersion: 1,
                              auditDetails: AuditDetails(
                                createdBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid!,
                                createdTime: context.millisecondsSinceEpoch(),
                              ),
                              clientAuditDetails: ClientAuditDetails(
                                createdBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid!,
                                createdTime: context.millisecondsSinceEpoch(),
                                lastModifiedBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid,
                                lastModifiedTime:
                                    context.millisecondsSinceEpoch(),
                              ),
                            );

                            bloc.add(
                              BeneficiaryRegistrationSaveAddressEvent(
                                addressModel,
                              ),
                            );
                            router.push(HouseDetailsRoute());
                          },
                          editHousehold: (
                            address,
                            householdModel,
                            individuals,
                            registrationDate,
                            projectBeneficiaryModel,
                            loading,
                            headOfHousehold,
                          ) {
                            var addressModel = address.copyWith(
                              addressLine1: addressLine1 != null &&
                                      addressLine1.trim().isNotEmpty
                                  ? addressLine1
                                  : null,
                              addressLine2: addressLine2 != null &&
                                      addressLine2.trim().isNotEmpty
                                  ? addressLine2
                                  : null,
                              landmark:
                                  landmark != null && landmark.trim().isNotEmpty
                                      ? landmark
                                      : null,
                              locality: address.locality,
                              pincode: postalCode != null &&
                                      postalCode.trim().isNotEmpty
                                  ? postalCode
                                  : null,
                              type: AddressType.correspondence,
                              latitude: form.control(_latKey).value,
                              longitude: form.control(_lngKey).value,
                              locationAccuracy:
                                  form.control(_accuracyKey).value,
                            );
                            // TODO [Linking of Voucher for Household based project  need to be handled]

                            bloc.add(
                              BeneficiaryRegistrationSaveAddressEvent(
                                addressModel,
                              ),
                            );
                            router.push(HouseDetailsRoute());
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          localizations.translate(
                            i18.householdLocation.actionLabel,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextBlock(
                            padding: const EdgeInsets.only(top: kPadding),
                            heading: localizations.translate(
                              i18.householdLocation.householdLocationLabelText,
                            ),
                            headingStyle: theme.textTheme.displayMedium,
                            body: localizations.translate(
                              i18.householdLocation
                                  .householdLocationDescriptionText,
                            )),
                        Column(
                            children: buildWidgetsFromConfig(WidgetConfigModel(
                                config: widget.widgetConfig, form: form)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final addressModel = state.mapOrNull(
      editHousehold: (value) => value.addressModel,
    );

    final formGroup = fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: localizations
            .translate(RegistrationDeliverySingleton().boundary!.code ?? ''),
        validators: [Validators.required],
      ),
      _addressLine1Key: FormControl<String>(
          value: addressModel?.addressLine1,
          validators: [
            CustomValidator.requiredMin,
            Validators.maxLength(64),
            Validators.required
          ]),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.addressLine2,
        validators: [
          CustomValidator.requiredMin,
          Validators.maxLength(64),
        ],
      ),
      _landmarkKey:
          FormControl<String>(value: addressModel?.landmark, validators: [
        CustomValidator.requiredMin,
        Validators.maxLength(64),
      ]),
      _postalCodeKey:
          FormControl<String>(value: addressModel?.pincode, validators: [
        CustomValidator.requiredMin,
        Validators.maxLength(6),
      ]),
      _latKey: FormControl<double>(value: addressModel?.latitude, validators: [
        CustomValidator.requiredMin,
      ]),
      _lngKey: FormControl<double>(
        value: addressModel?.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: addressModel?.locationAccuracy,
      ),
    });

    widget.widgetConfig.forEach((key, fieldConfig) {
      final formControl = formGroup.control(key);

      // Get current validators
      final currentValidators = formControl.validators;

      dynamic updatedValidators = currentValidators.where((validator) {
        // Check if the validator is of the same type as Validators.required
        return validator.runtimeType != Validators.required.runtimeType;
      }).toList();

      if (fieldConfig['isRequired'] == true) {
        // Add the new validator to the list
        updatedValidators = [
          ...currentValidators,
          Validators.required // Example new validator
        ];
      }


      // If JSON config has regex, add it as a validator
      if (fieldConfig.containsKey('regex') && fieldConfig['regex'] is List) {
        List<String> regexList = fieldConfig['regex'];
        String errorMessages = fieldConfig['errorMessage'];

        regexList.asMap().forEach((index, regexPattern) {
          updatedValidators.add((control) {
            final value = control.value;
            if (value != null && value.isNotEmpty && !RegExp(regexPattern).hasMatch(value)) {
              // Ensure there's a matching error message for this index
              return {'customError': errorMessages};
            }
            return null;
          });
        });
      }

      // Set the updated validators back to the form control
      formControl.setValidators(updatedValidators);

      // Re-run validation with the new validators
      formControl.updateValueAndValidity();
    });

    return formGroup;
  }
}
