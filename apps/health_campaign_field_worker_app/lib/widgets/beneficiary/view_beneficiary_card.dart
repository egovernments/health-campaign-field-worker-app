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

  bool _isCardExpanded = true;

  bool get isCardExpanded => _isCardExpanded;

  set isCardExpanded(bool value) => setState(() => _isCardExpanded = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final headerList = [
      TableHeader(
        localizations.translate(
          i18.beneficiaryDetails.beneficiary,
        ),
        cellKey: 'beneficiary',
      ),
      TableHeader(
        localizations.translate(
          i18.beneficiaryDetails.beneficiaryStatus,
        ),
        cellKey: 'delivery',
      ),
      TableHeader(
        localizations.translate(
          i18.common.coreCommonAge,
        ),
        cellKey: 'age',
      ),
      TableHeader(
        localizations.translate(
          i18.common.coreCommonGender,
        ),
        cellKey: 'gender',
      ),
    ];
    final filteredHeaderList = context.beneficiaryType !=
            BeneficiaryType.individual
        ? headerList.where((element) => element.cellKey != 'delivery').toList()
        : headerList;
    final bloc = context.read<ProjectBloc>().state;
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
        final referralData = householdMember.referrals
            ?.where((element) =>
                element.projectBeneficiaryClientReferenceId ==
                projectBeneficiary.first.clientReferenceId)
            .toList();
        final sideEffects = taskdata != null && taskdata.isNotEmpty
            ? householdMember.sideEffects
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

        final isNotEligible = !checkEligibilityForAgeAndSideEffect(
          DigitDOBAge(
            years: ageInYears,
            months: ageInMonths,
          ),
          bloc.projectType,
          (taskdata ?? []).isNotEmpty ? taskdata?.last : null,
          sideEffects,
        );
        final isSideEffectRecorded = recordedSideEffect(
          currentCycle,
          (taskdata ?? []).isNotEmpty ? taskdata?.last : null,
          sideEffects,
        );
        final isBeneficiaryRefused = checkIfBeneficiaryRefused(taskdata) &&
            !checkStatus(taskdata, currentCycle);
        final isBeneficiaryIneligible = checkIfBeneficiaryIneligible(
              taskdata,
            ) &&
            !checkStatus(taskdata, currentCycle);
        final isBeneficiaryReferred = checkIfBeneficiaryReferred(
          taskdata,
        );

        final isHead = e.clientReferenceId ==
            householdMember.headOfHousehold.clientReferenceId;

// TODO need to pass the current cycle

        final isStatusReset = checkStatus(taskdata, currentCycle);

        final rowTableData = [
          TableData(
            [
              e.name?.givenName,
              e.name?.familyName,
            ].whereNotNull().join(' '),
            cellKey: 'beneficiary',
          ),
          TableData(
            isHead
                ? localizations.translate(
                    i18.householdOverView.householdOverViewHouseholderHeadLabel,
                  )
                : getTableCellText(
                    isNotEligible,
                    taskdata,
                    isBeneficiaryRefused,
                    isBeneficiaryIneligible,
                    isBeneficiaryReferred,
                    isStatusReset,
                  ),
            cellKey: 'delivery',
            style: TextStyle(
              color: getTableCellTextColor(
                isNotEligible: isNotEligible,
                taskdata: taskdata,
                isBeneficiaryRefused:
                    isBeneficiaryRefused || isBeneficiaryReferred,
                isBeneficiaryIneligible: isBeneficiaryIneligible,
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
            localizations.translate(e.gender?.name.toUpperCase() ?? '--'),
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

    final isNotEligible = !checkEligibilityForAgeAndSideEffect(
      DigitDOBAge(
        years: ageInYears,
        months: ageInMonths,
      ),
      bloc.projectType,
      householdMember.tasks?.last,
      householdMember.sideEffects,
    );

    final isBeneficiaryRefused =
        checkIfBeneficiaryRefused(householdMember.tasks) &&
            !checkStatus(householdMember.tasks, currentCycle);

    final isBeneficiaryIneligible = checkIfBeneficiaryIneligible(
          householdMember.tasks,
        ) &&
        !checkStatus(householdMember.tasks, currentCycle);

    final isBeneficiaryReferred = checkIfBeneficiaryReferred(
      householdMember.tasks,
    );

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
                      ? '${householdMember.members.length ?? 1} ${householdMember.members.length == 1 ? localizations.translate(i18.memberCard.householdMemberText) : localizations.translate(i18.memberCard.householdMembersText)}  \n ${((widget.distance!) * 1000).round() > 999 ? '(${((widget.distance!).round())} km)' : '(${((widget.distance!) * 1000).round()} mts) ${localizations.translate(i18.beneficiaryDetails.fromCurrentLocation)}'}'
                      : '${householdMember.members.length ?? 1} ${householdMember.members.length == 1 ? localizations.translate(i18.memberCard.householdMemberText) : localizations.translate(i18.memberCard.householdMembersText)}',
                  status: context.beneficiaryType != BeneficiaryType.individual
                      ? (householdMember.tasks ?? []).isNotEmpty &&
                              !isNotEligible &&
                              !isBeneficiaryRefused &&
                              !isBeneficiaryIneligible &&
                              !isBeneficiaryReferred
                          ? Status.visited.toValue()
                          : Status.notVisited.toValue()
                      : null,
                  title: [
                    householdMember.headOfHousehold.name?.givenName,
                    householdMember.headOfHousehold.name?.familyName,
                  ].whereNotNull().join(' '),
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
              columnWidth: 130,
              height: householdMember.members.length == 1
                  ? 61 * 2
                  : householdMember.members.length <= 4
                      ? (householdMember.members.length + 1) * 58
                      : 5 * 60,
              scrollPhysics: householdMember.members.length <= 4
                  ? const NeverScrollableScrollPhysics()
                  : const ClampingScrollPhysics(),
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
    bool isBeneficiaryIneligible,
    bool isBeneficiaryReferred,
    bool isStatusReset,
  ) {
    if (isNotEligible || isBeneficiaryIneligible) {
      return localizations.translate(
          i18.householdOverView.householdOverViewNotEligibleIconLabel);
    } else if (isBeneficiaryReferred) {
      return localizations.translate(
          i18.householdOverView.householdOverViewBeneficiaryReferredLabel);
    } else if (taskdata != null) {
      if (taskdata.isEmpty) {
        return localizations.translate(Status.notVisited.toValue());
      } else if (isBeneficiaryRefused && !isStatusReset) {
        return localizations.translate(Status.beneficiaryRefused.toValue());
      } else if (isStatusReset) {
        return localizations.translate(Status.notVisited.toValue());
      } else {
        return localizations.translate(Status.visited.toValue());
      }
    } else {
      return localizations.translate(Status.notVisited.toValue());
    }
  }

  // ignore: long-parameter-list
  Color getTableCellTextColor({
    required bool isNotEligible,
    required List<TaskModel>? taskdata,
    required bool isBeneficiaryRefused,
    required bool isBeneficiaryIneligible,
    required bool isStatusReset,
    required ThemeData theme,
  }) {
    return taskdata != null &&
            taskdata.isNotEmpty &&
            !isBeneficiaryRefused &&
            !isNotEligible &&
            !isBeneficiaryIneligible &&
            !isStatusReset
        ? theme.colorScheme.onSurfaceVariant
        : theme.colorScheme.error;
  }
}
