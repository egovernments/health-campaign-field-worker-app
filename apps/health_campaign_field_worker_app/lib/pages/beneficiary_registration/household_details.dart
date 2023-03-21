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
              header: Column(children: const [
                BackNavigationHelpHeaderWidget(),
              ]),
              footer: SizedBox(
                height: 90,
                child: DigitCard(
                  child: DigitElevatedButton(
                    onPressed: () {
                      form.markAllAsTouched();
                      if (!form.valid) return;

                      final memberCount =
                          form.control(_memberCountKey).value as int;

                      final dateOfRegistration = form
                          .control(_dateOfRegistrationKey)
                          .value as DateTime;

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
                            auditDetails: AuditDetails(
                              createdBy: context.loggedInUserUuid,
                              createdTime: context.millisecondsSinceEpoch(),
                            ),
                          );

                          household = household.copyWith(
                            memberCount: memberCount,
                            address: addressModel,
                          );

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
                          loading,
                        ) {
                          var household = householdModel.copyWith(
                            memberCount: memberCount,
                            address: addressModel,
                            rowVersion: householdModel.rowVersion,
                          );

                          bloc.add(
                            BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                              household: household,
                              addressModel: addressModel,
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
              ),
              children: [
                DigitCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localizations.translate(
                          i18.householdDetails.householdDetailsLabel,
                        ),
                        style: theme.textTheme.displayMedium,
                      ),
                      Column(children: [
                        DigitDateFormPicker(
                          isEnabled: false,
                          formControlName: _dateOfRegistrationKey,
                          label: localizations.translate(
                            i18.householdDetails.dateOfRegistrationLabel,
                          ),
                          isRequired: false,
                        ),
                        DigitIntegerFormPicker(
                          minimum: 1,
                          form: form,
                          formControlName: _memberCountKey,
                          label: localizations.translate(
                            i18.householdDetails.noOfMembersCountLabel,
                          ),
                          incrementer: true,
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
