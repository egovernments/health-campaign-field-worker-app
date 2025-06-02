import 'package:flutter/material.dart';

class CustomAttendanceInfoCard extends StatelessWidget {
  final String name;
  final String individualNumber;
  final double? status; // -1: unmarked, 0: absent, 0.5: half, 1: present
  final VoidCallback onMarkPresent;
  final VoidCallback onMarkAbsent;

  const CustomAttendanceInfoCard({
    super.key,
    required this.name,
    required this.individualNumber,
    required this.status,
    required this.onMarkPresent,
    required this.onMarkAbsent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String? getStatusText() {
      if (status == 1) return "Marked as Present";
      if (status == 0.5) return "Marked Half";
      if (status == 0) return "Marked as Absent";
      return null;
    }

    Color? getStatusColor() {
      if (status == 1) return Colors.green;
      if (status == 0.5) return Colors.orangeAccent;
      if (status == 0) return Colors.redAccent;
      return null;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.vertical(),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "Distributor",
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            getStatusText() ?? "Attendance Unmarked",
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: getStatusColor() ?? Colors.orange,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: const BorderRadius.vertical(),
              color: Colors.grey.shade100,
            ),
            child: Center(
              child: Text(
                "ID $individualNumber",
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          (status == -1 || status == null)
              ? Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onMarkPresent,
                        icon: const Icon(Icons.check, color: Colors.green),
                        label: const Text("Present"),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(),
                          ),
                          side: const BorderSide(color: Colors.green),
                          foregroundColor: Colors.green, // text color
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onMarkAbsent,
                        icon: const Icon(Icons.cancel, color: Colors.red),
                        label: const Text("Absent"),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(),
                          ),
                          side: const BorderSide(color: Colors.red),
                          foregroundColor: Colors.red,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(
                  width: 400,
                ),
        ],
      ),
    );
  }
}
