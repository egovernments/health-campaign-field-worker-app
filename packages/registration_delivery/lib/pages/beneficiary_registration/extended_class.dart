import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'household_location.dart';
import '../../utils/utils.dart';

@RoutePage()
class ExtendedFormPage extends HouseholdLocationPage {
  ExtendedFormPage({super.key});
    //   : super(
    // widgetConfig: RegistrationDeliverySingleton().formConfig,
    //     );

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