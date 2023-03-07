import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/facility/facility.dart';
import '../../blocs/project/project.dart';
import '../../data/network_manager.dart';
import '../../models/entities/facility.dart';
import '../../models/entities/project_facility.dart';

class FacilityBlocWrapper extends StatelessWidget {
  final Widget child;

  const FacilityBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, projectState) {
          const noProjectSelected = Center(
            child: Text('No project selected'),
          );

          return projectState.maybeWhen(
            orElse: () => noProjectSelected,
            loading: () => const Center(child: CircularProgressIndicator()),
            fetched: (projects, selectedProject) {
              final projectId = selectedProject?.id;

              if (projectId == null) {
                return noProjectSelected;
              }

              if (selectedProject == null) {
                return const Center(
                  child: Text('Project not selected'),
                );
              }

              final facilityRepository = context
                  .read<NetworkManager>()
                  .repository<FacilityModel, FacilitySearchModel>(context);

              final projectFacilityRepository = context
                  .read<NetworkManager>()
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
                child: child,
              );
            },
          );
        },
      );
}
