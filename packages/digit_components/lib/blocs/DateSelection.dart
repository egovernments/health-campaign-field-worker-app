import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionBloc {
  Future<void> selectDate({
    required BuildContext context,
    required TextEditingController controller,
    DateFormat? dateFormat, /// Added parameter for custom date format
  }) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {
      String formattedDate =
          dateFormat?.format(selectedDate.toLocal()) ??
              DateFormat('dd/MM/yyyy').format(selectedDate.toLocal());
      controller.text = formattedDate;
    }
  }
}
