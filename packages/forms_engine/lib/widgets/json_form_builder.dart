part of 'json_schema_builder.dart';

class JsonFormBuilder extends StatelessWidget {
  final String formControlName;
  final PropertySchema schema;
  final List<Map<String, Widget>>? components;

  const JsonFormBuilder({
    Key? key,
    required this.formControlName,
    required this.schema,
    this.components,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final type = schema.type;
    Widget child;

    final display = schema.displayBehavior;
    final form = ReactiveForm.of(context) as FormGroup;

    if (display != null) {
      final oneOf = display.oneOf;
      final allOf = display.allOf;

      final values = (oneOf ?? allOf!).map((e) {
        final value = form.control(e).value;
        if (value is bool?) return !(value ?? false);
        if (value is String?) {
          return value?.isNotEmpty ?? false;
        }
        return false;
      }).toList();

      bool result;

      if (oneOf != null && oneOf.isNotEmpty) {
        result = values.fold(
          true,
          (previousValue, element) => previousValue && element,
        );
      } else {
        result = values.fold(
          false,
          (previousValue, element) => previousValue || element,
        );
      }

      if (display.behavior == FormulaBehavior.hide && result) {
        return const Offstage();
      }
    }

    switch (type) {
     
      case PropertySchemaType.string:
          if (schema.format == PropertySchemaFormat.select) {
          child = Container(
            padding:const EdgeInsets.only( top: 8),
            child:LabeledField(
            label: schema.label ?? '',
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child:  JsonSchemaSelectionBuilder(
                form: form,
                formControlName: formControlName,
                hint: schema.hint,
                enums: schema.enums ??[],
              )),));

        }
        else if (schema.enums?.isNotEmpty ?? false) {
          child = Container(
            padding: const EdgeInsets.all(8),
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [ 
              LabeledField(
            label: schema.label ?? '',
            child:
            Container(
            width:  MediaQuery.of(context).size.width ,
            // padding: EdgeInsets.all( spacer6),
            decoration: BoxDecoration(
              color: DigitColors().light.paperSecondary,
              borderRadius: BorderRadius.circular(spacer1),
              border: Border.all(
                color: const DigitColors().light.genericBackground,
                width: 1,
              ),
            ),
            child:  
             JsonSchemaDropdownBuilder(
              form: form,
              formControlName: formControlName,
              value: schema.value as String?,
              enums: schema.enums!,
              hint: schema.hint,
            ),
          ),)]),);
          break;
        } else if (schema.format == PropertySchemaFormat.date) {
          child = Container(
            padding: const EdgeInsets.all(8),
            child:LabeledField(
            label: schema.label ?? '',
            child: JsonSchemaDatePickerBuilder(
              form: form,
              formControlName: formControlName,
              hint: schema.hint,
              value: schema.value,
              start: schema.firstDate?.dateValue,
              end: schema.lastDate?.dateValue,
            ),
          ));
          break;

        }
         else if (schema.format == PropertySchemaFormat.locality) {
          child = LabeledField(
              label: schema.label ?? '',
              child: JsonSchemaStringBuilder(
                form: form,
                formControlName: formControlName,
                hint: schema.hint,
                readOnly: true,
              ));

          
        } else if (schema.format == PropertySchemaFormat.custom) {
          child = Container();
          if (components != null && components!.isNotEmpty) {
            for (var component in components!) {
              // Check if the map contains the key that matches the formController
              if (component.containsKey(formControlName)) {
                child = component[formControlName]!;  // Return the widget associated with the key
                break;  // Exit the loop once the matching widget is found
              }
            }
          }
        } else if (schema.format == PropertySchemaFormat.latLng) {
          child = BlocConsumer<LocationBloc, LocationState>(
            listener: (_, state) {
              form.control(formControlName).value = state.latLngString;
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: LabeledField(
                  label: schema.label ?? '',
                  child: JsonSchemaStringBuilder(
                    form: form,
                    formControlName: formControlName,
                    hint: schema.hint,
                    readOnly: true,
                    suffix: Container(
                      padding: const EdgeInsets.only(right: 8),
                      height: 18,
                      child: state.loading
                          ? const AspectRatio(
                              aspectRatio: 1,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.my_location),
                    ),
                    onTap: state.loading
                        ? null
                        : () => context.read<LocationBloc>().add(
                              const LoadLocationEvent(),
                            ),
                  ),
                ),
              );
            },
          );
        } else {
          child = Container(
              padding: const EdgeInsets.all(8),
              child: LabeledField(
                label: schema.label ?? '',
                child: JsonSchemaStringBuilder(
                  form: form,
                  formControlName: formControlName,
                  value: schema.value as String?,
                  maxLength: schema.maxLength,
                  minLength: schema.minLength,
                  hint: schema.hint,
                ),
              ));
        }
        break;
      case PropertySchemaType.integer:
        child = Container(
            padding:const EdgeInsets.all(8),
            child: LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaIntegerBuilder(
            form: form,
            formControlName: formControlName,
            value: schema.value as int?,
            incrementer: schema.format == PropertySchemaFormat.incrementer,
            maximum: schema.maximum?.toInt(),
            minimum: schema.minimum?.toInt(),
            hint: schema.hint,
          ),
        ));
        break;
      case PropertySchemaType.numeric:
        child = LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaNumberBuilder(
            form: form,
            formControlName: formControlName,
            value: schema.value as num?,
            maximum: schema.maximum,
            minimum: schema.minimum,
            hint: schema.hint,
          ),
        );
        break;
      case PropertySchemaType.boolean:
        child = Container(
            padding:const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: JsonSchemaBooleanBuilder(
          form: form,
          formControlName: formControlName,
          value: schema.value as bool?,
          hint: schema.label,
        ));
        break;
      case PropertySchemaType.object:
        child = Column(
          children: schema.properties?.entries.map<Widget>((e) {
                final subSchema = e.value;
                final subName = e.key;

                return JsonFormBuilder(
                  formControlName: subName,
                  schema: subSchema,
                  components: components,
                );
              }).toList() ??
              [const Text('No schema')],
        );
    }
    return child;
  }
}
