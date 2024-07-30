import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_dss/blocs/dashboard.dart';
import 'package:digit_dss/widgets/back_navigation_help_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../../widgets/dashboard/dashboard_metric_card.dart';
import '../../widgets/localized.dart';

@RoutePage()
class UserDashboardPage extends LocalizedStatefulWidget {
  const UserDashboardPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return UserDashboardPageState();
  }
}

class UserDashboardPageState extends LocalizedState<UserDashboardPage> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(DashboardRefreshEvent(
          projectId: DashboardSingleton().projectId,
          syncFromServer: false,
          selectedDate: DateTime.now(),
        ));

    super.initState();
  }

  bool isLoading = false;

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
          style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium?.apply(
            color: const DigitColors().burningOrange,
          ),
        ),
        TableData(
          e['noOfHousesVisited'].toString(),
          cellKey: 'noOfHousesVisited',
          style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium?.apply(
            color: const DigitColors().darkSpringGreen,
          ),
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
      TableData(
        totalDetails.noOfHousesVisited.toString(),
        style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium?.apply(
          color: const DigitColors().darkSpringGreen,
        ),
      ),
      TableData(totalDetails.noOfHousesSprayed.toString()),
      TableData(totalDetails.noOfHousesNotSprayed.toString()),
      TableData(totalDetails.bottlesUsed.toString()),
      TableData(totalDetails.noOfRemainingBottles.toString()),
      TableData(''),
    ]));

    return BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, dashboardState) {
      dashboardState.maybeWhen(
          orElse: () => false,
          loading: () {
            if (!isLoading) {
              setState(() {
                isLoading = true;
              });
              Loaders.showLoadingDialog(context);
            }
          },
          fetched: (metricData, tableData, selectedDate) {
            Navigator.of(context, rootNavigator: true).pop();
            setState(() {
              isLoading = false;
            });
          },
          error: () {
            Navigator.of(context, rootNavigator: true).pop();
            setState(() {
              isLoading = false;
            });
            DigitToast.show(context,
                options: DigitToastOptions(
                    'Please connect to the internet to refresh the dashboard',
                    true,
                    DigitTheme.instance.mobileTheme));
          });
    }, builder: (context, dashboardState) {
      return RefreshIndicator(
        onRefresh: () {
          dashboardState.maybeWhen(
              orElse: () => false,
              fetched: (metricData, tableData, selectedDate) async {
                bool isConnected = await getIsConnected();
                if (isConnected) {
                  context.read<DashboardBloc>().add(DashboardRefreshEvent(
                        projectId: DashboardSingleton().projectId,
                        syncFromServer: true,
                        selectedDate: selectedDate ?? DateTime.now(),
                      ));
                } else {
                  DigitToast.show(context,
                      options: DigitToastOptions(
                        'Please connect to the internet to refresh the dashboard',
                        true,
                        DigitTheme.instance.mobileTheme,
                      ));
                }
              });

          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: Scaffold(
          body: ScrollableContent(
            footer: PoweredByDigit(
              version: DashboardSingleton().appVersion,
            ),
            header: const Column(children: [
              BackNavigationHelpHeaderWidget(
                showHelp: false,
              ),
            ]),
            children: [
              dashboardState.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  fetched: (metricData, tableData, selectedDate) {
                    return DashboardMetricCard(
                      selectedDate: selectedDate ?? DateTime.now(),
                    );
                  }),
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
              const Align(
                alignment: Alignment.center,
                child: DigitInfoCard(
                  title: 'Note',
                  description:
                      'Scroll the bar to right to view all the details against a worker'
                      '\n\nHouse coverage ratio = Total houses sprayed / Total houses visited'
                      '\n\nRoom coverage ratio = Total rooms sprayed / Total rooms available',
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
