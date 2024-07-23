import 'package:closed_household/models/entities/user_action.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/beneficiary/beneficiary_card.dart';
import '../../../widgets/localized.dart';

class ViewClosedHouseholdCard extends LocalizedStatefulWidget {
  final UserActionModel userAction;
  final VoidCallback? onOpenPressed;
  final double? distance;

  const ViewClosedHouseholdCard({
    super.key,
    super.appLocalizations,
    required this.userAction,
    this.onOpenPressed,
    this.distance,
  });

  @override
  State<ViewClosedHouseholdCard> createState() =>
      _ViewClosedHouseholdCardState();
}

class _ViewClosedHouseholdCardState
    extends LocalizedState<ViewClosedHouseholdCard> {
  late UserActionModel userAction;

  @override
  void initState() {
    userAction = widget.userAction;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ViewClosedHouseholdCard oldWidget) {
    userAction = widget.userAction;
    super.didUpdateWidget(oldWidget);
  }

  bool _isCardExpanded = false;

  bool get isCardExpanded => _isCardExpanded;

  set isCardExpanded(bool value) => setState(() => _isCardExpanded = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  status: widget.userAction.status ?? '',
                  title: widget.userAction.additionalFields != null
                      ? widget.userAction.additionalFields?.fields
                          .where((h) => h.key == 'householdHead')
                          .firstOrNull
                          ?.value
                      : 'Unnamed',
                  description: widget.distance != null
                      ? ((widget.distance!) * 1000).round() > 999
                          ? '(${((widget.distance!).round())} km)'
                          : '(${((widget.distance!) * 1000).round()} mts)'
                      : '',
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
