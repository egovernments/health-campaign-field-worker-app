import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';
import 'package:registration_delivery/widgets/showcase/showcase_button.dart';

import '../../router/app_router.dart';

@RoutePage()
class CustomHouseHoldDetailsPage extends LocalizedStatefulWidget {
  const CustomHouseHoldDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomHouseHoldDetailsPage> createState() =>
      CustomHouseHoldDetailsPageState();
}

class CustomHouseHoldDetailsPageState
    extends LocalizedState<CustomHouseHoldDetailsPage> {
  static const _dateOfRegistrationKey = 'dateOfRegistration';
  static const _memberCountKey = 'memberCount';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) {
          int memberCount = form.control(_memberCountKey).value;
          return BlocConsumer<BeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
            listener: (context, state) {
              if (state is BeneficiaryRegistrationPersistedState &&
                  state.isEdit) {
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
                HouseholdMemberWrapper memberWrapper =
                    overviewBloc.state.householdMemberWrapper;
                final route = router.parent() as StackRouter;
                route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
                route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
              }
            },
            builder: (context, registrationState) {
              return ScrollableContent(
                header: const Column(children: [
                  BackNavigationHelpHeaderWidget(
                    showHelp: false,
                  ),
                ]),
                enableFixedButton: true,
                footer: DigitCard(
                  margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                  padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: DigitElevatedButton(
                    onPressed: () {
                      form.markAllAsTouched();
                      if (!form.valid) return;

                      final memberCount =
                          form.control(_memberCountKey).value as int;

                      final dateOfRegistration = form
                          .control(_dateOfRegistrationKey)
                          .value as DateTime;
                      //[TODO: Use pregnant women form value based on project config
                      registrationState.maybeWhen(
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
                        ) {
                          var household = householdModel;
                          household ??= HouseholdModel(
                            // info setting lat long from address to household object
                            latitude: addressModel?.latitude ??
                                householdModel?.latitude,
                            longitude: addressModel?.longitude ??
                                householdModel?.longitude,
                            tenantId: RegistrationDeliverySingleton().tenantId,
                            clientReferenceId:
                                householdModel?.clientReferenceId ??
                                    IdGen.i.identifier,
                            rowVersion: 1,
                            clientAuditDetails: ClientAuditDetails(
                              createdBy: RegistrationDeliverySingleton()
                                  .loggedInUserUuid!,
                              createdTime: context.millisecondsSinceEpoch(),
                              lastModifiedBy: RegistrationDeliverySingleton()
                                  .loggedInUserUuid,
                              lastModifiedTime:
                                  context.millisecondsSinceEpoch(),
                            ),
                            auditDetails: AuditDetails(
                              createdBy: RegistrationDeliverySingleton()
                                  .loggedInUserUuid!,
                              createdTime: context.millisecondsSinceEpoch(),
                              lastModifiedBy: RegistrationDeliverySingleton()
                                  .loggedInUserUuid,
                              lastModifiedTime:
                                  context.millisecondsSinceEpoch(),
                            ),
                          );

                          household = household.copyWith(
                              rowVersion: 1,
                              tenantId:
                                  RegistrationDeliverySingleton().tenantId,
                              clientReferenceId:
                                  householdModel?.clientReferenceId ??
                                      IdGen.i.identifier,
                              memberCount: memberCount,
                              clientAuditDetails: ClientAuditDetails(
                                createdBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid
                                    .toString(),
                                createdTime: context.millisecondsSinceEpoch(),
                                lastModifiedBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid
                                    .toString(),
                                lastModifiedTime:
                                    context.millisecondsSinceEpoch(),
                              ),
                              auditDetails: AuditDetails(
                                createdBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid
                                    .toString(),
                                createdTime: context.millisecondsSinceEpoch(),
                                lastModifiedBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid
                                    .toString(),
                                lastModifiedTime:
                                    context.millisecondsSinceEpoch(),
                              ),
                              address: addressModel,
                              additionalFields: HouseholdAdditionalFields(
                                  version: 1,
                                  fields: [
                                    //[TODO: Use pregnant women form value based on project config
                                    ...?householdModel?.additionalFields?.fields
                                        .where((e) =>
                                            e.key !=
                                                AdditionalFieldsType
                                                    .pregnantWomen
                                                    .toValue() &&
                                            e.key !=
                                                AdditionalFieldsType.children
                                                    .toValue()),
                                  ]));

                          bloc.add(
                            BeneficiaryRegistrationSaveHouseholdDetailsEvent(
                              household: household,
                              registrationDate: dateOfRegistration,
                            ),
                          );
                          context.router.push(
                            IndividualDetailsRoute(isHeadOfHousehold: true),
                          );
                        },
                        editHousehold: (
                          addressModel,
                          householdModel,
                          individuals,
                          registrationDate,
                          projectBeneficiaryModel,
                          loading,
                          isHeadOfHousehold,
                        ) {
                          var household = householdModel.copyWith(
                              memberCount: memberCount,
                              address: addressModel,
                              clientAuditDetails: (householdModel
                                              .clientAuditDetails?.createdBy !=
                                          null &&
                                      householdModel.clientAuditDetails
                                              ?.createdTime !=
                                          null)
                                  ? ClientAuditDetails(
                                      createdBy: householdModel
                                          .clientAuditDetails!.createdBy,
                                      createdTime: householdModel
                                          .clientAuditDetails!.createdTime,
                                      lastModifiedBy:
                                          RegistrationDeliverySingleton()
                                              .loggedInUserUuid,
                                      lastModifiedTime:
                                          DateTime.now().millisecondsSinceEpoch,
                                    )
                                  : null,
                              rowVersion: householdModel.rowVersion,
                              additionalFields: HouseholdAdditionalFields(
                                  version: householdModel
                                          .additionalFields?.version ??
                                      1,
                                  fields: [
                                    //[TODO: Use pregnant women form value based on project config
                                    ...?householdModel.additionalFields?.fields
                                        .where((e) =>
                                            e.key !=
                                                AdditionalFieldsType
                                                    .pregnantWomen
                                                    .toValue() &&
                                            e.key !=
                                                AdditionalFieldsType.children
                                                    .toValue()),
                                  ]));

                          bloc.add(
                            BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                              household: household.copyWith(
                                clientAuditDetails: (addressModel
                                                .clientAuditDetails
                                                ?.createdBy !=
                                            null &&
                                        addressModel.clientAuditDetails
                                                ?.createdTime !=
                                            null)
                                    ? ClientAuditDetails(
                                        createdBy: addressModel
                                            .clientAuditDetails!.createdBy,
                                        createdTime: addressModel
                                            .clientAuditDetails!.createdTime,
                                        lastModifiedBy:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid,
                                        lastModifiedTime:
                                            context.millisecondsSinceEpoch(),
                                      )
                                    : null,
                              ),
                              addressModel: addressModel.copyWith(
                                clientAuditDetails: (addressModel
                                                .clientAuditDetails
                                                ?.createdBy !=
                                            null &&
                                        addressModel.clientAuditDetails
                                                ?.createdTime !=
                                            null)
                                    ? ClientAuditDetails(
                                        createdBy: addressModel
                                            .clientAuditDetails!.createdBy,
                                        createdTime: addressModel
                                            .clientAuditDetails!.createdTime,
                                        lastModifiedBy:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid,
                                        lastModifiedTime:
                                            context.millisecondsSinceEpoch(),
                                      )
                                    : null,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        registrationState.mapOrNull(
                              editHousehold: (value) => localizations
                                  .translate(i18.common.coreCommonSave),
                            ) ??
                            localizations
                                .translate(i18.householdDetails.actionLabel),
                      ),
                    ),
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
                              i18.householdDetails.householdDetailsLabel,
                            ),
                            headingStyle: theme.textTheme.displayMedium,
                            body: localizations.translate(
                              i18.householdDetails.householdDetailsDescription,
                            ),
                          ),
                          Column(children: [
                            householdDetailsShowcaseData.dateOfRegistration
                                .buildWith(
                              child: DigitDateFormPicker(
                                isEnabled: false,
                                formControlName: _dateOfRegistrationKey,
                                label: localizations.translate(
                                  i18.householdDetails.dateOfRegistrationLabel,
                                ),
                                isRequired: false,
                                confirmText: localizations.translate(
                                  i18.common.coreCommonOk,
                                ),
                                cancelText: localizations.translate(
                                  i18.common.coreCommonCancel,
                                ),
                              ),
                            ),
                            //[TODO: Use pregnant women form value based on project config
                            // Info removed maximum value 30 , as mentioned in ticket
                            householdDetailsShowcaseData
                                .numberOfMembersLivingInHousehold
                                .buildWith(
                              child: DigitIntegerFormPicker(
                                minimum: 1,
                                form: form,
                                formControlName: _memberCountKey,
                                label: localizations.translate(
                                  i18.householdDetails.noOfMembersCountLabel,
                                ),
                                incrementer: true,
                              ),
                            ),
                          ]),
                          const SizedBox(height: 16),
                        ],
                      ),
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

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final household = state.mapOrNull(editHousehold: (value) {
      return value.householdModel;
    }, create: (value) {
      return value.householdModel;
    });

    final registrationDate = state.mapOrNull(
      editHousehold: (value) {
        return value.registrationDate;
      },
      create: (value) => DateTime.now(),
    );

    return fb.group(<String, Object>{
      _dateOfRegistrationKey:
          FormControl<DateTime>(value: registrationDate, validators: []),
      _memberCountKey: FormControl<int>(
        value: household?.memberCount ?? 1,
      ),
    });
  }
}
