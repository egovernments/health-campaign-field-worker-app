import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/blocs/project_facility.dart';

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
    return BlocProvider<ReferralReconProjectFacilityBloc>(
      create: (_) => ReferralReconProjectFacilityBloc(
        const ProjectFacilityEmptyState(),
        context: context,
      )..add(ProjectFacilityLoadForProjectEvent(projectId: projectId)),
      child: child,
    );
  }
}
