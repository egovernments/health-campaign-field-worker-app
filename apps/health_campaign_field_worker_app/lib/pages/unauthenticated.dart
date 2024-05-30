import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UnauthenticatedPageWrapper extends StatelessWidget {
  const UnauthenticatedPageWrapper({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();
}
