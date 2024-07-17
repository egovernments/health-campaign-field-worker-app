import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';

import '../../router/app_router.dart';
import '../../utils/utils.dart';
import '../../widgets/dashboard/dashboard_metric_card.dart';
import '../../widgets/localized.dart';

@RoutePage()
class YearlyDashboardPage extends LocalizedStatefulWidget {
  const YearlyDashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return YearlyDashboardPageState();
  }
}

class YearlyDashboardPageState extends LocalizedState<YearlyDashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TotalDetails totalDetails = TotalDetails();
    final headerList = [
      TableHeader(
        localizations.translate('User ID / Name'),
        cellKey: 'userID',
      ),
      TableHeader(
        localizations.translate('No. of houses visited today'),
        cellKey: 'noOfHousesVisited',
      ),
      TableHeader(
        localizations.translate('No. of houses sprayed today'),
        cellKey: 'noOfHousesSprayed',
      ),
      TableHeader(
        localizations.translate('No. of houses not sprayed today'),
        cellKey: 'noOfHousesNotSprayed',
      ),
      TableHeader(
        localizations.translate('Bottles used today'),
        cellKey: 'bottlesUsed',
      ),
      TableHeader(
        localizations.translate('Remaining bottles'),
        cellKey: 'remainingBottles',
      ),
      TableHeader(
        localizations.translate('Last synced time'),
        cellKey: 'lastSyncTime',
      ),
    ];

    final chartData = [
      {
        'name': 'Ram',
        'noOfHousesVisited': 100,
        'noOfHousesSprayed': 75,
        'bottlesUsed': 30,
        'totalBottles': 300,
        'lastSyncTime': 1720583715000
      },
      {
        'name': 'Naveen J',
        'noOfHousesVisited': 150,
        'noOfHousesSprayed': 90,
        'bottlesUsed': 50,
        'totalBottles': 500,
        'lastSyncTime': 1720151715000
      },
      {
        'name': 'Rachna',
        'noOfHousesVisited': 80,
        'noOfHousesSprayed': 65,
        'bottlesUsed': 20,
        'totalBottles': 200,
        'lastSyncTime': 1721015715000
      }
    ];

    final tableData = chartData.map((e) {
      final rowTableData = [
        TableData(
          e['name'].toString(),
          cellKey: 'userID',
        ),
        TableData(
          e['noOfHousesVisited'].toString(),
          cellKey: 'noOfHousesVisited',
        ),
        TableData(
          e['noOfHousesSprayed'].toString(),
          cellKey: 'noOfHousesSprayed',
        ),
        TableData(
          (int.parse(e['noOfHousesVisited'].toString()) -
                  int.parse(e['noOfHousesSprayed'].toString()))
              .toString(),
          cellKey: 'noOfHousesNotSprayed',
        ),
        TableData(
          e['bottlesUsed'].toString(),
          cellKey: 'bottlesUsed',
        ),
        TableData(
          (int.parse(e['totalBottles'].toString()) -
                  int.parse(e['bottlesUsed'].toString()))
              .toString(),
          cellKey: 'remainingBottles',
        ),
        TableData(
          DigitDateUtils.getDateFromTimestamp(
              int.parse(e['lastSyncTime'].toString())),
          cellKey: 'lastSyncTime',
        ),
      ];

      return TableDataRow(rowTableData);
    }).toList();

    for (int i = 0; i < chartData.length; i++) {
      totalDetails.noOfHousesVisited +=
          int.parse(chartData[i]['noOfHousesVisited'].toString());
      totalDetails.noOfHousesSprayed +=
          int.parse(chartData[i]['noOfHousesSprayed'].toString());
      totalDetails.noOfHousesNotSprayed +=
          (int.parse(chartData[i]['noOfHousesVisited'].toString()) -
              int.parse(chartData[i]['noOfHousesSprayed'].toString()));
      totalDetails.bottlesUsed +=
          int.parse(chartData[i]['bottlesUsed'].toString());
      totalDetails.noOfRemainingBottles +=
          (int.parse(chartData[i]['totalBottles'].toString()) -
              int.parse(chartData[i]['bottlesUsed'].toString()));
    }

    tableData.add(TableDataRow([
      TableData('Total'),
      TableData(totalDetails.noOfHousesVisited.toString()),
      TableData(totalDetails.noOfHousesSprayed.toString()),
      TableData(totalDetails.noOfHousesNotSprayed.toString()),
      TableData(totalDetails.bottlesUsed.toString()),
      TableData(totalDetails.noOfRemainingBottles.toString()),
      TableData(''),
    ]));

    return Scaffold(
      body: Column(
        children: [
          const DashboardMetricCard(),
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: DigitTable(
              headerList: headerList,
              tableData: tableData,
              height: ((tableData.length) + 1) * 65,
              columnWidth: 140,
              columnRowFixedHeight: 65,
              scrollPhysics: tableData.length > 5
                  ? const ClampingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
