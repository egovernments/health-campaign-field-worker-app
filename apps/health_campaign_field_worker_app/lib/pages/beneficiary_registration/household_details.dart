import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

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
                          tenantId: envConfig.variables.tenantId,
                          clientReferenceId: IdGen.i.identifier,
                          rowVersion: 1,
                          clientAuditDetails: ClientAuditDetails(
                            createdBy: context.loggedInUserUuid,
                            createdTime: context.millisecondsSinceEpoch(),
                            lastModifiedBy: context.loggedInUserUuid,
                            lastModifiedTime: context.millisecondsSinceEpoch(),
                          ),
                          auditDetails: AuditDetails(
                            createdBy: context.loggedInUserUuid,
                            createdTime: context.millisecondsSinceEpoch(),
                            lastModifiedBy: context.loggedInUserUuid,
                            lastModifiedTime: context.millisecondsSinceEpoch(),
                          ),
                        );

                        household = household.copyWith(
                          memberCount: memberCount,
                          address: addressModel,
                        );

                        bloc.add(
                          BeneficiaryRegistrationSaveHouseholdDetailsEvent(
                            household: household!,
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
                          clientAuditDetails:
                              (householdModel.clientAuditDetails?.createdBy !=
                                          null &&
                                      householdModel.clientAuditDetails
                                              ?.createdTime !=
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
                        );

                        bloc.add(
                          BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                            household: household.copyWith(
                              clientAuditDetails: (addressModel
                                              .clientAuditDetails?.createdBy !=
                                          null &&
                                      addressModel.clientAuditDetails
                                              ?.createdTime !=
                                          null)
                                  ? ClientAuditDetails(
                                      createdBy: addressModel
                                          .clientAuditDetails!.createdBy,
                                      createdTime: addressModel
                                          .clientAuditDetails!.createdTime,
                                      lastModifiedBy: context.loggedInUserUuid,
                                      lastModifiedTime:
                                          context.millisecondsSinceEpoch(),
                                    )
                                  : null,
                            ),
                            addressModel: addressModel.copyWith(
                              clientAuditDetails: (addressModel
                                              .clientAuditDetails?.createdBy !=
                                          null &&
                                      addressModel.clientAuditDetails
                                              ?.createdTime !=
                                          null)
                                  ? ClientAuditDetails(
                                      createdBy: addressModel
                                          .clientAuditDetails!.createdBy,
                                      createdTime: addressModel
                                          .clientAuditDetails!.createdTime,
                                      lastModifiedBy: context.loggedInUserUuid,
                                      lastModifiedTime:
                                          context.millisecondsSinceEpoch(),
                                    )
                                  : null,
                            ),
                          ),
                        );

                        (router.parent() as StackRouter).pop();
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: kPadding),
                          child: Text(
                            localizations.translate(
                              i18.householdDetails.householdDetailsLabel,
                            ),
                            style: theme.textTheme.displayMedium,
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
    });
  }
}
