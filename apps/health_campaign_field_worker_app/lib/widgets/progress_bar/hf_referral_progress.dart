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
  int visitedCount = 0;

  static const _symptomToChecklistKey = {
    'FEVER': 'feverQ1',
    'SICK': 'sickQ1',
    'DRUG_SE_CC': 'sideEffectQ1',
    'DRUG_SE_PC': 'sideEffectPQ1',
  };

  @override
  void didChangeDependencies() {
    final repository =
    context.read<LocalRepository<HFReferralModel, HFReferralSearchModel>>()
    as HFReferralLocalRepository;

    repository.listenToChanges(
      query: HFReferralSearchModel(
        projectId: [context.projectId.toString()],
      ),
      listener: (data) {
        if (mounted) {
          int visited = 0;
          for (final referral in data) {
            final symptom = referral.symptom?.toUpperCase() ?? '';
            final checklistKey = _symptomToChecklistKey[symptom];
            if (checklistKey != null) {
              final fields = referral.additionalFields?.fields ?? [];
              final hasChecklist = fields.any(
                    (field) =>
                field.key == checklistKey &&
                    field.value != null &&
                    field.value.toString().trim().isNotEmpty,
              );
              if (hasChecklist) {
                visited++;
              }
            }
          }
          setState(() {
            totalCount = data.length;
            visitedCount = visited;
          });
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DigitCard(margin: const EdgeInsets.all(spacer2), children: [
      ProgressIndicatorContainer(
        label: '${totalCount - visitedCount} ${widget.label}',
        prefixLabel: '$visitedCount ${widget.prefixLabel}',
        suffixLabel: totalCount.toStringAsFixed(0),
        value: totalCount == 0 ? 0 : visitedCount / totalCount,
      ),
    ]);
  }
}