import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/utils/utils.dart';

part 'transit_post.freezed.dart';

typedef TransitPostEmitter = Emitter<TransitPostState>;
typedef UserActionRemoteRepository
    = DataRepository<UserActionModel, UserActionSearchModel>;

class TransitPostBloc extends Bloc<TransitPostEvent, TransitPostState> {
  final UserActionLocalRepository userActionLocalRepository;
  final UserActionRemoteRepository userActionRemoteRepository;

  TransitPostBloc(
    super.initialState, {
    required this.userActionLocalRepository,
    required this.userActionRemoteRepository,
  }) {
    on(_handleTransitPostSelection);
    on(_handleDeliveryCount);
    on(_handleRecordDelivery);
  }

  FutureOr<void> _handleTransitPostSelection(
    TransitPostSelectionEvent event,
    TransitPostEmitter emit,
  ) async {
    emit(state.copyWith(
      transitPostType: event.transitPostType,
      transitPostName: event.transitPostName,
      locationAccuracy: event.locationAccuracy,
      latitude: event.latitude,
      longitude: event.longitude,
    ));
  }

  FutureOr<void> _handleDeliveryCount(
    TransitPostDeliveryCountEvent event,
    TransitPostEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    final totalCount = await userActionLocalRepository
        .fetchCount(TransitPostSingleton().loggedInUserUuid);

    final curCount = await userActionLocalRepository.fetchCount(
        TransitPostSingleton().loggedInUserUuid,
        query: UserActionSearchModel(
            auditDetails: AuditDetails(
                createdBy: TransitPostSingleton().loggedInUserUuid!,
                createdTime: DateTime.now().millisecondsSinceEpoch)));

    emit(state.copyWith(
      loading: false,
      totalCount: totalCount,
      curCount: curCount,
    ));
  }

  FutureOr<void> _handleRecordDelivery(
    TransitPostDeliveryEvent event,
    TransitPostEmitter emit,
  ) async {
    try {
      await userActionLocalRepository.create(UserActionModel(
          latitude: event.latitude,
          longitude: event.longitude,
          locationAccuracy: event.locationAccuracy,
          tenantId: TransitPostSingleton().tenantId,
          clientReferenceId: IdGen.instance.identifier,
          isSync: false,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          projectId: TransitPostSingleton().projectId!,
          boundaryCode: TransitPostSingleton().boundary!.code!,
          action: 'OTHER',
          rowVersion: 1,
          clientAuditDetails: ClientAuditDetails(
            createdBy: TransitPostSingleton().loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: TransitPostSingleton().loggedInUserUuid,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
          auditDetails: AuditDetails(
            createdBy: TransitPostSingleton().loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: TransitPostSingleton().loggedInUserUuid,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
          additionalFields: UserActionAdditionalFields(version: 1, fields: [
            AdditionalField(
              'transitPostType',
              state.transitPostType,
            ),
            AdditionalField(
              'transitPostName',
              state.transitPostName,
            ),
            AdditionalField(
              'scannedResource',
              event.scannedResource,
            ),
          ])));
      emit(state.copyWith(
        curCount: state.curCount != null ? state.curCount! + 1 : 1,
        totalCount: state.totalCount != null ? state.totalCount! + 1 : 1,
      ));
    } catch (e) {
      rethrow;
    }
  }
}

@freezed
class TransitPostEvent with _$TransitPostEvent {
  const factory TransitPostEvent.handleSelection({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? transitPostType,
    String? transitPostName,
  }) = TransitPostSelectionEvent;

  const factory TransitPostEvent.handleDelivery({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? scannedResource,
    int? curCount,
    int? totalCount,
  }) = TransitPostDeliveryEvent;

  const factory TransitPostEvent.handleDeliveryCount({
    @Default(0) int curCount,
    @Default(0) int totalCount,
  }) = TransitPostDeliveryCountEvent;
}

@freezed
class TransitPostState with _$TransitPostState {
  const factory TransitPostState({
    @Default(false) loading,
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? transitPostType,
    String? transitPostName,
    int? curCount,
    int? totalCount,
  }) = _TransitPostState;
}
