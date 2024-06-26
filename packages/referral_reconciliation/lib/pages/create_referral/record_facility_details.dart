import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_enums.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:referral_reconciliation/utils/constants.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/referral_recon_record.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../project_facility/project_facility_selection.dart';

@RoutePage()
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
  String? selectedProjectFacilityId;

  @override
  void dispose() {
    clickedStatus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final referralState = context.read<RecordHFReferralBloc>().state;
    setState(() {
      selectedProjectFacilityId = referralState.mapOrNull(
        create: (value) =>
            value.viewOnly ? value.hfReferralModel?.projectFacilityId : null,
      );
    });
    super.initState();
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

            return facilities.isNotEmpty
                ? Scaffold(
                    body: BlocBuilder<RecordHFReferralBloc,
                        RecordHFReferralState>(
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
                              margin:
                                  const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                              padding: const EdgeInsets.fromLTRB(
                                  kPadding, 0, kPadding, 0),
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
                                            RecordReferralDetailsRoute(
                                              projectId:
                                                  ReferralReconSingleton()
                                                      .projectId,
                                              cycles: ReferralReconSingleton()
                                                  .cycles,
                                            ),
                                          );
                                        } else {
                                          final evaluationFacility =
                                              selectedProjectFacilityId;
                                          if (evaluationFacility == null) {
                                            DigitToast.show(
                                              context,
                                              options: DigitToastOptions(
                                                'Facility is mandatory',
                                                true,
                                                theme,
                                              ),
                                            );
                                          } else {
                                            final dateOfEvaluation = form
                                                .control(_dateOfEvaluationKey)
                                                .value as DateTime;
                                            final hfCoordinator = form
                                                .control(_hfCoordinatorKey)
                                                .value as String?;
                                            final referredByTeam = form
                                                .control(_referredByKey)
                                                .value as String?;

                                            final event = context
                                                .read<RecordHFReferralBloc>();
                                            event.add(
                                              RecordHFReferralSaveFacilityDetailsEvent(
                                                dateOfEvaluation:
                                                    dateOfEvaluation,
                                                facilityId: evaluationFacility
                                                    .toString(),
                                                healthFacilityCord:
                                                    hfCoordinator,
                                                referredBy: referredByTeam,
                                              ),
                                            );

                                            context.router.push(
                                                RecordReferralDetailsRoute(
                                              projectId:
                                                  ReferralReconSingleton()
                                                      .projectId,
                                              cycles: ReferralReconSingleton()
                                                  .cycles,
                                            ));
                                          }
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
                                                i18.referralReconciliation
                                                    .facilityDetails,
                                              ),
                                              style:
                                                  theme.textTheme.displayMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(children: [
                                        DigitTextFormField(
                                          formControlName:
                                              _administrativeUnitKey,
                                          label: localizations.translate(
                                            i18.referralReconciliation
                                                .administrationUnitFormLabel,
                                          ),
                                          isRequired: true,
                                          readOnly: true,
                                        ),
                                        DigitDateFormPicker(
                                          formControlName: _dateOfEvaluationKey,
                                          label: localizations.translate(
                                            i18.referralReconciliation
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
                                                  final facility =
                                                      await Navigator.of(
                                                              context)
                                                          .push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReferralReconProjectFacilitySelectionPage(
                                                        projectFacilities:
                                                            facilities,
                                                      ),
                                                    ),
                                                  );

                                                  if (facility == null) return;
                                                  form
                                                          .control(
                                                            _evaluationFacilityKey,
                                                          )
                                                          .value =
                                                      localizations.translate(
                                                          'PJ_FAC_${facility.id}');
                                                  setState(() {
                                                    selectedProjectFacilityId =
                                                        facility.id;
                                                  });
                                                },
                                          child: IgnorePointer(
                                            child: DigitTextFormField(
                                              hideKeyboard: true,
                                              readOnly: viewOnly,
                                              label: localizations.translate(
                                                i18.referralReconciliation
                                                    .evaluationFacilityLabel,
                                              ),
                                              isRequired: true,
                                              suffix: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.search),
                                              ),
                                              formControlName:
                                                  _evaluationFacilityKey,
                                              validationMessages: {
                                                'required': (_) =>
                                                    localizations.translate(
                                                      i18.referralReconciliation
                                                          .facilityValidationMessage,
                                                    ),
                                              },
                                              onTap: viewOnly
                                                  ? null
                                                  : () async {
                                                      final facility =
                                                          await Navigator.of(
                                                                  context)
                                                              .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReferralReconProjectFacilitySelectionPage(
                                                            projectFacilities:
                                                                facilities,
                                                          ),
                                                        ),
                                                      );

                                                      if (facility == null)
                                                        return;
                                                      form
                                                              .control(
                                                                _evaluationFacilityKey,
                                                              )
                                                              .value =
                                                          localizations
                                                              .translate(
                                                        'PJ_FAC_${facility.id}',
                                                      );
                                                      setState(() {
                                                        selectedProjectFacilityId =
                                                            facility.id;
                                                      });
                                                    },
                                            ),
                                          ),
                                        ),
                                        DigitTextFormField(
                                          formControlName: _hfCoordinatorKey,
                                          label: localizations.translate(
                                            i18.referralReconciliation
                                                .healthFacilityCoordinatorLabel,
                                          ),
                                          readOnly: viewOnly,
                                        ),
                                        DigitTextFormField(
                                          formControlName: _referredByKey,
                                          label: localizations.translate(
                                            i18.referralReconciliation
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
                  )
                : Center(
                    child: Text(
                      localizations.translate(
                        i18.referralReconciliation.noFacilitiesAssigned,
                      ),
                    ),
                  );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          empty: () => Center(
            child: Text(
              localizations.translate(
                i18.referralReconciliation.noFacilitiesAssigned,
              ),
            ),
          ),
        );
      },
    );
  }

  FormGroup buildForm(
    RecordHFReferralState referralState,
    List<ProjectFacilityModel> facilities,
  ) {
    final dateOfEvaluation = referralState.mapOrNull(
      create: (value) => value.viewOnly &&
              value.hfReferralModel?.additionalFields?.fields
                      .where((e) =>
                          e.key ==
                          ReferralReconEnums.dateOfEvaluation.toValue())
                      .firstOrNull
                      ?.value !=
                  null
          ? DigitDateUtils.getFormattedDateToDateTime(
              DigitDateUtils.getDateFromTimestamp(
                int.tryParse(value.hfReferralModel?.additionalFields?.fields
                            .where((e) =>
                                e.key ==
                                ReferralReconEnums.dateOfEvaluation.toValue())
                            .firstOrNull
                            ?.value
                            .toString() ??
                        '') ??
                    DateTime.now().millisecondsSinceEpoch,
                dateFormat: defaultDateFormat,
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
        value: localizations.translate(
            (ReferralReconSingleton().boundary?.code ?? '').toString()),
        validators: [
          Validators.required,
        ],
      ),
      _hfCoordinatorKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly &&
                  value.hfReferralModel?.additionalFields?.fields
                          .where((e) =>
                              e.key ==
                              ReferralReconEnums.hFCoordinator.toValue())
                          .firstOrNull
                          ?.value !=
                      null
              ? value.hfReferralModel?.additionalFields?.fields
                  .where((e) =>
                      e.key == ReferralReconEnums.hFCoordinator.toValue())
                  .firstOrNull
                  ?.value
                  .toString()
              : ReferralReconSingleton().userName,
        ),
      ),
      _evaluationFacilityKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly
              ? localizations.translate(
                  'PJ_FAC_${facilities.where(
                        (e) => e.id == value.hfReferralModel?.projectFacilityId,
                      ).first.id.toString()}',
                )
              : null,
        ),
        validators: [Validators.required],
      ),
      _referredByKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly &&
                  value.hfReferralModel?.additionalFields?.fields
                          .where((e) =>
                              e.key == ReferralReconEnums.referredBy.toValue())
                          .firstOrNull
                          ?.value !=
                      null
              ? value.hfReferralModel?.additionalFields?.fields
                  .where(
                      (e) => e.key == ReferralReconEnums.referredBy.toValue())
                  .firstOrNull
                  ?.value
                  .toString()
              : null,
        ),
      ),
    });
  }
}
