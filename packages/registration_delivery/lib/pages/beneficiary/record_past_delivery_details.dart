import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../models/entities/status.dart';
import '../../models/entities/task.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/constants.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class RecordPastDeliveryDetailsPage extends LocalizedStatefulWidget {
  final List<TaskModel>? tasks;

  const RecordPastDeliveryDetailsPage({
    super.key,
    super.appLocalizations,
    this.tasks,
  });

  @override
  State<RecordPastDeliveryDetailsPage> createState() =>
      RecordPastDeliveryDetailsPageState();
}

class RecordPastDeliveryDetailsPageState
    extends LocalizedState<RecordPastDeliveryDetailsPage> {
  static const _recordDoseAdministeredKey = 'recordDoseAdministered';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = RegistrationDeliveryLocalization.of(context);
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);

    final futureTaskList = widget.tasks
        ?.where((task) => task.status == Status.delivered.toValue())
        .toList();

    return Scaffold(
      body: BlocBuilder<DeliverInterventionBloc, DeliverInterventionState>(
        builder: (context, state) {
          return ReactiveFormBuilder(
            form: () => buildForm(context),
            builder: (context, form, child) => ScrollableContent(
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                ),
              ]),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      label: localizations.translate(i18.common.coreCommonNext),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                      onPressed: () {
                        for (int i = 0;
                            i < (futureTaskList ?? []).length;
                            i++) {
                          if (form
                                  .control("$_recordDoseAdministeredKey.$i")
                                  .value ==
                              null) {
                            form
                                .control("$_recordDoseAdministeredKey.$i")
                                .setErrors({'': true});
                          }
                        }

                        form.markAllAsTouched();

                        if (!form.valid) return;

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (ctx) => Popup(
                            title: localizations.translate(i18
                                .deliverIntervention
                                .didYouObservePreviousAdvEventsTitle),
                            inlineActions: true,
                            actions: [
                              DigitButton(
                                  label: localizations.translate(
                                    i18.common.coreCommonYes,
                                  ),
                                  onPressed: () async {
                                    router.maybePop();
                                    final event =
                                        context.read<DeliverInterventionBloc>();
                                    final bloc =
                                        context.read<HouseholdOverviewBloc>();

                                    for (int i = 0;
                                        i < (futureTaskList ?? []).length;
                                        i++) {
                                      // Get the value of the form control for each task

                                      final formControlValue = (form
                                          .control(
                                            "$_recordDoseAdministeredKey.$i",
                                          )
                                          .value as bool);

                                      // Determine the status based on the form control value
                                      final status = formControlValue
                                          ? Status.administeredSuccess.toValue()
                                          : Status.administeredFailed.toValue();

                                      // Create a new task with the updated status
                                      final result = futureTaskList![i]
                                          .copyWith(status: status);

                                      // Add the updated task to the event
                                      event.add(DeliverInterventionSubmitEvent(
                                        task: result,
                                        isEditing: true,
                                        boundaryModel:
                                            RegistrationDeliverySingleton()
                                                .boundary!,
                                      ));
                                    }
                                    context.router.popUntilRouteWithName(
                                      HouseholdOverviewRoute.name,
                                    );
                                    Navigator.of(ctx).pop();
                                    final response = await router.push(
                                      SideEffectsRoute(
                                        tasks: [(futureTaskList ?? []).last],
                                      ),
                                    );
                                    if (response == null) {
                                      bloc.add(HouseholdOverviewReloadEvent(
                                        projectId:
                                            RegistrationDeliverySingleton()
                                                .projectId!,
                                        projectBeneficiaryType:
                                            RegistrationDeliverySingleton()
                                                .beneficiaryType!,
                                      ));
                                    }
                                  },
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.medium),
                              DigitButton(
                                  label: localizations.translate(
                                    i18.common.coreCommonNo,
                                  ),
                                  onPressed: () {
                                    router.maybePop();
                                    final event =
                                        context.read<DeliverInterventionBloc>();

                                    for (int i = 0;
                                        i < (futureTaskList ?? []).length;
                                        i++) {
                                      // Get the value of the form control for each task

                                      final formControllValue = (form
                                          .control(
                                            "$_recordDoseAdministeredKey.$i",
                                          )
                                          .value as bool);

                                      // Determine the status based on the form control value
                                      final status = formControllValue
                                          ? Status.administeredSuccess.toValue()
                                          : Status.administeredFailed.toValue();

                                      // Create a new task with the updated status
                                      final result = futureTaskList![i]
                                          .copyWith(status: status);

                                      // Add the updated task to the event
                                      event.add(DeliverInterventionSubmitEvent(
                                        task: result,
                                        isEditing: true,
                                        boundaryModel:
                                            RegistrationDeliverySingleton()
                                                .boundary!,
                                      ));
                                    }
                                    final bloc =
                                        context.read<HouseholdOverviewBloc>();

                                    bloc.add(HouseholdOverviewReloadEvent(
                                      projectId: RegistrationDeliverySingleton()
                                          .projectId!,
                                      projectBeneficiaryType:
                                          RegistrationDeliverySingleton()
                                              .beneficiaryType!,
                                    ));

                                    event.add(DeliverInterventionSearchEvent(
                                      taskSearch: TaskSearchModel(
                                        projectBeneficiaryClientReferenceId:
                                            bloc.state.householdMemberWrapper
                                                .projectBeneficiaries
                                                ?.map(
                                                    (e) => e.clientReferenceId)
                                                .toList(),
                                      ),
                                    ));
                                    context.router.popUntilRouteWithName(
                                      SearchBeneficiaryRoute.name,
                                    );
                                    bloc.add(HouseholdOverviewReloadEvent(
                                      projectId: RegistrationDeliverySingleton()
                                          .projectId!,
                                      projectBeneficiaryType:
                                          RegistrationDeliverySingleton()
                                              .beneficiaryType!,
                                    ));
                                    Navigator.of(ctx).pop();

                                    router.push(
                                      BeneficiaryDetailsRoute(),
                                    );
                                  },
                                  type: DigitButtonType.primary,
                                  size: DigitButtonSize.medium),
                            ],
                          ),
                        );
                      },
                    ),
                  ]),
              children: [
                DigitCard(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: spacer2,
                      vertical: spacer2,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(spacer2),
                          child: Text(
                            localizations.translate(
                              i18.deliverIntervention.recordPastDeliveryDeatils,
                            ),
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.displayMedium,
                          ),
                        ),
                        ...(futureTaskList?.asMap().entries.map((entry) {
                              final int doseNumber = int.parse(
                                entry.value.additionalFields?.fields
                                    .firstWhereOrNull(
                                      (ele) =>
                                          ele.key ==
                                          AdditionalFieldsType.doseIndex
                                              .toValue(),
                                    )
                                    ?.value,
                              );

                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Column(
                                    children: [
                                      ReactiveWrapperField(
                                        formControlName:
                                            "$_recordDoseAdministeredKey.${futureTaskList.indexOf(entry.value)}",
                                        builder: (field) => LabeledField(
                                          label:
                                              "${localizations.translate(i18.deliverIntervention.wasDosePastDeliveryDetails)} $doseNumber ${localizations.translate(i18.deliverIntervention.wasDosePastRecordDeliveryDetails)} ${localizations.translate(i18.beneficiaryDetails.beneficiaryDose)} ${doseNumber - 1} ?",
                                          isRequired: true,
                                          labelStyle: DigitTheme
                                              .instance
                                              .mobileTheme
                                              .textTheme
                                              .headlineSmall,
                                          padding: const EdgeInsets.only(
                                            top: spacer2,
                                          ),
                                          child: RadioList(
                                            radioDigitButtons: Constants.yesNo
                                                .map((e) => RadioButtonModel(
                                                      code: e.key.toString(),
                                                      name: localizations
                                                          .translate(e.label),
                                                    ))
                                                .toList(),
                                            groupValue: form
                                                    .control(
                                                        "$_recordDoseAdministeredKey.${futureTaskList.indexOf(entry.value)}")
                                                    .value
                                                    .toString() ??
                                                '',
                                            onChanged: (val) {
                                              form
                                                  .control(
                                                      "$_recordDoseAdministeredKey.${futureTaskList.indexOf(entry.value)}")
                                                  .value = val.code ==
                                                      'true'
                                                  ? true
                                                  : false;
                                            },
                                            errorMessage: form
                                                    .control(
                                                        "$_recordDoseAdministeredKey.${futureTaskList.indexOf(entry.value)}")
                                                    .hasErrors
                                                ? localizations.translate(
                                                    i18.common
                                                        .corecommonRequired,
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ),
                                      if (entry.key !=
                                          futureTaskList.length - 1)
                                        const Divider(
                                          thickness: 1.0,
                                        ),
                                    ],
                                  );
                                },
                              );
                            }).toList() ??
                            []),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          );
        },
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
    final futureTaskList = widget.tasks
        ?.where((task) => task.status == Status.delivered.toValue())
        .toList();

    // Create a form group with a FormArray of KeyValue form controls
    return fb.group(
      {
        _recordDoseAdministeredKey: FormArray<bool>([
          ...futureTaskList?.map(
                (e) => FormControl<bool>(),
              ) ??
              [],
        ]),
      },
    );
  }
}
