import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../models/entities/roles_type.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/stock_calculation_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

@RoutePage()
class SummaryReportPage extends LocalizedStatefulWidget {
  const SummaryReportPage({super.key});

  @override
  State<SummaryReportPage> createState() => _SummaryReportPageState();
}

class _SummaryReportPageState extends LocalizedState<SummaryReportPage> {
  List<_SummaryReportRow> _reportRows = [];
  List<ProductVariantModel> _productVariants = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final userUuid = context.loggedInUserUuid;
      final projectId = context.projectId;

      // Repositories
      final householdRepo = context
          .read<LocalRepository<HouseholdModel, HouseholdSearchModel>>();
      final taskRepo =
          context.read<LocalRepository<TaskModel, TaskSearchModel>>();
      final householdMemberRepo = context.read<
          LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>();
      final stockRepo =
          context.read<LocalRepository<StockModel, StockSearchModel>>();
      final projectResourceRepo = context.read<
          LocalRepository<ProjectResourceModel, ProjectResourceSearchModel>>();
      final productVariantRepo = context.read<
          LocalRepository<ProductVariantModel, ProductVariantSearchModel>>();
      final projectFacilityRepo = context.read<
          LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>();
      final facilityRepo =
          context.read<LocalRepository<FacilityModel, FacilitySearchModel>>();

      // Determine facility ID (same logic as stock_balance_card)
      final isDistributor = context.loggedInUserRoles
          .any((role) => role.code == RolesType.distributor.toValue());

      final projectFacilities = await projectFacilityRepo
          .search(ProjectFacilitySearchModel(projectId: [projectId]));

