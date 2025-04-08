// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:survey_form/models/entities/service.dart';

import '../../data/repositories/local/household_global_search.dart';
import '../../data/repositories/local/individual_global_search.dart';
import '../../data/repositories/local/registration_delivery_address.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/task.dart';
import '../../utils/global_search_parameters.dart';
import '../../utils/typedefs.dart';

part 'search_households.freezed.dart';

typedef SearchHouseholdsEmitter = Emitter<SearchHouseholdsState>;

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchHouseholdsBloc
    extends Bloc<SearchHouseholdsEvent, SearchHouseholdsState> {
  final BeneficiaryType beneficiaryType;
  final String projectId;
  final String userUid;
  final IndividualDataRepository individual;
  final HouseholdDataRepository household;
  final RegistrationDeliveryAddressRepo addressRepository;
  final HouseholdMemberDataRepository householdMember;
  final ProjectBeneficiaryDataRepository projectBeneficiary;
  final TaskDataRepository taskDataRepository;
  final SideEffectDataRepository sideEffectDataRepository;
  final ReferralDataRepository referralDataRepository;
  final IndividualGlobalSearchRepository individualGlobalSearchRepository;
  final HouseHoldGlobalSearchRepository houseHoldGlobalSearchRepository;
  final ServiceDataRepository serviceDataRepository;

  SearchHouseholdsBloc(
      {required this.userUid,
      required this.projectId,
      required this.individual,
      required this.householdMember,
      required this.household,
      required this.projectBeneficiary,
      required this.taskDataRepository,
      required this.beneficiaryType,
      required this.sideEffectDataRepository,
      required this.addressRepository,
      required this.referralDataRepository,
      required this.individualGlobalSearchRepository,
      required this.houseHoldGlobalSearchRepository,
        required this.serviceDataRepository,
      })
      : super(const SearchHouseholdsState()) {
    on(_handleClear);
    on(_handleSearchByHousehold);
  }

  // This function is been used in Individual details screen.
  Future<void> _handleSearchByHousehold(
    SearchHouseholdsByHouseholdsEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final householdMembers = await householdMember.search(
        HouseholdMemberSearchModel(
          householdClientReferenceId: [event.householdModel.clientReferenceId],
        ),
      );

      final individuals = await fetchIndividuals(
        householdMembers
            .map((e) => e.individualClientReferenceId)
            .whereNotNull()
            .toList(),
        null,
      );

      final projectBeneficiaries = await fetchProjectBeneficiary(
        beneficiaryType == BeneficiaryType.individual
            ? individuals.map((e) => e.clientReferenceId).toList()
            : [event.householdModel.clientReferenceId],
      );

      final headOfHousehold = individuals.firstWhereOrNull(
        (element) =>
            element.clientReferenceId ==
            householdMembers.firstWhereOrNull(
              (element) {
                return element.isHeadOfHousehold;
              },
            )?.individualClientReferenceId,
      );
      final tasks = await fetchTaskByProjectBeneficiary(projectBeneficiaries);

      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
      ));

      final referrals = await referralDataRepository.search(ReferralSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));

      final householdChecklist = await serviceDataRepository.search(ServiceSearchModel(
        referenceIds: [event.householdModel.clientReferenceId],
      ));

      final memberChecklist = await serviceDataRepository.search(ServiceSearchModel(
        referenceIds: householdMembers
            .map((e) => e.individualClientReferenceId)
            .whereNotNull()
            .toList(),
      ));

      if (headOfHousehold == null) {
        emit(state.copyWith(
          loading: false,
          householdMembers: [],
        ));
      } else {
        final householdMemberWrapper = HouseholdMemberWrapper(
          household: event.householdModel,
          headOfHousehold: headOfHousehold,
          members: individuals,
          projectBeneficiaries: projectBeneficiaries,
          tasks: tasks.isNotEmpty ? tasks : null,
          sideEffects: sideEffects.isNotEmpty ? sideEffects : null,
          referrals: referrals.isNotEmpty ? referrals : null,
          householdChecklists: householdChecklist,
          individualChecklists: memberChecklist,
        );

        emit(
          state.copyWith(
            loading: false,
            householdMembers: [
              householdMemberWrapper,
            ],
            searchQuery: [
              headOfHousehold.name?.givenName,
              headOfHousehold.name?.familyName,
            ].whereNotNull().join(' '),
          ),
        );
      }
    } catch (error) {
      emit(state.copyWith(
        loading: false,
        householdMembers: [],
      ));
    }
  }

  FutureOr<void> _handleClear(
    SearchHouseholdsClearEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    emit(state.copyWith(
      searchQuery: null,
      householdMembers: [],
      tag: null,
    ));
  }

