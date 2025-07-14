part of 'json_schema_builder.dart';

class JsonSchemaScannerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final DateTime? end;

  const JsonSchemaScannerBuilder({
    required super.formControlName,
    required super.form,
    super.label,
    super.key,
    super.value,
    super.helpText,
    this.start,
    this.end,
    super.validations,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);
    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) =>
          BlocConsumer<DigitScannerBloc, DigitScannerState>(
              listener: (context, state) {
                if(state.qrCodes.isNotEmpty) {
                  form.control(formControlName).value = state.qrCodes.first;
                }
              },
              builder: (context, state) {

                return state.qrCodes.isNotEmpty ?
                Container(
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width  ,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width* .78,
                        child: LabelValueSummary(
                          padding: EdgeInsets.zero,
                          withDivider: false,
                          items: [
                            LabelValueItem(
                              label: label ?? 'Voucher code',
                              value: state.qrCodes.first,
                              labelFlex: 5,
                              maxLines: 5,
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                      DigitButton(label: '', onPressed: (){
                        context.router.push(DigitScannerRoute(
                          quantity: 1,
                          isGS1code: false,
                          singleValue: true,
                        ));
                      }, type: DigitButtonType.tertiary, size: DigitButtonSize.medium, prefixIcon: Icons.edit,)
                    ],
                  ),
                )
                    : DigitButton(
                  capitalizeLetters: false,
                  size: DigitButtonSize.large,
                  label: label ?? 'scanner',
                  onPressed: () async {
                    context.read<DigitScannerBloc>().add(
                      const DigitScannerEvent.handleScanner(),
                    );
                    context.router.push(DigitScannerRoute(
                      quantity: 1,
                      isGS1code: false,
                      singleValue: true,
                    ));
                  },
                  type: DigitButtonType.secondary,
                  prefixIcon: Icons.qr_code,
                  mainAxisSize: MainAxisSize.max,
                );
              }
          ),
    );
  }
}
