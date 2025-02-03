import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../router/registration_delivery_router.gm.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class HouseHoldConsentPage extends LocalizedStatefulWidget {
  const HouseHoldConsentPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseHoldConsentPage> createState() => _HouseHoldConsentPageState();
}

class _HouseHoldConsentPageState extends LocalizedState<HouseHoldConsentPage> {
  static const _consent = 'consent';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(context),
        builder: (context, form, child) => BlocBuilder<
            BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
          builder: (context, registrationState) {
            return ScrollableContent(
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(),
              ]),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, spacer1, 0, 0),
                children: [
                  BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, locationState) {
                      return ElevatedButton(
                        onPressed: () {
                          form.markAllAsTouched();
                          if (!form.valid) return;

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
                              final isConsent = form.control(_consent).value;
                              if (isConsent == false && address != null) {
                                var addressModel = address.copyWith(
                                  latitude: locationState.latitude ??
                                      address.latitude,
                                  longitude: locationState.longitude ??
                                      address.longitude,
                                  locationAccuracy: locationState.accuracy ??
                                      address.locationAccuracy,
                                );
                                var household = householdModel;
                                household ??= HouseholdModel(
                                  tenantId:
                                      RegistrationDeliverySingleton().tenantId,
                                  clientReferenceId: IdGen.i.identifier,
                                  rowVersion: 1,
                                  clientAuditDetails: ClientAuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid,
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  auditDetails: AuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid,
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  address: addressModel,
                                  latitude: locationState.latitude,
                                  longitude: locationState.longitude,
                                  additionalFields: HouseholdAdditionalFields(
                                    version: 1,
                                    fields: [
                                      AdditionalField("isConsent", isConsent),
                                    ],
                                  ),
                                );

                                household = household.copyWith(
                                  memberCount: 0,
                                );

                                bloc.add(
                                  BeneficiaryRegistrationSaveHouseholdConsentEvent(
                                    household: household,
                                    isConsent: isConsent,
                                  ),
                                );
                                // clear search on consent being no
                                final searchBloc =
                                    context.read<SearchHouseholdsBloc>();
                                searchBloc.add(
                                  const SearchHouseholdsClearEvent(),
                                );
                                context.router.push(
                                    ConsentHouseholdAcknowledgementRoute());
                              } else {
                                context.router.push(HouseHoldDetailsRoute());
                              }
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
                              (router.parent() as StackRouter).maybePop();
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            registrationState.mapOrNull(
                                  editHousehold: (value) => localizations
                                      .translate(i18.common.coreCommonSave),
                                ) ??
                                localizations.translate(
                                    i18.householdDetails.actionLabel),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
              children: [
                DigitCard(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          localizations.translate(
                            i18.householdDetails.householdConsentLabel,
                          ),
                          style: theme.textTheme.displaySmall,
                        ),
                        Text(
                          localizations.translate(
                            i18.householdDetails.cardTitle,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                        ReactiveWrapperField(
                          formControlName: _consent,
                          builder: (field) => RadioList(
                            errorMessage: form.control(_consent).hasErrors
                                ? localizations.translate(
                                    i18.householdDetails.validationForSelection,
                                  )
                                : null,
                            radioDigitButtons: [
                              KeyValue(i18.householdDetails.submitYes, true),
                              KeyValue(i18.householdDetails.submitNo, false),
                            ]
                                .map((e) => RadioButtonModel(
                                      code: e.key.toString(),
                                      name: localizations.translate(e.label),
                                    ))
                                .toList(),
                            groupValue:
                                form.control(_consent).value.toString() ?? '',
                            onChanged: (value) {
                              if (form.control(_consent).disabled) return;

                              form.control(_consent).value =
                                  value.code == 'true' ? true : false;
                            },
                            capitalizeFirstLetter: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  FormGroup buildForm(BuildContext ctx) {
    return fb.group(<String, Object>{
      _consent: FormControl<bool>(value: null),
    });
  }
}
