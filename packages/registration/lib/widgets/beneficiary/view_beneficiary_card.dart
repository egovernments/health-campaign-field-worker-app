import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';
import 'package:registration/widgets/beneficiary/beneficiary_card.dart';

import '../../blocs/search_households/search_households.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../localized.dart';

class ViewBeneficiaryCard extends LocalizedStatefulWidget {
  final HouseholdMemberWrapper householdMember;
  final VoidCallback onOpenPressed;
  final double? distance;

  const ViewBeneficiaryCard({
    super.key,
    super.appLocalizations,
    required this.householdMember,
    required this.onOpenPressed,
    this.distance,
  });

  @override
  State<ViewBeneficiaryCard> createState() => ViewBeneficiaryCardState();
}

class ViewBeneficiaryCardState extends LocalizedState<ViewBeneficiaryCard> {
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

    final headerList = [
      DigitTableColumn(
        header:
            localizations.translate(i18.beneficiaryDetails.beneficiaryHeader),
        cellValue: 'beneficiary',
        isFrozen: true,
      ),
      // DigitTableColumn(
      //   header: localizations.translate(i18.beneficiaryDetails.deliveryHeader),
      //   cellValue: 'delivery',
      // ),
      DigitTableColumn(
        header: localizations.translate(i18.individualDetails.ageLabelText),
        cellValue: 'age',
      ),
      DigitTableColumn(
        header: localizations.translate(i18.common.coreCommonGender),
        cellValue: 'gender',
      ),
    ];
    final filteredHeaderList =
        RegistrationSingleton().beneficiaryType !=
                BeneficiaryType.individual
            ? headerList
                .where((element) => element.cellValue != 'delivery')
                .toList()
            : headerList;

    final tableData = householdMember.members?.map(
      (e) {
        final projectBeneficiary =
            householdMember.projectBeneficiaries?.where((element) {
          if (RegistrationSingleton().beneficiaryType ==
              BeneficiaryType.individual) {
            return element.beneficiaryClientReferenceId == e.clientReferenceId;
          } else {
            return element.beneficiaryClientReferenceId ==
                householdMember.household!.clientReferenceId;
          }
        }).toList();

        final rowTableData = [
          DigitTableData(
            [
              e.name?.givenName ?? '--',
              (e.name?.familyName?.trim().isNotEmpty ?? false)
                  ? e.name?.familyName
                  : null,
            ].whereNotNull().join(' '),
            cellKey: 'beneficiary',
          ),
          DigitTableData(
            e.dateOfBirth == null
                ? '--'
                : '${DigitDateUtils.calculateAge(
                    DigitDateUtils.getFormattedDateToDateTime(
                          e.dateOfBirth!,
                        ) ??
                        DateTime.now(),
                  ).years} ${localizations.translate(i18.searchBeneficiary.yearsAbbr)} ${DigitDateUtils.calculateAge(
                    DigitDateUtils.getFormattedDateToDateTime(
                          e.dateOfBirth!,
                        ) ??
                        DateTime.now(),
                  ).months} ${localizations.translate(i18.searchBeneficiary.monthsAbbr)}',
            cellKey: 'age',
          ),
          DigitTableData(
            e.gender?.name == null
                ? '--'
                : localizations
                    .translate('CORE_COMMON_${e.gender?.name.toUpperCase()}'),
            cellKey: 'gender',
          ),
        ];

        return DigitTableRow(
          tableRow: RegistrationSingleton().beneficiaryType !=
                  BeneficiaryType.individual
              ? rowTableData
                  .where((element) => element.cellKey != 'delivery')
                  .toList()
              : rowTableData,
        );
        // rowTableData
      },
    ).toList();

    return DigitCard(
        margin: const EdgeInsets.only(top: spacer2, bottom: spacer2),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: BeneficiaryCard(
                  description: [
                    householdMember.household?.address?.doorNo,
                    householdMember.household?.address?.addressLine1,
                    householdMember.household?.address?.addressLine2,
                    householdMember.household?.address?.landmark,
                    householdMember.household?.address?.city,
                    householdMember.household?.address?.pincode,
                  ].whereNotNull().take(2).join(' '),
                  subtitle: (RegistrationSingleton().householdType ==
                          HouseholdType.family)
                      ? widget.distance != null
                          ? '${householdMember.members?.length ?? 1} ${householdMember.members?.length == 1 ? localizations.translate(i18.beneficiaryDetails.householdMemberSingular) : localizations.translate(i18.beneficiaryDetails.householdMemberPlural)}\n${((widget.distance!) * 1000).round() > 999 ? '(${((widget.distance!).round())} km)' : '(${((widget.distance!) * 1000).round()} mts) ${localizations.translate(i18.beneficiaryDetails.fromCurrentLocation)}'}'
                          : '${householdMember.members?.length ?? 1} ${householdMember.members?.length == 1 ? localizations.translate(i18.beneficiaryDetails.householdMemberSingular) : localizations.translate(i18.beneficiaryDetails.householdMemberPlural)}'
                      : (widget.distance != null)
                          ? ((widget.distance!) * 1000).round() > 999
                              ? '(${((widget.distance!).round())} km)'
                              : '(${((widget.distance!) * 1000).round()} mts) ${localizations.translate(i18.beneficiaryDetails.fromCurrentLocation)}'
                          : null,
                  title: (RegistrationSingleton().householdType ==
                          HouseholdType.community)
                      ? householdMember.household?.address?.buildingName ??
                          localizations.translate(i18.common.coreCommonNA)
                      : [
                          householdMember.headOfHousehold?.name?.givenName ??
                              localizations.translate(i18.common.coreCommonNA),
                          householdMember.headOfHousehold?.name?.familyName,
                        ].whereNotNull().join(''),
                ),
              ),
              Flexible(
                child: DigitButton(
                  label:
                      localizations.translate(i18.searchBeneficiary.iconLabel),
                  onPressed: widget.onOpenPressed,
                  type: DigitButtonType.secondary,
                  size: DigitButtonSize.medium,
                ),
              ),
            ],
          ),
          if (RegistrationSingleton().householdType ==
              HouseholdType.family) ...[
            Offstage(
              offstage: !isCardExpanded,
              child: DigitTable(
                enableBorder: true,
                showPagination: false,
                columns: filteredHeaderList,
                rows: tableData ?? [],
              ),
            ),
            Container(
              height: 24,
              margin: const EdgeInsets.all(4),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    isCardExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 24,
                  ),
                  onPressed: () => isCardExpanded = !isCardExpanded,
                ),
              ),
            ),
          ]
        ]);
  }

  // ignore: long-parameter-list
  Color getTableCellTextColor({
    required bool isNotEligible,
    // required List<TaskModel>? taskdata,
    required bool isBeneficiaryRefused,
    required bool isStatusReset,
    required ThemeData theme,
  }) {
    return
        //taskdata != null &&
        // taskdata.isNotEmpty &&
        !isBeneficiaryRefused && !isNotEligible && !isStatusReset
            ? theme.colorTheme.alert.success
            : theme.colorTheme.alert.error;
  }
}
