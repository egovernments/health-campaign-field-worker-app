import 'package:digit_data_model/data/repositories/package_repository/local/hf_referral.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/utils.dart';
import '../progress_indicator/progress_indicator.dart';

class HFReferralProgressBar extends StatefulWidget {
  final String label;
  final String prefixLabel;

  const HFReferralProgressBar({
    super.key,
    required this.label,
    required this.prefixLabel,
  });

  @override
  State<HFReferralProgressBar> createState() => _HFReferralProgressBarState();
}

class _HFReferralProgressBarState extends State<HFReferralProgressBar> {
  int totalCount = 0;
  int completedCount = 0;
  bool _isListenerSetup = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isListenerSetup) {
      _isListenerSetup = true;
      _setupListener();
    }
  }

  void _setupListener() {
    final hfRepository =
    context.read<LocalRepository<HFReferralModel, HFReferralSearchModel>>()
    as HFReferralLocalRepository;

    final currentUserUuid = context.loggedInUserUuid;
    final projectId = context.projectId;

    hfRepository.listenToChanges(
      query: HFReferralSearchModel(
        projectId: projectId,
      ),
      listener: (data) {
        if (mounted) {
          int completed = 0;
          for (final referral in data) {
            final clientModifiedBy =
                referral.clientAuditDetails?.lastModifiedBy;
            final auditModifiedBy =
                referral.auditDetails?.lastModifiedBy;
            if (clientModifiedBy == currentUserUuid ||
                auditModifiedBy == currentUserUuid) {
              completed++;
            }
          }
          setState(() {
            totalCount = data.length;
            completedCount = completed;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DigitCard(margin: const EdgeInsets.all(spacer2), children: [
      ProgressIndicatorContainer(
        label: '${totalCount - completedCount} ${widget.label}',
        prefixLabel: '$completedCount ${widget.prefixLabel}',
        suffixLabel: totalCount.toStringAsFixed(0),
        value: totalCount == 0 ? 0 : completedCount / totalCount,
      ),
    ]);
  }
}