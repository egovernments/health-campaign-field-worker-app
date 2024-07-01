import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/pages/beneficiary_registration/household_details.dart';

@RoutePage()
class CustomHouseHoldDetailsPage extends HouseHoldDetailsPage {
  const CustomHouseHoldDetailsPage({super.key, super.appLocalizations});

  @override
  State<HouseHoldDetailsPage> createState() =>
      CustomHouseHoldDetailsPageState();
}

class CustomHouseHoldDetailsPageState extends HouseHoldDetailsPageState {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          ElevatedButton(onPressed: () {
            context.router.pushNamed('individual-details');
          }, child: Text('Custom Button')),
        ],
      ),
    );
  }
}
