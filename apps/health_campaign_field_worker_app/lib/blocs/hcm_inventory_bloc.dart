import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sync/sync.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';

class HcmInventoryBloc extends InventoryListener {
  BuildContext context;
  final String? userId;
  final String? individualId;
  final String? projectId;

  HcmInventoryBloc({
    required this.context,
    required this.userId,
    required this.individualId,
    required this.projectId,
  });

  late Function(List<InventoryFacilityModel> facilities) _facilitiesLoaded;

  @override
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(userId!));
  }

  @override
  void fetchFacilitiesForProjectId(
    Function(List<InventoryFacilityModel> facilitiesModel) facilities,
  ) {
    _facilitiesLoaded = facilities;

    return onFacilitiesFetched();
  }

  void onFacilitiesFetched() {
    _facilitiesLoaded([
      InventoryFacilityModel(
        id: 'Delivery Team',
      ),
    ]);
  }
}
