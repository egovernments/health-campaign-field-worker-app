import 'package:flutter/material.dart';

import '../../../widgets/localized.dart';
import '../../checklist/checklist_preview.dart';

class ReferralReasonCheckListPreviewPage extends LocalizedStatefulWidget {
  final bool isEditing;
  final String? referralClientRefId;

  const ReferralReasonCheckListPreviewPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
    this.referralClientRefId,
  });

  @override
  State<ReferralReasonCheckListPreviewPage> createState() =>
      _ReferralReasonCheckListPreviewPageState();
}

class _ReferralReasonCheckListPreviewPageState
    extends LocalizedState<ReferralReasonCheckListPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return const ChecklistPreviewPage();
  }
}
