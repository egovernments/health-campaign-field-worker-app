import 'package:digit_data_model/data/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/facility/facility.dart';
import '../../blocs/project_facility/project_facility.dart';
import '../../models/entities/facility.dart';
import '../../models/entities/project_facility.dart';
import '../../utils/extensions/extensions.dart';
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

        final projectFacilityRepository = context
            .repository<ProjectFacilityModel, ProjectFacilitySearchModel>();

        return BlocProvider(
          create: (_) => FacilityBloc(
            facilityLocalRepository: context
                .read<LocalRepository<FacilityModel, FacilitySearchModel>>(),
            projectFacilityLocalRepository: context.read<
                LocalRepository<ProjectFacilityModel,
                    ProjectFacilitySearchModel>>(),
          )..add(
              FacilityLoadForProjectEvent(
                projectId: selectedProject.id,
              ),
            ),
          child: BlocProvider(
            create: (_) => ProjectFacilityBloc(
              const ProjectFacilityState.empty(),
              projectFacilityDataRepository: projectFacilityRepository,
            )..add(
                ProjectFacilityLoadEvent(
                  query: ProjectFacilitySearchModel(
                    projectId: [context.projectId],
                  ),
                ),
              ),
            child: child,
          ),
        );
      },
    );
  }
}
