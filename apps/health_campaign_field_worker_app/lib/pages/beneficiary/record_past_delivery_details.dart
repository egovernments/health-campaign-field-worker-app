import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/localization/app_localization.dart';
import '../../models/data_model.mapper.g.dart';
import '../../models/entities/status.dart';
import '../../models/entities/task.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

class RecordPastDeliveryDetailsPage extends LocalizedStatefulWidget {
  const RecordPastDeliveryDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<RecordPastDeliveryDetailsPage> createState() =>
      _RecordPastDeliveryDetailsPageState();
}

class _RecordPastDeliveryDetailsPageState
    extends LocalizedState<RecordPastDeliveryDetailsPage> {
  static const _recordDoseAdministeredKey = 'recordDoseAdministered';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final router = context.router;

    return Scaffold(
      body: BlocBuilder<DeliverInterventionBloc, DeliverInterventionState>(
        builder: (context, state) {
          return ReactiveFormBuilder(
            form: () => buildForm(context),
            builder: (context, form, child) => ScrollableContent(
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(),
              ]),
              footer: SizedBox(
                height: 85,
                child: DigitCard(
                  margin: const EdgeInsets.only(top: kPadding),
                  child: DigitElevatedButton(
                    onPressed: () async {
                      final event = context.read<DeliverInterventionBloc>();

                      for (int i = 0;
                          i < (state.futureTask ?? []).length;
                          i++) {
                        final formControllValue = (form
                                .control("$_recordDoseAdministeredKey.$i")
                                .value as KeyValue)
                            .key;

                        final status = formControllValue
                            ? Status.delivered.toValue()
                            : Status.notDelivered.toValue();

                        final result =
                            state.futureTask![i].copyWith(status: status);

                        event.add(DeliverInterventionSubmitEvent(
                          result,
                          true,
                          context.boundary,
                        ));
                      }
                      await DigitDialog.show<bool>(
                        context,
                        options: DigitDialogOptions(
                          titleText: i18.deliverIntervention
                              .didYouObservePreviousAdvEventsTitle,
                          barrierDismissible: true,
                          primaryAction: DigitDialogActions(
                            label: localizations.translate(
                              i18.common.coreCommonNo,
                            ),
                            action: (ctx) {
                              router.pop();
                              final bloc =
                                  context.read<HouseholdOverviewBloc>();

                              bloc.add(HouseholdOverviewReloadEvent(
                                projectId: context.projectId,
                                projectBeneficiaryType: context.beneficiaryType,
                              ));
                              event.add(DeliverInterventionSearchEvent(
                                TaskSearchModel(
                                  projectBeneficiaryClientReferenceId: bloc
                                      .state
                                      .householdMemberWrapper
                                      .projectBeneficiaries
                                      .map((e) => e.clientReferenceId)
                                      .toList(),
                                ),
                              ));
                              Navigator.of(
                                ctx,
                                rootNavigator: true,
                              ).pop();
                              router.push(
                                BeneficiaryDetailsRoute(),
                              );
                            },
                          ),
                          secondaryAction: DigitDialogActions(
                            label: localizations.translate(
                              i18.common.coreCommonYes,
                            ),
                            action: (ctx) {
                              router.pop();
                              Navigator.of(
                                ctx,
                                rootNavigator: true,
                              ).pop();
                              router.push(
                                AdverseEventsRoute(
                                  tasks: [(state.futureTask ?? []).last],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        localizations.translate(i18.common.coreCommonNext),
                      ),
                    ),
                  ),
                ),
              ),
              children: [
                DigitCard(
                  child: Column(
                    children: [
                      Text(
                        localizations.translate(
                          i18.deliverIntervention.recordPastDeliveryDeatils,
                        ),
                        style: theme.textTheme.displayMedium,
                      ),
                      Column(
                        children: [
                          ...(state.futureTask?.map((e) {
                                final int doseNumber =
                                    int.parse(e.additionalFields!.fields
                                        .firstWhereOrNull(
                                          (ele) => ele.key == "DoseIndex",
                                        )!
                                        .value);

                                return DigitRadioButtonList(
                                  labelText: "${localizations.translate(
                                    i18.deliverIntervention
                                        .wasDosePastDeliveryDetails,
                                  )} $doseNumber ${localizations.translate(
                                    i18.deliverIntervention
                                        .wasDosePastRecordDeliveryDetails,
                                  )} ${localizations.translate(
                                    i18.beneficiaryDetails.beneficiaryDose,
                                  )} ${doseNumber - 1} ?",
                                  labelStyle: theme.textTheme.displayMedium,
                                  formControlName:
                                      "$_recordDoseAdministeredKey.${state.futureTask!.indexOf(e)}",
                                  valueMapper: (val) =>
                                      localizations.translate(val.label),
                                  options: Constants.yesNo,
                                  isRequired: true,
                                  onValueChange: (val) {
                                    form
                                        .control(
                                          "$_recordDoseAdministeredKey.${state.futureTask!.indexOf(e)}",
                                        )
                                        .value = val;
                                  },
                                );
                              }).toList() ??
                              []),
                          const Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
    final bloc = context.read<DeliverInterventionBloc>().state;

    return fb.group(
      {
        _recordDoseAdministeredKey: FormArray<KeyValue>([
          ...bloc.futureTask?.map(
                (e) => FormControl<KeyValue>(),
              ) ??
              [],
        ]),
      },
    );
  }
}
