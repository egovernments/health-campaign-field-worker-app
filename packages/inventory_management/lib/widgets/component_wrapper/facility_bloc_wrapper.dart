import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';

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
          facilityDataRepository:
              context.repository<FacilityModel, FacilitySearchModel>(context),
          projectFacilityDataRepository: context.repository<
              ProjectFacilityModel, ProjectFacilitySearchModel>(context))
        ..add(FacilityLoadForProjectEvent(projectId: projectId)),
      child: child,
    );
  }
}
