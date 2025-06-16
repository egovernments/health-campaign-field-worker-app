import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:registration_delivery/blocs/search_households/household_global_seach.dart';
import 'package:registration_delivery/blocs/search_households/individual_global_search.dart';
import 'package:registration_delivery/data/repositories/local/individual_global_search.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';
import 'package:registration_bloc/bloc/registration_bloc.dart';
import 'package:registration_bloc/service/registration_service.dart';
import 'package:registration_bloc/repositories/local/search_entity_repository.dart';
import 'package:registration_bloc/models/global_search_params.dart';
import '../blocs/entity_create/entity_create.dart';
import '../blocs/household_details/household_details.dart';
import '../blocs/search_households/search_bloc_common_wrapper.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/search_households/tag_by_search.dart';
import '../data/repositories/local/household_global_search.dart';
import '../data/repositories/local/registration_delivery_address.dart';
import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/referral.dart';
import '../models/entities/side_effect.dart';
import '../models/entities/task.dart';
import '../utils/utils.dart';

@RoutePage()
class RegistrationDeliveryWrapperPage extends StatelessWidget {
  const RegistrationDeliveryWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return RegistrationBloc(
                service: RegistrationService(
                  relationshipMap: [
                    const RelationshipMapping(from: 'name', to: 'individual', localKey: 'individualClientReferenceId', foreignKey: 'clientReferenceId'),
                    const RelationshipMapping(from: 'householdMember', to: 'individual', localKey: 'individualClientReferenceId', foreignKey: 'clientReferenceId'),
                    const RelationshipMapping(from: 'householdMember', to: 'household', localKey: 'householdClientReferenceId', foreignKey: 'clientReferenceId'),
                  ],
                  nestedModelMappings: [
                    const NestedModelMapping(
                      rootModel: 'individual',
                      fields: {
                        'name': NestedFieldMapping(
                          table: 'name',
                          localKey: 'clientReferenceId',
                          foreignKey: 'individualClientReferenceId',
                          type: NestedMappingType.one,
                        ),
                        'address': NestedFieldMapping(
                          table: 'address',
                          localKey: 'clientReferenceId',
                          foreignKey: 'relatedClientReferenceId',
                          type: NestedMappingType.many,
                        ),
                        'identifiers': NestedFieldMapping(
                          table: 'identifier',
                          localKey: 'clientReferenceId',
                          foreignKey: 'clientReferenceId',
                          type: NestedMappingType.many,
                        ),
                      },
                    ),
                  ],
                  projectBeneficiaryRepository: context.repository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(context),
                  householdMemberRepository: context.repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context),
                  householdRepository: context.repository<HouseholdModel, HouseholdSearchModel>(context),
                  individualRepository: context.repository<IndividualModel, IndividualSearchModel>(context),
                  taskDataRepository: context.repository<TaskModel, TaskSearchModel>(context),
                  searchEntityRepository: context.read<SearchEntityRepository>(),
                ),
              );
            },
          ),
          BlocProvider(
            create: (context) {
              return SearchHouseholdsBloc(
                  beneficiaryType:
                      RegistrationDeliverySingleton().beneficiaryType!,
                  userUid: RegistrationDeliverySingleton().loggedInUserUuid!,
                  projectId: RegistrationDeliverySingleton().projectId!,
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
                  individual:
                      context.repository<IndividualModel, IndividualSearchModel>(
                          context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalSearchRepository: context.read<IndividualGlobalSearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalSearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return TagSearchBloc(
                  beneficiaryType:
                      RegistrationDeliverySingleton().beneficiaryType!,
                  userUid: RegistrationDeliverySingleton().loggedInUserUuid!,
                  projectId: RegistrationDeliverySingleton().projectId!,
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
                  individual:
                      context.repository<IndividualModel, IndividualSearchModel>(
                          context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalSearchRepository: context.read<IndividualGlobalSearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalSearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return IndividualGlobalSearchBloc(
                  beneficiaryType:
                      RegistrationDeliverySingleton().beneficiaryType!,
                  userUid: RegistrationDeliverySingleton().loggedInUserUuid!,
                  projectId: RegistrationDeliverySingleton().projectId!,
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
                  individual:
                      context.repository<IndividualModel, IndividualSearchModel>(
                          context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalSearchRepository: context.read<IndividualGlobalSearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalSearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return HouseHoldGlobalSearchBloc(
                  beneficiaryType:
                      RegistrationDeliverySingleton().beneficiaryType!,
                  userUid: RegistrationDeliverySingleton().loggedInUserUuid!,
                  projectId: RegistrationDeliverySingleton().projectId!,
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
                  individual:
                      context.repository<IndividualModel, IndividualSearchModel>(
                          context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  sideEffectDataRepository: context
                      .repository<SideEffectModel, SideEffectSearchModel>(context),
                  referralDataRepository: context.repository<ReferralModel, ReferralSearchModel>(context),
                  individualGlobalSearchRepository: context.read<IndividualGlobalSearchRepository>(),
                  houseHoldGlobalSearchRepository: context.read<HouseHoldGlobalSearchRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return SearchBlocWrapper(
                  searchHouseholdsBloc: context.read<SearchHouseholdsBloc>(),
                  tagSearchBloc: context.read<TagSearchBloc>(),
                  individualGlobalSearchBloc:
                      context.read<IndividualGlobalSearchBloc>(),
                  houseHoldGlobalSearchBloc:
                      context.read<HouseHoldGlobalSearchBloc>());
            },
          ),
          BlocProvider(
            create: (_) => HouseholdDetailsBloc(const HouseholdDetailsState()),
          ),
          BlocProvider(
            create: (_) => LocationBloc(location: Location()),
          ),
          BlocProvider(
            create: (ctx) => EntityCreateBloc(
              individualRepository: context.repository<IndividualModel, IndividualSearchModel>(
                  context),
              householdRepository: context.repository<HouseholdModel, HouseholdSearchModel>(
                  context),
              householdMemberRepository: context.repository<HouseholdMemberModel,
                  HouseholdMemberSearchModel>(context),
              projectBeneficiaryRepository: context.repository<
                  ProjectBeneficiaryModel,
                  ProjectBeneficiarySearchModel>(context),
              taskDataRepository: context.repository<TaskModel, TaskSearchModel>(context),
            ),
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