      final currentFacilities = projectFacilities.where((pf) {
        final facilityLevel = pf.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      final facilityIds =
          currentFacilities.map((pf) => pf.facilityId).toList();
      final facilities = await facilityRepo
          .search(FacilitySearchModel(id: facilityIds));

      // Match stock_balance_card: distributors always use userUuid
      final effectiveFacilityId = isDistributor
          ? userUuid
          : (facilities.isNotEmpty ? facilities.first.id : userUuid);

      // Fetch product variants
      final projectResources = await projectResourceRepo
          .search(ProjectResourceSearchModel(projectId: [projectId]));
      final productVariantIds = projectResources
          .map((pr) => pr.resource.productVariantId)
          .whereType<String>()
          .toSet()
          .toList();
      final productVariants = productVariantIds.isNotEmpty
          ? await productVariantRepo
              .search(ProductVariantSearchModel(id: productVariantIds))
          : <ProductVariantModel>[];

      // Fetch all data
      final households = await householdRepo.search(HouseholdSearchModel());
      final tasks = await taskRepo.search(TaskSearchModel());
      final householdMembers =
          await householdMemberRepo.search(HouseholdMemberSearchModel());

      // Fetch stock records (received + sent for facility)
      final receivedStocks = await stockRepo
          .search(StockSearchModel(receiverId: effectiveFacilityId));
      final sentStocks = await stockRepo
          .search(StockSearchModel(senderId: effectiveFacilityId));

      // Deduplicate stock records by clientReferenceId
      final allStocksMap = <String, StockModel>{};
      for (final stock in receivedStocks) {
        allStocksMap[stock.clientReferenceId] = stock;
      }
      for (final stock in sentStocks) {
        allStocksMap[stock.clientReferenceId] = stock;
      }
      final allStocks = allStocksMap.values.toList();

      // ── Group households by date (filter by logged-in user) ──
      final hhByDate = <String, int>{};
      for (final hh in households) {
        final createdBy =
            hh.clientAuditDetails?.createdBy ?? hh.auditDetails?.createdBy;
        if (createdBy != userUuid) continue;
        final epochMs = hh.clientAuditDetails?.createdTime ??
            hh.auditDetails?.createdTime;
        if (epochMs == null) continue;
        final date = _epochToDateString(epochMs);
        hhByDate[date] = (hhByDate[date] ?? 0) + 1;
      }

      // ── Group tasks by date for children treated ──
      // (filter by logged-in user AND status == 'ADMINISTRATION_SUCCESS' or 'VISITED')
      final tasksByDate = <String, Set<String>>{};
      for (final task in tasks) {
        if (task.status != 'ADMINISTRATION_SUCCESS' &&
            task.status != 'VISITED') continue;
        final createdBy = task.clientAuditDetails?.createdBy ??
            task.auditDetails?.createdBy;
        if (createdBy != userUuid) continue;
        final epochMs = task.clientAuditDetails?.createdTime ??
            task.auditDetails?.createdTime;
        if (epochMs == null) continue;
        final beneficiaryRef = task.projectBeneficiaryClientReferenceId;
        if (beneficiaryRef == null || beneficiaryRef.isEmpty) continue;
        final date = _epochToDateString(epochMs);
        tasksByDate.putIfAbsent(date, () => <String>{});
        tasksByDate[date]!.add(beneficiaryRef);
      }

      // ── Group non-head household members by date ──
      final nonHeadMembersByDate = <String, int>{};
      for (final member in householdMembers) {
        if (member.isHeadOfHousehold) continue;
        final createdBy = member.clientAuditDetails?.createdBy ??
            member.auditDetails?.createdBy;
        if (createdBy != userUuid) continue;
        final epochMs = member.clientAuditDetails?.createdTime ??
            member.auditDetails?.createdTime;
        if (epochMs == null) continue;
        final date = _epochToDateString(epochMs);
        nonHeadMembersByDate[date] = (nonHeadMembersByDate[date] ?? 0) + 1;
      }

      // ── Group stock consumed from task resources by date + productVariant ──
      // Only count tasks with status 'ADMINISTRATION_SUCCESS' or 'VISITED'
      // Key: "date|productVariantId" -> sum of quantity
      final consumedByDateProduct = <String, double>{};
      for (final task in tasks) {
        if (task.status != 'ADMINISTRATION_SUCCESS' &&
            task.status != 'VISITED') continue;
        final createdBy = task.clientAuditDetails?.createdBy ??
            task.auditDetails?.createdBy;
        if (createdBy != userUuid) continue;
        final epochMs = task.clientAuditDetails?.createdTime ??
            task.auditDetails?.createdTime;
        if (epochMs == null) continue;
        final date = _epochToDateString(epochMs);
        final resources = task.resources;
        if (resources == null) continue;
        for (final res in resources) {
          final pvId = res.productVariantId;
          if (pvId == null || pvId.isEmpty) continue;
          final qty = double.tryParse(res.quantity ?? '0') ?? 0.0;
          final key = '$date|$pvId';
          consumedByDateProduct[key] =
              (consumedByDateProduct[key] ?? 0.0) + qty;
        }
      }

      // ── Collect stock dates (for date rows) ──
      final stockDates = <String>{};
      for (final stock in allStocks) {
        final epochMs = stock.clientAuditDetails?.createdTime ??
            stock.auditDetails?.createdTime;
        if (epochMs == null) continue;
        stockDates.add(_epochToDateString(epochMs));
      }

      // ── Collect consumed dates ──
      final consumedDates = <String>{};
      for (final key in consumedByDateProduct.keys) {
        consumedDates.add(key.split('|')[0]);
      }

      final allDates = <String>{
        ...hhByDate.keys,
        ...tasksByDate.keys,
        ...stockDates,
        ...consumedDates,
      };

      // ── Build rows ──
      // Sort dates ascending for cumulative consumed calculation
      final sortedDates = allDates.toList()..sort();

      // Track cumulative consumed per product variant (for balance)
      final cumulativeConsumed = <String, double>{};

      final rows = <_SummaryReportRow>[];
      for (final date in sortedDates) {
        final hhCount = hhByDate[date] ?? 0;
        final childrenCount = tasksByDate[date]?.length ?? 0;
        final nonHeadCount = nonHeadMembersByDate[date] ?? 0;
        final percentage =
            nonHeadCount > 0 ? (childrenCount / nonHeadCount) * 100 : 0.0;

        // End-of-day timestamp for cumulative stock filtering
        final endOfDay = DateTime.parse(date)
            .add(const Duration(days: 1))
            .subtract(const Duration(milliseconds: 1))
            .millisecondsSinceEpoch;

        // Filter all stocks up to and including this day
        // Stocks without timestamps are included (assumed historical)
        final cumulativeStocks = allStocks.where((stock) {
          final epochMs = stock.clientAuditDetails?.createdTime ??
              stock.auditDetails?.createdTime;
          if (epochMs == null) return true;
          return epochMs <= endOfDay;
        }).toList();

        // Per-product stock data
        final stockData = <String, _ProductStockData>{};
        for (final pv in productVariants) {
          // Cumulative received & returned using same logic as stock_balance_card
          final metrics = cumulativeStocks.isNotEmpty
              ? StockCalculationUtils.calculateStockMetrics(
                  stockList: cumulativeStocks,
                  facilityId: effectiveFacilityId,
                  productId: pv.id,
                  loggedInUserUuid: userUuid,
                  isDistributor: isDistributor,
                )
              : StockCalculationUtils.emptyMetrics;

          final totalReceived = metrics['stockReceived'] ?? 0.0;
          final totalReturned = metrics['stockReturned'] ?? 0.0;

          // Daily consumed (for this day only)
          final key = '$date|${pv.id}';
          final dailyConsumed = consumedByDateProduct[key] ?? 0.0;

          // Accumulate consumed for balance calculation
          cumulativeConsumed[pv.id] =
              (cumulativeConsumed[pv.id] ?? 0.0) + dailyConsumed;
          final totalConsumed = cumulativeConsumed[pv.id]!;

          final balance = totalReceived - totalConsumed - totalReturned;

          stockData[pv.id] = _ProductStockData(
            received: totalReceived,
            consumed: dailyConsumed,
            returned: totalReturned,
            balance: balance,
          );
        }

        rows.add(_SummaryReportRow(
          date: date,
          householdsRegistered: hhCount,
          childrenTreated: childrenCount,
          childrenTreatedPercent: percentage,
          stockData: stockData,
        ));
      }

      // Sort descending by date for display
      rows.sort((a, b) => b.date.compareTo(a.date));

      if (mounted) {
        setState(() {
          _reportRows = rows;
          _productVariants = productVariants;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _epochToDateString(int epochMs) {
    final dt = DateTime.fromMillisecondsSinceEpoch(epochMs);
    return DateFormat('yyyy-MM-dd').format(dt);
  }

  String _formatDisplayDate(String dateStr) {
    final dt = DateTime.parse(dateStr);
    return DateFormat('dd/MM/yyyy').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    // Build columns: base columns + per-product stock columns
    final columns = <DigitTableColumn>[
      DigitTableColumn(
        header: localizations.translate(i18.summaryReport.dateColumn),
        cellValue: 'date',
      ),
      DigitTableColumn(
        header: localizations.translate(i18.summaryReport.householdsRegistered),
        cellValue: 'hhRegistered',
      ),
      DigitTableColumn(
        header: localizations.translate(i18.summaryReport.childrenTreated),
        cellValue: 'childrenTreated',
      ),
      DigitTableColumn(
        header:
            localizations.translate(i18.summaryReport.childrenTreatedPercent),
        cellValue: 'childrenTreatedPercent',
      ),
    ];

    // Add stock columns per product variant
    for (final pv in _productVariants) {
      final name = localizations.translate(pv.sku ?? pv.id);
      columns.addAll([
        DigitTableColumn(
          header:
              '${localizations.translate(i18.summaryReport.stockReceived)} ($name)',
          cellValue: 'received_${pv.id}',
        ),
        DigitTableColumn(
          header:
              '${localizations.translate(i18.summaryReport.stockConsumed)} ($name)',
          cellValue: 'consumed_${pv.id}',
        ),
        DigitTableColumn(
          header:
              '${localizations.translate(i18.summaryReport.stockReturned)} ($name)',
          cellValue: 'returned_${pv.id}',
        ),
        DigitTableColumn(
          header:
              '${localizations.translate(i18.summaryReport.stockBalance)} ($name)',
          cellValue: 'balance_${pv.id}',
        ),
      ]);
    }

    // Build rows
    final rows = _reportRows.map((row) {
      final cells = <DigitTableData>[
        DigitTableData(
          _formatDisplayDate(row.date),
          cellKey: 'date',
        ),
        DigitTableData(
          row.householdsRegistered.toString(),
          cellKey: 'hhRegistered',
        ),
        DigitTableData(
          row.childrenTreated.toString(),
          cellKey: 'childrenTreated',
        ),
        DigitTableData(
          '${row.childrenTreatedPercent.toStringAsFixed(1)}%',
          cellKey: 'childrenTreatedPercent',
        ),
      ];

      // Add stock cells per product variant
      for (final pv in _productVariants) {
        final data = row.stockData[pv.id];
        cells.addAll([
          DigitTableData(
            (data?.received ?? 0).toStringAsFixed(0),
            cellKey: 'received_${pv.id}',
          ),
          DigitTableData(
            (data?.consumed ?? 0).toStringAsFixed(0),
            cellKey: 'consumed_${pv.id}',
          ),
          DigitTableData(
            (data?.returned ?? 0).toStringAsFixed(0),
            cellKey: 'returned_${pv.id}',
          ),
          DigitTableData(
            (data?.balance ?? 0).toStringAsFixed(0),
            cellKey: 'balance_${pv.id}',
          ),
        ]);
      }

      return DigitTableRow(tableRow: cells);
    }).toList();

    return Scaffold(
      body: ScrollableContent(
        enableFixedDigitButton: true,
        header: BackNavigationHelpHeaderWidget(
          handleback: () {
            context.router.replaceAll([HomeRoute()]);
          },
        ),
        footer: DigitCard(
          margin: const EdgeInsets.only(top: spacer2),
          children: [
            DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: localizations.translate(i18.summaryReport.backToHome),
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              onPressed: () {
                context.router.replaceAll([HomeRoute()]);
              },
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(spacer2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                localizations.translate(i18.summaryReport.heading),
                style: textTheme.headingXl.copyWith(
                  color: theme.colorTheme.primary.primary2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacer2),
            child: Text(
              localizations.translate(i18.summaryReport.description),
              style: textTheme.bodyL,
            ),
          ),
          const SizedBox(height: spacer2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacer2),
            child: InfoCard(
              title: localizations.translate(i18.summaryReport.infoCardTitle),
              description: localizations
                  .translate(i18.summaryReport.infoCardDescription),
              type: InfoType.info,
            ),
          ),
          const SizedBox(height: spacer2),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_reportRows.isEmpty)
            Padding(
              padding: const EdgeInsets.all(spacer4),
              child: Center(
                child: Text(
                  localizations.translate(i18.common.noResultsFound),
                  style: textTheme.bodyL,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer2),
              child: DigitTable(
                enableBorder: true,
                showPagination: false,
                showSelectedState: false,
                columns: columns,
                rows: rows,
                tableHeight: (rows.length * 50.0).clamp(100, 400),
              ),
            ),
          const SizedBox(height: spacer2),
        ],
      ),
    );
  }
}

class _SummaryReportRow {
  final String date;
  final int householdsRegistered;
  final int childrenTreated;
  final double childrenTreatedPercent;
  final Map<String, _ProductStockData> stockData;

  _SummaryReportRow({
    required this.date,
    required this.householdsRegistered,
    required this.childrenTreated,
    required this.childrenTreatedPercent,
    this.stockData = const {},
  });
}

class _ProductStockData {
  final double received;
  final double consumed;
  final double returned;
  final double balance;

  _ProductStockData({
    required this.received,
    required this.consumed,
    required this.returned,
    required this.balance,
  });
}
