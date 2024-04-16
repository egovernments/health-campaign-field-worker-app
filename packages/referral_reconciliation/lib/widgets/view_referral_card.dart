import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../models/entities/referral_recon_enums.dart';
import 'beneficiary_card.dart';
import 'localizaed.dart';

class ViewReferralCard extends LocalizedStatefulWidget {
  final ReferralReconciliation hfReferralModel;
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
  late ReferralReconciliation hfReferralModel;

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
    final dateOfEvaluation = int.tryParse(hfReferralModel.additionalData[
            ReferralReconEnums.dateOfEvaluation.toValue().toString()]
        .toString());

    return DigitCard(
      child: Column(
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
                      '${localizations.translate(i18.referralReconciliation.dateOfEvaluationLabel)}: ${dateOfEvaluation != null ? DigitDateUtils.getDateFromTimestamp(dateOfEvaluation, dateFormat: 'dd/MM/yyyy') : localizations.translate(i18.common.coreCommonNA)}',
                  title: hfReferralModel.hfReferralModel.name.toString(),
                ),
              ),
              Flexible(
                child: DigitOutLineButton(
                  buttonStyle: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  label: localizations
                      .translate(i18.referralReconciliation.iconLabel),
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
