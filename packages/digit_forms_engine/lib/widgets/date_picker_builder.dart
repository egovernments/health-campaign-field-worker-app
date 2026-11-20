part of 'json_schema_builder.dart';

class JsonSchemaDatePickerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final DateTime? end;

  const JsonSchemaDatePickerBuilder({
    required super.formControlName,
    required super.form,
    super.label,
    super.key,
    super.value,
    super.helpText,
    this.start,
    this.end,
    super.validations,
    super.tooltipText,
    super.readOnly,
    super.isRequired,
    super.innerLabel,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    // The field can already hold a date outside first..last, e.g. an onset
    // date picked before a later vaccination date was set. The picker opens
    // on that date and fails if it is outside the range, so widen the range
    // just enough to include it; the startDate/endDate validator flags it.
    DateTime? firstDate = parseDateValue(start);
    DateTime? lastDate = parseDateValue(end);
    final selectedDateTime = _currentDate(context);
    if (selectedDateTime != null) {
      final selectedDate = DateUtils.dateOnly(selectedDateTime);
      if (firstDate != null && selectedDate.isBefore(DateUtils.dateOnly(firstDate))) {
        firstDate = selectedDateTime;
      }
      if (lastDate != null && selectedDate.isAfter(DateUtils.dateOnly(lastDate))) {
        lastDate = selectedDateTime;
      }
    }

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) => LabeledField(
        infoText: translateIfPresent(tooltipText, loc),
        label: label,
        capitalizedFirstLetter: false,
        isRequired: isRequired ?? false,
        child: DigitDateFormInput(
          firstDate: firstDate,
          lastDate: lastDate,
          helpText: helpText,
          onChange: (value) {
            form.control(formControlName).markAsTouched();
            DateTime? parsedDate;
            try {
              final currentLocale = Localizations.localeOf(context).toString();
              parsedDate =
                  DateFormat("dd MMM yyyy", currentLocale).parseStrict(value);
            } catch (e) {
              // Optional: Handle invalid date input
              parsedDate = null;
            }
            form.control(formControlName).value = parsedDate;
          },
          readOnly: readOnly,
          errorMessage: field.errorText,
          innerLabel: innerLabel,
          initialDate: parseDateValue(start),
          initialValue: () {
            final rawValue = form.control(formControlName).value;

            if (rawValue == null) return null;

            DateTime? parsed;

            if (rawValue is DateTime) {
              parsed = rawValue;
            } else if (rawValue is String && rawValue.trim().isNotEmpty) {
              try {
                final currentLocale =
                    Localizations.localeOf(context).toString();
                parsed = DateFormat("dd MMM yyyy", currentLocale)
                    .parseStrict(rawValue);
              } catch (_) {
                parsed = null;
              }
            }

            return parsed != null
                ? formatDateLocalized(
                    context,
                    parsed,
                    Constants().dateMonthYearFormat,
                  )
                : null;
          }(),
        ),
      ),
    );
  }

  /// The field's current date: a DateTime from the picker, or a prefilled
  /// "dd MMM yyyy" string.
  DateTime? _currentDate(BuildContext context) {
    final rawValue = form.control(formControlName).value;
    if (rawValue is DateTime) return rawValue;
    if (rawValue is String && rawValue.trim().isNotEmpty) {
      try {
        final currentLocale = Localizations.localeOf(context).toString();
        return DateFormat("dd MMM yyyy", currentLocale).parseStrict(rawValue);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
