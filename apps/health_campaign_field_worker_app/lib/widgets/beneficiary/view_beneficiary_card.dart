import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../blocs/search_households/search_households.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';
import 'beneficiary_card.dart';

class ViewBeneficiaryCard extends LocalizedStatefulWidget {
  final HouseholdMemberWrapper householdMember;
  final VoidCallback? onOpenPressed;

  const ViewBeneficiaryCard({
    Key? key,
    super.appLocalizations,
    required this.householdMember,
    this.onOpenPressed,
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
                width: MediaQuery.of(context).size.width / 1.7,
                child: BeneficiaryCard(
                  description: [
                    householdMember.household.address?.doorNo,
                    householdMember.household.address?.addressLine1,
                    householdMember.household.address?.addressLine2,
                    householdMember.household.address?.landmark,
                    householdMember.household.address?.city,
                    householdMember.household.address?.pincode,
                  ].whereNotNull().take(2).join(' '),
                  subtitle:
                      '${householdMember.household.memberCount ?? 1} Members',
                  status: householdMember.task?.status != null
                      ? 'delivered'
                      : 'Not Delivered',
                  title: [
                    householdMember.headOfHousehold.name?.givenName,
                    householdMember.headOfHousehold.name?.familyName,
                  ].whereNotNull().join(''),
                ),
              ),
              Flexible(
                child: DigitOutLineButton(
                  label:
                      localizations.translate(i18.searchBeneficiary.iconLabel),
                  onPressed: widget.onOpenPressed,
                ),
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
                // TableHeader(
                //   'Delivery',
                //   cellKey: 'delivery',
                // ),
                TableHeader(
                  'Age',
                  cellKey: 'age',
                ),
                TableHeader(
                  'Gender',
                  cellKey: 'gender',
                ),
              ],
              tableData: householdMember.members
                  .map(
                    (e) => TableDataRow(
                      [
                        TableData(
                          [
                            e.name?.givenName,
                            e.name?.familyName,
                          ].whereNotNull().join('-'),
                          cellKey: 'beneficiary',
                        ),
                        // TableData(
                        //   'Not Delivered',
                        //   cellKey: 'delivery',
                        //   style: TextStyle(
                        //     color: theme.colorScheme.error,
                        //   ),
                        // ),
                        TableData(
                          e.dateOfBirth == null
                              ? ''
                              : (DateTime.now()
                                          .difference(DateTime.parse(DateFormat(
                                            'dd/MM/yyyy',
                                          ).parse(e.dateOfBirth!).toString()))
                                          .inDays /
                                      365)
                                  .round()
                                  .toStringAsFixed(0),
                          cellKey: 'age',
                        ),
                        TableData(
                          e.gender?.name ?? '',
                          cellKey: 'gender',
                        ),
                      ],
                    ),
                  )
                  .toList(),
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
