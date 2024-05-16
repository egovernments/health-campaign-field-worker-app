// Import statements
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';

import '../sync/sync.dart';

// Bloc for handling inventory related operations
class HcmReferralReconBloc extends ReferralReconListener {
  // Class variables
  BuildContext context;
  final String userName;
  final String userId;
  final String tenantId;
  final ProjectModel selectedProject;
  final List<String> checklistTypes;

  // Constructor for the HcmReferralBloc
  HcmReferralReconBloc({
    required this.context,
    required this.userName,
    required this.userId,
    required this.tenantId,
    required this.selectedProject,
    required this.checklistTypes,
  });

  // Method to call the sync method
  @override
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(userId));
  }
}
