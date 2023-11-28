import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../router/app_router.dart';
import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/household_overview/household_overview.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

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
                      !widget.isHousholdDelete
                          ? context.read<HouseholdOverviewBloc>().add(
                                HouseholdOverviewDeleteIndividualEvent(
                                  projectId: ctx.projectId,
                                  householdModel:
                                      state.householdMemberWrapper.household,
                                  individualModel: state.selectedIndividual!,
                                  projectBeneficiaryType:
                                      context.beneficiaryType,
                                ),
                              )
                          : context.read<HouseholdOverviewBloc>().add(
                                HouseholdOverviewDeleteHouseholdEvent(
                                  projectId: context.projectId,
                                  householdModel:
                                      state.householdMemberWrapper.household,
                                  members: state.householdMemberWrapper.members,
                                  projectBeneficiaryModel: state
                                      .householdMemberWrapper
                                      .projectBeneficiaries
                                      .first,
                                  projectBeneficiaryType:
                                      context.beneficiaryType,
                                ),
                              );

                      context.router.pop();

                      if (widget.isHousholdDelete) {
                        (context.router.parent() as StackRouter).pop();
                      }
                      context.router.push(AcknowledgementRoute());
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
                child:
                    BlocBuilder<AppInitializationBloc, AppInitializationState>(
                  builder: (context, state) {
                    if (state is! AppInitialized) return const Offstage();

                    final householdMemberDeletionReasonOptions = state
                            .appConfiguration
                            .householdMemberDeletionReasonOptions ??
                        <HouseholdMemberDeletionReasonOptions>[];

                    final householdDeletionReasonOptions =
                        state.appConfiguration.householdDeletionReasonOptions ??
                            <HouseholdDeletionReasonOptions>[];

                    return Column(
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
                                ? householdDeletionReasonOptions
                                    .map((e) => ReactiveRadioListTile(
                                          title: Text(
                                            localizations.translate(e.name),
                                          ),
                                          value: e.code,
                                          formControlName:
                                              _reasonForDeletionKey,
                                        ))
                                    .toList()
                                : householdMemberDeletionReasonOptions
                                    .map((e) => ReactiveRadioListTile(
                                          title: Text(
                                            localizations.translate(e.name),
                                          ),
                                          value: e.code,
                                          formControlName:
                                              _reasonForDeletionKey,
                                        ))
                                    .toList(),
                          ),
                        ),
                      ],
                    );
                  },
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
