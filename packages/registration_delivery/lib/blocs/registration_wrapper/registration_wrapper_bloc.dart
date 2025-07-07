import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_bloc/bloc/registration_bloc.dart';
import 'package:registration_bloc/models/global_search_params.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../models/entities/additional_fields_type.dart';
import '../../models/entities/deliver_strategy_type.dart';
import '../../models/entities/status.dart';

part 'registration_wrapper_bloc.freezed.dart';

typedef RegistrationWrapperEmitter = Emitter<RegistrationWrapperState>;

class RegistrationWrapperBloc
    extends Bloc<RegistrationWrapperEvent, RegistrationWrapperState> {
  final RegistrationBloc globalRegistrationBloc;

  RegistrationWrapperBloc({required this.globalRegistrationBloc})
      : super(const RegistrationWrapperState()) {
    on<RegistrationWrapperLoadFromGlobal>(_handleLoadFromGlobal);
    on<FetchDeliveryDetails>(_fetchDeliveryDetails);
    on<RegistrationWrapperClear>(_handleClear);
    on<Create>(_handleCreate);
    on<Update>(_handleUpdate);
    on<Delete>(_handleDelete);
  }

  FutureOr<void> _handleCreate(
    Create event,
    RegistrationWrapperEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      globalRegistrationBloc
          .add(RegistrationEvent.create(entities: event.entities));

      final wrappers = groupEntitiesIntoWrappers(event.entities);

      emit(state.copyWith(
        loading: false,
        lastAction: RegistrationWrapperActionType.created,
        householdMembers: [...state.householdMembers, ...wrappers],
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleUpdate(
    Update event,
    RegistrationWrapperEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      // Update audit fields for each entity
      final updatedEntities = event.entities.map((entity) {
        final audit = entity.auditDetails;

        final updatedAudit = audit?.copyWith(
          lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        );

        return entity.copyWith(auditDetails: updatedAudit);
      }).toList();

      globalRegistrationBloc
          .add(RegistrationEvent.update(entities: updatedEntities));

      final wrappers = groupEntitiesIntoWrappers(event.entities);

      emit(state.copyWith(
        loading: false,
        lastAction: RegistrationWrapperActionType.updated,
        householdMembers: [...state.householdMembers, ...wrappers],
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleDelete(
    Delete event,
    RegistrationWrapperEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      globalRegistrationBloc
          .add(RegistrationEvent.delete(entities: event.entities));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleLoadFromGlobal(
    RegistrationWrapperLoadFromGlobal event,
    RegistrationWrapperEmitter emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      lastAction: RegistrationWrapperActionType.none,
    ));

    final completer = Completer<RegistrationStateLoaded>();

    late final StreamSubscription subscription;
    subscription = globalRegistrationBloc.stream.listen((globalState) {
      if (globalState is RegistrationStateLoaded) {
        subscription.cancel();
        if (!completer.isCompleted) completer.complete(globalState);
      } else if (globalState is RegistrationStateError) {
        subscription.cancel();
        if (!completer.isCompleted) {
          completer.completeError(globalState.message ?? 'Unknown error');
        }
      }
    });

    // Trigger the global load
    globalRegistrationBloc.add(RegistrationEvent.search(event.searchParams));

    try {
      final globalState = await completer.future;

      // ✅ Now you are still within async handler scope, so this is safe
      final wrappers = <HouseholdWrapper>[];

      final allHouseholds = (globalState.results['household'] ?? [])
          .whereType<HouseholdModel>()
          .toList();
      final allMembers = (globalState.results['householdMember'] ?? [])
          .whereType<HouseholdMemberModel>()
          .toList();
      final allIndividuals = (globalState.results['individual'] ?? [])
          .whereType<IndividualModel>()
          .toList();
      final allBeneficiaries = (globalState.results['projectBeneficiary'] ?? [])
          .whereType<ProjectBeneficiaryModel>()
          .toList();
      final allTasks =
          (globalState.results['task'] ?? []).whereType<TaskModel>().toList();
      final allSideEffects = (globalState.results['sideEffect'] ?? [])
          .whereType<SideEffectModel>()
          .toList();
      final allReferrals = (globalState.results['referral'] ?? [])
          .whereType<ReferralModel>()
          .toList();

      for (final headMember
          in allMembers.where((m) => m.isHeadOfHousehold == true)) {
        final household = allHouseholds.firstWhereOrNull((h) =>
            h.clientReferenceId == headMember.householdClientReferenceId);

        if (household == null) continue;

        final householdMembers = allMembers
            .where((m) =>
                m.householdClientReferenceId == household.clientReferenceId)
            .toList();

        final householdIndividuals = allIndividuals
            .where((i) => householdMembers.any(
                (m) => m.individualClientReferenceId == i.clientReferenceId))
            .toList();

        final householdBeneficiaries = event.beneficiaryType == 'individual'
            ? allBeneficiaries
                .where((b) => householdIndividuals.any((i) =>
                    i.clientReferenceId == b.beneficiaryClientReferenceId))
                .toList()
            : allBeneficiaries
                .where((b) =>
                    b.beneficiaryClientReferenceId ==
                    household.clientReferenceId)
                .toList();

        final beneficiaryIds =
            householdBeneficiaries.map((b) => b.clientReferenceId).toSet();
        final tasks = allTasks
            .where((t) =>
                beneficiaryIds.contains(t.projectBeneficiaryClientReferenceId))
            .toList();
        final sideEffects = allSideEffects
            .where((s) => s.clientReferenceId == household.clientReferenceId)
            .toList();
        final referrals = allReferrals
            .where((r) => r.clientReferenceId == household.clientReferenceId)
            .toList();

        wrappers.add(HouseholdWrapper(
          household: household,
          headOfHousehold: householdIndividuals.firstWhereOrNull((i) =>
              i.clientReferenceId == headMember.individualClientReferenceId),
          members: householdMembers,
          individuals: householdIndividuals,
          projectBeneficiaries: householdBeneficiaries,
          tasks: tasks,
          sideEffects: sideEffects,
          referrals: referrals,
        ));
      }

      emit(state.copyWith(
        lastAction: RegistrationWrapperActionType.none,
        householdMembers: [...state.householdMembers, ...wrappers],
        loading: false,
        totalCount: globalState.totalCount ?? 0,
        limit: event.searchParams.pagination?.limit,
        offset: event.searchParams.pagination?.offset,
      ));
    } catch (e) {
      emit(state
          .copyWith(householdMembers: [], loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _fetchDeliveryDetails(
    FetchDeliveryDetails event,
    RegistrationWrapperEmitter emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      lastAction: RegistrationWrapperActionType.none,
    ));

    final household = event.householdWrapper.household;
    final individual = event.selectedIndividual;
    final projectId = event.projectId;

    final searchParams = GlobalSearchParameters(
      filters: [
        SearchFilter(
          root: 'household',
          field: 'clientReferenceId',
          operator: 'equals',
          value: household?.clientReferenceId,
        ),
      ], // Optional: if you're resolving linked entities
      primaryModel: 'household',
      select: [
        'individual',
        'household',
        'householdMember',
        'projectBeneficiary',
        'task'
      ],
      pagination: null,
    );

    final completer = Completer<RegistrationStateLoaded>();
    late final StreamSubscription subscription;

    subscription = globalRegistrationBloc.stream.listen((globalState) {
      if (globalState is RegistrationStateLoaded) {
        subscription.cancel();
        if (!completer.isCompleted) completer.complete(globalState);
      } else if (globalState is RegistrationStateError) {
        subscription.cancel();
        if (!completer.isCompleted) {
          completer.completeError(globalState.message ?? 'Unknown error');
        }
      }
    });

    globalRegistrationBloc.add(RegistrationEvent.search(searchParams));

    try {
      final globalState = await completer.future;

      final allHouseholds = (globalState.results['household'] ?? [])
          .whereType<HouseholdModel>()
          .toList();
      final allMembers = (globalState.results['householdMember'] ?? [])
          .whereType<HouseholdMemberModel>()
          .toList();
      final allIndividuals = (globalState.results['individual'] ?? [])
          .whereType<IndividualModel>()
          .toList();

      final tasks =
          (globalState.results['task'] ?? []).whereType<TaskModel>().toList();
      final sideEffects = (globalState.results['sideEffect'] ?? [])
          .whereType<SideEffectModel>()
          .toList();
      final referrals = (globalState.results['referral'] ?? [])
          .whereType<ReferralModel>()
          .toList();
      final beneficiaries = (globalState.results['projectBeneficiary'] ?? [])
          .whereType<ProjectBeneficiaryModel>()
          .toList();

      final List<TaskModel> futureTasks = tasks
          .where((element) => element.additionalFields != null
              ? element.additionalFields!.fields
                          .firstWhereOrNull(
                            (a) =>
                                a.key ==
                                AdditionalFieldsType.deliveryStrategy.toValue(),
                          )
                          ?.value ==
                      DeliverStrategyType.indirect.toValue() &&
                  element.status == Status.delivered.toValue()
              : false)
          .toList();
      int lastCycleIndex = tasks.isNotEmpty
          ? tasks.last.additionalFields?.fields
                  .where(
                      (h) => h.key == AdditionalFieldsType.cycleIndex.toValue())
                  .firstOrNull
                  ?.value ??
              1
          : 1;
      int lastDeliveryIndex = tasks.isNotEmpty
          ? tasks.last.additionalFields?.fields
                  .where(
                      (h) => h.key == AdditionalFieldsType.doseIndex.toValue())
                  .firstOrNull
                  ?.value ??
              1
          : 0;

      List<ProjectCycle>? campaignCycles = RegistrationDeliverySingleton()
          .selectedProject
          ?.additionalDetails
          ?.projectType
          ?.cycles;
      ProjectCycle? currentCycle = campaignCycles
          ?.where((c) =>
              DateTime.now().millisecondsSinceEpoch <= c.endDate &&
              DateTime.now().millisecondsSinceEpoch >= c.startDate)
          .firstOrNull;

      DeliveryWrapper deliveryState = DeliveryWrapper(
        cycle: lastCycleIndex,
        dose: lastDeliveryIndex,
      );
      final currentRunningCycle = (campaignCycles?.firstWhereOrNull(
            (e) =>
                (e.startDate) < DateTime.now().millisecondsSinceEpoch &&
                (e.endDate) > DateTime.now().millisecondsSinceEpoch,
          ))?.id ??
          0;

      if (currentRunningCycle != 0) {
        final isSameCycle = lastCycleIndex == currentRunningCycle;
        final deliveryLength = campaignCycles
                ?.firstWhere((c) => c.id == lastCycleIndex)
                .deliveries
                ?.length ??
            0;

        final isNotLastDose = lastDeliveryIndex < deliveryLength;

        if (isSameCycle) {
          final pastCycles = getPastCycles(campaignCycles, lastCycleIndex);
          if (isNotLastDose) {
            deliveryState = DeliveryWrapper(
              cycle: lastCycleIndex,
              dose: lastDeliveryIndex + 1,
              pastCycles: pastCycles,
              hasCycleArrived: true,
              futureTask: futureTasks,
            );
          } else {
            final pastCycles = getPastCycles(campaignCycles, lastCycleIndex,
                includeCurrent: true);
            deliveryState = DeliveryWrapper(
              cycle: lastCycleIndex,
              dose: lastDeliveryIndex,
              pastCycles: pastCycles,
              hasCycleArrived: false,
              futureTask: futureTasks,
            );
          }
        } else {
          final pastCycles = getPastCycles(campaignCycles, currentRunningCycle);
          deliveryState = DeliveryWrapper(
            cycle: currentRunningCycle,
            dose: 1,
            pastCycles: pastCycles,
            hasCycleArrived: true,
            futureTask: futureTasks,
          );
        }
      } else {
        final pastCycles = getPastCycles(campaignCycles, currentRunningCycle);
        deliveryState = DeliveryWrapper(
          cycle: lastCycleIndex,
          dose: 1,
          pastCycles: pastCycles,
          hasCycleArrived: false,
          futureTask: futureTasks,
        );
      }

// Determine future deliveries if applicable
      int currentCycleIndex = deliveryState.cycle;
      int currentDeliveryIndex = deliveryState.dose;
      final deliveriesList = currentCycle?.deliveries;

      if (deliveriesList != null) {
        final futureDeliveries = deliveriesList
            .skip(currentDeliveryIndex)
            .takeWhile((d) =>
                d.deliveryStrategy == DeliverStrategyType.indirect.toValue())
            .toList();

        deliveryState = DeliveryWrapper(
          cycle: currentCycleIndex,
          dose: currentDeliveryIndex,
          pastCycles: deliveryState.pastCycles,
          hasCycleArrived: deliveryState.hasCycleArrived,
          futureTask: futureTasks,
          futureDeliveries: futureDeliveries,
        );
      }

      emit(state.copyWith(
        lastAction: RegistrationWrapperActionType.none,
        householdMembers: [
          event.householdWrapper.copyWith(
              tasks: tasks,
              sideEffects: sideEffects,
              referrals: referrals,
              projectBeneficiaries: beneficiaries,
              household: household,
              members: allMembers,
              individuals: allIndividuals,
              headOfHousehold: allIndividuals.first

              /// todo: need to recheck this logic
              )
        ],
        deliveryWrapper: deliveryState,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        deliveryWrapper: null,
        householdMembers: [],
        loading: false,
        error: e.toString(),
      ));
    }
  }

  // Helper to get past cycles before or excluding a given cycle ID
  List<ProjectCycle>? getPastCycles(List<ProjectCycle>? cycles, int cycleId,
      {bool includeCurrent = false}) {
    return cycles
        ?.where((p) => includeCurrent ? p.id <= cycleId : p.id < cycleId)
        .toList();
  }

  FutureOr<void> _handleClear(
    RegistrationWrapperClear event,
    RegistrationWrapperEmitter emit,
  ) async {
    emit(const RegistrationWrapperState()); // Reset to initial default state
  }

  List<HouseholdWrapper> groupEntitiesIntoWrappers(List<EntityModel> entities) {
    final allHouseholds = entities.whereType<HouseholdModel>().toList();
    final allMembers = entities.whereType<HouseholdMemberModel>().toList();
    final allIndividuals = entities.whereType<IndividualModel>().toList();
    final allBeneficiaries =
        entities.whereType<ProjectBeneficiaryModel>().toList();
    final allTasks = entities.whereType<TaskModel>().toList();
    final allSideEffects = entities.whereType<SideEffectModel>().toList();
    final allReferrals = entities.whereType<ReferralModel>().toList();

    final wrappers = <HouseholdWrapper>[];

    for (final headMember
        in allMembers.where((m) => m.isHeadOfHousehold == true)) {
      final household = allHouseholds.firstWhereOrNull(
        (h) => h.clientReferenceId == headMember.householdClientReferenceId,
      );

      if (household == null) continue;

      final householdMembers = allMembers
          .where((m) =>
              m.householdClientReferenceId == household.clientReferenceId)
          .toList();

      final householdIndividuals = allIndividuals
          .where((i) => householdMembers
              .any((m) => m.individualClientReferenceId == i.clientReferenceId))
          .toList();

      final householdBeneficiaries =
          false //TODO:need to keep in state which type of campaign, will pick later
              ? allBeneficiaries
                  .where((b) => householdIndividuals.any((i) =>
                      i.clientReferenceId == b.beneficiaryClientReferenceId))
                  .toList()
              : allBeneficiaries
                  .where((b) =>
                      b.beneficiaryClientReferenceId ==
                      household.clientReferenceId)
                  .toList();

      final beneficiaryIds =
          householdBeneficiaries.map((b) => b.clientReferenceId).toSet();

      final tasks = allTasks
          .where((t) =>
              beneficiaryIds.contains(t.projectBeneficiaryClientReferenceId))
          .toList();

      final sideEffects = allSideEffects
          .where((s) => s.clientReferenceId == household.clientReferenceId)
          .toList();

      final referrals = allReferrals
          .where((r) => r.clientReferenceId == household.clientReferenceId)
          .toList();

      wrappers.add(HouseholdWrapper(
        household: household,
        headOfHousehold: householdIndividuals.firstWhereOrNull(
          (i) => i.clientReferenceId == headMember.individualClientReferenceId,
        ),
        members: householdMembers,
        individuals: householdIndividuals,
        projectBeneficiaries: householdBeneficiaries,
        tasks: tasks,
        sideEffects: sideEffects,
        referrals: referrals,
      ));
    }

    return wrappers;
  }
}

@freezed
class RegistrationWrapperEvent with _$RegistrationWrapperEvent {
  const factory RegistrationWrapperEvent.loadFromGlobal({
    required GlobalSearchParameters searchParams,
    String? beneficiaryType,
  }) = RegistrationWrapperLoadFromGlobal;

  // New event to fetch delivery details
  const factory RegistrationWrapperEvent.fetchDeliveryDetails({
    required HouseholdWrapper householdWrapper,
    required IndividualModel? selectedIndividual,
    String? beneficiaryType,
    required String projectId,
  }) = FetchDeliveryDetails;

  // CREATE household or related entities
  const factory RegistrationWrapperEvent.create(
      {required List<EntityModel> entities}) = Create;

// UPDATE household or related entities
  const factory RegistrationWrapperEvent.update(
      {required List<EntityModel> entities}) = Update;

// DELETE household or related entities
  const factory RegistrationWrapperEvent.delete(
      {required List<EntityModel> entities}) = Delete;

  const factory RegistrationWrapperEvent.clear() = RegistrationWrapperClear;
}

@freezed
class RegistrationWrapperState with _$RegistrationWrapperState {
  const factory RegistrationWrapperState({
    @Default(false) bool loading,
    @Default([]) List<HouseholdWrapper> householdMembers,
    IndividualModel? selectedIndividual,
    DeliveryWrapper? deliveryWrapper,
    int? offset,
    int? limit,
    String? error,
    @Default(0) int totalCount,
    @Default(RegistrationWrapperActionType.none)
    RegistrationWrapperActionType lastAction,
  }) = _RegistrationWrapperState;
}

@freezed
class HouseholdWrapper with _$HouseholdWrapper {
  const factory HouseholdWrapper({
    HouseholdModel? household,
    IndividualModel? headOfHousehold,
    List<HouseholdMemberModel>? members,
    List<IndividualModel>? individuals,
    List<ProjectBeneficiaryModel>? projectBeneficiaries,
    double? distance,
    List<TaskModel>? tasks,
    List<SideEffectModel>? sideEffects,
    List<ReferralModel>? referrals,
  }) = _HouseholdWrapper;
}

@freezed
class DeliveryWrapper with _$DeliveryWrapper {
  const factory DeliveryWrapper({
    @Default(1) int cycle,
    @Default(1) int dose,
    List<ProjectCycle>? pastCycles,
    @Default(true) bool hasCycleArrived,
    @Default(false) bool isLastDoseOfCycle,
    List<TaskModel>? tasks,
    List<ProjectCycleDelivery>? futureDeliveries,
    List<TaskModel>? futureTask,
    TaskModel? oldTask,
  }) = _DeliveryWrapper;
}

enum RegistrationWrapperActionType { none, created, updated, deleted }
