import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/models/widget_config_model.dart';
import 'household_location.dart';
import '../../utils/utils.dart';

List<FormConfigFieldModel> getHouseholdLocationFields() {
  // Find the item with name 'HouseholdLocation' and return its fields.
  final householdLocation = RegistrationDeliverySingleton().formConfig?.firstWhere(
        (value) => value.name == 'HouseholdLocation',
  );

  // Return the fields if the item is found, otherwise return an empty list.
  return householdLocation?.fields ?? [];
}

@RoutePage()
class ExtendedFormPage extends HouseholdLocationPage {
  ExtendedFormPage({super.key})
      : super(
    widgetConfig: RegistrationDeliverySingleton().formConfig,
          // Call the parent class constructor with the widget
          // widgetConfig: {
          //   'administrationArea': {
          //     'isEnabled': false,
          //     'readOnly': true,
          //     'isRequired': false,
          //     'order': 3,
          //   },
          //   'accuracy': {
          //     'isEnabled': true,
          //     'readOnly': true,
          //     'isRequired': true,
          //     'order': 2,
          //   },
          //   'addressLine1': {
          //     'isEnabled': true,
          //     'readOnly': false,
          //     'isRequired': false,
          //     'regex': ["^\\d+\$"],
          //     "errorMessage": "Invalid input",
          //     'order': 1,
          //   },
          //   'postalCode': {
          //     'isEnabled': true,
          //     'readOnly': false,
          //     'isRequired': false,
          //     'regex': ["^\\d+\\\$"],
          //     "errorMessage": "Invalid input",
          //     'order': 1,
          //   },
          // },
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