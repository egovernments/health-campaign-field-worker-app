import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../models/entities/referral_recon_enums.dart';
import '../utils/constants.dart';
import '../utils/date_utils.dart';
import 'beneficiary_card.dart';
import 'localized.dart';

class ViewReferralCard extends LocalizedStatefulWidget {
  final HFReferralModel hfReferralModel;
  final VoidCallback? onOpenPressed;

  const ViewReferralCard({
    super.key,
    super.appLocalizations,
    required this.hfReferralModel,
    this.onOpenPressed,
  });

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
    final dateOfEvaluation = int.tryParse(DateTime.parse(hfReferralModel
                .additionalFields?.fields
                .where((e) =>
                    e.key == ReferralReconEnums.dateOfEvaluation.toValue())
                .first
                .value)
            .millisecondsSinceEpoch
            .toString() ??
        '');
    return DigitCard(
        margin: const EdgeInsets.symmetric(horizontal: spacer2),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: ReferralBeneficiaryCard(
                  description: '',
                  subtitle:
                      '${localizations.translate(i18.referralReconciliation.dateOfEvaluationLabel)}: ${dateOfEvaluation != null ? DigitDateUtils.getDateFromTimestamp(dateOfEvaluation, dateFormat: defaultDateFormat) : localizations.translate(i18.common.coreCommonNA)}',
                  title: hfReferralModel.name.toString(),
                ),
              ),
              Flexible(
                child: DigitButton(
                  size: DigitButtonSize.large,
                  type: DigitButtonType.secondary,
                  label: localizations
                      .translate(i18.referralReconciliation.iconLabel),
                  onPressed: widget.onOpenPressed ?? () {},
                ),
              ),
            ],
          ),
        ]);
  }
}
