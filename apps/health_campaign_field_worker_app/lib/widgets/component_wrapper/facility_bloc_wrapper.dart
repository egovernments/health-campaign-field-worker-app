import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/facility/facility.dart';
import '../../blocs/project_facility/project_facility.dart';
import '../../models/data_model.dart';
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
        final facilityRepository =
            context.repository<FacilityModel, FacilitySearchModel>();

        final projectFacilityRepository = context
            .repository<ProjectFacilityModel, ProjectFacilitySearchModel>();

        final stockRepository =
            context.repository<StockModel, StockSearchModel>();

        return BlocProvider(
          create: (_) => FacilityBloc(
            facilityDataRepository: facilityRepository,
            projectFacilityDataRepository: projectFacilityRepository,
            stockRepository: stockRepository,
          )..add(
              FacilityLoadForProjectEvent(
                projectId: selectedProject.id,
                userId: context.loggedInUserUuid,
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
