import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import 'household_details.dart';
import 'household_location.dart';

@RoutePage()
class ExtendedFormPage extends HouseholdLocationPage {
  ExtendedFormPage()
      : super(
          // Call the parent class constructor with the widget
          widgetConfig: {
            'administrationArea': {
              'isEnabled': false,
              'readOnly': true,
              'isRequired': false,
              'order': 3,
            },
            'accuracy': {
              'isEnabled': true,
              'readOnly': true,
              'isRequired': true,
              'order': 2,
            },
            'addressLine1': {
              'isEnabled': true,
              'readOnly': false,
              'isRequired': false,
              'order': 1,
            },
            'postalCode': {
              'isEnabled': true,
              'readOnly': false,
              'isRequired': false,
              'order': 1,
            },
          },
        );

  @override
  _ExtendedFormPageState createState() => _ExtendedFormPageState();
}

class _ExtendedFormPageState extends HouseholdLocationPageState {
  _ExtendedFormPageState() : super();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}

// HouseHold LOcation
