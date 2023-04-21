import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import '../../blocs/project/project.dart';
import '../../data/data_repository.dart';
import '../../models/data_model.dart';

class ProjectBlocProvider extends StatelessWidget {
  final Widget child;
  final Isar isar;

  const ProjectBlocProvider({
    Key? key,
    required this.child,
    required this.isar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (ctx) => ProjectBloc(
          facilityLocalRepository:
              ctx.read<LocalRepository<FacilityModel, FacilitySearchModel>>(),
          facilityRemoteRepository:
              ctx.read<RemoteRepository<FacilityModel, FacilitySearchModel>>(),
          projectFacilityLocalRepository: ctx.read<
              LocalRepository<ProjectFacilityModel,
                  ProjectFacilitySearchModel>>(),
          projectFacilityRemoteRepository: ctx.read<
              RemoteRepository<ProjectFacilityModel,
                  ProjectFacilitySearchModel>>(),
          projectLocalRepository:
              ctx.read<LocalRepository<ProjectModel, ProjectSearchModel>>(),
          projectStaffLocalRepository: ctx.read<
              LocalRepository<ProjectStaffModel, ProjectStaffSearchModel>>(),
          projectStaffRemoteRepository: ctx.read<
              RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel>>(),
          projectRemoteRepository:
              ctx.read<RemoteRepository<ProjectModel, ProjectSearchModel>>(),
          serviceDefinitionRemoteRepository: ctx.read<
              RemoteRepository<ServiceDefinitionModel,
                  ServiceDefinitionSearchModel>>(),
          isar: isar,
          serviceDefinitionLocalRepository: ctx.read<
              LocalRepository<ServiceDefinitionModel,
                  ServiceDefinitionSearchModel>>(),
          boundaryRemoteRepository:
              ctx.read<RemoteRepository<BoundaryModel, BoundarySearchModel>>(),
          boundaryLocalRepository:
              ctx.read<LocalRepository<BoundaryModel, BoundarySearchModel>>(),
          productVariantLocalRepository: ctx.read<
              LocalRepository<ProductVariantModel,
                  ProductVariantSearchModel>>(),
          productVariantRemoteRepository: ctx.read<
              RemoteRepository<ProductVariantModel,
                  ProductVariantSearchModel>>(),
          projectResourceLocalRepository: ctx.read<
              LocalRepository<ProjectResourceModel,
                  ProjectResourceSearchModel>>(),
          projectResourceRemoteRepository: ctx.read<
              RemoteRepository<ProjectResourceModel,
                  ProjectResourceSearchModel>>(),
        ),
        child: child,
      );
}
