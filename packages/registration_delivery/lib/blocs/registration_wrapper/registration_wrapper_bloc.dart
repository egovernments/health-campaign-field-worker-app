import 'dart:async';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/registration_delivery.dart';
import '../../models/entities/household.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/task.dart';
import 'package:registration_bloc/bloc/registration_bloc.dart';
import 'package:registration_bloc/service/registration_service.dart';
import 'package:registration_bloc/repositories/local/search_entity_repository.dart';
import 'package:registration_bloc/models/global_search_params.dart';

part 'registration_wrapper_bloc.freezed.dart';

typedef RegistrationWrapperEmitter = Emitter<RegistrationWrapperState>;

class RegistrationWrapperBloc extends Bloc<RegistrationWrapperEvent, RegistrationWrapperState> {
  final RegistrationBloc globalRegistrationBloc;

  RegistrationWrapperBloc({required this.globalRegistrationBloc})
      : super(const RegistrationWrapperState()) {
    on<RegistrationWrapperLoadFromGlobal>(_handleLoadFromGlobal);
    on<RegistrationWrapperClear>(_handleClear);
  }

  FutureOr<void> _handleLoadFromGlobal(
      RegistrationWrapperLoadFromGlobal event,
      RegistrationWrapperEmitter emit,
      ) async {
    final currentGlobalState = globalRegistrationBloc.state;

    if (currentGlobalState is RegistrationStateLoaded) {
      final wrappers = <HouseholdWrapper>[];

      final allHouseholds = (currentGlobalState.results['household'] ?? []).whereType<HouseholdModel>().toList();
      final allMembers = (currentGlobalState.results['householdMember'] ?? []).whereType<HouseholdMemberModel>().toList();
      final allIndividuals = (currentGlobalState.results['individual'] ?? []).whereType<IndividualModel>().toList();
      final allBeneficiaries = (currentGlobalState.results['projectBeneficiary'] ?? []).whereType<ProjectBeneficiaryModel>().toList();
      final allTasks = (currentGlobalState.results['task'] ?? []).whereType<TaskModel>().toList();
      final allSideEffects = (currentGlobalState.results['sideEffect'] ?? []).whereType<SideEffectModel>().toList();
      final allReferrals = (currentGlobalState.results['referral'] ?? []).whereType<ReferralModel>().toList();

      for (final headMember in allMembers.where((m) => m.isHeadOfHousehold == true)) {
        final household = allHouseholds.firstWhereOrNull(
              (h) => h.clientReferenceId == headMember.householdClientReferenceId,
        );

        if (household == null) continue;

        // Get all members of this household
        final householdMembers = allMembers
            .where((m) => m.householdClientReferenceId == household.clientReferenceId)
            .toList();

        // Get all individuals for these members
        final householdIndividuals = allIndividuals
            .where((i) => householdMembers.any((m) => m.individualClientReferenceId == i.clientReferenceId))
            .toList();

        // Determine beneficiaries based on beneficiary type
        final householdBeneficiaries = event.beneficiaryType == 'individual'
            ? allBeneficiaries.where((b) => householdIndividuals.any((i) => i.clientReferenceId == b.beneficiaryClientReferenceId)).toList()
            : allBeneficiaries.where((b) => b.beneficiaryClientReferenceId == household.clientReferenceId).toList();

        // Tasks, side effects, referrals linked to household
        final tasks = allTasks.where((t) => t.clientReferenceId == household.clientReferenceId).toList();
        final sideEffects = allSideEffects.where((s) => s.clientReferenceId == household.clientReferenceId).toList();
        final referrals = allReferrals.where((r) => r.clientReferenceId == household.clientReferenceId).toList();

        // Build wrapper
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

      emit(state.copyWith(householdMembers: wrappers, loading: false, totalCount: currentGlobalState.totalCount ?? 0, ));
    } else {
      emit(const RegistrationWrapperState(error: 'Global state not loaded or invalid.'));
    }
  }

  FutureOr<void> _handleClear(
      RegistrationWrapperClear event,
      RegistrationWrapperEmitter emit,
      ) async {
    emit(const RegistrationWrapperState()); // Reset to initial default state
  }

}

@freezed
class RegistrationWrapperEvent with _$RegistrationWrapperEvent {
  const factory RegistrationWrapperEvent.loadFromGlobal({
    required GlobalSearchParameters searchParams,
    String? beneficiaryType,
  }) = RegistrationWrapperLoadFromGlobal;

  const factory RegistrationWrapperEvent.clear() = RegistrationWrapperClear;

}

@freezed
class RegistrationWrapperState with _$RegistrationWrapperState {
  const factory RegistrationWrapperState({
    @Default(false) bool loading,
    @Default([]) List<HouseholdWrapper> householdMembers,
    IndividualModel? selectedIndividual,
    int? offset,
    int? limit,
    String? error,
    @Default(0) int totalCount,
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
