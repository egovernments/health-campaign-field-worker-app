import 'package:auto_route/auto_route.dart';
import 'package:digit_dss/blocs/dashboard.dart';
import 'package:digit_dss/widgets/back_navigation_help_header.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/digit_toast.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:digit_ui_components/widgets/powered_by_digit.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/dashboard/dashboard_metric_card.dart';
import '../../widgets/localized.dart';
import '../../widgets/no_result_card.dart';

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
              DigitLoaders.overlayLoader(context: context);
            }
          },
          fetched: (
            metricData,
            tableData,
            selectedDate,
            isNetworkError,
          ) {
            Navigator.of(context, rootNavigator: true).pop();
            if (isNetworkError == true) {
              Toast.showToast(
                context,
                message:
                    localizations.translate(i18.dashboard.someErrorOccured),
                type: ToastType.error,
              );
            }

            setState(() {
              isLoading = false;
            });
          },
          error: () {
            Navigator.of(context, rootNavigator: true).pop();
            setState(() {
              isLoading = false;
            });
            Toast.showToast(
              context,
              message: localizations.translate(i18.dashboard.someErrorOccured),
              type: ToastType.error,
            );
          });
    }, builder: (context, dashboardState) {
      return RefreshIndicator(
        onRefresh: () {
          dashboardState.maybeWhen(
              orElse: () => false,
              fetched:
                  (metricData, tableData, selectedDate, isNetworkError) async {
                bool isConnected = await getIsConnected();
                fetchData(isConnected, selectedDate);
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
                  fetched:
                      (metricData, tableData, selectedDate, isNetworkError) {
                    return Column(
                      children: [
                        DashboardMetricCard(
                          selectedDate: selectedDate ?? DateTime.now(),
                        ),
                        if ((metricData ?? {}).isEmpty &&
                            (tableData ?? []).isEmpty)
                          NoResultCard(
                            align: Alignment.center,
                            label: localizations.translate(
                              i18.common.noResultsFound,
                            ),
                          ),
                        ...(tableData ?? [])
                            .map((table) => Padding(
                                  padding: const EdgeInsets.all(spacer1),
                                  child: DigitTable(
                                    scrollPhysics: (table.tableData.length) > 5
                                        ? const ClampingScrollPhysics()
                                        : const NeverScrollableScrollPhysics(),
                                    rows: table.tableData,
                                    columns: table.headerList,
                                    tableHeight:
                                        MediaQuery.of(context).size.height * .3,
                                    showSelectedState: false,
                                    showPagination: false,
                                  ),
                                ))
                            .toList(),
                        if ((tableData ?? []).isNotEmpty)
                          Align(
                            alignment: Alignment.center,
                            child: InfoCard(
                              title: localizations
                                  .translate(i18.dashboard.noteHeader),
                              description: localizations
                                  .translate(i18.dashboard.noteDescription),
                              type: InfoType.info,
                            ),
                          )
                      ],
                    );
                  }),
            ],
          ),
        ),
      );
    });
  }

  void fetchData(bool isConnected, DateTime? selectedDate) {
    if (isConnected) {
      context.read<DashboardBloc>().add(DashboardRefreshEvent(
            projectId: DashboardSingleton().projectId,
            syncFromServer: true,
            selectedDate: selectedDate ?? DateTime.now(),
          ));
    } else {
      Toast.showToast(
        context,
        message: localizations.translate(i18.dashboard.networkFailureError),
        type: ToastType.error,
      );
    }
  }
}
