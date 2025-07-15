import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../widgets/error_screen.dart';
import 'error_boundary.dart';

@RoutePage()
class UnauthenticatedPageWrapper extends StatelessWidget {
  const UnauthenticatedPageWrapper({super.key});

  @override
  Widget build(BuildContext context) => ErrorBoundary(builder: (context, error) {
    return error != null ? const ErrorScreen() : const AutoRouter();
  });
}
