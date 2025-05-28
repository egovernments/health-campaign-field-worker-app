import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/household_overview/household_overview.dart';
import '../router/registration_router.gm.dart';
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
  State<ReasonForDeletionPage> createState() => ReasonForDeletionPageState();
}

class ReasonForDeletionPageState extends LocalizedState<ReasonForDeletionPage> {
  static const _reasonForDeletionKey = 'reasonForDeletion';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(context),
        builder: (context, form, child) {
          return ScrollableContent(
            footer: DigitCard(
                margin: const EdgeInsets.only(top: spacer2),
                padding: const EdgeInsets.all(spacer2),
                children: [
                  BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                    builder: (ctx, state) {
                      if (state.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return DigitButton(
                        label: localizations
                            .translate(i18.householdLocation.actionLabel),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () {
                          if (form.valid) {
                            !widget.isHousholdDelete
                                ? context.read<HouseholdOverviewBloc>().add(
                                      HouseholdOverviewDeleteIndividualEvent(
                                        projectId:
                                            RegistrationSingleton()
                                                .projectId!,
                                        householdModel: state
                                            .householdMemberWrapper.household!,
                                        individualModel:
                                            state.selectedIndividual!,
                                        projectBeneficiaryType:
                                            RegistrationSingleton()
                                                .beneficiaryType!,
                                      ),
                                    )
                                : context.read<HouseholdOverviewBloc>().add(
                                      HouseholdOverviewDeleteHouseholdEvent(
                                        projectId:
                                            RegistrationSingleton()
                                                .projectId!,
                                        householdModel: state
                                            .householdMemberWrapper.household!,
                                        members: state
                                            .householdMemberWrapper.members!,
                                        projectBeneficiaryModel: state
                                            .householdMemberWrapper
                                            .projectBeneficiaries!
                                            .first,
                                        projectBeneficiaryType:
                                            RegistrationSingleton()
                                                .beneficiaryType!,
                                      ),
                                    );

                            // context.router.maybePop();
                            final parent =
                                context.router.parent() as StackRouter;

                            if (widget.isHousholdDelete) {
                              (context.router.parent() as StackRouter)
                                  .maybePop();
                            }
                            parent.popUntil((route) =>
                                route.settings.name ==
                                BeneficiaryWrapperRoute.name);
                            final reloadState =
                                context.read<HouseholdOverviewBloc>();
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                reloadState.add(
                                  HouseholdOverviewReloadEvent(
                                    projectId: RegistrationSingleton()
                                        .projectId!,
                                    projectBeneficiaryType:
                                        RegistrationSingleton()
                                            .beneficiaryType!,
                                  ),
                                );
                              },
                            ).then(
                              (value) => context.router.push(
                                HouseholdAcknowledgementRoute(
                                  enableViewHousehold: true,
                                ),
                              ),
                            );
                          } else {
                            Toast.showToast(context,
                                message: localizations
                                    .translate(i18.common.corecommonRequired),
                                type: ToastType.error);
                          }
                        },
                      );
                    },
                  ),
                ]),
            header: const Column(children: [
              BackNavigationHelpHeaderWidget(),
            ]),
            children: [
              DigitCard(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    localizations.translate(
                      i18.reasonForDeletion.reasonForDeletionLabel,
                    ),
                    style: textTheme.headingXl,
                  ),
                ),
                Column(
                  children: widget.isHousholdDelete
                      ? RegistrationSingleton()
                          .householdDeletionReasonOptions!
                          .map((e) => ReactiveRadioListTile(
                                title: Text(
                                  localizations.translate(e),
                                ),
                                value: e,
                                formControlName: _reasonForDeletionKey,
                              ))
                          .toList()
                      : RegistrationSingleton()
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
              ]),
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
