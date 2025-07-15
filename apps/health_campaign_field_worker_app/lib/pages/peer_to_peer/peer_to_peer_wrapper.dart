import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:survey_form/models/entities/service.dart';

import '../../blocs/peer_to_peer/peer_to_peer.dart';
import '../../models/downsync/downsync.dart';
import '../../router/app_router.dart';

@RoutePage()
class PeerToPeerWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  const PeerToPeerWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        child: this,
        create: (_) => PeerToPeerBloc(
              individualLocalRepository: context.read<
                  LocalRepository<IndividualModel, IndividualSearchModel>>(),
              householdLocalRepository: context.read<
                  LocalRepository<HouseholdModel, HouseholdSearchModel>>(),
              householdMemberLocalRepository: context.read<
                  LocalRepository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>>(),
              projectBeneficiaryLocalRepository: context.read<
                  LocalRepository<ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>>(),
              taskLocalRepository:
                  context.read<LocalRepository<TaskModel, TaskSearchModel>>(),
              sideEffectLocalRepository: context.read<
                  LocalRepository<SideEffectModel, SideEffectSearchModel>>(),
              referralLocalRepository: context
                  .read<LocalRepository<ReferralModel, ReferralSearchModel>>(),
              downSyncLocalRepository: context
                  .read<LocalRepository<DownsyncModel, DownsyncSearchModel>>(),
              serviceLocalRepository: context
                  .read<LocalRepository<ServiceModel, ServiceSearchModel>>(),
            ));
  }
}
