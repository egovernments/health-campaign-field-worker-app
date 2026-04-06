import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import '../blocs/hf_referral_downsync/hf_referral_downsync.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../utils/extensions/extensions.dart';
import 'notification_handler.dart';

class ReferralNotificationHandler implements NotificationHandler {
  @override
  void handle(BuildContext context, Map<String, dynamic> payload) {
    try {
      final isar = context.read<Isar>();
      final configs = isar.appConfigurations.where().findAllSync();

      context.read<HFReferralDownSyncBloc>().add(
            HFReferralDownSyncStartEvent(
              projectId: context.projectId,
              appConfiguration: configs,
            ),
          );
    } catch (e) {
      debugPrint('Referral notification handler failed: $e');
    }
  }
}
