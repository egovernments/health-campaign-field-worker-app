import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/utils/extensions/extensions.dart';
import 'package:referral_reconciliation/utils/utils.dart';

class ProjectFacilityBlocWrapper extends StatelessWidget {
  final Widget child;
  final String projectId;

  const ProjectFacilityBlocWrapper({
    super.key,
    required this.child,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectFacilityBloc>(
      create: (_) => ProjectFacilityBloc(
        const ProjectFacilityEmptyState(),
        projectFacilityDataRepository: context.repository<ProjectFacilityModel,
            ProjectFacilitySearchModel>(context),
      )..add(ProjectFacilityLoadEvent(
          query: ProjectFacilitySearchModel(
              projectId: [ReferralReconSingleton().projectId]))),
      child: child,
    );
  }
}
