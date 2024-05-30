import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_enums.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:referral_reconciliation/utils/extensions/extensions.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/referral_recon_record.dart';
import '../../blocs/referral_recon_service.dart';
import '../../blocs/referral_recon_service_definition.dart';
import '../../models/entities/hf_referral.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class RecordReferralDetailsPage extends LocalizedStatefulWidget {
  final bool isEditing;
  final String projectId;
  final List<String> cycles;

  const RecordReferralDetailsPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
    required this.projectId,
    required this.cycles,
  });

  @override
  State<RecordReferralDetailsPage> createState() =>
      _RecordReferralDetailsPageState();
}

class _RecordReferralDetailsPageState
    extends LocalizedState<RecordReferralDetailsPage> {
  static const _nameOfChildKey = 'nameOfChild';
  static const _evaluationFacilityKey = 'evaluationFacility';
  static const _referralReason = 'referralReason';
  static const _referredByKey = 'referredBy';
  static const _genderKey = 'gender';
  static const _cycleKey = 'cycle';
  static const _beneficiaryIdKey = 'beneficiaryId';
  static const _referralCodeKey = 'referralCode';
  static const _ageKey = 'ageInMonths';
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

    return BlocBuilder<ReferralReconServiceDefinitionBloc,
        ReferralReconServiceDefinitionState>(
      builder: (context, state) {
        return state.map(
          empty: (value) => const Text('No Checklist'),
          isloading: (value) => const Center(
            child: CircularProgressIndicator(),
          ),
          serviceDefinitionFetch:
              (ReferralReconServiceDefinitionServiceFetchedState value) {
            return Scaffold(
              body: BlocBuilder<RecordHFReferralBloc, RecordHFReferralState>(
                builder: (context, recordState) {
                  final bool viewOnly = recordState.mapOrNull(
                        create: (value) => value.viewOnly,
                      ) ??
                      false;

                  return ReactiveFormBuilder(
                    form: () => buildForm(recordState),
                    builder: (context, form, child) {
                      form.control(_referralReason).value =
                          recordState.mapOrNull(
                        create: (value) => value.viewOnly
                            ? ReferralReconSingleton()
                                .referralReasons
                                .where(
                                    (e) => e == value.hfReferralModel?.symptom)
                                .first
                            : null,
                      );
                      return ScrollableContent(
                        enableFixedButton: true,
                        header: const Column(children: [
                          BackNavigationHelpHeaderWidget(),
                        ]),
                        footer: BlocBuilder<ReferralReconServiceBloc,
                            ReferralReconServiceState>(
                          builder: (context, serviceState) {
                            return serviceState.maybeWhen(
                              orElse: () => DigitCard(
                                margin: const EdgeInsets.fromLTRB(
                                    0, kPadding, 0, 0),
                                padding: const EdgeInsets.fromLTRB(
                                    kPadding, 0, kPadding, 0),
                                child: ValueListenableBuilder(
                                  valueListenable: clickedStatus,
                                  builder: (context, bool isClicked, _) {
                                    return DigitElevatedButton(
                                      onPressed: isClicked
                                          ? null
                                          : () {
                                              if (form
                                                      .control(_cycleKey)
                                                      .value ==
                                                  null) {
                                                clickedStatus.value = false;
                                                form
                                                    .control(_cycleKey)
                                                    .setErrors({'': true});
                                              } else if (form
                                                      .control(_genderKey)
                                                      .value ==
                                                  null) {
                                                clickedStatus.value = false;
                                                form
                                                    .control(_genderKey)
                                                    .setErrors({'': true});
                                              } else if (form
                                                      .control(_referralReason)
                                                      .value ==
                                                  null) {
                                                clickedStatus.value = false;
                                                form
                                                    .control(_referralReason)
                                                    .setErrors({'': true});
                                              }
                                              form.markAllAsTouched();

                                              if (viewOnly) {
                                                final symptom = form
                                                    .control(_referralReason)
                                                    .value as String;
                                                context
                                                    .read<
                                                        ReferralReconServiceDefinitionBloc>()
                                                    .add(
                                                      ReferralReconServiceDefinitionSelectionEvent(
                                                        serviceDefinitionCode:
                                                            symptom,
                                                      ),
                                                    );
                                                context
                                                    .read<
                                                        ReferralReconServiceBloc>()
                                                    .add(
                                                      ReferralReconServiceSearchEvent(
                                                        serviceSearchModel:
                                                            ServiceSearchModel(
                                                          clientId: recordState
                                                              .mapOrNull(
                                                            create: (value) => value
                                                                    .viewOnly
                                                                ? value
                                                                    .hfReferralModel
                                                                    ?.clientReferenceId
                                                                : null,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                context.router.push(
                                                  ReferralReasonChecklistPreviewRoute(),
                                                );
                                              } else if (!form.valid) {
                                                return;
                                              } else if (value
                                                  .serviceDefinitionList
                                                  .isEmpty) {
                                                DigitToast.show(
                                                  context,
                                                  options: DigitToastOptions(
                                                    i18.referralReconciliation
                                                        .noChecklistFound,
                                                    true,
                                                    DigitTheme
                                                        .instance.mobileTheme,
                                                  ),
                                                );
                                              } else {
                                                final hfState = BlocProvider.of<
                                                    RecordHFReferralBloc>(
                                                  context,
                                                ).state;
                                                clickedStatus.value = true;
                                                final cycle = form
                                                    .control(_cycleKey)
                                                    .value;
                                                final nameOfChild = form
                                                    .control(_nameOfChildKey)
                                                    .value as String;
                                                final age = form
                                                    .control(_ageKey)
                                                    .value as int;
                                                final gender = form
                                                    .control(_genderKey)
                                                    .value as String;
                                                final beneficiaryId = form
                                                    .control(_beneficiaryIdKey)
                                                    .value as String?;
                                                final referralCode = form
                                                    .control(_referralCodeKey)
                                                    .value as String?;
                                                final symptom = form
                                                    .control(_referralReason)
                                                    .value as String;
                                                final hfCoordinator =
                                                    hfState.mapOrNull(
                                                  create: (val) =>
                                                      val.healthFacilityCord,
                                                );
                                                final referredBy =
                                                    hfState.mapOrNull(
                                                  create: (val) =>
                                                      val.referredBy,
                                                );
                                                final dateOfEvaluation = hfState
                                                    .mapOrNull(
                                                      create: (val) =>
                                                          val.dateOfEvaluation,
                                                    )
                                                    ?.millisecondsSinceEpoch;
                                                final facilityId =
                                                    hfState.mapOrNull(
                                                  create: (val) =>
                                                      val.facilityId,
                                                );
                                                final hfClientRefId =
                                                    IdGen.i.identifier;

                                                final event = context.read<
                                                    RecordHFReferralBloc>();
                                                event.add(
                                                  RecordHFReferralCreateEntryEvent(
                                                    hfReferralModel:
                                                        HFReferralModel(
                                                      clientReferenceId:
                                                          hfClientRefId,
                                                      projectFacilityId:
                                                          facilityId,
                                                      projectId:
                                                          widget.projectId,
                                                      name: nameOfChild.trim(),
                                                      beneficiaryId:
                                                          beneficiaryId,
                                                      referralCode:
                                                          referralCode,
                                                      symptom: symptom,
                                                      tenantId:
                                                          ReferralReconSingleton()
                                                              .tenantId,
                                                      rowVersion: 1,
                                                      auditDetails:
                                                          AuditDetails(
                                                        createdBy:
                                                            ReferralReconSingleton()
                                                                .userUUid,
                                                        createdTime: context
                                                            .millisecondsSinceEpoch(),
                                                        lastModifiedBy:
                                                            ReferralReconSingleton()
                                                                .userUUid,
                                                        lastModifiedTime: context
                                                            .millisecondsSinceEpoch(),
                                                      ),
                                                      clientAuditDetails:
                                                          ClientAuditDetails(
                                                        createdBy:
                                                            ReferralReconSingleton()
                                                                .userUUid,
                                                        createdTime: context
                                                            .millisecondsSinceEpoch(),
                                                        lastModifiedBy:
                                                            ReferralReconSingleton()
                                                                .userUUid,
                                                        lastModifiedTime: context
                                                            .millisecondsSinceEpoch(),
                                                      ),
                                                      additionalFields:
                                                          HFReferralAdditionalFields(
                                                        version: 1,
                                                        fields: [
                                                          if (hfCoordinator !=
                                                                  null &&
                                                              hfCoordinator
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty)
                                                            AdditionalField(
                                                              ReferralReconEnums
                                                                  .hFCoordinator
                                                                  .toValue(),
                                                              hfCoordinator,
                                                            ),
                                                          if (referredBy !=
                                                                  null &&
                                                              referredBy
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty)
                                                            AdditionalField(
                                                              ReferralReconEnums
                                                                  .referredBy
                                                                  .toValue(),
                                                              referredBy,
                                                            ),
                                                          if (dateOfEvaluation !=
                                                                  null &&
                                                              dateOfEvaluation
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty)
                                                            AdditionalField(
                                                              ReferralReconEnums
                                                                  .dateOfEvaluation
                                                                  .toValue(),
                                                              dateOfEvaluation,
                                                            ),
                                                          if (nameOfChild !=
                                                                  null &&
                                                              nameOfChild
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty)
                                                            AdditionalField(
                                                              ReferralReconEnums
                                                                  .nameOfReferral
                                                                  .toValue(),
                                                              nameOfChild,
                                                            ),
                                                          if (age != null &&
                                                              age
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty)
                                                            AdditionalField(
                                                              ReferralReconEnums
                                                                  .age
                                                                  .toValue(),
                                                              age,
                                                            ),
                                                          if (gender != null &&
                                                              gender
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty)
                                                            AdditionalField(
                                                              ReferralReconEnums
                                                                  .gender
                                                                  .toValue(),
                                                              gender,
                                                            ),
                                                          if (cycle != null &&
                                                              cycle
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty)
                                                            AdditionalField(
                                                              ReferralReconEnums
                                                                  .cycle
                                                                  .toValue(),
                                                              cycle,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                                context
                                                    .read<
                                                        ReferralReconServiceDefinitionBloc>()
                                                    .add(
                                                      ReferralReconServiceDefinitionSelectionEvent(
                                                          serviceDefinitionCode:
                                                              symptom),
                                                    );
                                                context.router.push(
                                                  ReferralReasonChecklistRoute(
                                                    referralClientRefId:
                                                        hfClientRefId,
                                                  ),
                                                );
                                              }
                                            },
                                      child: Center(
                                        child: Text(
                                          localizations
                                              .translate(recordState.mapOrNull(
                                                    create: (value) => value
                                                            .viewOnly
                                                        ? i18.common
                                                            .coreCommonNext
                                                        : i18.common
                                                            .coreCommonSubmit,
                                                  ) ??
                                                  i18.common.coreCommonSubmit),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              serviceSearch: (value1, value2, value3) {
                                return DigitCard(
                                  margin: const EdgeInsets.fromLTRB(
                                      0, kPadding, 0, 0),
                                  padding: const EdgeInsets.fromLTRB(
                                      kPadding, 0, kPadding, 0),
                                  child: ValueListenableBuilder(
                                    valueListenable: clickedStatus,
                                    builder: (context, bool isClicked, _) {
                                      return DigitElevatedButton(
                                        onPressed: isClicked
                                            ? null
                                            : () {
                                                if (form
                                                        .control(_cycleKey)
                                                        .value ==
                                                    null) {
                                                  clickedStatus.value = false;
                                                  form
                                                      .control(_cycleKey)
                                                      .setErrors({'': true});
                                                } else if (form
                                                        .control(_genderKey)
                                                        .value ==
                                                    null) {
                                                  clickedStatus.value = false;
                                                  form
                                                      .control(_genderKey)
                                                      .setErrors({'': true});
                                                } else if (form
                                                        .control(
                                                            _referralReason)
                                                        .value ==
                                                    null) {
                                                  clickedStatus.value = false;
                                                  form
                                                      .control(_referralReason)
                                                      .setErrors({'': true});
                                                }
                                                form.markAllAsTouched();

                                                if (viewOnly) {
                                                  final symptom = form
                                                      .control(_referralReason)
                                                      .value as String;
                                                  if (value1.isNotEmpty) {
                                                    context
                                                        .read<
                                                            ReferralReconServiceDefinitionBloc>()
                                                        .add(
                                                          ReferralReconServiceDefinitionSelectionEvent(
                                                              serviceDefinitionCode:
                                                                  symptom),
                                                        );
                                                    context
                                                        .read<
                                                            ReferralReconServiceBloc>()
                                                        .add(
                                                          ReferralReconServiceSearchEvent(
                                                            serviceSearchModel:
                                                                ServiceSearchModel(
                                                              clientId:
                                                                  recordState
                                                                      .mapOrNull(
                                                                create: (value) => value
                                                                        .viewOnly
                                                                    ? value
                                                                        .hfReferralModel
                                                                        ?.clientReferenceId
                                                                    : null,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                    context.router.push(
                                                      ReferralReasonChecklistPreviewRoute(),
                                                    );
                                                  } else {
                                                    final hfClientRefId =
                                                        recordState.mapOrNull(
                                                      create: (value) => value
                                                          .hfReferralModel
                                                          ?.clientReferenceId,
                                                    );
                                                    context
                                                        .read<
                                                            ReferralReconServiceDefinitionBloc>()
                                                        .add(
                                                          ReferralReconServiceDefinitionSelectionEvent(
                                                            serviceDefinitionCode:
                                                                symptom,
                                                          ),
                                                        );
                                                    context.router.push(
                                                      ReferralReasonChecklistRoute(
                                                        referralClientRefId:
                                                            hfClientRefId,
                                                      ),
                                                    );
                                                  }
                                                } else if (!form.valid) {
                                                  return;
                                                } else if (value
                                                    .serviceDefinitionList
                                                    .isEmpty) {
                                                  DigitToast.show(
                                                    context,
                                                    options: DigitToastOptions(
                                                      i18.referralReconciliation
                                                          .noChecklistFound,
                                                      true,
                                                      DigitTheme
                                                          .instance.mobileTheme,
                                                    ),
                                                  );
                                                } else {
                                                  final hfState = BlocProvider
                                                      .of<RecordHFReferralBloc>(
                                                    context,
                                                  ).state;
                                                  clickedStatus.value = true;
                                                  final cycle = form
                                                      .control(_cycleKey)
                                                      .value;
                                                  final nameOfChild = form
                                                      .control(_nameOfChildKey)
                                                      .value as String;
                                                  final age = form
                                                      .control(_ageKey)
                                                      .value as int;
                                                  final gender = form
                                                      .control(_genderKey)
                                                      .value as String;
                                                  final beneficiaryId = form
                                                      .control(
                                                          _beneficiaryIdKey)
                                                      .value as String?;
                                                  final referralCode = form
                                                      .control(_referralCodeKey)
                                                      .value as String?;
                                                  final symptom = form
                                                      .control(_referralReason)
                                                      .value as String;
                                                  final hfCoordinator =
                                                      hfState.mapOrNull(
                                                    create: (val) =>
                                                        val.healthFacilityCord,
                                                  );
                                                  final referredBy =
                                                      hfState.mapOrNull(
                                                    create: (val) =>
                                                        val.referredBy,
                                                  );
                                                  final dateOfEvaluation = hfState
                                                      .mapOrNull(
                                                        create: (val) => val
                                                            .dateOfEvaluation,
                                                      )
                                                      ?.millisecondsSinceEpoch;
                                                  final facilityId =
                                                      hfState.mapOrNull(
                                                    create: (val) =>
                                                        val.facilityId,
                                                  );
                                                  final hfClientRefId =
                                                      IdGen.i.identifier;

                                                  final event = context.read<
                                                      RecordHFReferralBloc>();
                                                  event.add(
                                                    RecordHFReferralCreateEntryEvent(
                                                      hfReferralModel:
                                                          HFReferralModel(
                                                        clientReferenceId:
                                                            hfClientRefId,
                                                        projectFacilityId:
                                                            facilityId,
                                                        projectId:
                                                            ReferralReconSingleton()
                                                                .projectId,
                                                        name:
                                                            nameOfChild.trim(),
                                                        beneficiaryId:
                                                            beneficiaryId,
                                                        referralCode:
                                                            referralCode,
                                                        symptom: symptom,
                                                        tenantId:
                                                            ReferralReconSingleton()
                                                                .tenantId,
                                                        rowVersion: 1,
                                                        auditDetails:
                                                            AuditDetails(
                                                          createdBy:
                                                              ReferralReconSingleton()
                                                                  .userUUid,
                                                          createdTime: context
                                                              .millisecondsSinceEpoch(),
                                                          lastModifiedBy:
                                                              ReferralReconSingleton()
                                                                  .userUUid,
                                                          lastModifiedTime: context
                                                              .millisecondsSinceEpoch(),
                                                        ),
                                                        clientAuditDetails:
                                                            ClientAuditDetails(
                                                          createdBy:
                                                              ReferralReconSingleton()
                                                                  .userUUid,
                                                          createdTime: context
                                                              .millisecondsSinceEpoch(),
                                                          lastModifiedBy:
                                                              ReferralReconSingleton()
                                                                  .userUUid,
                                                          lastModifiedTime: context
                                                              .millisecondsSinceEpoch(),
                                                        ),
                                                        additionalFields:
                                                            HFReferralAdditionalFields(
                                                          version: 1,
                                                          fields: [
                                                            if (hfCoordinator !=
                                                                    null &&
                                                                hfCoordinator
                                                                    .toString()
                                                                    .trim()
                                                                    .isNotEmpty)
                                                              AdditionalField(
                                                                ReferralReconEnums
                                                                    .hFCoordinator
                                                                    .toValue(),
                                                                hfCoordinator,
                                                              ),
                                                            if (referredBy !=
                                                                    null &&
                                                                referredBy
                                                                    .toString()
                                                                    .trim()
                                                                    .isNotEmpty)
                                                              AdditionalField(
                                                                ReferralReconEnums
                                                                    .referredBy
                                                                    .toValue(),
                                                                referredBy,
                                                              ),
                                                            if (dateOfEvaluation !=
                                                                    null &&
                                                                dateOfEvaluation
                                                                    .toString()
                                                                    .trim()
                                                                    .isNotEmpty)
                                                              AdditionalField(
                                                                ReferralReconEnums
                                                                    .dateOfEvaluation
                                                                    .toValue(),
                                                                dateOfEvaluation,
                                                              ),
                                                            if (nameOfChild !=
                                                                    null &&
                                                                nameOfChild
                                                                    .toString()
                                                                    .trim()
                                                                    .isNotEmpty)
                                                              AdditionalField(
                                                                ReferralReconEnums
                                                                    .nameOfReferral
                                                                    .toValue(),
                                                                nameOfChild,
                                                              ),
                                                            if (age != null &&
                                                                age
                                                                    .toString()
                                                                    .trim()
                                                                    .isNotEmpty)
                                                              AdditionalField(
                                                                ReferralReconEnums
                                                                    .age
                                                                    .toValue(),
                                                                age,
                                                              ),
                                                            if (gender !=
                                                                    null &&
                                                                gender
                                                                    .toString()
                                                                    .trim()
                                                                    .isNotEmpty)
                                                              AdditionalField(
                                                                ReferralReconEnums
                                                                    .gender
                                                                    .toValue(),
                                                                gender,
                                                              ),
                                                            if (cycle != null &&
                                                                cycle
                                                                    .toString()
                                                                    .trim()
                                                                    .isNotEmpty)
                                                              AdditionalField(
                                                                ReferralReconEnums
                                                                    .cycle
                                                                    .toValue(),
                                                                cycle,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                  context
                                                      .read<
                                                          ReferralReconServiceDefinitionBloc>()
                                                      .add(
                                                        ReferralReconServiceDefinitionSelectionEvent(
                                                          serviceDefinitionCode:
                                                              symptom,
                                                        ),
                                                      );
                                                  final parent = context.router
                                                      .parent() as StackRouter;
                                                  parent.push(
                                                    ReferralReasonChecklistRoute(
                                                      referralClientRefId:
                                                          hfClientRefId,
                                                    ),
                                                  );
                                                }
                                              },
                                        child: Center(
                                          child: Text(
                                            localizations.translate(recordState
                                                    .mapOrNull(
                                                  create: (value) =>
                                                      value.viewOnly
                                                          ? i18.common
                                                              .coreCommonNext
                                                          : i18.common
                                                              .coreCommonSubmit,
                                                ) ??
                                                i18.common.coreCommonSubmit),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                DigitCard(
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
                                                    .referralDetails,
                                              ),
                                              style:
                                                  theme.textTheme.displayMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(children: [
                                        DigitReactiveSearchDropdown<String>(
                                          label: localizations.translate(
                                            i18.referralReconciliation
                                                .selectCycle,
                                          ),
                                          form: form,
                                          isRequired: true,
                                          enabled: !viewOnly,
                                          menuItems: widget.cycles,
                                          formControlName: _cycleKey,
                                          valueMapper: (value) {
                                            return '${localizations.translate(i18.referralReconciliation.cycle)} $value';
                                          },
                                          validationMessage:
                                              localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                          emptyText: localizations.translate(
                                              i18.common.noMatchFound),
                                        ),
                                        DigitTextFormField(
                                          formControlName: _nameOfChildKey,
                                          label: localizations.translate(
                                            i18.referralReconciliation
                                                .nameOfTheChildLabel,
                                          ),
                                          readOnly: viewOnly,
                                          isRequired: true,
                                          validationMessages: {
                                            'required': (_) =>
                                                localizations.translate(
                                                  i18.common.corecommonRequired,
                                                ),
                                          },
                                        ),
                                        DigitTextFormField(
                                          formControlName: _beneficiaryIdKey,
                                          label: localizations.translate(
                                            i18.referralReconciliation
                                                .beneficiaryIdLabel,
                                          ),
                                          readOnly: viewOnly,
                                        ),
                                        DigitTextFormField(
                                          formControlName: _referralCodeKey,
                                          label: localizations.translate(
                                            i18.referralReconciliation
                                                .referralCodeLabel,
                                          ),
                                          readOnly: viewOnly,
                                        ),
                                        DigitTextFormField(
                                          formControlName: _ageKey,
                                          label: localizations.translate(
                                            i18.common.ageInMonths,
                                          ),
                                          readOnly: viewOnly,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4)
                                          ],
                                          isRequired: true,
                                          validationMessages: {
                                            'required': (_) =>
                                                localizations.translate(
                                                  i18.common.corecommonRequired,
                                                ),
                                            'max': (_) => localizations
                                                .translate(
                                                  i18.common.maxValue,
                                                )
                                                .replaceAll(
                                                  '{}',
                                                  ReferralReconSingleton()
                                                      .validIndividualAgeForCampaign
                                                      .validMaxAge
                                                      .toString(),
                                                ),
                                            'min': (_) => localizations
                                                .translate(
                                                  i18.common.minValue,
                                                )
                                                .replaceAll(
                                                  '{}',
                                                  ReferralReconSingleton()
                                                      .validIndividualAgeForCampaign
                                                      .validMinAge
                                                      .toString(),
                                                ),
                                          },
                                        ),
                                        DigitReactiveSearchDropdown<String>(
                                          label: localizations.translate(
                                            i18.common.genderLabelText,
                                          ),
                                          enabled: !viewOnly,
                                          form: form,
                                          isRequired: true,
                                          menuItems: ReferralReconSingleton()
                                              .genderOptions,
                                          validationMessage:
                                              localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                          formControlName: _genderKey,
                                          valueMapper: (value) {
                                            return localizations
                                                .translate(value);
                                          },
                                          emptyText: localizations.translate(
                                            i18.common.noMatchFound,
                                          ),
                                        )
                                      ]),
                                    ],
                                  ),
                                ),
                                StatefulBuilder(builder: (context, set) {
                                  form.control(_referralReason).value =
                                      recordState.mapOrNull(
                                    create: (value) => value.viewOnly
                                        ? ReferralReconSingleton()
                                            .referralReasons
                                            .where((e) =>
                                                e ==
                                                value.hfReferralModel?.symptom)
                                            .first
                                        : null,
                                  );
                                  return DigitCard(
                                      child: DigitRadioButtonList<String>(
                                    labelStyle: theme.textTheme.displayMedium,
                                    isEnabled: !viewOnly,
                                    formControlName: _referralReason,
                                    valueMapper: (val) =>
                                        localizations.translate(val),
                                    options: ReferralReconSingleton()
                                        .referralReasons,
                                    labelText: localizations.translate(
                                      i18.referralReconciliation
                                          .reasonForReferralHeader,
                                    ),
                                    isRequired: true,
                                    errorMessage: localizations.translate(
                                      i18.common.corecommonRequired,
                                    ),
                                    onValueChange: (val) {
                                      form.control(_referralReason).value = val;
                                    },
                                  ));
                                }),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  FormGroup buildForm(RecordHFReferralState referralState) {
    return fb.group(<String, Object>{
      _cycleKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly &&
                  value.hfReferralModel?.additionalFields?.fields
                          .where((e) =>
                              e.key == ReferralReconEnums.cycle.toValue())
                          .firstOrNull
                          ?.value !=
                      null
              ? value.hfReferralModel?.additionalFields?.fields
                  .where((e) => e.key == ReferralReconEnums.cycle.toValue())
                  .firstOrNull
                  ?.value
                  .toString()
              : null,
        ),
        disabled: referralState.mapOrNull(
              create: (value) => value.viewOnly,
            ) ??
            false,
      ),
      _nameOfChildKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly &&
                  value.hfReferralModel?.additionalFields?.fields
                          .where((e) =>
                              e.key ==
                              ReferralReconEnums.nameOfReferral.toValue())
                          .firstOrNull
                          ?.value !=
                      null
              ? value.hfReferralModel?.additionalFields?.fields
                  .where((e) =>
                      e.key == ReferralReconEnums.nameOfReferral.toValue())
                  .firstOrNull
                  ?.value
                  .toString()
              : value.hfReferralModel?.name ?? '',
        ),
        disabled: referralState.mapOrNull(
              create: (value) => value.viewOnly,
            ) ??
            false,
        validators: [
          Validators.required,
        ],
      ),
      _beneficiaryIdKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.hfReferralModel?.beneficiaryId,
        ),
        disabled: referralState.mapOrNull(
              create: (value) => value.viewOnly,
            ) ??
            false,
      ),
      _referralCodeKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) =>
              value.viewOnly ? value.hfReferralModel?.referralCode : null,
        ),
        disabled: referralState.mapOrNull(
              create: (value) => value.viewOnly,
            ) ??
            false,
      ),
      _genderKey: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly &&
                  value.hfReferralModel?.additionalFields?.fields
                          .where((e) =>
                              e.key == ReferralReconEnums.gender.toValue())
                          .firstOrNull
                          ?.value !=
                      null
              ? value.hfReferralModel?.additionalFields?.fields
                  .where((e) => e.key == ReferralReconEnums.gender.toValue())
                  .firstOrNull
                  ?.value
                  .toString()
              : null,
        ),
        disabled: referralState.mapOrNull(
              create: (value) => value.viewOnly,
            ) ??
            false,
      ),
      _ageKey: FormControl<int>(
        value: referralState.mapOrNull(
          create: (value) => value.viewOnly &&
                  value.hfReferralModel?.additionalFields?.fields
                          .where(
                              (e) => e.key == ReferralReconEnums.age.toValue())
                          .firstOrNull
                          ?.value !=
                      null
              ? int.tryParse(value.hfReferralModel?.additionalFields?.fields
                      .where((e) => e.key == ReferralReconEnums.age.toValue())
                      .firstOrNull
                      ?.value
                      .toString() ??
                  '')
              : null,
        ),
        disabled: referralState.mapOrNull(
              create: (value) => value.viewOnly,
            ) ??
            false,
        validators: (ReferralReconSingleton()
                        .validIndividualAgeForCampaign
                        .validMaxAge !=
                    0 &&
                ReferralReconSingleton()
                        .validIndividualAgeForCampaign
                        .validMinAge !=
                    0)
            ? [
                Validators.required,
                Validators.max<int>(
                  ReferralReconSingleton()
                      .validIndividualAgeForCampaign
                      .validMaxAge,
                ),
                Validators.min<int>(
                  ReferralReconSingleton()
                      .validIndividualAgeForCampaign
                      .validMinAge,
                ),
              ]
            : [Validators.required],
      ),
      _referralReason: FormControl<String>(
        value: referralState.mapOrNull(
          create: (value) =>
              value.viewOnly && value.hfReferralModel?.symptom != null
                  ? value.hfReferralModel?.symptom
                  : null,
        ),
        disabled: referralState.mapOrNull(
              create: (value) => value.viewOnly,
            ) ??
            false,
        // validators: [
        //   Validators.required,
        // ],
      ),
    });
  }
}
