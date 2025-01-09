import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/component_mapper/household_location_component_mapper.dart';
import '../../utils/convert_to_map.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseholdLocationPage extends LocalizedStatefulWidget {
  final List<RegistrationDeliveryFormConfig>? widgetConfig;

  const HouseholdLocationPage({
    this.widgetConfig,
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseholdLocationPage> createState() => HouseholdLocationPageState();
}

class HouseholdLocationPageState extends LocalizedState<HouseholdLocationPage> {
  static const administrationAreaKey = 'administrationArea';
  static const addressLine1Key = 'addressLine1';
  static const addressLine2Key = 'addressLine2';
  static const landmarkKey = 'landmark';
  static const postalCodeKey = 'postalCode';
  static const latKey = 'lat';
  static const lngKey = 'lng';
  static const accuracyKey = 'accuracy';
  static const maxLength = 64;
  HouseholdLocationComponentMapper mapper = HouseholdLocationComponentMapper();

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

    if (widget.widgetConfig != null) {
      final converter = FieldConverter(widget.widgetConfig);
      mapper.configs = converter.convertWidgetConfigToJsonByName(HouseholdLocationRoute.name)!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    void validate(final form, final key, final fieldConfig) {
      if (fieldConfig?['attribute'] != 'textField' &&
          fieldConfig?['attribute'] != 'dateFormPicker' &&
          fieldConfig?['attribute'] != 'dobPicker') {
        if (form.control(key).value == null &&
            (fieldConfig?['isRequired'] ?? false) &&
            (fieldConfig?['isEnabled'] ?? false)) {
          setState(() {
            form.control(key).setErrors({'': true});
          });
        }
      }
      if (fieldConfig?['attribute'] == 'dobPicker') {
        final age = DigitDateUtils.calculateAge(
          form.control(key).value as DateTime?,
        );
        if ((fieldConfig?['isRequired'] ?? false) &&
            (fieldConfig?['isEnabled'] ?? false) &&
            ((age.years == 0 && age.months == 0) ||
                (age.years >= 150 && age.months > 0))) {
          setState(() {
            form.control(key).setErrors({'': true});
          });
        }
      }
    }

    return Scaffold(
      body: BlocBuilder<BeneficiaryRegistrationBloc,
          BeneficiaryRegistrationState>(builder: (context, registrationState) {
        return ReactiveFormBuilder(
          form: () => mapper.buildForm(bloc.state, localizations),
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

                form.control(latKey).value ??= lat;
                form.control(lngKey).value ??= lng;
                form.control(accuracyKey).value ??= accuracy;
              }
            },
            listenWhen: (previous, current) {
              final lat = form.control(latKey).value;
              final lng = form.control(lngKey).value;
              final accuracy = form.control(accuracyKey).value;

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
                        List<AdditionalField> fields = [];
                        for (var component in mapper.configs["components"]) {
                          for (var fieldConfig in component["attributes"]) {
                            var key = fieldConfig["name"];
                            validate(form, key, fieldConfig);
                            if (fieldConfig['type'] == 'additionalField' &&
                                fieldConfig['isEnabled'] == true) {
                              var val = form.control(key).value ?? '';
                              fields.add(AdditionalField(
                                key,
                                val is List ? val.join("|")
                                    .toString() : val.toString(),
                              ));
                            }
                          }
                        }
                        form.markAllAsTouched();
                        if (!form.valid) return;

                        final addressLine1 =
                            form.control(addressLine1Key).value as String?;
                        final addressLine2 =
                            form.control(addressLine2Key).value as String?;
                        final landmark =
                            form.control(landmarkKey).value as String?;
                        final postalCode =
                            form.control(postalCodeKey).value as String?;
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
                              latitude: form.control(latKey).value ??
                                  locationState.latitude,
                              longitude: form.control(lngKey).value ??
                                  locationState.longitude,
                              locationAccuracy:
                                  form.control(accuracyKey).value ??
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
                              additionalFields: AddressAdditionalFields(
                                  version: 1, fields: fields),
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
                              latitude: form.control(latKey).value,
                              longitude: form.control(lngKey).value,
                              locationAccuracy: form.control(accuracyKey).value,
                              additionalFields: AddressAdditionalFields(
                                  version: 1, fields: fields),
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
                  child: Column(
                    children: mapper.buildWidgetsFromConfig(
                        WidgetConfigModel(
                          config: mapper.configs,
                          form: form,
                          localizations: localizations,
                        ),
                        context
                        // children: [
                        //   DigitCard(
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         TextBlock(
                        //             padding: const EdgeInsets.only(top: kPadding),
                        //             heading: localizations.translate(
                        //               i18.householdLocation.householdLocationLabelText,
                        //             ),
                        //             headingStyle: theme.textTheme.displayMedium,
                        //             body: localizations.translate(
                        //               i18.householdLocation
                        //                   .householdLocationDescriptionText,
                        //             )),
                        //         Column(
                        //             children: mapper.buildWidgetsFromConfig(
                        //                 WidgetConfigModel(
                        //                     config: mapper.configs,
                        //                     form: form,
                        //                     localizations: localizations)))
                        //       ],
                        //     ),
                        //   ),
                        // ],
                        ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
