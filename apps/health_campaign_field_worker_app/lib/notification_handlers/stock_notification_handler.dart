import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/local_store/secure_store/secure_store.dart';
import '../utils/stock_downsync.dart';
import 'notification_handler.dart';

class StockNotificationHandler implements NotificationHandler {
  @override
  void handle(BuildContext context, Map<String, dynamic> payload) {
    try {
      final stockService = StockDownsyncService(
        localSecureStore: LocalSecureStore.instance,
        projectFacilityLocalRepository: context.read<
            LocalRepository<ProjectFacilityModel,
                ProjectFacilitySearchModel>>(),
        facilityLocalRepository:
            context.read<LocalRepository<FacilityModel, FacilitySearchModel>>(),
        stockRemoteRepository:
            context.read<RemoteRepository<StockModel, StockSearchModel>>(),
        stockLocalRepository:
            context.read<LocalRepository<StockModel, StockSearchModel>>(),
        projectResourceLocalRepository: context.read<
            LocalRepository<ProjectResourceModel,
                ProjectResourceSearchModel>>(),
      );

      stockService.execute(context);
    } catch (e) {
      debugPrint('Stock notification handler failed: $e');
    }
  }
}
