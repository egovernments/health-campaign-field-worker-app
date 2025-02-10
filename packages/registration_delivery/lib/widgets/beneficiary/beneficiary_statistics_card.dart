import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../models/beneficiary_statistics/beneficiary_statistics_model.dart';

class BeneficiaryStatisticsCard extends StatelessWidget {
  final BeneficiaryStatisticsWrapperModel beneficiaryStatistics;

  const BeneficiaryStatisticsCard({
    super.key,
    required this.beneficiaryStatistics,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return DigitCard(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  beneficiaryStatistics.beneficiaryStatisticsList.first.title,
                  style: textTheme.headingXl,
                  textAlign: TextAlign.center,
                ),
                Text(
                  beneficiaryStatistics.beneficiaryStatisticsList.first.content,
                  style: textTheme.bodyS,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                Text(
                  beneficiaryStatistics.beneficiaryStatisticsList.last.title,
                  style: textTheme.headingXl,
                  textAlign: TextAlign.center,
                ),
                Text(
                  beneficiaryStatistics.beneficiaryStatisticsList.last.content,
                  style: textTheme.bodyS,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
