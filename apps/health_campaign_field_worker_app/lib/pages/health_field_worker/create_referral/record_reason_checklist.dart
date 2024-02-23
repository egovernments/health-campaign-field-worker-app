import 'package:flutter/material.dart';

import '../../../widgets/localized.dart';
import '../../checklist/checklist_view.dart';

class ReferralReasonChecklistPage extends LocalizedStatefulWidget {
  final bool isEditing;
  final String? referralClientRefId;

  const ReferralReasonChecklistPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
    this.referralClientRefId,
  });

  @override
  State<ReferralReasonChecklistPage> createState() =>
      _ReferralReasonChecklistPageState();
}

class _ReferralReasonChecklistPageState
    extends LocalizedState<ReferralReasonChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return ChecklistViewPage(
      referralClientRefId: widget.referralClientRefId,
    );
  }
}
