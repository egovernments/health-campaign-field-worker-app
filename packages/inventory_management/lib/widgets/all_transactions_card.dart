import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';

import 'package:flutter/material.dart';
import 'package:inventory_management/utils/utils.dart';

class TransactionsCard extends StatelessWidget {
  final String minNumber;
  final String cddCode;
  final String date;
  final List<Map<String, String>> items;
  final Map<String, dynamic> data;
  final String waybillNumber;
  final bool? isSelected;

  const TransactionsCard({
    super.key,
    required this.minNumber,
    required this.cddCode,
    required this.date,
    required this.items,
    required this.data,
    required this.waybillNumber,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Container(
      decoration: BoxDecoration(
        color: isSelected != null && isSelected!
            ? const Color.fromARGB(255, 250, 158, 105)
            : Colors.grey[200],
        border: Border.all(
          color: isSelected != null && isSelected!
              ? const Color.fromARGB(255, 223, 107, 41)
              : Colors.grey[400]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0), // Replace spacer2 with 8.0
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replace spacer4 with 16.0
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected != null && isSelected!
                    ? const Color.fromARGB(255, 238, 190, 162)
                    : Colors.white,
                borderRadius: BorderRadius.circular(8.0), // Replace spacer2
              ),
              padding: const EdgeInsets.all(8.0), // Replace spacer2
              child: Text(
                minNumber,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            if (!InventorySingleton().isWareHouseMgr)
              const SizedBox(height: 8.0), // Replace spacer2
            Text(cddCode),
            const SizedBox(height: 8.0), // Replace spacer2

            const SizedBox(height: 8.0), // Replace spacer2
            ...items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0), // Replace spacer2
                child: Row(
                  children: [
                    Text(
                      item['name']!,
                      style: textTheme.bodyL,
                    ),
                    const SizedBox(width: 8.0), // Replace spacer2
                    Text(
                      "|",
                      style: textTheme.bodyL,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      "${item['quantity']!} Units",
                      style: textTheme.bodyL,
                    ),
                    // const SizedBox(width: 8.0),
                    // Text(
                    //   "|",
                    //   style: textTheme.bodyL,
                    // ),
                    // Replace spacer2
                  ],
                ),
              );
            }).toList(),

            if (date.trim().isNotEmpty) ...[
              const SizedBox(width: 8.0),
              Text(
                date,
                style: textTheme.bodyL,
              ),
            ],

            const SizedBox(height: 8.0), // Replace spacer2
            Row(
              children: [
                Text("Waybill",
                    style: textTheme.bodyL.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  width: spacer4,
                ), // Replace spacer2
                Text(waybillNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
