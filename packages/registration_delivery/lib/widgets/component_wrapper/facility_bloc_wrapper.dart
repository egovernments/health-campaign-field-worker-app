import 'package:digit_data_model/blocs/facility/facility.dart';
import 'package:digit_data_model/blocs/project_facility/project_facility.dart';
import 'package:digit_data_model/models/entities/facility.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/extensions/extensions.dart';
import '../../utils/utils.dart';
import 'selected_project_builder.dart';

class FacilityBlocWrapper extends StatelessWidget {
  final Widget child;

  const FacilityBlocWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SelectedProjectBuilder(
      projectBuilder: (context, selectedProject) {
        final facilityRepository =
            context.repository<FacilityModel, FacilitySearchModel>(context);

        final projectFacilityRepository = context.repository<
            ProjectFacilityModel, ProjectFacilitySearchModel>(context);

        return BlocProvider(
          create: (_) => FacilityBloc(
            facilityDataRepository: facilityRepository,
            projectFacilityDataRepository: projectFacilityRepository,
          )..add(
              FacilityLoadForProjectEvent(
                projectId: RegistrationDeliverySingleton().projectId!,
              ),
            ),
          child: BlocProvider(
            create: (_) => ProjectFacilityBloc(
              const ProjectFacilityState.loading(),
              projectFacilityDataRepository:
                  context.read<ProjectFacilityDataRepository>(),
              facilityDataRepository: context.read<FacilityDataRepository>(),
            )..add(
                ProjectFacilityLoadEvent(
                  query: ProjectFacilitySearchModel(
                    projectId: [RegistrationDeliverySingleton().projectId!],
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
