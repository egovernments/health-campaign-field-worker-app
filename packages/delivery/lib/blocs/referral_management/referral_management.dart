import 'dart:async';

import 'package:delivery/models/entities/referral.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_management.freezed.dart';

typedef ReferralEmitter = Emitter<ReferralState>;

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
    ReferralEmitter emit,
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
    ReferralEmitter emit,
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
