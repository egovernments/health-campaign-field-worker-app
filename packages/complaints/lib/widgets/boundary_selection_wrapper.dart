import 'package:auto_route/auto_route.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:digit_data_model/blocs/boundary/boundary.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// Wraps the [child] widget with a [BlocListener] that listens to
/// [BoundaryState] changes and navigates to [HomeRoute] when submitted.
class BoundarySelectionWrapper extends StatelessWidget {
  final Widget child;

  const BoundarySelectionWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<BoundaryBloc, BoundaryState>(
        listener: (context, state) {
          if (state.hasSubmitted) {
            context.navigateTo(
              const ComplaintsInboxWrapperRoute(),
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
