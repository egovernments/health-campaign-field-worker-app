part of 'json_schema_builder.dart';

class JsonSchemaImageBuilder extends StatefulWidget {
  final FormGroup form;
  final String formControlName;
  final String? label;
  final bool isRequired;
  final String? helpText;
  final String? tooltipText;
  final List<ValidationRule>? validations;

  const JsonSchemaImageBuilder({
    super.key,
    required this.form,
    required this.formControlName,
    this.label,
    this.isRequired = false,
    this.helpText,
    this.tooltipText,
    this.validations,
  });

  @override
  State<JsonSchemaImageBuilder> createState() => _JsonSchemaImageBuilderState();
}

class _JsonSchemaImageBuilderState extends State<JsonSchemaImageBuilder> {
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final currentValue = widget.form.control(widget.formControlName).value;
    if (currentValue is String && currentValue.isNotEmpty) {
      _imagePath = currentValue;
    }
  }

  Future<void> _captureImage() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 1024,
    );

    if (photo != null) {
      setState(() {
        _imagePath = photo.path;
      });
      widget.form.control(widget.formControlName).value = photo.path;
      widget.form.control(widget.formControlName).markAsTouched();
    }
  }

  void _removeImage() {
    setState(() {
      _imagePath = null;
    });
    widget.form.control(widget.formControlName).value = null;
    widget.form.control(widget.formControlName).markAsTouched();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveWrapperField<String>(
      formControlName: widget.formControlName,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        return LabeledField(
          isRequired: widget.isRequired,
          label: widget.label,
          infoText: widget.tooltipText,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_imagePath != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: [
                      Image.file(
                        File(_imagePath!),
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: _removeImage,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _captureImage,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Retake Photo'),
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _captureImage,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Capture Photo'),
                  ),
                ),
              ],
              if (widget.helpText != null && widget.helpText!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    widget.helpText!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              if (field.errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    field.errorText!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
