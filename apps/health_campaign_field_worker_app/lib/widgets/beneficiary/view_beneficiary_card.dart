import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';

import '../../blocs/search_households/search_households.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';
import 'beneficiary_card.dart';

class ViewBeneficiaryCard extends LocalizedStatefulWidget {
  final HouseholdMemberWrapper householdMember;

  const ViewBeneficiaryCard({
    Key? key,
    super.appLocalizations,
    required this.householdMember,
  }) : super(key: key);

  @override
  State<ViewBeneficiaryCard> createState() => _ViewBeneficiaryCardState();
}

class _ViewBeneficiaryCardState extends LocalizedState<ViewBeneficiaryCard> {
  late HouseholdMemberWrapper householdMember;

  @override
  void initState() {
    householdMember = widget.householdMember;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ViewBeneficiaryCard oldWidget) {
    householdMember = widget.householdMember;
    super.didUpdateWidget(oldWidget);
  }

  HouseholdModel get householdModel => householdMember.household;
  IndividualModel get individualModel => householdMember.individual;

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
              BeneficiaryCard(
                description: [
                  householdModel.address?.doorNo,
                  householdModel.address?.addressLine1,
                  householdModel.address?.addressLine2,
                  householdModel.address?.landmark,
                  householdModel.address?.city,
                  householdModel.address?.pincode,
                ].whereNotNull().take(2).join(' '),
                subtitle: '${householdModel.memberCount ?? 1} Members',
                status: 'Not Delivered',
                title: [
                  individualModel.name?.givenName,
                  individualModel.name?.familyName,
                ].whereNotNull().join(''),
              ),
              DigitOutLineButton(
                label: localizations.translate(i18.searchBeneficiary.iconLabel),
                onPressed: () => context.router.push(HouseholdOverViewRoute()),
              ),
            ],
          ),
          Offstage(
            offstage: !isCardExpanded,
            child: DigitTable(
              headerList: [
                TableHeader(
                  'Beneficiary',
                  cellKey: 'beneficiary',
                ),
                TableHeader(
                  'Delivery',
                  cellKey: 'delivery',
                ),
                TableHeader(
                  'Age',
                  cellKey: 'age',
                ),
                TableHeader(
                  'Gender',
                  cellKey: 'gender',
                ),
              ],
              tableData: [
                // TableDataRow(
                //   [
                //     TableData(
                //       [
                //         individualModel.name?.givenName,
                //         individualModel.name?.familyName,
                //       ].whereNotNull().join('-'),
                //       cellKey: 'beneficiary',
                //     ),
                //     TableData(
                //       'Not Delivered',
                //       cellKey: 'delivery',
                //       style: TextStyle(
                //         color: theme.colorScheme.onSurfaceVariant,
                //       ),
                //     ),
                //     TableData(
                //       '45',
                //       cellKey: 'age',
                //     ),
                //     TableData(
                //       'Male',
                //       cellKey: 'gender',
                //     ),
                //   ],
                // ),
              ],
              leftColumnWidth: 110,
              rightColumnWidth: 45 * 8,
              height: 170,
            ),
          ),
          Container(
            height: 24,
            margin: const EdgeInsets.all(4),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                isCardExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 16,
              ),
              onPressed: () => isCardExpanded = !isCardExpanded,
            ),
          ),
        ],
      ),
    );
  }
}
