import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';

import 'package:flutter/material.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MinNumberCard extends StatelessWidget {
  final String minNumber;
  final String cddCode;
  final String date;
  final List<Map<String, String>> items;
  final String data;
  final String? waybillNumber;
  final bool? isSelected;
  final StockRecordEntryType entryType;

  const MinNumberCard(
      {super.key,
      required this.minNumber,
      required this.cddCode,
      required this.date,
      required this.items,
      required this.data,
      this.waybillNumber,
      required this.entryType,
      this.isSelected});

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
          width: 2,
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
              margin: const EdgeInsets.symmetric(vertical: 10.0),
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
            if (InventorySingleton().isHFU &&
                entryType == StockRecordEntryType.dispatch)
              Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: QrImageView(
                  data: data,
                  version: QrVersions.auto,
                  size: 250.0,
                ),
              ),
            if (InventorySingleton().isHFU &&
                entryType == StockRecordEntryType.dispatch)
              const SizedBox(height: 8.0), // Replace spacer2
            ((InventorySingleton().isHFU &&
                        entryType == StockRecordEntryType.dispatch) ||
                    (InventorySingleton().isCDD &&
                        entryType == StockRecordEntryType.receipt))
                ? Text(cddCode != "" ? 'FAC_Delivery Team' : "")
                : Text(cddCode),

            const SizedBox(height: 8.0), // Replace spacer2
            Text(
              date,
              style: textTheme.bodyL,
            ),
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
                    const SizedBox(width: 8.0), // Replace spacer2
                    Text(
                      "${item['quantity']!} ${item['name']!.contains('SPAQ') ? 'Blisters' : 'Capsules'}",
                      style: textTheme.bodyL,
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 8.0), // Replace spacer2
            if (waybillNumber != null && waybillNumber!.trim().isNotEmpty)
              Row(
                children: [
                  Text("Waybill",
                      style: textTheme.bodyL.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    width: 16.0, // Replace spacer4 with 16.0
                  ),
                  Text(waybillNumber!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
