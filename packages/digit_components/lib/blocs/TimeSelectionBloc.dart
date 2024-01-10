import 'package:flutter/material.dart';
import '../../utils/time_utils.dart';

class TimeBloc {
  Future<void> selectTime({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    /// Show a time picker and update the controller's value
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (selectedTime != null) {
      controller.text = formatTime(selectedTime);
    }
  }
}
