import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/facility/facility.dart';
import '../../data/network_manager.dart';
import '../../models/data_model.dart';
import 'selected_project_builder.dart';

class FacilityBlocWrapper extends StatelessWidget {
  final Widget child;

  const FacilityBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedProjectBuilder(
      projectBuilder: (context, selectedProject) {
        final networkManager = context.read<NetworkManager>();

        final facilityRepository = networkManager
            .repository<FacilityModel, FacilitySearchModel>(context);

        final projectFacilityRepository = networkManager
            .repository<ProjectFacilityModel, ProjectFacilitySearchModel>(
          context,
        );

        return BlocProvider(
          create: (_) => FacilityBloc(
            facilityDataRepository: facilityRepository,
            projectFacilityDataRepository: projectFacilityRepository,
          )..add(
              FacilityLoadForProjectEvent(
                projectId: selectedProject.id,
              ),
            ),
          lazy: false,
          child: child,
        );
      },
    );
  }
}
