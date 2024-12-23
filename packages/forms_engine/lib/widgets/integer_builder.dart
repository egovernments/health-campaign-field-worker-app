part of 'json_schema_builder.dart';

class JsonSchemaIntegerBuilder extends JsonSchemaBuilder<int> {
  final int? minimum;
  final int? maximum;
  final bool incrementer;

  const JsonSchemaIntegerBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    super.hint,
    this.incrementer = false,
    this.minimum,
    this.maximum,
  });

  @override
  Widget build(BuildContext context) {
    if (!incrementer) {
      return ReactiveTextField(
        formControlName: formControlName,
        decoration: InputDecoration(labelText: hint),
        keyboardType: TextInputType.number,
      );
    }

    return IntrinsicHeight(
      child: Row(
        children: [
          _buildButton(
            context,
            border: Border(
              left: _borderSide,
              bottom: _borderSide,
              top: _borderSide,
            ),
            icon: Icons.remove,
            onPressed: () => form.control(formControlName).value -= 1,
          ),
          Expanded(
            child: ReactiveTextField(
              readOnly: true,
              textAlign: TextAlign.center,
              formControlName: formControlName,
              decoration: InputDecoration(labelText: hint),
              keyboardType: TextInputType.number,
            ),
          ),
          _buildButton(
            context,
            border: Border(
              right: _borderSide,
              bottom: _borderSide,
              top: _borderSide,
            ),
            icon: Icons.add,
            onPressed: () => form.control(formControlName).value += 1,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required Border border,
    required IconData icon,
    VoidCallback? onPressed,
  }) =>
      AspectRatio(
        aspectRatio: 1,
        child: Material(
          shape: border,
          color: Theme.of(context).colorScheme.surface,
          child: InkWell(onTap: onPressed, child: Icon(icon)),
        ),
      );

  BorderSide get _borderSide => const BorderSide(width: 1);
}
