import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';

class DeliverInterventionPage extends StatelessWidget {
  const DeliverInterventionPage({super.key});

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
                        Text(
                          'Deliver Intervention',
                          style: theme.textTheme.displayMedium,
                        ),
                      ],
                    ),
                    const DigitTableCard(
                      element: {
                        "Date of Registration": "Joseph Segio",
                        "Household Head Name": "Jose (H)",
                      },
                    ),
                    DigitTableCard(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      element: const {
                        "ID Type": "National ID",
                        "ID Number": "JGK87389",
                        "Age": "40 years",
                        "Gender": "Male",
                        "Mobile Number": "+258 576478",
                      },
                    ),
                    const DigitTableCard(
                      element: {
                        "Member Count": 4,
                        "Number Of Resources For Delivery": "03",
                      },
                    ),
                    DigitDropdown(
                      label: 'Resource Delivered',
                      initialValue: 'Betnets',
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
                      label: "Resource Delivered",
                      incrementer: true,
                    ),
                    DigitDropdown(
                      label: 'Delivery Comment',
                      initialValue: 'Betnets',
                      menuItems: [
                        MenuItemModel(
                          "Insufficient Resources",
                          "Insufficient Resources",
                        ),
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
              title: "Ready to Submit?",
              content:
                  "Make sure you review all details before clicking on the Submit button. Click on the Cancel button to go back to the previous page.",
              primaryActionLabel: "Submit",
              primaryAction: () =>
                  Navigator.of(context, rootNavigator: true).pop(),
              secondaryActionLabel: "Cancel",
              secondaryAction: () =>
                  Navigator.of(context, rootNavigator: true).pop(),
            ),
            child: const Center(
              child: Text(
                "Submit",
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
