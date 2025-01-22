import 'package:collection/collection.dart';
import 'package:digit_dss/widgets/localized.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/dashboard.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';

class DashboardMetricCard extends LocalizedStatefulWidget {
  final DateTime? selectedDate;
  const DashboardMetricCard({
    super.key,
    super.appLocalizations,
    this.selectedDate,
  });

  @override
  State<DashboardMetricCard> createState() => _DashboardMetricCardState();
}

class _DashboardMetricCardState extends LocalizedState<DashboardMetricCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance.mobileTheme;

    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, dashboardState) {
      return DigitCard(
        margin: const EdgeInsets.all(spacer2),
          children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width*.5,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right:  spacer2,
                ),
                child: Text(
                  localizations.translate(
                    i18.dashboard.dashboardLabel,
                  ),
                  style: theme.textTheme.displayMedium,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  bool isConnected = await getIsConnected();
                  fetchChartData(isConnected);
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          dashboardState.maybeWhen(
                              orElse: () => '',
                              fetched: (metricData, tableData, selectedDate,
                                      isNetworkError) =>
                                  '${DigitDateUtils.getMonth(selectedDate?.toLocal() ?? DateTime.now())} - ${(selectedDate?.toLocal() ?? DateTime.now()).day}, ${(selectedDate?.toLocal() ?? DateTime.now()).year}'),
                          style: theme.textTheme.bodyMedium
                              ?.apply(color: theme.colorScheme.secondary),
                        ),
                         Visibility(
                           child: Icon(Icons.arrow_drop_down, color: theme.colorTheme.primary.primary2,),
                         )
                      ]),
                ),
              ),
            )
          ],
        ),
        Wrap(
          spacing: spacer1/2, // Space between items
          runSpacing: spacer1/2, // Space between lines
          alignment: WrapAlignment.start,
          children: [
            ...dashboardState.maybeWhen(
                orElse: () => [],
                fetched:
                    (metricData, tableData, selectedDate, isNetworkError) {
                  return metricData != null
                      ? metricData.entries
                          .where((m) => m.value.isHorizontal == true)
                          .mapIndexed((
                          i,
                          entry,
                        ) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.width / 3.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildMetric(
                                  context,
                                  entry.key,
                                  entry.value.value,
                                  i,
                                  localizations,
                                ),
                                if (entry.key != metricData.entries.last.key)
                                  const DigitDivider(dividerOrientation: DividerOrientation.vertical, dividerType: DividerType.small,),
                              ],
                            ),
                          );
                        }).toList()
                      : [];
                }),
            ...dashboardState.maybeWhen(
                orElse: () => [],
                fetched:
                    (metricData, tableData, selectedDate, isNetworkError) {
                  return metricData != null
                      ? metricData.entries
                          .where((m) => m.value.isHorizontal == false)
                          .mapIndexed((
                          i,
                          entry,
                        ) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: spacer1),
                              child: Text(
                                '${entry.value.value} ${localizations.translate(entry.value.header)}',
                                textAlign: TextAlign.start,
                                style: DigitTheme.instance.mobileTheme
                                    .textTheme.bodyMedium,
                              ),
                            ),
                          );
                        }).toList()
                      : [];
                }),
          ],
        ),
      ]);
    });
  }

  void fetchChartData(bool isConnected) async {
    if (isConnected) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (pickedDate != null && pickedDate != DateTime.now() && mounted) {
        final dashboardBloc = context.read<DashboardBloc>();
        dashboardBloc.add(DashboardRefreshEvent(
          selectedDate: pickedDate.toLocal(),
          projectId: DashboardSingleton().projectId,
          syncFromServer: true,
        ));
      }
    } else {
      Toast.showToast(context,
          message: localizations.translate(i18.dashboard.networkFailureError),
          type: ToastType.error);
    }
  }
}
