import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/hf_referrals/record_referral.dart';
import '../../../blocs/project_facility/project_facility.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';
import '../../inventory/project_facility_selection.dart';

class ReferralFacilityPage extends LocalizedStatefulWidget {
  final bool isEditing;

  const ReferralFacilityPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
  });

  @override
  State<ReferralFacilityPage> createState() => _ReferralFacilityPageState();
}

class _ReferralFacilityPageState extends LocalizedState<ReferralFacilityPage> {
  static const _dateOfEvaluationKey = 'dateOfEvaluation';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _hfCoordinatorKey = 'healthFacilityCoordinatorKey';
  static const _evaluationFacilityKey = 'evaluationFacility';
  static const _referredByKey = 'referredBy';
  final clickedStatus = ValueNotifier<bool>(false);

  @override
  void dispose() {
    clickedStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final router = context.router;

    return BlocConsumer<ProjectFacilityBloc, ProjectFacilityState>(
      listener: (context, state) {
        state.whenOrNull(
          empty: () => false,
        );
      },
      builder: (ctx, facilityState) {
        return facilityState.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          fetched: (facilities) {
            final projectFacilities = facilities
                .where((e) => e.id != 'N/A' && e.id != 'Delivery Team')
                .toList();

            return Scaffold(
              body: BlocBuilder<RecordHFReferralBloc, RecordHFReferralState>(
                builder: (context, recordState) {
                  final bool viewOnly = recordState.mapOrNull(
                        create: (value) => value.viewOnly,
                      ) ??
                      false;

                  return ReactiveFormBuilder(
                    form: () => buildForm(recordState, projectFacilities),
                    builder: (context, form, child) => ScrollableContent(
                      enableFixedButton: true,
                      header: const Column(children: [
                        BackNavigationHelpHeaderWidget(),
                      ]),
                      footer: DigitCard(
                        margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                        padding:
                            const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                        child: ValueListenableBuilder(
                          valueListenable: clickedStatus,
                          builder: (context, bool isClicked, _) {
                            return DigitElevatedButton(
                              onPressed: () {
                                form.markAllAsTouched();
                                if (!form.valid) {
                                  return;
                                } else {
                                  clickedStatus.value = true;
                                  if (viewOnly) {
                                    context.router.push(
                                      RecordReferralDetailsRoute(),
                                    );
                                  } else {
                                    final evaluationFacility = form
                                        .control(_evaluationFacilityKey)
                                        .value as ProjectFacilityModel;
                                    final dateOfEvaluation = form
                                        .control(_dateOfEvaluationKey)
                                        .value as DateTime;
                                    final hfCoordinator = form
                                        .control(_hfCoordinatorKey)
                                        .value as String?;
                                    final referredByTeam = form
                                        .control(_referredByKey)
                                        .value as String?;

                                    final event =
                                        context.read<RecordHFReferralBloc>();
                                    event.add(
                                      RecordHFReferralSaveFacilityDetailsEvent(
                                        dateOfEvaluation: dateOfEvaluation,
                                        facilityId: evaluationFacility.id,
                                        healthFacilityCord: hfCoordinator,
                                        referredBy: referredByTeam,
                                      ),
                                    );

                                    context.router.push(
                                      RecordReferralDetailsRoute(),
                                    );
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  localizations.translate(
                                    i18.common.coreCommonNext,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      slivers: [
                        SliverToBoxAdapter(
                          child: DigitCard(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        localizations.translate(
                                          i18.referBeneficiary.facilityDetails,
                                        ),
                                        style: theme.textTheme.displayMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(children: [
                                  DigitTextFormField(
                                    formControlName: _administrativeUnitKey,
                                    label: localizations.translate(
                                      i18.referBeneficiary
                                          .administrationUnitFormLabel,
                                    ),
                                    isRequired: true,
                                    readOnly: true,
                                  ),
                                  DigitDateFormPicker(
                                    formControlName: _dateOfEvaluationKey,
                                    label: localizations.translate(
                                      i18.referBeneficiary
                                          .dateOfEvaluationLabel,
                                    ),
                                    isEnabled: !viewOnly,
                                    isRequired: true,
                                    initialDate: DateTime.now(),
                                    cancelText: localizations.translate(
                                      i18.common.coreCommonCancel,
                                    ),
                                    confirmText: localizations.translate(
                                      i18.common.coreCommonOk,
                                    ),
                                    padding: const EdgeInsets.only(
                                      bottom: kPadding,
                                      top: kPadding,
                                    ),
                                    lastDate: DateTime.now(),
                                    validationMessages: {
                                      'required': (_) =>
                                          localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                    },
                                  ),
                                  InkWell(
                                    onTap: viewOnly
                                        ? null
                                        : () async {
                                            final parent = context.router
                                                .parent() as StackRouter;
                                            final facility = await parent
                                                .push<ProjectFacilityModel>(
                                              ProjectFacilitySelectionRoute(
                                                projectFacilities:
                                                    projectFacilities,
                                              ),
                                            );

                                            if (facility == null) return;
                                            form
                                                .control(
                                                  _evaluationFacilityKey,
                                                )
                                                .value = facility;
                                          },
                                    child: IgnorePointer(
                                      child: DigitTextFormField(
                                        hideKeyboard: true,
                                        readOnly: viewOnly,
                                        valueAccessor:
                                            ProjectFacilityValueAccessor(
                                          projectFacilities,
                                        ),
                                        label: localizations.translate(
                                          i18.referBeneficiary
                                              .evaluationFacilityLabel,
                                        ),
                                        isRequired: true,
                                        suffix: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.search),
                                        ),
                                        formControlName: _evaluationFacilityKey,
                                        validationMessages: {
                                          'required': (_) =>
                                              localizations.translate(
                                                i18.referBeneficiary
                                                    .facilityValidationMessage,
                                              ),
                                        },
                                        onTap: viewOnly
                                            ? null
                                            : () async {
                                                final parent = context.router
                                                    .parent() as StackRouter;
                                                final facility = await parent
                                                    .push<FacilityModel>(
                                                  ProjectFacilitySelectionRoute(
                                                    projectFacilities:
                                                        projectFacilities,
                                                  ),
                                                );

                                                if (facility == null) return;
                                                form
                                                    .control(
                                                      _evaluationFacilityKey,
                                                    )
                                                    .value = facility;
                                              },
                                      ),
                                    ),
                                  ),
                                  DigitTextFormField(
                                    formControlName: _hfCoordinatorKey,
                                    label: localizations.translate(
                                      i18.referBeneficiary
                                          .healthFacilityCoordinatorLabel,
                                    ),
                                    // validationMessages: {
                                    //   'required': (_) =>
                                    //       localizations.translate(
                                    //         i18.common.corecommonRequired,
                                    //       ),
                                    // },
                                    // isRequired: true,
                                    readOnly: viewOnly,
                                  ),
                                  DigitTextFormField(
                                    formControlName: _referredByKey,
                                    label: localizations.translate(
                                      i18.referBeneficiary
                                          .referredByTeamCodeLabel,
                                    ),
                                    readOnly: viewOnly,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  FormGroup buildForm(
    RecordHFReferralState referralState,
    List<ProjectFacilityModel> facilities,
  ) {
    final dateOfEvaluation = referralState.mapOrNull(
      create: (value) => value.viewOnly
          ? DigitDateUtils.getFormattedDateToDateTime(
              DigitDateUtils.getDateFromTimestamp(
                value.hfReferralModel?.additionalFields?.fields
                    .where((e) =>
                        e.key ==
                        AdditionalFieldsType.dateOfEvaluation.toValue())
                    .first
                    .value,
                dateFormat: 'dd/MM/yyyy',
              ),
            )
          : DateTime.now(),
    );

    return fb.group(<String, Object>{
      _dateOfEvaluationKey: FormControl<DateTime>(
        value: dateOfEvaluation,
        validators: [Validators.max(DateTime.now()), Validators.required],
      ),
      _administrativeUnitKey: FormControl<String>(
        value: context.boundary.name,
        validators: [
          Validators.required,
        ],
      ),
      _hfCoordinatorKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly
              ? value.hfReferralModel?.additionalFields?.fields
                  .where((e) =>
                      e.key == AdditionalFieldsType.hFCoordinator.toValue())
                  .first
                  .value
              : context.loggedInUser.name,
        ),
        // validators: [
        //   Validators.required,
        // ],
      ),
      _evaluationFacilityKey: FormControl<ProjectFacilityModel>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly
              ? facilities
                  .where(
                    (e) => e.id == value.hfReferralModel?.projectFacilityId,
                  )
                  .first
              : null,
        ),
        validators: [Validators.required],
      ),
      _referredByKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly &&
                  (value.hfReferralModel?.additionalFields?.fields
                              .where(
                                (e) =>
                                    e.key ==
                                    AdditionalFieldsType.referredBy.toValue(),
                              )
                              .toList() ??
                          [])
                      .isNotEmpty
              ? value.hfReferralModel?.additionalFields?.fields
                  .where(
                    (e) => e.key == AdditionalFieldsType.referredBy.toValue(),
                  )
                  .first
                  .value
              : null,
        ),
      ),
    });
  }
}
