// Importing necessary libraries and packages
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        customWidget: Text('From main app'),
        customMethod: CustomHouseHoldLocationState.customMethod1,
      )});

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

  // A custom method that prints a message to the console when the app is in debug mode
  static void customMethod1(BuildContext context) {
    if (kDebugMode) {
      print(
          'Custom1 method called ${context.read<BeneficiaryRegistrationBloc>().state}');
    }
  }
}
