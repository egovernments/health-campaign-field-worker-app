import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_dss/blocs/dashboard.dart';
import 'package:digit_dss/widgets/back_navigation_help_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/i18_key_constants.dart' as i18;
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
                    localizations.translate(i18.dashboard.someErrorOccured),
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
                        localizations
                            .translate(i18.dashboard.networkFailureError),
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
                    return Column(
                      children: [
                        DashboardMetricCard(
                          selectedDate: selectedDate ?? DateTime.now(),
                        ),
                        ...(tableData ?? [])
                            .map((table) => Padding(
                                  padding: const EdgeInsets.all(kPadding),
                                  child: DigitTable(
                                    headerList: table.headerList.map((header) {
                                      return TableHeader(
                                        localizations.translate(header.label),
                                        cellKey: header.cellKey,
                                      );
                                    }).toList(),
                                    tableData: table.tableData,
                                    height:
                                        ((table.tableData.length ?? 0) + 1) *
                                            65,
                                    columnWidth: 140,
                                    columnRowFixedHeight: 65,
                                    scrollPhysics: (table.tableData.length ??
                                                0) >
                                            5
                                        ? const ClampingScrollPhysics()
                                        : const NeverScrollableScrollPhysics(),
                                  ),
                                ))
                            .toList(),
                      ],
                    );
                  }),
              Align(
                alignment: Alignment.center,
                child: DigitInfoCard(
                  title: localizations.translate(i18.dashboard.noteHeader),
                  description:
                      localizations.translate(i18.dashboard.noteDescription),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
