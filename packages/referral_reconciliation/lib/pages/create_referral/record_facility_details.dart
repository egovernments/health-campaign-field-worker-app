import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_enums.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:referral_reconciliation/utils/constants.dart';

import '../../../utils/date_utils.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/referral_recon_record.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class ReferralFacilityPage extends LocalizedStatefulWidget {
  final bool isEditing;

  const ReferralFacilityPage(
      {super.key, super.appLocalizations, this.isEditing = false});

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
    final textTheme = theme.digitTextTheme(context);
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
                            enableFixedDigitButton: true,
                            header: const Column(children: [
                              BackNavigationHelpHeaderWidget(),
                            ]),
                            footer: DigitCard(
                                margin: EdgeInsets.fromLTRB(
                                    0, theme.spacerTheme.spacer2, 0, 0),
                                cardType: CardType.primary,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: clickedStatus,
                                    builder: (context, bool isClicked, _) {
                                      return DigitButton(
                                        size: DigitButtonSize.large,
                                        label: localizations.translate(
                                          i18.common.coreCommonNext,
                                        ),
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
                                                  cycles:
                                                      ReferralReconSingleton()
                                                          .cycles,
                                                ),
                                              );
                                            } else {
                                              final evaluationFacility =
                                                  selectedProjectFacilityId;
                                              if (evaluationFacility == null) {
                                                Toast.showToast(
                                                  context,
                                                  message: localizations
                                                      .translate(i18
                                                          .referralReconciliation
                                                          .facilityIsMandatory),
                                                  type: ToastType.error,
                                                );
                                              } else {
                                                final dateOfEvaluation = form
                                                    .control(
                                                        _dateOfEvaluationKey)
                                                    .value as DateTime;
                                                final hfCoordinator = form
                                                    .control(_hfCoordinatorKey)
                                                    .value as String?;
                                                final referredByTeam = form
                                                    .control(_referredByKey)
                                                    .value as String?;

                                                final event = context.read<
                                                    RecordHFReferralBloc>();
                                                event.add(
                                                  RecordHFReferralSaveFacilityDetailsEvent(
                                                    dateOfEvaluation:
                                                        dateOfEvaluation,
                                                    facilityId:
                                                        evaluationFacility
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
                                                  cycles:
                                                      ReferralReconSingleton()
                                                          .cycles,
                                                ));
                                              }
                                            }
                                          }
                                        },
                                        type: DigitButtonType.primary,
                                        mainAxisSize: MainAxisSize.max,
                                      );
                                    },
                                  ),
                                ]),
                            slivers: [
                              SliverToBoxAdapter(
                                child: DigitCard(
                                    cardType: CardType.primary,
                                    margin: const EdgeInsets.all(spacer2),
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
                                              style: textTheme.headingXl,
                                            ),
                                          ),
                                        ],
                                      ),
                                      ReactiveWrapperField<String>(
                                          formControlName:
                                              _administrativeUnitKey,
                                          builder: (field) {
                                            return LabeledField(
                                              isRequired: true,
                                              label: localizations.translate(
                                                i18.referralReconciliation
                                                    .administrationUnitFormLabel,
                                              ),
                                              child: DigitTextFormInput(
                                                readOnly: true,
                                                initialValue: field.value,
                                              ),
                                            );
                                          }),
                                      ReactiveWrapperField(
                                          formControlName: _dateOfEvaluationKey,
                                          validationMessages: {
                                            'required': (_) =>
                                                localizations.translate(
                                                  i18.common.corecommonRequired,
                                                ),
                                          },
                                          showErrors: (control) =>
                                              control.invalid &&
                                              control.touched,
                                          // Ensures error is shown if invalid and touched
                                          builder: (field) {
                                            return LabeledField(
                                              isRequired: true,
                                              label: localizations.translate(
                                                i18.referralReconciliation
                                                    .dateOfEvaluationLabel,
                                              ),
                                              child: DigitDateFormInput(
                                                onChange: (val) => {
                                                  form
                                                      .control(
                                                          _dateOfEvaluationKey)
                                                      .markAsTouched(),
                                                  form
                                                          .control(
                                                              _dateOfEvaluationKey)
                                                          .value =
                                                      DigitDateUtils
                                                          .getFormattedDateToDateTime(
                                                              val),
                                                },
                                                readOnly: viewOnly,
                                                errorMessage: field.errorText,
                                                initialValue: DigitDateUtils
                                                    .getDateString(form
                                                        .control(
                                                            _dateOfEvaluationKey)
                                                        .value),
                                                lastDate: DateTime.now(),
                                                cancelText:
                                                    localizations.translate(
                                                  i18.common.coreCommonCancel,
                                                ),
                                                confirmText:
                                                    localizations.translate(
                                                  i18.common.coreCommonOk,
                                                ),
                                              ),
                                            );
                                          }),
                                      ReactiveWrapperField(
                                        formControlName: _evaluationFacilityKey,
                                        validationMessages: {
                                          'required': (_) =>
                                              localizations.translate(
                                                i18.referralReconciliation
                                                    .facilityValidationMessage,
                                              ),
                                        },
                                        showErrors: (control) =>
                                            control.invalid && control.touched,
                                        // Ensures error is shown if invalid and touched
                                        builder: (field) => LabeledField(
                                          isRequired: true,
                                          label: localizations.translate(
                                            i18.referralReconciliation
                                                .evaluationFacilityLabel,
                                          ),
                                          child: DigitDropdown(
                                            errorMessage: field.errorText,
                                            sentenceCaseEnabled: false,
                                            isDisabled: viewOnly,
                                            selectedOption: DropdownItem(
                                              name: form
                                                      .control(
                                                          _evaluationFacilityKey)
                                                      .value ??
                                                  '',
                                              code: form
                                                      .control(
                                                          _evaluationFacilityKey)
                                                      .value ??
                                                  '',
                                            ),
                                            items: facilities.map((e) {
                                              return DropdownItem(
                                                name: localizations.translate(
                                                  '$projectFacilityPrefix${e.id}',
                                                ),
                                                code: e.id,
                                              );
                                            }).toList(),
                                            readOnly: viewOnly,
                                            onSelect: (value) {
                                              form
                                                      .control(
                                                        _evaluationFacilityKey,
                                                      )
                                                      .value =
                                                  localizations.translate(
                                                      'PJ_FAC_${value.code}');

                                              setState(() {
                                                selectedProjectFacilityId =
                                                    value.code;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      ReactiveWrapperField<String>(
                                          formControlName: _hfCoordinatorKey,
                                          builder: (field) {
                                            return LabeledField(
                                                label: localizations.translate(
                                                  i18.referralReconciliation
                                                      .healthFacilityCoordinatorLabel,
                                                ),
                                                child: DigitTextFormInput(
                                                  onChange: (val) => {
                                                    form
                                                        .control(
                                                            _hfCoordinatorKey)
                                                        .markAsTouched(),
                                                    form
                                                        .control(
                                                            _hfCoordinatorKey)
                                                        .value = val,
                                                  },
                                                  readOnly: viewOnly,
                                                  initialValue: form
                                                      .control(
                                                          _hfCoordinatorKey)
                                                      .value,
                                                ));
                                          }),
                                      ReactiveWrapperField<String>(
                                          formControlName: _referredByKey,
                                          builder: (field) {
                                            return LabeledField(
                                                label: localizations.translate(
                                                  i18.referralReconciliation
                                                      .referredByTeamCodeLabel,
                                                ),
                                                child: DigitTextFormInput(
                                                  onChange: (val) => {
                                                    form
                                                        .control(_referredByKey)
                                                        .markAsTouched(),
                                                    form
                                                        .control(_referredByKey)
                                                        .value = val,
                                                  },
                                                  readOnly: viewOnly,
                                                  initialValue: form
                                                      .control(_referredByKey)
                                                      .value,
                                                ));
                                          }),
                                    ]),
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
