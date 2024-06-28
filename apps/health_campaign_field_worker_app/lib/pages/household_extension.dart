// Importing necessary libraries and packages
import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';

// A custom page that extends the HouseholdLocationPage
// This page is used to display a custom location for a household
@RoutePage()
class CustomHouseHoldLocationPage extends HouseholdLocationPage {
  // Constructor for the CustomHouseHoldLocationPage class
  // It takes a key and a customExtensionWidgetPage as parameters
  // The customExtensionWidgetPage is set to a default value of CustomExtensionWidgetPage
  const CustomHouseHoldLocationPage(
      {super.key,
      super.customExtensionWidgetPage = const CustomExtensionWidgetPage(
        customWidget: SizedBox(),
        customMethod: CustomHouseHoldLocationState.customMethod1,
      )});

  @override
  CustomExtensionWidgetPage? get customExtensionWidgetPage =>
      const CustomExtensionWidgetPage(
        customWidget: Column(
          children: [
            DigitTextFormField(
                label: 'Address line 2', formControlName: 'addressLine2')
          ],
        ),
        customMethod: CustomHouseHoldLocationState.customMethod1,
      );

  // Overriding the createState method to return a new instance of CustomHouseHoldLocationState
  @override
  CustomHouseHoldLocationState createState() => CustomHouseHoldLocationState();
}

// A custom state class that extends the HouseholdLocationPageState
class CustomHouseHoldLocationState extends HouseholdLocationPageState {
  // Overriding the build method to return a widget that fits the entire screen
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: super.build(context),
    );
  }

  @override
  proceedToNextPage(
      BuildContext context,
      FormGroup form,
      BeneficiaryRegistrationState registrationState,
      StackRouter router,
      LocationState locationState,
      BeneficiaryRegistrationBloc bloc) {
    // Custom logic to proceed to the next page
    // This method is called when the user presses the 'Next' button
    // The custom logic can be added here
    // The super keyword is used to call the method from the parent class
    if (kDebugMode) {
      print('form value: ${form.value} ${bloc.state}');
    }
    super.proceedToNextPage(
        context, form, registrationState, router, locationState, bloc);
  }

  // A custom method that prints a message to the console when the app is in debug mode
  static void customMethod1(BuildContext context) {
    if (kDebugMode) {
      print(
          'Custom1 method called ${context.read<BeneficiaryRegistrationBloc>().state}');
    }
  }
}

class CustomBloc extends BeneficiaryRegistrationBloc {
  CustomBloc(super.initialState,
      {required super.individualRepository,
      required super.householdRepository,
      required super.householdMemberRepository,
      required super.projectBeneficiaryRepository,
      required super.beneficiaryType});
}
