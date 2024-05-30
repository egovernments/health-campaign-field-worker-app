import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/household_overview/household_overview.dart';
import '../router/registration_delivery_router.gm.dart';
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';

@RoutePage()
class ReasonForDeletionPage extends LocalizedStatefulWidget {
  final bool isHousholdDelete;
  const ReasonForDeletionPage({
    super.key,
    super.appLocalizations,
    this.isHousholdDelete = false,
  });

  @override
  State<ReasonForDeletionPage> createState() => _ReasonForDeletionPageState();
}

class _ReasonForDeletionPageState
    extends LocalizedState<ReasonForDeletionPage> {
  static const _reasonForDeletionKey = 'reasonForDeletion';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(context),
        builder: (context, form, child) {
          return ScrollableContent(
            footer: DigitCard(
              margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
              child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                builder: (ctx, state) {
                  if (state.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return DigitElevatedButton(
                    onPressed: () {
                      if (form.valid) {
                        !widget.isHousholdDelete
                            ? context.read<HouseholdOverviewBloc>().add(
                                  HouseholdOverviewDeleteIndividualEvent(
                                    projectId: RegistrationDeliverySingleton()
                                        .projectId!,
                                    householdModel:
                                        state.householdMemberWrapper.household,
                                    individualModel: state.selectedIndividual!,
                                    projectBeneficiaryType:
                                        RegistrationDeliverySingleton()
                                            .beneficiaryType!,
                                  ),
                                )
                            : context.read<HouseholdOverviewBloc>().add(
                                  HouseholdOverviewDeleteHouseholdEvent(
                                    projectId: RegistrationDeliverySingleton()
                                        .projectId!,
                                    householdModel:
                                        state.householdMemberWrapper.household,
                                    members:
                                        state.householdMemberWrapper.members,
                                    projectBeneficiaryModel: state
                                        .householdMemberWrapper
                                        .projectBeneficiaries
                                        .first,
                                    projectBeneficiaryType:
                                        RegistrationDeliverySingleton()
                                            .beneficiaryType!,
                                  ),
                                );

                        context.router.maybePop();

                        if (widget.isHousholdDelete) {
                          (context.router.parent() as StackRouter).maybePop();
                        }
                        context.router.push(BeneficiaryAcknowledgementRoute());
                      } else {
                        DigitToast.show(context,
                            options: DigitToastOptions(
                                localizations
                                    .translate(i18.common.corecommonRequired),
                                true,
                                theme));
                      }
                    },
                    child: Center(
                      child: Text(
                        localizations
                            .translate(i18.householdLocation.actionLabel),
                      ),
                    ),
                  );
                },
              ),
            ),
            header: const Column(children: [
              BackNavigationHelpHeaderWidget(),
            ]),
            children: [
              DigitCard(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        localizations.translate(
                          i18.reasonForDeletion.reasonForDeletionLabel,
                        ),
                        style: theme.textTheme.displayMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: widget.isHousholdDelete
                            ? RegistrationDeliverySingleton()
                                .householdDeletionReasonOptions!
                                .map((e) => ReactiveRadioListTile(
                                      title: Text(
                                        localizations.translate(e),
                                      ),
                                      value: e,
                                      formControlName: _reasonForDeletionKey,
                                    ))
                                .toList()
                            : RegistrationDeliverySingleton()
                                .householdMemberDeletionReasonOptions!
                                .map((e) => ReactiveRadioListTile(
                                      title: Text(
                                        localizations.translate(e),
                                      ),
                                      value: e,
                                      formControlName: _reasonForDeletionKey,
                                    ))
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
    return fb.group(<String, Object>{
      _reasonForDeletionKey: FormControl<String>(
        validators: [Validators.required],
      ),
    });
  }
}
