import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class DeliverInterventionPage extends LocalizedStatefulWidget {
  const DeliverInterventionPage({
    super.key,
    super.appLocalizations,
  });
  @override
  State<DeliverInterventionPage> createState() =>
      _DeliverInterventionPageState();
}

class _DeliverInterventionPageState
    extends LocalizedState<DeliverInterventionPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            children: [
              DigitCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            localizations.translate(
                              i18.deliverIntervention.deliverInterventionLabel,
                            ),
                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                      ],
                    ),
                    DigitTableCard(
                      element: {
                        localizations.translate(i18.deliverIntervention
                            .dateOfRegistrationLabel): "Joseph Segio",
                        localizations.translate(i18.householdOverView
                            .householdOverViewHouseholdHeadLabel): "Jose (H)",
                      },
                    ),
                    DigitTableCard(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      element: {
                        localizations.translate(
                          i18.deliverIntervention.idTypeText,
                        ): "National ID",
                        localizations.translate(
                          i18.deliverIntervention.idNumberText,
                        ): "JGK87389",
                        localizations.translate(i18.common.coreCommonAge):
                            "40 years",
                        localizations.translate(i18.common.coreCommonGender):
                            "Male",
                        localizations.translate(
                          i18.common.coreCommonMobileNumber,
                        ): "+258 576478",
                      },
                    ),
                    DigitTableCard(
                      element: {
                        localizations.translate(
                          i18.deliverIntervention.memberCountText,
                        ): 4,
                        localizations.translate(i18.deliverIntervention
                            .noOfResourcesForDelivery): "03",
                      },
                    ),
                    DigitDropdown(
                      label: localizations.translate(
                        i18.deliverIntervention.resourceDeliveredLabel,
                      ),
                      initialValue: 'BEDNETS',
                      menuItems: [
                        MenuItemModel(
                          "DOLO",
                          "DOLO",
                        ),
                        MenuItemModel(
                          "BEDNETS",
                          "BEDNETS",
                        ),
                      ],
                      onChanged: (String? newValue) {},
                      formControlName: 'resourcDelivered',
                    ),
                    DigitIntegerFormPicker(
                      form: form,
                      formControlName: 'quantityDistributed',
                      label: localizations.translate(
                        i18.deliverIntervention.quantityDistributedLabel,
                      ),
                      incrementer: true,
                    ),
                    DigitDropdown(
                      label: localizations.translate(
                        i18.deliverIntervention.deliveryCommentLabel,
                      ),
                      initialValue: 'Betnets',
                      menuItems: [
                        MenuItemModel(
                          "Insufficient Resources",
                          "Insufficient Resources",
                        ),
                        MenuItemModel(
                          "Beneficiary Absent",
                          "Beneficiary Absent",
                        ),
                      ],
                      onChanged: (String? newValue) {},
                      formControlName: 'deliveryComment',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: DigitCard(
          child: DigitElevatedButton(
            onPressed: () => DigitDialog.show(
              context,
              options: DigitDialogOptions(
                titleText: localizations
                    .translate(i18.deliverIntervention.dialogTitle),
                contentText: localizations
                    .translate(i18.deliverIntervention.dialogContent),
                primaryAction: DigitDialogActions(
                  label: localizations.translate(i18.common.coreCommonSubmit),
                  action: (context) =>
                      Navigator.of(context, rootNavigator: true).pop(),
                ),
                secondaryAction: DigitDialogActions(
                  label: localizations.translate(i18.common.coreCommonCancel),
                  action: (context) =>
                      Navigator.of(context, rootNavigator: true).pop(),
                ),
              ),
            ),
            child: Center(
              child: Text(
                localizations.translate(i18.common.coreCommonSubmit),
              ),
            ),
          ),
        ),
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        'resourcDelivered': FormControl<String>(value: ''),
        'quantityDistributed': FormControl<int>(value: 1),
        'deliveryComment': FormControl<String>(value: ''),
      });
}
