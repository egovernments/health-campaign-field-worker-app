import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../flow_widget_interface.dart';

class DateRowPickerWidget implements FlowWidget {
  @override
  String get format => 'dateRowPicker';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    return WidgetStateContext.reactive(context, (ctx, state) {
      // --- Config from JSON ---
      final fieldKey = json['fieldKey'] as String? ?? 'selectedDate';

      // Parse optional startDate from JSON (ISO 8601 string or null → today)
      final startDateRaw = json['startDate'] as String?;
      final DateTime startDate = startDateRaw != null
          ? DateTime.tryParse(startDateRaw) ?? DateTime.now()
          : DateTime.now();

      final endDateRaw = json['endDate'] as String?;
      final DateTime endDate = endDateRaw != null
          ? DateTime.tryParse(endDateRaw) ?? DateTime.now()
          : DateTime.now();

      final int daysCount = endDate.difference(startDate).inDays;

      // Build the list of dates
      final dates = List.generate(
        daysCount,
        (i) => startDate.add(Duration(days: i)),
      );

      // Currently selected date (stored as ISO date string "yyyy-MM-dd")
      final selectedValue = state.widgetData[fieldKey] as String?;

      return SizedBox(
        height: 110,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          itemCount: dates.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final date = dates[index];
            final dateKey = _isoDate(date);
            final isSelected = dateKey == selectedValue;

            return _DateCard(
              date: date,
              isSelected: isSelected,
              onTap: () {
                // Persist selection in widgetData
                state.updateWidgetData(fieldKey, dateKey);

                // Fire onAction so consumers can react
                onAction(ActionConfig(
                  action: 'selectDate',
                  actionType: 'widgetData',
                  properties: {
                    'key': fieldKey,
                    'value': dateKey,
                  },
                ));
              },
            );
          },
        ),
      );
    });
  }

  static String _isoDate(DateTime d) => '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}

/// Individual date card widget.
class _DateCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateCard({
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  static const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final weekday = _weekdays[date.weekday - 1]; // weekday: 1=Mon … 7=Sun
    final month = _months[date.month - 1];
    final day = date.day.toString();

    // Colour tokens matching the design image
    const selectedBorder = Color(0xFFB54B16); // deep orange-brown
    const selectedBg = Color(0xFFFDF4EE); // warm cream
    const unselectedBorder = Color(0xFFD4D4D4); // light grey
    const unselectedBg = Colors.white;
    const labelColor = Color(0xFF5B7F99); // muted teal-blue (weekday & month)
    const dayColorSelected = Color(0xFF1B4B72); // dark navy (bold day number)
    const dayColorNormal = Color(0xFF1B4B72);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 76,
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : unselectedBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? selectedBorder : unselectedBorder,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: selectedBorder.withOpacity(0.18),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Day of week
            Text(
              weekday,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: labelColor,
              ),
            ),
            const SizedBox(height: 4),
            // Day number
            Text(
              day,
              style: TextStyle(
                fontSize: 26,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                color: isSelected ? dayColorSelected : dayColorNormal,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 4),
            // Month
            Text(
              month,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? selectedBorder : labelColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
