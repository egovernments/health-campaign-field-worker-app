import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/boundary/boundary.dart';
import '../router/app_router.dart';

class BoundarySelectionWrapper extends StatelessWidget {
  final Widget child;
  final StackRouter? router;

  const BoundarySelectionWrapper({
    Key? key,
    required this.child,
    this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<BoundaryBloc, BoundaryState>(
        listener: (context, state) {
          if (state.hasSubmitted) {
            context.navigateTo(
              HomeRoute(),
              onFailure: (failure) {
                AppLogger.instance.error(
                  title: 'BoundarySelectionWrapper',
                  message: failure.toString(),
                );
              },
            );
          }
        },
        child: child,
      );
}
