// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
import '../../utils/typedefs.dart';
import '../search_households/search_households.dart';

part 'household_overview.freezed.dart';

typedef HouseholdOverviewEmitter = Emitter<HouseholdOverviewState>;

class HouseholdOverviewBloc
    extends Bloc<HouseholdOverviewEvent, HouseholdOverviewState> {
  final IndividualDataRepository individualRepository;
  final HouseholdDataRepository householdRepository;
  final HouseholdMemberDataRepository householdMemberRepository;
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final TaskDataRepository taskDataRepository;

  HouseholdOverviewBloc(
    super.initialState, {
    required this.projectBeneficiaryRepository,
    required this.householdRepository,
    required this.individualRepository,
    required this.householdMemberRepository,
    required this.taskDataRepository,
  }) {
    on(_handleDeleteHousehold);
    on(_handleDeleteIndividual);
    on(_handleSetAsHead);
    on(_handleReloadMember);
  }

  FutureOr<void> _handleReloadMember(
    HouseholdOverviewReloadEvent event,
    Emitter<HouseholdOverviewState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final members = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId:
            state.householdMemberWrapper.household.clientReferenceId,
      ),
    );

    final groupedHouseholds = members.groupListsBy(
      (element) => element.householdClientReferenceId,
    );

    final householdId =
        state.householdMemberWrapper.household.clientReferenceId;

    if (!groupedHouseholds.containsKey(householdId)) {
      emit(state.copyWith(loading: false));

      return;
    }

    final householdMemberList = groupedHouseholds[householdId]!;

    final individualIds = householdMemberList
        .map((e) => e.individualClientReferenceId)
        .whereNotNull()
        .toList();

    final households = await householdRepository.search(
      HouseholdSearchModel(clientReferenceId: [householdId]),
    );

    if (households.isEmpty) {
      emit(state.copyWith(loading: false));

      return;
    }

    final resultHousehold = households.first;
    final individuals = await individualRepository.search(
      IndividualSearchModel(clientReferenceId: individualIds),
    );

    final head = individuals.firstWhereOrNull(
      (i) =>
          i.clientReferenceId ==
          householdMemberList
              .firstWhereOrNull((h) => h.isHeadOfHousehold)
              ?.individualClientReferenceId,
    );

    if (head == null) {
      emit(state.copyWith(loading: false));

      return;
    }

    final projectBeneficiaries = await projectBeneficiaryRepository.search(
      ProjectBeneficiarySearchModel(
        beneficiaryClientReferenceId: resultHousehold.clientReferenceId,
        projectId: '13',
      ),
    );

    if (projectBeneficiaries.isEmpty) {
      emit(state.copyWith(loading: false));

      return;
    }

    final tasks = await taskDataRepository.search(TaskSearchModel(
      projectBeneficiaryClientReferenceId:
          projectBeneficiaries.first.clientReferenceId,
    ));

    emit(
      state.copyWith(
        householdMemberWrapper: HouseholdMemberWrapper(
          household: resultHousehold,
          headOfHousehold: head,
          members: individuals,
          task: tasks.isEmpty ? null : tasks.first,
          projectBeneficiary: projectBeneficiaries.first,
        ),
        loading: false,
      ),
    );
  }

  FutureOr<void> _handleDeleteHousehold(
    HouseholdOverviewDeleteHouseholdEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    await householdRepository.delete(
      event.householdModel.copyWith(
        rowVersion: event.householdModel.rowVersion + 1,
      ),
    );
    for (final i in event.members) {
      await individualRepository.delete(i);
      final householdMember =
          await householdMemberRepository.search(HouseholdMemberSearchModel(
        householdClientReferenceId: event.householdModel.clientReferenceId,
        individualClientReferenceId: i.clientReferenceId,
      ));

      for (final j in householdMember) {
        await householdMemberRepository.delete(
          j.copyWith(
            rowVersion: j.rowVersion + 1,
          ),
        );
      }
    }

    await projectBeneficiaryRepository.delete(
      event.projectBeneficiaryModel.copyWith(
        rowVersion: event.projectBeneficiaryModel.rowVersion + 1,
      ),
    );
  }

  FutureOr<void> _handleDeleteIndividual(
    HouseholdOverviewDeleteIndividualEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    await individualRepository.delete(event.individualModel);
    final householdMembers = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        individualClientReferenceId: event.individualModel.clientReferenceId,
        householdClientReferenceId: event.householdModel.clientReferenceId,
      ),
    );

    for (final i in householdMembers) {
      await householdMemberRepository.delete(
        i.copyWith(
          rowVersion: i.rowVersion + 1,
        ),
      );
    }

    add(const HouseholdOverviewReloadEvent());
  }

  FutureOr<void> _handleSetAsHead(
    HouseholdOverviewSetAsHeadEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    final members = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId: event.householdModel.clientReferenceId,
      ),
    );

    final updatedMembers = members.map((i) {
      final individualId = event.individualModel.clientReferenceId;
      final memberId = i.individualClientReferenceId;

      if (individualId == memberId) {
        if (!i.isHeadOfHousehold) {
          return i.copyWith(
            isHeadOfHousehold: true,
            rowVersion: i.rowVersion + 1,
          );
        }
      } else {
        if (i.isHeadOfHousehold) {
          return i.copyWith(
            isHeadOfHousehold: false,
            rowVersion: i.rowVersion + 1,
          );
        }
      }

      return i;
    }).toList();

    for (final element in updatedMembers) {
      await householdMemberRepository.update(
        element.copyWith(
          rowVersion: element.rowVersion + 1,
        ),
      );
    }

    add(const HouseholdOverviewReloadEvent());
  }
}

@freezed
class HouseholdOverviewEvent with _$HouseholdOverviewEvent {
  const factory HouseholdOverviewEvent.deleteHousehold({
    required HouseholdModel householdModel,
    required List<IndividualModel> members,
    required ProjectBeneficiaryModel projectBeneficiaryModel,
  }) = HouseholdOverviewDeleteHouseholdEvent;

  const factory HouseholdOverviewEvent.deleteIndividual({
    required HouseholdModel householdModel,
    required IndividualModel individualModel,
  }) = HouseholdOverviewDeleteIndividualEvent;

  const factory HouseholdOverviewEvent.setAsHead({
    required IndividualModel individualModel,
    required HouseholdModel householdModel,
  }) = HouseholdOverviewSetAsHeadEvent;

  const factory HouseholdOverviewEvent.reload() = HouseholdOverviewReloadEvent;
}

@freezed
class HouseholdOverviewState with _$HouseholdOverviewState {
  const factory HouseholdOverviewState({
    @Default(false) bool loading,
    required HouseholdMemberWrapper householdMemberWrapper,
  }) = _HouseholdOverviewState;
}
