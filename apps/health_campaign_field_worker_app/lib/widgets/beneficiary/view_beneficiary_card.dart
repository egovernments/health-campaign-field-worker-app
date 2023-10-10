import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/project/project.dart';
import '../../blocs/search_households/search_households.dart';
import '../../models/data_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../localized.dart';
import 'beneficiary_card.dart';

class ViewBeneficiaryCard extends LocalizedStatefulWidget {
  final HouseholdMemberWrapper householdMember;
  final VoidCallback? onOpenPressed;
  final double? distance;

  const ViewBeneficiaryCard({
    Key? key,
    super.appLocalizations,
    required this.householdMember,
    this.onOpenPressed,
    this.distance,
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

    final headerList = [
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
    ];
    final filteredHeaderList = context.beneficiaryType !=
            BeneficiaryType.individual
        ? headerList.where((element) => element.cellKey != 'delivery').toList()
        : headerList;
    final bloc = context.read<ProjectBloc>().state;
    final validMinAge = bloc.projectType?.validMinAge;
    final validMaxAge = bloc.projectType?.validMaxAge;
    final currentCycle = bloc.projectType?.cycles?.firstWhereOrNull(
      (e) =>
          (e.startDate!) < DateTime.now().millisecondsSinceEpoch &&
          (e.endDate!) > DateTime.now().millisecondsSinceEpoch,
      // Return null when no matching cycle is found
    );

    final tableData = householdMember.members.map(
      (e) {
        final projectBeneficiary =
            context.beneficiaryType != BeneficiaryType.individual
                ? [householdMember.projectBeneficiaries.first]
                : householdMember.projectBeneficiaries
                    .where(
                      (element) =>
                          element.beneficiaryClientReferenceId ==
                          e.clientReferenceId,
                    )
                    .toList();

        final taskdata = householdMember.tasks
            ?.where((element) =>
                element.projectBeneficiaryClientReferenceId ==
                projectBeneficiary.first.clientReferenceId)
            .toList();
        final adverseEvents = taskdata != null && taskdata.isNotEmpty
            ? householdMember.adverseEvents
                ?.where((element) =>
                    element.taskClientReferenceId ==
                    taskdata.last.clientReferenceId)
                .toList()
            : null;
        final ageInYears = DigitDateUtils.calculateAge(
          DigitDateUtils.getFormattedDateToDateTime(
                e.dateOfBirth!,
              ) ??
              DateTime.now(),
        ).years;
        final ageInMonths = DigitDateUtils.calculateAge(
          DigitDateUtils.getFormattedDateToDateTime(
                e.dateOfBirth!,
              ) ??
              DateTime.now(),
        ).months;

        final isNotEligible = !checkEligibilityForAgeAndAdverseEvent(
          DigitDOBAge(
            years: ageInYears,
            months: ageInMonths,
          ),
          bloc.projectType,
          (taskdata ?? []).isNotEmpty ? taskdata?.last : null,
          adverseEvents,
        );
        final isAdverseEventRecorded = recordedAdverseEvent(currentCycle,
            (taskdata ?? []).isNotEmpty ? taskdata?.last : null, adverseEvents);
        final isBeneficiaryRefused = checkIfBeneficiaryRefused(taskdata);

// TODO need to pass the current cycle

        final isStatusReset = checkStatus(taskdata, currentCycle);

        final rowTableData = [
          TableData(
            [
              e.name?.givenName,
              e.name?.familyName,
            ].whereNotNull().join('-'),
            cellKey: 'beneficiary',
          ),
          TableData(
            getTableCellText(
              isNotEligible,
              taskdata,
              isBeneficiaryRefused,
              isStatusReset,
            ),
            cellKey: 'delivery',
            style: TextStyle(
              color: getTableCellTextColor(
                isNotEligible: isNotEligible,
                taskdata: taskdata,
                isBeneficiaryRefused: isBeneficiaryRefused,
                isStatusReset: isStatusReset,
                theme: theme,
              ),
            ),
          ),
          TableData(
            e.dateOfBirth == null
                ? ''
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
          TableData(
            e.gender?.name ?? '',
            cellKey: 'gender',
          ),
        ];

        return TableDataRow(
          context.beneficiaryType != BeneficiaryType.individual
              ? rowTableData
                  .where((element) => element.cellKey != 'delivery')
                  .toList()
              : rowTableData,
        );
        // rowTableData
      },
    ).toList();

    final ageInYears = DigitDateUtils.calculateAge(
      DigitDateUtils.getFormattedDateToDateTime(
            householdMember.headOfHousehold.dateOfBirth!,
          ) ??
          DateTime.now(),
    ).years;
    final ageInMonths = DigitDateUtils.calculateAge(
      DigitDateUtils.getFormattedDateToDateTime(
            householdMember.headOfHousehold.dateOfBirth!,
          ) ??
          DateTime.now(),
    ).months;

    final isNotEligible = !checkEligibilityForAgeAndAdverseEvent(
      DigitDOBAge(
        years: ageInYears,
        months: ageInMonths,
      ),
      bloc.projectType,
      householdMember.tasks?.last,
      householdMember.adverseEvents,
    );

    final isBeneficiaryRefused =
        checkIfBeneficiaryRefused(householdMember.tasks);

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
                  description: [
                    householdMember.household.address?.doorNo,
                    householdMember.household.address?.addressLine1,
                    householdMember.household.address?.addressLine2,
                    householdMember.household.address?.landmark,
                    householdMember.household.address?.city,
                    householdMember.household.address?.pincode,
                  ].whereNotNull().take(2).join(' '),
                  subtitle: widget.distance != null
                      ? '${householdMember.members.length ?? 1} Members \n ${((widget.distance!) * 1000).round() > 999 ? '(${((widget.distance!).round())} km)' : '(${((widget.distance!) * 1000).round()} mts)'}'
                      : '',
                  status: context.beneficiaryType != BeneficiaryType.individual
                      ? (householdMember.tasks ?? []).isNotEmpty &&
                              !isNotEligible &&
                              !isBeneficiaryRefused
                          ? Status.delivered.toValue()
                          : Status.notDelivered.toValue()
                      : null,
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
              headerList: filteredHeaderList,
              tableData: tableData,
              leftColumnWidth: 130,
              rightColumnWidth: filteredHeaderList.length * 17 * 6,
              height: householdMember.members.length <= 5
                  ? (householdMember.members.length + 1) * 57
                  : 6 * 57,
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

  String getTableCellText(
    bool isNotEligible,
    List<TaskModel>? taskdata,
    bool isBeneficiaryRefused,
    bool isStatusReset,
  ) {
    if (isNotEligible) {
      return 'Not Eligible';
    } else if (taskdata != null) {
      if (taskdata.isEmpty) {
        return localizations.translate(Status.notDelivered.toValue());
      } else if (isBeneficiaryRefused && !isStatusReset) {
        return localizations.translate(Status.beneficiaryRefused.toValue());
      } else if (isStatusReset) {
        return localizations.translate(Status.notDelivered.toValue());
      } else {
        return localizations.translate(Status.delivered.toValue());
      }
    } else {
      return localizations.translate(Status.notDelivered.toValue());
    }
  }

  // ignore: long-parameter-list
  Color getTableCellTextColor({
    required bool isNotEligible,
    required List<TaskModel>? taskdata,
    required bool isBeneficiaryRefused,
    required bool isStatusReset,
    required ThemeData theme,
  }) {
    return taskdata != null &&
            taskdata.isNotEmpty &&
            !isBeneficiaryRefused &&
            !isNotEligible &&
            !isStatusReset
        ? theme.colorScheme.onSurfaceVariant
        : theme.colorScheme.error;
  }
}
