part of 'json_schema_builder.dart';

class JsonSchemaStringBuilder extends JsonSchemaBuilder<String> {
  final int? minLength;
  final int? maxLength;
  final List<String>? enums;
  final String? format;
  
  final Widget? suffix;

  const JsonSchemaStringBuilder({
    required super.formControlName,
    required super.form,
    super.readOnly,
    super.onTap,
    super.key,
    super.value,
    super.hint,
    this.suffix,
    this.enums,
    this.format,
    this.minLength,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return  ReactiveTextField(
      readOnly: readOnly,
      formControlName: formControlName,
        validationMessages: {
          ValidationMessage.pattern:(error) => 'Pattron Mismatch',
          ValidationMessage.minLength:(controler)=> 'Min...Length'
        } , 
      decoration: InputDecoration(

        labelText: hint,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 48,
          maxWidth: 48,
        ),
        suffixIcon: suffix == null
            ? null
            : InkWell(
                onTap: onTap,
                child: suffix,
              ),
      ),
    );
  }
}
