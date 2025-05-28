import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:delivery/blocs/search_households/household_global_search.dart';
import 'package:delivery/blocs/search_households/individual_global_search.dart';
import 'package:delivery/data/repositories/local/individual_global_search.dart';
import 'package:registration/blocs/household_details/household_details.dart';
import 'package:registration/data/repositories/local/registration_delivery_address.dart';
import 'package:registration/models/entities/household.dart';
import 'package:registration/models/entities/household_member.dart';
import 'package:registration/models/entities/project_beneficiary.dart';

import 'package:registration/utils/extensions/extensions.dart';

import '../blocs/search_households/search_bloc_common_wrapper.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/search_households/tag_by_search.dart';
import '../data/repositories/local/household_global_search.dart';

import '../models/entities/referral.dart';
import '../models/entities/side_effect.dart';
import '../models/entities/task.dart';
import '../utils/utils.dart';

@RoutePage()
class DeliveryWrapperPage extends StatelessWidget {
  const DeliveryWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return SearchHouseholdsDeliveryBloc(
                  beneficiaryType: DeliverySingleton().beneficiaryType!,
                  userUid: DeliverySingleton().loggedInUserUuid!,
                  projectId: DeliverySingleton().projectId!,
                  addressRepository:
                      context.read<RegistrationDeliveryAddressRepo>(),
                  projectBeneficiary: context.repository<
                      ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>(context),
                  householdMember: context.repository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>(context),
                  household:
                      context.repository<HouseholdModel, HouseholdSearchModel>(
                          context),
                  individual: context.repository<IndividualModel,
                      IndividualSearchModel>(context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalDeliverySearchRepository: context.read<IndividualGlobalDeliverySearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalDeliverySearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return TagSearchDeliveryBloc(
                  beneficiaryType: DeliverySingleton().beneficiaryType!,
                  userUid: DeliverySingleton().loggedInUserUuid!,
                  projectId: DeliverySingleton().projectId!,
                  addressRepository:
                      context.read<RegistrationDeliveryAddressRepo>(),
                  projectBeneficiary: context.repository<
                      ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>(context),
                  householdMember: context.repository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>(context),
                  household:
                      context.repository<HouseholdModel, HouseholdSearchModel>(
                          context),
                  individual: context.repository<IndividualModel,
                      IndividualSearchModel>(context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalDeliverySearchRepository: context.read<IndividualGlobalDeliverySearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalDeliverySearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return IndividualGlobalDeliverySearchBloc(
                  beneficiaryType: DeliverySingleton().beneficiaryType!,
                  userUid: DeliverySingleton().loggedInUserUuid!,
                  projectId: DeliverySingleton().projectId!,
                  addressRepository:
                      context.read<RegistrationDeliveryAddressRepo>(),
                  projectBeneficiary: context.repository<
                      ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>(context),
                  householdMember: context.repository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>(context),
                  household:
                      context.repository<HouseholdModel, HouseholdSearchModel>(
                          context),
                  individual: context.repository<IndividualModel,
                      IndividualSearchModel>(context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalDeliverySearchRepository: context.read<IndividualGlobalDeliverySearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalDeliverySearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return HouseHoldGlobalDeliverySearchBloc(
                  beneficiaryType: DeliverySingleton().beneficiaryType!,
                  userUid: DeliverySingleton().loggedInUserUuid!,
                  projectId: DeliverySingleton().projectId!,
                  addressRepository:
                      context.read<RegistrationDeliveryAddressRepo>(),
                  projectBeneficiary: context.repository<
                      ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>(context),
                  householdMember: context.repository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>(context),
                  household:
                      context.repository<HouseholdModel, HouseholdSearchModel>(
                          context),
                  individual: context.repository<IndividualModel,
                      IndividualSearchModel>(context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalDeliverySearchRepository: context.read<IndividualGlobalDeliverySearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalDeliverySearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return SearchBlocDeliveryWrapper(
                  searchHouseholdsBloc:
                      context.read<SearchHouseholdsDeliveryBloc>(),
                  tagSearchBloc: context.read<TagSearchDeliveryBloc>(),
                  individualGlobalSearchBloc:
                      context.read<IndividualGlobalDeliverySearchBloc>(),
                  houseHoldGlobalSearchBloc:
                      context.read<HouseHoldGlobalDeliverySearchBloc>());
            },
          ),
          BlocProvider(
            create: (_) => HouseholdDetailsBloc(const HouseholdDetailsState()),
          ),
          BlocProvider(
            create: (_) => LocationBloc(location: Location()),
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
