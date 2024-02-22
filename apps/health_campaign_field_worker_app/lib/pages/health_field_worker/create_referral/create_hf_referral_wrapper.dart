import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/project/project.dart';
import '../../../../models/data_model.dart';
import '../../../../router/app_router.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../../widgets/boundary_selection_wrapper.dart';
import '../../../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../../blocs/hf_referrals/record_referral.dart';
import '../../../blocs/service/service.dart';
import '../../../blocs/service_definition/service_definition.dart';

class HFCreateReferralWrapperPage extends StatelessWidget
    with AutoRouteWrapper {
  final bool viewOnly;
  final HFReferralModel? hfReferralModel;
  const HFCreateReferralWrapperPage({
    Key? key,
    required this.viewOnly,
    this.hfReferralModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoundarySelectionWrapper(
      child: AutoRouter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final hfReferralRepository =
        context.repository<HFReferralModel, HFReferralSearchModel>();
    final serviceDefinition = context
        .repository<ServiceDefinitionModel, ServiceDefinitionSearchModel>();

    final service = context.repository<ServiceModel, ServiceSearchModel>();

    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        const noProjectSelected = Center(
          child: Text('No project selected'),
        );

        if (projectState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final selectedProject = projectState.selectedProject;

        if (selectedProject == null) {
          return noProjectSelected;
        }

        final projectId = selectedProject.id;

        return FacilityBlocWrapper(
          child: ProductVariantBlocWrapper(
            child: BlocProvider(
              create: (_) => ServiceDefinitionBloc(
                const ServiceDefinitionEmptyState(),
                serviceDefinitionDataRepository: serviceDefinition,
              )..add(const ServiceDefinitionFetchEvent()),
              child: BlocProvider(
                create: (_) => ServiceBloc(
                  const ServiceEmptyState(),
                  serviceDataRepository: service,
                )..add(ServiceSearchEvent(
                      serviceSearchModel: ServiceSearchModel(
                    clientId: hfReferralModel?.clientReferenceId,
                  ))),
                child: BlocProvider(
                  create: (_) => RecordHFReferralBloc(
                    RecordHFReferralState.create(
                      projectId: context.projectId,
                      viewOnly: viewOnly,
                      hfReferralModel: hfReferralModel,
                    ),
                    hfReferralRepository: hfReferralRepository,
                  ),
                  child: this,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
