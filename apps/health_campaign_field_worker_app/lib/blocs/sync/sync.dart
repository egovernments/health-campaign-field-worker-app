// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../data/local_store/no_sql/schema/oplog.dart';
import '../../models/data_model.dart';

part 'sync.freezed.dart';

typedef SyncEmitter = Emitter<SyncState>;

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final Isar isar;

  SyncBloc({
    required this.isar,
  }) : super(const SyncState()) {
    on(_handleRefresh);
    on(_handleSyncUp);
    on(_handleSyncDown);
  }

  FutureOr<void> _handleRefresh(
    SyncRefreshEvent event,
    SyncEmitter emit,
  ) async {
    final opLogs = await isar.opLogs.filter().isSyncedEqualTo(false).findAll();
    emit(
      state.copyWith(
        count: opLogs.where((element) {
          switch (element.entityType) {
            case DataModelType.household:
            case DataModelType.individual:
            case DataModelType.task:
              return true;
            default:
              return false;
          }
        }).length,
      ),
    );
  }

  FutureOr<void> _handleSyncUp(
    SyncSyncUpEvent event,
    SyncEmitter emit,
  ) async {
    // handle logic for syncUp here
  }

  FutureOr<void> _handleSyncDown(
    SyncSyncDownEvent event,
    SyncEmitter emit,
  ) async {
    // handle logic for syncDown here
  }
}

@freezed
class SyncEvent with _$SyncEvent {
  const factory SyncEvent.refresh() = SyncRefreshEvent;

  const factory SyncEvent.syncUp() = SyncSyncUpEvent;

  const factory SyncEvent.syncDown() = SyncSyncDownEvent;
}

@freezed
class SyncState with _$SyncState {
  const factory SyncState({@Default(0) int count}) = _SyncState;
}
