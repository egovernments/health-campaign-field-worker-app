import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/referral_management/referral_management.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../models/entities/referral.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../widgets/localized.dart';

@RoutePage()
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
  State<ReferBeneficiaryPage> createState() => ReferBeneficiaryPageState();
}

class ReferBeneficiaryPageState extends LocalizedState<ReferBeneficiaryPage> {
  static const _dateOfReferralKey = 'dateOfReferral';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _referredByKey = 'referredBy';
  static const _referredToKey = 'referredTo';
  static const _referralReason = 'referralReason';
  static const _referralComments = 'referralComments';
  final clickedStatus = ValueNotifier<bool>(false);
  late final List<KeyValue> reasons;
  String? selectedProjectFacilityId;

  @override
  void initState() {
    reasons = (RegistrationDeliverySingleton().referralReasons ?? [])
        .map((e) => KeyValue(e, e))
        .toList();
    super.initState();
  }

  @override
  void dispose() {
    clickedStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocConsumer<FacilityBloc, FacilityState>(
      listener: (context, state) {
        state.whenOrNull(
          fetched: (_, facilities) => facilities.isEmpty
              ? NoFacilitiesAssignedDialog.show(context)
              : null,
          empty: () => NoFacilitiesAssignedDialog.show(context),
        );
      },
      builder: (ctx, facilityState) {
        final facilities = facilityState.whenOrNull(
              fetched: (_, facilities) {
                final projectFacilities = facilities
                    .where((e) =>
                        e.id != Constants().notAvailable &&
                        e.id != Constants().deliveryTeam)
                    .toList();
                final healthFacilities = [
                  FacilityModel(id: Constants().communityHealthWorker),
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
              enableFixedDigitButton: true,
              header: const Column(children: [
                Padding(
                  padding: EdgeInsets.only(bottom: spacer4),
                  child: BackNavigationHelpHeaderWidget(),
                ),
              ]),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    ValueListenableBuilder(
                      valueListenable: clickedStatus,
                      builder: (context, bool isClicked, _) {
                        return DigitButton(
                          label: localizations
                              .translate(i18.common.coreCommonSubmit),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          isDisabled: isClicked ? true : false,
                          onPressed: () {
                            if (form.control(_referralReason).value == null) {
                              clickedStatus.value = false;
                            }
                            form.markAllAsTouched();

                            if (!form.valid) {
                              return;
                            } else {
                              clickedStatus.value = true;
                              final reason =
                                  form.control(_referralReason).value as String;
                              final recipientType = selectedProjectFacilityId ==
                                      'Community Health Worker'
                                  ? 'STAFF'
                                  : 'FACILITY';
                              final recipientId = selectedProjectFacilityId ==
                                      'Community Health Worker'
                                  ? RegistrationDeliverySingleton()
                                      .loggedInUserUuid
                                  : selectedProjectFacilityId;
                              final referralComment =
                                  form.control(_referralComments).value;

                              final event = context.read<ReferralBloc>();
                              event.add(ReferralSubmitEvent(
                                ReferralModel(
                                  clientReferenceId: IdGen.i.identifier,
                                  projectId:
                                      RegistrationDeliverySingleton().projectId,
                                  projectBeneficiaryClientReferenceId:
                                      widget.projectBeneficiaryClientRefId,
                                  referrerId: RegistrationDeliverySingleton()
                                      .loggedInUserUuid,
                                  recipientId: recipientId,
                                  recipientType: recipientType,
                                  reasons: [reason],
                                  tenantId:
                                      RegistrationDeliverySingleton().tenantId,
                                  rowVersion: 1,
                                  auditDetails: AuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid,
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  clientAuditDetails: ClientAuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid!,
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  additionalFields: ReferralAdditionalFields(
                                    version: 1,
                                    fields: [
                                      AdditionalField(
                                          "boundaryCode",
                                          RegistrationDeliverySingleton()
                                              .boundary
                                              ?.code),
                                      if (referralComment != null &&
                                          referralComment
                                              .toString()
                                              .trim()
                                              .isNotEmpty)
                                        AdditionalField(
                                          AdditionalFieldsType.referralComments
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
                                  reloadState.add(HouseholdOverviewReloadEvent(
                                    projectId: RegistrationDeliverySingleton()
                                        .projectId!,
                                    projectBeneficiaryType:
                                        RegistrationDeliverySingleton()
                                            .beneficiaryType!,
                                  ));
                                },
                              ).then((value) => context.router.popAndPush(
                                    HouseholdAcknowledgementRoute(
                                      enableViewHousehold: true,
                                    ),
                                  ));
                            }
                          },
                        );
                      },
                    ),
                  ]),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                    margin: const EdgeInsets.symmetric(horizontal: spacer2),
                      children: [
                    Text(
                      localizations.translate(
                        i18.referBeneficiary.referralDetails,
                      ),
                      style: textTheme.headingXl.copyWith(
                        color: theme.colorTheme.primary.primary2
                      ),
                    ),
                    ReactiveWrapperField(
                      formControlName: _dateOfReferralKey,
                      builder: (field) => LabeledField(
                        label: localizations.translate(
                          i18.referBeneficiary.dateOfReferralLabel,
                        ),
                        child: DigitDateFormInput(
                          readOnly: true,
                          isRequired: false,
                          initialValue: DateFormat('dd MMM yyyy')
                              .format(form.control(_dateOfReferralKey).value)
                              .toString(),
                          initialDate: DateTime.now(),
                          cancelText: localizations
                              .translate(i18.common.coreCommonCancel),
                          confirmText:
                              localizations.translate(i18.common.coreCommonOk),
                        ),
                      ),
                    ),
                    ReactiveWrapperField(
                      formControlName: _administrativeUnitKey,
                      builder: (field) => LabeledField(
                        label: localizations.translate(
                          i18.referBeneficiary.administrationUnitFormLabel,
                        ),
                        isRequired: true,
                        child: DigitTextFormInput(
                          readOnly: true,
                          initialValue:
                              form.control(_administrativeUnitKey).value,
                        ),
                      ),
                    ),
                    ReactiveWrapperField(
                      formControlName: _referredByKey,
                      validationMessages: {
                        'required': (_) => localizations.translate(
                              i18.common.corecommonRequired,
                            ),
                      },
                      builder: (field) => LabeledField(
                        label: localizations.translate(
                          i18.referBeneficiary.referredByLabel,
                        ),
                        isRequired: true,
                        child: DigitTextFormInput(
                          errorMessage: field.errorText,
                          readOnly: true,
                          onChange: (value) {
                            form.control(_referredByKey).value = value;
                          },
                          initialValue: form.control(_referredByKey).value,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final parent = context.router.parent() as StackRouter;
                        final facility = await parent.push(
                          FacilitySelectionRoute(
                            facilities: facilities,
                          ),
                        ) as FacilityModel?;

                        if (facility == null) return;
                        form.control(_referredToKey).value =
                            localizations.translate('FAC_${facility.id}');
                        setState(() {
                          selectedProjectFacilityId = facility.id;
                        });
                      },
                      child: IgnorePointer(
                        child: ReactiveWrapperField(
                          formControlName: _referredToKey,
                          validationMessages: {
                            'required': (_) => localizations.translate(
                                  i18.referBeneficiary
                                      .facilityValidationMessage,
                                ),
                          },
                          builder: (field) => LabeledField(
                            label: localizations.translate(
                              i18.referBeneficiary.referredToLabel,
                            ),
                            isRequired: true,
                            child: DigitSearchFormInput(
                              errorMessage: field.errorText,
                              initialValue: form.control(_referredToKey).value,
                              onSuffixTap: (value) async {
                                final parent =
                                    context.router.parent() as StackRouter;
                                final facility = await parent.push(
                                  FacilitySelectionRoute(
                                    facilities: facilities,
                                  ),
                                ) as FacilityModel?;

                                if (facility == null) return;
                                form.control(_referredToKey).value =
                                    localizations
                                        .translate('FAC_${facility.id}');

                                setState(() {
                                  selectedProjectFacilityId = facility.id;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    ReactiveWrapperField(
                      formControlName: _referralReason,
                      validationMessages: {
                        'required': (_) => localizations.translate(
                              i18.common.corecommonRequired,
                            ),
                      },
                      builder: (field) => LabeledField(
                        label: localizations.translate(
                          i18.referBeneficiary.reasonForReferral,
                        ),
                        isRequired: true,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: RadioList(
                            containerPadding: const EdgeInsets.all(spacer2),
                            radioDigitButtons: reasons
                                .map((e) => RadioButtonModel(
                                    code: e.key.toString(),
                                    name: localizations.translate(e.label)))
                                .toList(),
                            errorMessage: field.errorText,
                            groupValue:
                                form.control(_referralReason).value ?? '',
                            onChanged: (val) {
                              form.control(_referralReason).value = val.code;
                            },
                          ),
                        ),
                      ),
                    ),
                    ReactiveWrapperField(
                      formControlName: _referralComments,
                      builder: (field) => LabeledField(
                        label: localizations.translate(
                          i18.referBeneficiary.referralComments,
                        ),
                        child: DigitTextAreaFormInput(
                          maxLine: 3,
                          initialValue: form.control(_referralComments).value,
                          onChange: (value) {
                            form.control(_referralComments).value = value;
                          },
                        ),
                      ),
                    ),
                  ]),
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
      _administrativeUnitKey: FormControl<String>(
          value: localizations.translate(
              RegistrationDeliverySingleton().boundary!.name.toString())),
      _referredByKey: FormControl<String>(
        value: RegistrationDeliverySingleton().loggedInUserUuid,
        validators: [Validators.required],
      ),
      _referredToKey: FormControl<String>(validators: [Validators.required]),
      _referralReason: FormControl<String>(
        value: null,
        validators: [Validators.required],
      ),
      _referralComments: FormControl<String>(value: null),
    });
  }
}
