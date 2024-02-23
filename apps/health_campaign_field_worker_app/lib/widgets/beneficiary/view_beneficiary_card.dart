import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/project/project.dart';
import '../../blocs/search_households/search_households.dart';
import '../../models/data_model.dart';
import '../../models/project_type/project_type_model.dart';
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
        localizations.translate(i18.beneficiaryDetails.beneficiaryHeader),
        cellKey: 'beneficiary',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.deliveryHeader),
        cellKey: 'delivery',
      ),
      TableHeader(
        localizations.translate(i18.individualDetails.ageLabelText),
        cellKey: 'age',
      ),
      TableHeader(
        localizations.translate(i18.common.coreCommonGender),
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

        final taskdata = projectBeneficiary.isNotEmpty
            ? householdMember.tasks
                ?.where((element) =>
                    element.projectBeneficiaryClientReferenceId ==
                    projectBeneficiary.first.clientReferenceId)
                .toList()
            : null;
        final referralData = projectBeneficiary.isNotEmpty
            ? householdMember.referrals
                ?.where((element) =>
                    element.projectBeneficiaryClientReferenceId ==
                    projectBeneficiary.first.clientReferenceId)
                .toList()
            : null;
        final sideEffects = taskdata != null && taskdata.isNotEmpty
            ? householdMember.sideEffects
                ?.where((element) =>
                    element.taskClientReferenceId ==
                    taskdata.last.clientReferenceId)
                .toList()
            : null;
  
    final ageInYears = DigitDateUtils.calculateAge(
      householdMember.headOfHousehold.dateOfBirth != null
          ? DigitDateUtils.getFormattedDateToDateTime(
                householdMember.headOfHousehold.dateOfBirth!,
              ) ??
              DateTime.now()
          : DateTime.now(),
    ).years;
    final ageInMonths = DigitDateUtils.calculateAge(
      householdMember.headOfHousehold.dateOfBirth != null
          ? DigitDateUtils.getFormattedDateToDateTime(
                householdMember.headOfHousehold.dateOfBirth!,
              ) ??
              DateTime.now()
          : DateTime.now(),
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
        final isBeneficiaryRefused = checkIfBeneficiaryRefused(taskdata);
        final isBeneficiaryReferred = checkIfBeneficiaryReferred(
          referralData,
          currentCycle ?? const Cycle(),
        );

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
              StatusKeys(
                isNotEligible,
                isBeneficiaryRefused,
                isBeneficiaryReferred,
                isStatusReset,
              ),
              taskdata,
            ),
            cellKey: 'delivery',
            style: TextStyle(
              color: getTableCellTextColor(
                isNotEligible: isNotEligible,
                taskdata: taskdata,
                isBeneficiaryRefused:
                    isBeneficiaryRefused || isBeneficiaryReferred,
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
            e.gender?.name ?? '--',
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
      householdMember.headOfHousehold.dateOfBirth != null
          ? DigitDateUtils.getFormattedDateToDateTime(
                householdMember.headOfHousehold.dateOfBirth!,
              ) ??
              DateTime.now()
          : DateTime.now(),
    ).years;
    final ageInMonths = DigitDateUtils.calculateAge(
      householdMember.headOfHousehold.dateOfBirth != null
          ? DigitDateUtils.getFormattedDateToDateTime(
                householdMember.headOfHousehold.dateOfBirth!,
              ) ??
              DateTime.now()
          : DateTime.now(),
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
                      ? '${householdMember.members.length ?? 1} ${householdMember.members.length == 1 ? 'Household Member' : 'Household Members'}\n${((widget.distance!) * 1000).round() > 999 ? '(${((widget.distance!).round())} km)' : '(${((widget.distance!) * 1000).round()} mts) ${localizations.translate(i18.beneficiaryDetails.fromCurrentLocation)}'}'
                      : '${householdMember.members.length ?? 1} ${householdMember.members.length == 1 ? 'Household Member' : 'Household Members'}',
                  status: context.beneficiaryType == BeneficiaryType.individual
                      ? (householdMember.tasks ?? []).isNotEmpty &&
                              !isNotEligible &&
                              !isBeneficiaryRefused
                          ? Status.visited.toValue()
                          : Status.notVisited.toValue()
                      : (householdMember.tasks ?? []).isNotEmpty
                          ? Status.visited.toValue()
                          : Status.notVisited.toValue(),
                  title: [
                    householdMember.headOfHousehold.name?.givenName,
                    householdMember.headOfHousehold.name?.familyName,
                  ].whereNotNull().join(''),
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
          Offstage(
            offstage: !isCardExpanded,
            child: DigitTable(
              headerList: filteredHeaderList,
              tableData: tableData,
              columnWidth: 130,
              columnRowFixedHeight: 65,
              height: householdMember.members.length == 1
                  ? 65 * 2
                  : householdMember.members.length <= 4
                      ? (householdMember.members.length + 1) * 65
                      : 5 * 68,
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
                size: 24,
              ),
              onPressed: () => isCardExpanded = !isCardExpanded,
            ),
          ),
        ],
      ),
    );
  }

  String getTableCellText(
    StatusKeys statusKeys,
    List<TaskModel>? taskData,
  ) {
    if (statusKeys.isNotEligible) {
      return 'Not Eligible';
    } else if (statusKeys.isBeneficiaryReferred) {
      return localizations.translate(Status.beneficiaryReferred.toValue());
    } else if (taskData != null) {
      if (taskData.isEmpty) {
        return localizations.translate(Status.notVisited.toValue());
      } else if (statusKeys.isBeneficiaryRefused && !statusKeys.isStatusReset) {
        return localizations.translate(Status.beneficiaryRefused.toValue());
      } else if (statusKeys.isStatusReset) {
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
