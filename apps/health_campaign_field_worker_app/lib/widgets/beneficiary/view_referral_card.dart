import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';

import '../../models/data_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';
import 'beneficiary_card.dart';

class ViewReferralCard extends LocalizedStatefulWidget {
  final HFReferralModel hfReferralModel;
  final VoidCallback? onOpenPressed;

  const ViewReferralCard({
    Key? key,
    super.appLocalizations,
    required this.hfReferralModel,
    this.onOpenPressed,
  }) : super(key: key);

  @override
  State<ViewReferralCard> createState() => _ViewReferralCardState();
}

class _ViewReferralCardState extends LocalizedState<ViewReferralCard> {
  late HFReferralModel hfReferralModel;

  @override
  void initState() {
    hfReferralModel = widget.hfReferralModel;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ViewReferralCard oldWidget) {
    hfReferralModel = widget.hfReferralModel;
    super.didUpdateWidget(oldWidget);
  }

  bool _isCardExpanded = true;

  bool get isCardExpanded => _isCardExpanded;

  set isCardExpanded(bool value) => setState(() => _isCardExpanded = value);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final bloc = context.read<ProjectBloc>().state;
    final dateOfEvaluation = hfReferralModel.additionalFields?.fields
        .where((e) => e.key == AdditionalFieldsType.dateOfEvaluation.toValue())
        .first
        .value;

    return DigitCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: BeneficiaryCard(
                  description: '',
                  subtitle:
                      '${localizations.translate(i18.referBeneficiary.dateOfEvaluationLabel)}: ${dateOfEvaluation != null ? DigitDateUtils.getDateFromTimestamp(dateOfEvaluation, dateFormat: 'dd/MM/yyyy') : localizations.translate(i18.common.coreCommonNA)}',
                  title: hfReferralModel.name.toString(),
                ),
              ),
              Flexible(
                child: DigitOutLineButton(
                  buttonStyle: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  label:
                      localizations.translate(i18.searchBeneficiary.iconLabel),
                  onPressed: widget.onOpenPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
