import 'package:attendance_management/widgets/localized.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';

class DashboardMetricCard extends LocalizedStatefulWidget {
  const DashboardMetricCard({
    super.key,
    super.appLocalizations,
  });

  @override
  State<DashboardMetricCard> createState() => _DashboardMetricCardState();
}

class _DashboardMetricCardState extends LocalizedState<DashboardMetricCard> {
  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance.mobileTheme;

    final metricData = {
      'totalNoOfHousesSprayed': 75,
      'totalBottlesUsed': 30,
      'targetAchievement': '67 %',
    };

    return DigitCard(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Text(
                localizations.translate(
                  'Dashboard',
                ),
                style: theme.textTheme.displayMedium,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: null,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '${DigitDateUtils.getMonth(DateTime.now())} - ${DateTime.now().year}',
                          style: theme.textTheme.bodyMedium
                              ?.apply(color: theme.colorScheme.secondary),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Visibility(
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: kPadding, bottom: kPadding),
          child: Wrap(
            spacing: 2.0, // Space between items
            runSpacing: 2.0, // Space between lines
            alignment: WrapAlignment.start,
            children: metricData.entries.map((entry) {
              return SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildMetric(entry.key, entry.value.toString()),
                    if (entry.key != metricData.entries.last.key)
                      VerticalDivider(
                        width: kPadding,
                        color:
                            DigitTheme.instance.mobileTheme.colorScheme.outline,
                        thickness: 2,
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding),
            child: Text(
              '5 Spray operators synced atleast once',
              textAlign: TextAlign.start,
              style: DigitTheme.instance.mobileTheme.textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          value,
          style: DigitTheme.instance.mobileTheme.textTheme.bodyLarge,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3.5),
          child: Text(
            localizations.translate(
              label,
            ),
            style:
                DigitTheme.instance.mobileTheme.textTheme.bodyMedium?.apply(),
          ),
        ),
      ],
    );
  }
}