// Fetch the HouseHold Members

  Future<List<HouseholdMemberModel>> fetchHouseholdMembers(
    String? householdClientReferenceId,
    String? individualClientReferenceId,
    bool? isHeadOfHousehold,
  ) async {
    return await householdMember.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId: [householdClientReferenceId.toString()],
        individualClientReferenceId: [individualClientReferenceId.toString()],
        isHeadOfHousehold: isHeadOfHousehold,
      ),
    );
  }

  Future<List<HouseholdMemberModel>> fetchHouseholdMembersBulk(
    List<String>? individualClientReferenceIds,
    List<String>? householdClientReferenceIds,
  ) async {
    return await householdMember.search(
      HouseholdMemberSearchModel(
        individualClientReferenceIds: individualClientReferenceIds,
        householdClientReferenceIds: householdClientReferenceIds,
        isHeadOfHousehold: RegistrationDeliverySingleton().householdType ==
                HouseholdType.community
            ? true
            : null,
      ),
    );
  }

  // Fetch the task
  Future<List<TaskModel>> fetchTaskByProjectBeneficiary(
    List<ProjectBeneficiaryModel> projectBeneficiaries,
  ) async {
    return await taskDataRepository.search(TaskSearchModel(
      projectBeneficiaryClientReferenceId:
          projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
    ));
  }

  // Fetch the project Beneficiary
  Future<List<ProjectBeneficiaryModel>> fetchProjectBeneficiary(
    List<String> projectBeneficiariesIds,
  ) async {
    return await projectBeneficiary.search(
      ProjectBeneficiarySearchModel(
        projectId: [projectId],
        beneficiaryClientReferenceId: projectBeneficiariesIds,
      ),
    );
  }

  Future<List<IndividualModel>> fetchIndividuals(
    List<String> individualIds,
    String? name,
  ) async {
    return await individual.search(
      IndividualSearchModel(
        clientReferenceId: individualIds,
        name: name != null ? NameSearchModel(givenName: name.trim()) : null,
      ),
    );
  }
}

@freezed
class SearchHouseholdsEvent with _$SearchHouseholdsEvent {
  const factory SearchHouseholdsEvent.initialize() =
      SearchHouseholdsInitializedEvent;

  const factory SearchHouseholdsEvent.searchByHousehold({
    required String projectId,
    double? latitude,
    double? longitude,
    double? maxRadius,
    required final bool isProximityEnabled,
    required HouseholdModel householdModel,
  }) = SearchHouseholdsByHouseholdsEvent;

  const factory SearchHouseholdsEvent.searchByHouseholdHead({
    required String searchText,
    required String projectId,
    required final bool isProximityEnabled,
    double? latitude,
    double? longitude,
    double? maxRadius,
    String? tag,
    required int offset,
    required int limit,
  }) = SearchHouseholdsSearchByHouseholdHeadEvent;

  const factory SearchHouseholdsEvent.searchByProximity({
    required double latitude,
    required double longititude,
    required String projectId,
    required double maxRadius,
    required int offset,
    required int limit,
  }) = SearchHouseholdsByProximityEvent;

  const factory SearchHouseholdsEvent.searchByTag({
    required String tag,
    required String projectId,
  }) = SearchHouseholdsByTagEvent;

  const factory SearchHouseholdsEvent.clear() = SearchHouseholdsClearEvent;

  const factory SearchHouseholdsEvent.individualGlobalSearch({
    required GlobalSearchParameters globalSearchParams,
  }) = IndividualGlobalSearchEvent;

  const factory SearchHouseholdsEvent.houseHoldGlobalSearch({
    required GlobalSearchParameters globalSearchParams,
  }) = HouseHoldGlobalSearchEvent;
}

@freezed
class SearchHouseholdsState with _$SearchHouseholdsState {
  const SearchHouseholdsState._();

  const factory SearchHouseholdsState({
    @Default(0) int offset,
    @Default(10) int limit,
    @Default(false) bool loading,
    String? searchQuery,
    String? tag,
    @Default([]) List<HouseholdMemberWrapper> householdMembers,
    @Default(0) int totalResults,
  }) = _SearchHouseholdsState;

  bool get resultsNotFound {
    if (loading) return false;

    if (searchQuery?.isEmpty ?? true && tag == null) return false;

    return householdMembers.isEmpty;
  }
}

@freezed
class HouseholdMemberWrapper with _$HouseholdMemberWrapper {
  const factory HouseholdMemberWrapper({
    HouseholdModel? household,
    IndividualModel? headOfHousehold,
    List<IndividualModel>? members,
    List<ProjectBeneficiaryModel>? projectBeneficiaries,
    double? distance,
    List<TaskModel>? tasks,
    List<SideEffectModel>? sideEffects,
    List<ReferralModel>? referrals,
    List<ServiceModel>? householdChecklists,
List<ServiceModel>? individualChecklists,
  }) = _HouseholdMemberWrapper;
}
