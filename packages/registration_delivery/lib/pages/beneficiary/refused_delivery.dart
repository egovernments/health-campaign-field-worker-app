import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../models/entities/status.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class RefusedDeliveryPage extends LocalizedStatefulWidget {
  const RefusedDeliveryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<RefusedDeliveryPage> createState() => RefusedDeliveryPageState();
}

class RefusedDeliveryPageState extends LocalizedState<RefusedDeliveryPage> {
  static const _dataOfRefusalKey = 'dateOfAdministration';
  static const _reasonOfRefusal = 'reasonOfRefusal';
  static const _deliveryCommentKey = 'deliveryComment';

  @override
  void initState() {
    final registrationState = context.read<HouseholdOverviewBloc>().state;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<HouseholdOverviewBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => buildForm(),
          builder: (_, form, __) =>
              BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                builder: (context, registrationState) {
                  return ScrollableContent(
                    enableFixedButton: true,
                    header: const Column(
                      children: [
                        BackNavigationHelpHeaderWidget(
                          showcaseButton: ShowcaseButton(),
                          showHelp: false,
                        ),
                      ],
                    ),
                    footer: DigitCard(
                      margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                      padding:
                          const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                      child: DigitElevatedButton(
                        onPressed: () {
                          form.markAllAsTouched();

                          if (form.control(_reasonOfRefusal).value == null) {
                            setState(() {
                              form
                                  .control(_reasonOfRefusal)
                                  .setErrors({'': true});
                            });
                          }

                          if (!form.valid) return;

                          final reasonOfRefusal =
                              form.control(_reasonOfRefusal).value;

                          final refusalComment =
                              form.control(_deliveryCommentKey).value;

                          final projectBeneficiary =
                              RegistrationDeliverySingleton().beneficiaryType !=
                                      BeneficiaryType.individual
                                  ? [
                                      registrationState.householdMemberWrapper
                                          .projectBeneficiaries?.first
                                    ]
                                  : registrationState.householdMemberWrapper
                                      .projectBeneficiaries
                                      ?.where(
                                        (element) =>
                                            element
                                                .beneficiaryClientReferenceId ==
                                            registrationState.selectedIndividual
                                                ?.clientReferenceId,
                                      )
                                      .toList();

                          // Determine the status based on the reason of refusal
                          String status;
                          if (reasonOfRefusal =='REFUSED') {
                            status = Status.beneficiaryRefused.toValue();
                          } else {
                            status = Status.administeredFailed.toValue();
                          }

                          context.read<DeliverInterventionBloc>().add(
                                DeliverInterventionSubmitEvent(
                                  navigateToSummary: true,
                                  householdMemberWrapper:
                                      registrationState.householdMemberWrapper,
                                  task: TaskModel(
                                    projectBeneficiaryClientReferenceId:
                                        projectBeneficiary?.first
                                            ?.clientReferenceId, //TODO: need to check for individual based campaign
                                    clientReferenceId: IdGen.i.identifier,
                                    tenantId: RegistrationDeliverySingleton()
                                        .tenantId,
                                    rowVersion: 1,
                                    auditDetails: AuditDetails(
                                      createdBy: RegistrationDeliverySingleton()
                                          .loggedInUserUuid!,
                                      createdTime:
                                          context.millisecondsSinceEpoch(),
                                    ),
                                    projectId: RegistrationDeliverySingleton()
                                        .projectId,
                                    status: status,
                                    clientAuditDetails: ClientAuditDetails(
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
                                    additionalFields: TaskAdditionalFields(
                                      version: 1,
                                      fields: [
                                        AdditionalField(
                                          AdditionalFieldsType.reasonOfRefusal
                                              .toValue(),
                                          reasonOfRefusal,
                                        ),
                                        if (refusalComment != null)
                                          AdditionalField(
                                          AdditionalFieldsType.deliveryComment
                                              .toValue(),
                                          refusalComment,
                                        ),
                                      ],
                                    ),
                                  ),
                                  isEditing: false,
                                  boundaryModel:
                                      RegistrationDeliverySingleton().boundary!,
                                ),
                              );
                          context.router.push(DeliverySummaryRoute());
                        },
                        child: Center(
                          child: Text(
                            localizations.translate(
                              i18.householdLocation.actionLabel,
                            ),
                          ),
                        ),
                      ),
                    ),
                    slivers: [
                      SliverToBoxAdapter(
                        child: DigitCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0, 0, 0, kPadding),
                                child: Text(
                                  localizations.translate(
                                    i18.deliverIntervention
                                        .refusedDeliveryLabel,
                                  ),
                                  style: theme.textTheme.displayMedium,
                                ),
                              ),
                              Column(children: [
                                refusedDeliveryShowcaseData.dateOfVisit
                                    .buildWith(
                                  child: DigitDateFormPicker(
                                    isEnabled: false,
                                    formControlName: _dataOfRefusalKey,
                                    label: localizations.translate(
                                      i18.deliverIntervention
                                          .refusedDeliveryVisitDateLabel,
                                    ),
                                    confirmText: localizations.translate(
                                      i18.common.coreCommonOk,
                                    ),
                                    cancelText: localizations.translate(
                                      i18.common.coreCommonCancel,
                                    ),
                                    isRequired: false,
                                    padding: const EdgeInsets.only(
                                      top: kPadding,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: kPadding,
                                ),
                                refusedDeliveryShowcaseData.reasonOfRefusal
                                    .buildWith(
                                  child: LabeledField(
                                    label: localizations.translate(
                                      i18.deliverIntervention
                                          .reasonForRefusalLabel,
                                    ),
                                    isRequired: true,
                                    child: SelectionBox<String>(
                                      width: MediaQuery.of(context).size.width*.36,
                                      allowMultipleSelection: false,
                                      options: RegistrationDeliverySingleton()
                                              .refusalReasons ??
                                          [],
                                      onSelectionChanged: (value) {
                                        form
                                            .control(_reasonOfRefusal)
                                            .markAsTouched();
                                        setState(() {
                                          if (value.isNotEmpty) {
                                            form
                                                .control(_reasonOfRefusal)
                                                .value = value.first;
                                          } else {
                                            form
                                                .control(_reasonOfRefusal)
                                                .value = null;
                                            setState(() {
                                              form
                                                  .control(_reasonOfRefusal)
                                                  .setErrors({'': true});
                                            });
                                          }
                                        });
                                      },
                                      valueMapper: (value) {
                                        return localizations
                                            .translate(value.toString());
                                      },
                                      errorMessage: form
                                                  .control(_reasonOfRefusal)
                                                  .hasErrors &&
                                              form
                                                  .control(_reasonOfRefusal)
                                                  .touched
                                          ? localizations.translate(
                                              i18.common.corecommonRequired)
                                          : null,
                                    ),
                                  ),
                                ),
                                refusedDeliveryShowcaseData.comments.buildWith(
                                  child: DigitTextFormField(
                                    formControlName: _deliveryCommentKey,
                                    label: localizations.translate(i18
                                        .deliverIntervention
                                        .reasonForRefusalCommentLabel),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _dataOfRefusalKey:
          FormControl<DateTime>(value: DateTime.now(), validators: []),
      _reasonOfRefusal:
          FormControl<String>(value: null, validators: [Validators.required]),
      _deliveryCommentKey: FormControl<String>(value: null),
    });
  }
}
