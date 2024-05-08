import 'package:flutter/material.dart';
import 'package:registration_delivery/blocs/registraton_delivery_listener.dart';

import '../../router/app_router.dart';

class HcmRegistrationDelivery extends RegistrationDeliveryListener {
  final BuildContext? context;

  HcmRegistrationDelivery({required this.context});

  @override
  void navigateToBoundaryPage() {
    context!.router.push(BoundarySelectionRoute());
  }
}
