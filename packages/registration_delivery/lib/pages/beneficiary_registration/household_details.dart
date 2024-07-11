import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/household.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseHoldDetailsPage extends LocalizedStatefulWidget {
  const HouseHoldDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseHoldDetailsPage> createState() => _HouseHoldDetailsPageState();
}

class _HouseHoldDetailsPageState extends LocalizedState<HouseHoldDetailsPage> {
  static const _dateOfRegistrationKey = 'dateOfRegistration';
  static const _memberCountKey = 'memberCount';
  static const _pregnantWomenCountKey = 'pregnantWomenCount';
  static const _childrenCountKey = 'childrenCount';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) => BlocBuilder<
            BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
          builder: (context, registrationState) {
            return ScrollableContent(
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  showcaseButton: ShowcaseButton(),
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

                    final dateOfRegistration =
                        form.control(_dateOfRegistrationKey).value as DateTime;
                    //[TODO: Use pregnant women form value based on project config
                    final pregnantWomen =
                        form.control(_pregnantWomenCountKey).value as int;
                    final children =
                        form.control(_childrenCountKey).value as int;

                    registrationState.maybeWhen(
                      orElse: () {
                        return;
                      },
                      create: (
                        addressModel,
                        householdModel,
                        individualModel,
                        registrationDate,
                        searchQuery,
                        loading,
                        isHeadOfHousehold,
                      ) {
                        var household = householdModel;
                        household ??= HouseholdModel(
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
                            lastModifiedTime: context.millisecondsSinceEpoch(),
                          ),
                          auditDetails: AuditDetails(
                            createdBy: RegistrationDeliverySingleton()
                                .loggedInUserUuid!,
                            createdTime: context.millisecondsSinceEpoch(),
                            lastModifiedBy: RegistrationDeliverySingleton()
                                .loggedInUserUuid,
                            lastModifiedTime: context.millisecondsSinceEpoch(),
                          ),
                        );

                        household = household.copyWith(
                            rowVersion: 1,
                            tenantId: RegistrationDeliverySingleton().tenantId,
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
                            additionalFields:
                                HouseholdAdditionalFields(version: 1, fields: [
                              //[TODO: Use pregnant women form value based on project config
                              ...?householdModel?.additionalFields?.fields,
                              AdditionalField(
                                AdditionalFieldsType.pregnantWomen.toValue(),
                                pregnantWomen,
                              ),
                              AdditionalField(
                                AdditionalFieldsType.children.toValue(),
                                children,
                              )
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
                      ) {
                        var household = householdModel.copyWith(
                            memberCount: memberCount,
                            address: addressModel,
                            clientAuditDetails: (householdModel
                                            .clientAuditDetails?.createdBy !=
                                        null &&
                                    householdModel
                                            .clientAuditDetails?.createdTime !=
                                        null)
                                ? ClientAuditDetails(
                                    createdBy: householdModel
                                        .clientAuditDetails!.createdBy,
                                    createdTime: householdModel
                                        .clientAuditDetails!.createdTime,
                                    lastModifiedBy: householdModel
                                        .clientAuditDetails!.lastModifiedBy,
                                    lastModifiedTime:
                                        DateTime.now().millisecondsSinceEpoch,
                                  )
                                : null,
                            rowVersion: householdModel.rowVersion,
                            additionalFields: HouseholdAdditionalFields(
                                version:
                                    householdModel.additionalFields?.version ??
                                        1,
                                fields: [
                                  //[TODO: Use pregnant women form value based on project config
                                  AdditionalField(
                                    AdditionalFieldsType.pregnantWomen
                                        .toValue(),
                                    pregnantWomen,
                                  ),
                                  AdditionalField(
                                    AdditionalFieldsType.children.toValue(),
                                    children,
                                  )
                                ]));

                        bloc.add(
                          BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                            household: household.copyWith(
                              clientAuditDetails:
                                  (addressModel.clientAuditDetails?.createdBy !=
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
                              clientAuditDetails:
                                  (addressModel.clientAuditDetails?.createdBy !=
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
                          //[TODO: Use pregnant women form value based on project config
                          householdDetailsShowcaseData
                              .numberOfPregnantWomenInHousehold
                              .buildWith(
                            child: DigitIntegerFormPicker(
                              minimum: 0,
                              form: form,
                              formControlName: _pregnantWomenCountKey,
                              label: localizations.translate(
                                i18.householdDetails
                                    .noOfPregnantWomenCountLabel,
                              ),
                              incrementer: true,
                            ),
                          ),
                          householdDetailsShowcaseData
                              .numberOfChildrenBelow5InHousehold
                              .buildWith(
                            child: DigitIntegerFormPicker(
                              minimum: 0,
                              form: form,
                              formControlName: _childrenCountKey,
                              label: localizations.translate(
                                i18.householdDetails
                                    .noOfChildrenBelow5YearsLabel,
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
        ),
      ),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final household = state.mapOrNull(
      editHousehold: (value) {
        return value.householdModel;
      },
    );

    final registrationDate = state.mapOrNull(
      editHousehold: (value) {
        return value.registrationDate;
      },
      create: (value) => DateTime.now(),
    );

    return fb.group(<String, Object>{
      _dateOfRegistrationKey:
          FormControl<DateTime>(value: registrationDate, validators: []),
      _memberCountKey: FormControl<int>(value: household?.memberCount ?? 1),
      _pregnantWomenCountKey: FormControl<int>(
          value: household?.additionalFields?.fields
                      .where((h) =>
                          h.key == AdditionalFieldsType.pregnantWomen.toValue())
                      .firstOrNull
                      ?.value !=
                  null
              ? int.tryParse(household?.additionalFields?.fields
                      .where((h) =>
                          h.key == AdditionalFieldsType.pregnantWomen.toValue())
                      .firstOrNull
                      ?.value
                      .toString() ??
                  '0')
              : 0),
      _childrenCountKey: FormControl<int>(
          value: household?.additionalFields?.fields
                      .where((h) =>
                          h.key == AdditionalFieldsType.children.toValue())
                      .firstOrNull
                      ?.value !=
                  null
              ? int.tryParse(household?.additionalFields?.fields
                      .where((h) =>
                          h.key == AdditionalFieldsType.children.toValue())
                      .firstOrNull
                      ?.value
                      .toString() ??
                  '0')
              : 0)
    });
  }
}
