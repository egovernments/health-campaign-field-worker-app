import 'package:digit_data_model/blocs/facility/facility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacilityBlocWrapper extends StatelessWidget {
  final Widget child;
  final String projectId;

  const FacilityBlocWrapper({
    super.key,
    required this.child,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FacilityBloc>(
      create: (context) => FacilityBloc(
        facilityDataRepository: context.read(),
        projectFacilityDataRepository: context.read(),
      )..add(FacilityLoadForProjectEvent(projectId: projectId)),
      child: child,
    );
  }
}
