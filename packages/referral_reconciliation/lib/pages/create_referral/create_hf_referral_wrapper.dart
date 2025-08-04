import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/blocs/app_localization.dart';
import 'package:referral_reconciliation/blocs/referral_recon_record.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';
import 'package:referral_reconciliation/utils/extensions/extensions.dart';
import 'package:survey_form/survey_form.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/referral_recon_service_definition.dart';
import '../../widgets/localized.dart';
import '../../widgets/project_facility_bloc_wrapper.dart';

@RoutePage()
class HFCreateReferralWrapperPage extends LocalizedStatefulWidget {
  final bool viewOnly;
  final HFReferralModel? referralReconciliation;
  final List<String> cycles;
  final String projectId;
  final void Function(BuildContext context)? onInitComplete;

  const HFCreateReferralWrapperPage({
    super.key,
    required this.projectId,
    this.viewOnly = false,
    this.referralReconciliation,
    required this.cycles,
    this.onInitComplete,
  });

  @override
  State<HFCreateReferralWrapperPage> createState() =>
      _HFCreateReferralWrapperPageState();
}

class _HFCreateReferralWrapperPageState
    extends State<HFCreateReferralWrapperPage> {
  bool _didInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didInit && widget.onInitComplete != null) {
      _didInit = true;
      // Ensure context is fully initialized
      Future.microtask(() => widget.onInitComplete!(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cycles.isEmpty) {
      return Center(
        child: Text(ReferralReconLocalization.of(context)
            .translate(i18.referralReconciliation.noCyclesFound)),
      );
    } else {
      return ProjectFacilityBlocWrapper(
        projectId: widget.projectId,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ReferralReconServiceDefinitionBloc(
                const ReferralReconServiceDefinitionEmptyState(),
                serviceDefinitionDataRepository: context.repository<
                    ServiceDefinitionModel, ServiceDefinitionSearchModel>(
                  context,
                ),
              )..add(const ReferralReconServiceDefinitionFetchEvent()),
            ),
            BlocProvider(
              create: (_) => ServiceBloc(
                const ServiceEmptyState(),
                serviceDataRepository: context
                    .repository<ServiceModel, ServiceSearchModel>(context),
              )..add(ServiceSearchEvent(
                  serviceSearchModel: ServiceSearchModel(
                    referenceIds: [
                      widget.referralReconciliation?.clientReferenceId ?? ''
                    ],
                  ),
                )),
            ),
            BlocProvider(
              create: (_) => RecordHFReferralBloc(
                RecordHFReferralState.create(
                  projectId: widget.projectId,
                  viewOnly: widget.viewOnly,
                  hfReferralModel: widget.referralReconciliation,
                ),
                referralReconDataRepository:
                    context.repository<HFReferralModel, HFReferralSearchModel>(
                  context,
                ),
              ),
            ),
          ],
          child: const AutoRouter(),
        ),
      );
    }
  }
}
