import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/entities/referral.dart';

part 'referral_management.freezed.dart';

typedef BeneficiaryRegistrationEmitter = Emitter<ReferralState>;

class ReferralBloc extends Bloc<ReferralEvent, ReferralState> {
  final DataRepository<ReferralModel, ReferralSearchModel> referralRepository;

  ReferralBloc(
    super.initialState, {
    required this.referralRepository,
  }) {
    on(_handleSubmit);
    on(_handleSearch);
  }

  FutureOr<void> _handleSubmit(
    ReferralSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.isEditing) {
        await referralRepository.update(event.referral);
      } else {
        await referralRepository.create(event.referral);
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleSearch(
    ReferralSearchEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final List<ReferralModel> referrals = await referralRepository.search(
        event.referrals,
      );
      if (referrals.isNotEmpty) {
        emit(state.copyWith(referrals: referrals));
      } else {
        emit(state.copyWith(referrals: null));
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class ReferralEvent with _$ReferralEvent {
  const factory ReferralEvent.handleSubmit(
    ReferralModel referral,
    bool isEditing,
  ) = ReferralSubmitEvent;

  const factory ReferralEvent.handleSearch(
    ReferralSearchModel referrals,
  ) = ReferralSearchEvent;
}

@freezed
class ReferralState with _$ReferralState {
  const factory ReferralState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    List<ReferralModel>? referrals,
  }) = _ReferralState;
}
