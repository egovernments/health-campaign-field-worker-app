import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/facility/facility.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/referral_management/referral_management.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../widgets/localized.dart';
import '../inventory/facility_selection.dart';

class ReferBeneficiaryPage extends LocalizedStatefulWidget {
  final bool isEditing;
  final String projectBeneficiaryClientRefId;

  const ReferBeneficiaryPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
    required this.projectBeneficiaryClientRefId,
  });
  @override
  State<ReferBeneficiaryPage> createState() => _ReferBeneficiaryPageState();
}

class _ReferBeneficiaryPageState extends LocalizedState<ReferBeneficiaryPage> {
  static const _dateOfReferralKey = 'dateOfReferral';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _referredByKey = 'referredBy';
  static const _referredToKey = 'referredTo';
  static const _referralReason = 'referralReason';
  static const _referralComments = 'referralComments';
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

    return BlocConsumer<FacilityBloc, FacilityState>(
      listener: (context, state) {
        state.whenOrNull(
          empty: () => NoFacilitiesAssignedDialog.show(context),
        );
      },
      builder: (ctx, facilityState) {
        final facilities = facilityState.whenOrNull(
              fetched: (_, facilities) {
                final projectFacilities = facilities
                    .where((e) => e.id != 'N/A' && e.id != 'Delivery Team')
                    .toList();
                final healthFacilities = [
                  FacilityModel(id: 'Community Health Worker'),
                ];
                healthFacilities.addAll(projectFacilities);

                return healthFacilities;
              },
            ) ??
            [];

        return Scaffold(
          body: ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) => ScrollableContent(
              enableFixedButton: true,
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(),
              ]),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: ValueListenableBuilder(
                  valueListenable: clickedStatus,
                  builder: (context, bool isClicked, _) {
                    return DigitElevatedButton(
                      onPressed: isClicked
                          ? null
                          : () {
                              if (form.control(_referralReason).value == null) {
                                clickedStatus.value = false;
                                form
                                    .control(_referralReason)
                                    .setErrors({'': true});
                              }
                              form.markAllAsTouched();

                              if (!form.valid) {
                                return;
                              } else {
                                clickedStatus.value = true;
                                final recipient = form
                                    .control(_referredToKey)
                                    .value as FacilityModel;
                                final reason = form
                                    .control(_referralReason)
                                    .value as KeyValue;
                                final recipientType =
                                    recipient.id == 'Community Health Worker'
                                        ? 'STAFF'
                                        : 'FACILITY';
                                final recipientId =
                                    recipient.id == 'Community Health Worker'
                                        ? context.loggedInUserUuid
                                        : recipient.id;
                                final referralComment =
                                    form.control(_referralComments).value;

                                final event = context.read<ReferralBloc>();
                                event.add(ReferralSubmitEvent(
                                  ReferralModel(
                                    clientReferenceId: IdGen.i.identifier,
                                    projectId: context.projectId,
                                    projectBeneficiaryClientReferenceId:
                                        widget.projectBeneficiaryClientRefId,
                                    referrerId: context.loggedInUserUuid,
                                    recipientId: recipientId,
                                    recipientType: recipientType,
                                    reasons: [reason.key],
                                    tenantId: envConfig.variables.tenantId,
                                    rowVersion: 1,
                                    auditDetails: AuditDetails(
                                      createdBy: context.loggedInUserUuid,
                                      createdTime:
                                          context.millisecondsSinceEpoch(),
                                      lastModifiedBy: context.loggedInUserUuid,
                                      lastModifiedTime:
                                          context.millisecondsSinceEpoch(),
                                    ),
                                    clientAuditDetails: ClientAuditDetails(
                                      createdBy: context.loggedInUserUuid,
                                      createdTime:
                                          context.millisecondsSinceEpoch(),
                                      lastModifiedBy: context.loggedInUserUuid,
                                      lastModifiedTime:
                                          context.millisecondsSinceEpoch(),
                                    ),
                                    additionalFields: ReferralAdditionalFields(
                                      version: 1,
                                      fields: [
                                        if (referralComment != null &&
                                            referralComment
                                                .toString()
                                                .trim()
                                                .isNotEmpty)
                                          AdditionalField(
                                            AdditionalFieldsType
                                                .referralComments
                                                .toValue(),
                                            referralComment,
                                          ),
                                      ],
                                    ),
                                  ),
                                  false,
                                ));

                                final reloadState =
                                    context.read<HouseholdOverviewBloc>();

                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () {
                                    reloadState
                                        .add(HouseholdOverviewReloadEvent(
                                      projectId: context.projectId,
                                      projectBeneficiaryType:
                                          context.beneficiaryType,
                                    ));
                                  },
                                ).then((value) => context.router.popAndPush(
                                      HouseholdAcknowledgementRoute(
                                        enableViewHousehold: true,
                                      ),
                                    ));
                              }
                            },
                      child: Center(
                        child: Text(
                          localizations.translate(i18.common.coreCommonSubmit),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                localizations.translate(
                                  i18.referBeneficiary.referralDetails,
                                ),
                                style: theme.textTheme.displayMedium,
                              ),
                            ),
                          ],
                        ),
                        Column(children: [
                          DigitDateFormPicker(
                            isEnabled: false,
                            formControlName: _dateOfReferralKey,
                            label: localizations.translate(
                              i18.referBeneficiary.dateOfReferralLabel,
                            ),
                            isRequired: false,
                            initialDate: DateTime.now(),
                            cancelText: localizations
                                .translate(i18.common.coreCommonCancel),
                            confirmText: localizations
                                .translate(i18.common.coreCommonOk),
                            padding: const EdgeInsets.only(
                              bottom: kPadding,
                              top: kPadding,
                            ),
                          ),
                          DigitTextFormField(
                            formControlName: _administrativeUnitKey,
                            label: localizations.translate(
                              i18.referBeneficiary.administrationUnitFormLabel,
                            ),
                            isRequired: true,
                            readOnly: true,
                          ),
                          DigitTextFormField(
                            formControlName: _referredByKey,
                            label: localizations.translate(
                              i18.referBeneficiary.referredByLabel,
                            ),
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.common.corecommonRequired,
                                  ),
                            },
                            isRequired: true,
                          ),
                          InkWell(
                            onTap: () async {
                              final parent =
                                  context.router.parent() as StackRouter;
                              final facility = await parent.push<FacilityModel>(
                                FacilitySelectionRoute(
                                  facilities: facilities,
                                ),
                              );

                              if (facility == null) return;
                              form.control(_referredToKey).value = facility;
                            },
                            child: IgnorePointer(
                              child: DigitTextFormField(
                                hideKeyboard: true,
                                valueAccessor: FacilityValueAccessor(
                                  facilities,
                                ),
                                label: localizations.translate(
                                  i18.referBeneficiary.referredToLabel,
                                ),
                                isRequired: true,
                                suffix: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.search),
                                ),
                                formControlName: _referredToKey,
                                readOnly: true,
                                validationMessages: {
                                  'required': (_) => localizations.translate(
                                        i18.referBeneficiary
                                            .facilityValidationMessage,
                                      ),
                                },
                                onTap: () async {
                                  final parent =
                                      context.router.parent() as StackRouter;
                                  final facility =
                                      await parent.push<FacilityModel>(
                                    FacilitySelectionRoute(
                                      facilities: facilities,
                                    ),
                                  );

                                  if (facility == null) return;
                                  form.control(_referredToKey).value = facility;
                                },
                              ),
                            ),
                          ),
                          BlocBuilder<AppInitializationBloc,
                              AppInitializationState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (appConfiguration, _) {
                                  final List<KeyValue> reasons =
                                      (appConfiguration.referralReasons ?? [])
                                          .map((e) => KeyValue(e.code, e.code))
                                          .toList();

                                  return DigitRadioButtonList<KeyValue>(
                                    labelStyle: DigitTheme.instance.mobileTheme
                                        .textTheme.bodyLarge,
                                    formControlName: _referralReason,
                                    valueMapper: (val) =>
                                        localizations.translate(val.label),
                                    options: reasons,
                                    labelText: localizations.translate(
                                      i18.referBeneficiary.reasonForReferral,
                                    ),
                                    isRequired: true,
                                    errorMessage: localizations.translate(
                                      i18.common.corecommonRequired,
                                    ),
                                    onValueChange: (val) {
                                      form.control(_referralReason).value = val;
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          DigitTextFormField(
                            formControlName: _referralComments,
                            label: localizations.translate(
                              i18.referBeneficiary.referralComments,
                            ),
                            minLines: 3,
                            maxLines: 3,
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _dateOfReferralKey: FormControl<DateTime>(value: DateTime.now()),
      _administrativeUnitKey: FormControl<String>(value: context.boundary.name),
      _referredByKey: FormControl<String>(
        value: context.loggedInUserUuid,
        validators: [Validators.required],
      ),
      _referredToKey:
          FormControl<FacilityModel>(validators: [Validators.required]),
      _referralReason: FormControl<KeyValue>(value: null),
      _referralComments: FormControl<String>(value: null),
    });
  }
}
