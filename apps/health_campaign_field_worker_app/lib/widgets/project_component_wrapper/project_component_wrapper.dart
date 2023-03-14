import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/facility/facility.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../blocs/project/project.dart';
import '../../data/network_manager.dart';
import '../../models/data_model.dart';

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

class ProductVariantBlocWrapper extends StatelessWidget {
  final Widget child;

  const ProductVariantBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedProjectBuilder(
      projectBuilder: (context, selectedProject) {
        final networkManager = context.read<NetworkManager>();

        final productVariant = networkManager
            .repository<ProductVariantModel, ProductVariantSearchModel>(
          context,
        );

        final projectResource = networkManager
            .repository<ProjectResourceModel, ProjectResourceSearchModel>(
          context,
        );

        return BlocProvider(
          create: (_) => ProductVariantBloc(
            const ProductVariantEmptyState(),
            productVariantDataRepository: productVariant,
            projectResourceDataRepository: projectResource,
          )..add(
              ProductVariantLoadEvent(
                query: ProjectResourceSearchModel(
                  projectId: selectedProject.id,
                ),
              ),
            ),
          lazy: false,
          child: child,
        );
      },
    );
  }
}

class ProjectComponentWrapper extends StatelessWidget {
  final Widget child;

  const ProjectComponentWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
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

            final networkManager = context.read<NetworkManager>();

            final facilityRepository = networkManager
                .repository<FacilityModel, FacilitySearchModel>(context);

            final projectFacilityRepository = networkManager
                .repository<ProjectFacilityModel, ProjectFacilitySearchModel>(
              context,
            );

            final productVariant = networkManager
                .repository<ProductVariantModel, ProductVariantSearchModel>(
              context,
            );

            final projectResource = networkManager
                .repository<ProjectResourceModel, ProjectResourceSearchModel>(
              context,
            );

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => FacilityBloc(
                    facilityDataRepository: facilityRepository,
                    projectFacilityDataRepository: projectFacilityRepository,
                  )..add(
                      FacilityLoadForProjectEvent(
                        projectId: selectedProject.id,
                      ),
                    ),
                  lazy: false,
                ),
                BlocProvider(
                  create: (_) => ProductVariantBloc(
                    const ProductVariantEmptyState(),
                    productVariantDataRepository: productVariant,
                    projectResourceDataRepository: projectResource,
                  )..add(
                      ProductVariantLoadEvent(
                        query: ProjectResourceSearchModel(
                          projectId: selectedProject.id,
                        ),
                      ),
                    ),
                  lazy: false,
                ),
              ],
              child: child,
            );
          },
        );
      },
    );
  }
}

class SelectedProjectBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    ProjectModel selectedProject,
  ) projectBuilder;

  const SelectedProjectBuilder({
    Key? key,
    required this.projectBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        const noProjectSelected = Center(
          child: Text('No project selected'),
        );

        return projectState.maybeWhen(
          orElse: () => noProjectSelected,
          loading: () => const Center(child: CircularProgressIndicator()),
          fetched: (projects, selectedProject) {
            if (selectedProject == null) {
              return noProjectSelected;
            }

            return projectBuilder(context, selectedProject);
          },
        );
      },
    );
  }
}
