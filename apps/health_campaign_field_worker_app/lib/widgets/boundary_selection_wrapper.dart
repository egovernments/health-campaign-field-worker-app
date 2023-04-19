import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/boundary/boundary.dart';
import '../router/app_router.dart';

class BoundarySelectionWrapper extends StatelessWidget {
  final Widget child;

  const BoundarySelectionWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BoundaryBloc, BoundaryState>(
      listener: (context, state) {
        if (state.hasSubmitted) {
          // context.navigateTo(HomeRoute());
          context.router.pop();
        }
      },
      child: child,
    );
  }
}
