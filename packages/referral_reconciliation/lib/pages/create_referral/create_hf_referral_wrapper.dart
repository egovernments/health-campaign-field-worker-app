import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/blocs/referral_recon_record.dart';

import '../../blocs/referral_recon_service.dart';
import '../../blocs/referral_recon_service_definition.dart';
import '../../models/entities/h_f_referral.dart';
import '../../models/entities/referral_recon_service.dart';
import '../../widgets/project_facility_bloc_wrapper.dart';

@RoutePage()
class HFCreateReferralWrapperPage extends StatelessWidget {
  final bool viewOnly;
  final HFReferralModel? hfReferralModel;
  final List<String> cycles;
  final String projectId;
  const HFCreateReferralWrapperPage({
    super.key,
    required this.projectId,
    this.viewOnly = false,
    this.hfReferralModel,
    required this.cycles,
  });

  @override
  Widget build(BuildContext context) {
    if (cycles.isEmpty) {
      return const Center(
        child: Text('No Cycles exists for the project'),
      );
    } else {
      return ProjectFacilityBlocWrapper(
        projectId: projectId,
        child: BlocProvider(
          create: (_) => ReferralReconServiceDefinitionBloc(
            const ReferralReconServiceDefinitionEmptyState(),
          )..add(const ReferralReconServiceDefinitionFetchEvent()),
          child: BlocProvider(
            create: (_) => ReferralReconServiceBloc(
              const ReferralReconServiceEmptyState(),
            )..add(ReferralReconServiceSearchEvent(
                  serviceSearchModel: ReferralReconServiceSearchModel(
                clientId: hfReferralModel?.clientReferenceId,
              ))),
            child: BlocProvider(
              create: (_) => RecordHFReferralBloc(
                RecordHFReferralState.create(
                  projectId: projectId,
                  viewOnly: viewOnly,
                  hfReferralModel: hfReferralModel,
                ),
              ),
              child: this,
            ),
          ),
        ),
      );
    }
  }
}
