import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/blocs/app_localization.dart';
import 'package:referral_reconciliation/blocs/referral_recon_record.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/referral_recon_service.dart';
import '../../blocs/referral_recon_service_definition.dart';
import '../../blocs/referral_reconciliation_listeners.dart';
import '../../models/entities/referral_recon_service.dart';
import '../../widgets/project_facility_bloc_wrapper.dart';

@RoutePage()
class HFCreateReferralWrapperPage extends StatelessWidget {
  final bool viewOnly;
  final ReferralReconciliation? referralReconciliation;
  final List<String> cycles;
  final String projectId;
  const HFCreateReferralWrapperPage({
    super.key,
    required this.projectId,
    this.viewOnly = false,
    this.referralReconciliation,
    required this.cycles,
  });

  @override
  Widget build(BuildContext context) {
    if (cycles.isEmpty) {
      return Center(
        child: Text(ReferralReconLocalization.of(context)
            .translate(i18.referralReconciliation.noCyclesFound)),
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
                clientId:
                    referralReconciliation?.hfReferralModel?.clientReferenceId,
              ))),
            child: BlocProvider(
              create: (_) => RecordHFReferralBloc(
                RecordHFReferralState.create(
                  projectId: projectId,
                  viewOnly: viewOnly,
                  hfReferralModel: referralReconciliation?.hfReferralModel,
                  additionalData: referralReconciliation?.additionalData,
                ),
              ),
              child: const AutoRouter(),
            ),
          ),
        ),
      );
    }
  }
}
