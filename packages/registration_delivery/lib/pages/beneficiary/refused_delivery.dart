import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<HouseholdOverviewBloc>();
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => buildForm(),
          builder: (_, form, __) =>
              BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                builder: (context, registrationState) {
                  return ScrollableContent(
                    enableFixedDigitButton: true,
                    header: const Column(
                      children: [
                        BackNavigationHelpHeaderWidget(
                          showcaseButton: ShowcaseButton(),
                          showHelp: false,
                        ),
                      ],
                    ),
                    footer: DigitCard(
                        margin: const EdgeInsets.only(top: spacer2),
                        children: [
                          DigitButton(
                            label: localizations.translate(
                              i18.householdLocation.actionLabel,
                            ),
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () {
                              form.markAllAsTouched();

                              if (form.control(_reasonOfRefusal).value ==
                                  null) {
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
                                  RegistrationDeliverySingleton()
                                              .beneficiaryType !=
                                          BeneficiaryType.individual
                                      ? [
                                          registrationState
                                              .householdMemberWrapper
                                              .projectBeneficiaries
                                              ?.first
                                        ]
                                      : registrationState.householdMemberWrapper
                                          .projectBeneficiaries
                                          ?.where(
                                            (element) =>
                                                element
                                                    .beneficiaryClientReferenceId ==
                                                registrationState
                                                    .selectedIndividual
                                                    ?.clientReferenceId,
                                          )
                                          .toList();

                              // Determine the status based on the reason of refusal
                              String status;
                              if (reasonOfRefusal ==
                                  Status.beneficiaryRefused.toValue()) {
                                status = Status.beneficiaryRefused.toValue();
                              } else {
                                status = Status.administeredFailed.toValue();
                              }
                              final oldTask = RegistrationDeliverySingleton()
                                          .beneficiaryType !=
                                      BeneficiaryType.individual
                                  ? registrationState
                                      .householdMemberWrapper.tasks?.last
                                  : null;

                              context.read<DeliverInterventionBloc>().add(
                                    DeliverInterventionSubmitEvent(
                                      navigateToSummary: true,
                                      householdMemberWrapper: registrationState
                                          .householdMemberWrapper,
                                      task: _getTaskModel(
                                          oldTask,
                                          projectBeneficiary
                                              ?.first?.clientReferenceId,
                                          status,
                                          reasonOfRefusal,
                                          refusalComment,
                                          registrationState
                                              .householdMemberWrapper
                                              .members
                                              ?.first
                                              .address
                                              ?.first),
                                      isEditing: false,
                                      boundaryModel:
                                          RegistrationDeliverySingleton()
                                              .boundary!,
                                    ),
                                  );
                              context.router.push(DeliverySummaryRoute());
                            },
                          ),
                        ]),
                    slivers: [
                      SliverToBoxAdapter(
                        child: DigitCard(
                            margin: const EdgeInsets.all(spacer2),
                            children: [
                              Text(
                                localizations.translate(
                                  RegistrationDeliverySingleton()
                                          .projectType!
                                          .code
                                          .toString() +
                                      i18.deliverIntervention
                                          .refusedDeliveryLabel,
                                ),
                                style: textTheme.headingXl,
                              ),
                              refusedDeliveryShowcaseData.dateOfVisit.buildWith(
                                child: ReactiveWrapperField(
                                  formControlName: _dataOfRefusalKey,
                                  builder: (field) => LabeledField(
                                    label: localizations.translate(
                                      i18.deliverIntervention
                                          .refusedDeliveryVisitDateLabel,
                                    ),
                                    child: DigitDateFormInput(
                                      readOnly: true,
                                      confirmText: localizations.translate(
                                        i18.common.coreCommonOk,
                                      ),
                                      cancelText: localizations.translate(
                                        i18.common.coreCommonCancel,
                                      ),
                                      initialValue: DateFormat('dd MMM yyyy')
                                          .format(form
                                              .control(_dataOfRefusalKey)
                                              .value),
                                    ),
                                  ),
                                ),
                              ),
                              refusedDeliveryShowcaseData.reasonOfRefusal
                                  .buildWith(
                                child: SelectionCard<String>(
                                  title: localizations.translate(
                                    RegistrationDeliverySingleton()
                                            .projectType!
                                            .code
                                            .toString() +
                                        i18.deliverIntervention
                                            .reasonForRefusalLabel,
                                  ),
                                  showParentContainer: true,
                                  isRequired: true,
                                  width:
                                      MediaQuery.of(context).size.width * .34,
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
                                        form.control(_reasonOfRefusal).value =
                                            value.first;
                                      } else {
                                        form.control(_reasonOfRefusal).value =
                                            null;
                                        setState(() {
                                          form
                                              .control(_reasonOfRefusal)
                                              .setErrors({'': true});
                                        });
                                      }
                                    });
                                  },
                                  valueMapper: (value) {
                                    return localizations.translate(
                                        'REASON_${value.toString()}');
                                  },
                                  errorMessage: form
                                              .control(_reasonOfRefusal)
                                              .hasErrors &&
                                          form.control(_reasonOfRefusal).touched
                                      ? localizations.translate(
                                          i18.common.corecommonRequired)
                                      : null,
                                ),
                              ),
                              refusedDeliveryShowcaseData.comments.buildWith(
                                child: ReactiveWrapperField(
                                  formControlName: _deliveryCommentKey,
                                  builder: (field) => LabeledField(
                                    label: localizations.translate(i18
                                        .deliverIntervention
                                        .reasonForRefusalCommentLabel),
                                    child: DigitTextFormInput(
                                      onChange: (value) {
                                        form
                                            .control(_deliveryCommentKey)
                                            .value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  );
                },
              )),
    );
  }

  _getTaskModel(
    TaskModel? oldTask,
    String? projectBeneficiaryClientReferenceId,
    String status,
    String? reasonOfRefusal,
    String? refusalComment,
    AddressModel? address,
  ) {
    var task = oldTask;
    var clientReferenceId = task?.clientReferenceId ?? IdGen.i.identifier;
    task ??= TaskModel(
      projectBeneficiaryClientReferenceId: projectBeneficiaryClientReferenceId,
      clientReferenceId: clientReferenceId,
      address: address?.copyWith(
        relatedClientReferenceId: clientReferenceId,
      ),
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
      ),
      projectId: RegistrationDeliverySingleton().projectId,
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    task = task.copyWith(
      status: status,
      address: address?.copyWith(
        relatedClientReferenceId: clientReferenceId,
      ),
      additionalFields: TaskAdditionalFields(
        version: 1,
        fields: [
          AdditionalField(
            AdditionalFieldsType.reasonOfRefusal.toValue(),
            reasonOfRefusal,
          ),
          if (refusalComment != null)
            AdditionalField(
              AdditionalFieldsType.deliveryComment.toValue(),
              refusalComment,
            ),
        ],
      ),
    );

    return task;
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
