import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/beneficiary_registration/beneficiary_registration_cubit.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
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

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            footer: SizedBox(
              height: 90,
              child: DigitCard(
                child: DigitElevatedButton(
                  onPressed: () {
                    if (!form.valid) return;

                    final dateOfRegistration =
                        form.control(_dateOfRegistrationKey).value as DateTime;
                    final memberCount =
                        form.control(_memberCountKey).value as int;

                    final cubit = context.read<BeneficiaryRegistrationCubit>();
                    final model = HouseholdModel(
                      tenantId: 'default',
                      clientReferenceId: Uuid().v1(),
                      memberCount: memberCount,
                      rowVersion: 1,
                      address: cubit.addressModel,
                    );
                    cubit.updateHouseholdModel(householdModel: model);

                    context.router.push(IndividualDetailsRoute());
                  },
                  child: Center(
                    child: Text(localizations
                        .translate(i18.householdDetails.actionLabel)),
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
                        minimum: 0,
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
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _dateOfRegistrationKey: FormControl<DateTime>(value: DateTime.now()),
        _memberCountKey: FormControl<int>(value: 1),
      });
}
