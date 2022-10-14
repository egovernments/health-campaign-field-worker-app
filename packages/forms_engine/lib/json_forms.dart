library json_forms;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/widgets/labeled_field.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/models/schema_object/schema_object.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'models/property_schema/property_schema.dart';

typedef ActionItemSchemaCallback<T> = FutureOr<T> Function(
  BuildContext context,
  ActionItemSchema schema,
);

class JsonForms extends StatelessWidget {
  final PropertySchema propertySchema;

  const JsonForms({super.key, required this.propertySchema});

  static Map<String, FormControl> getFormControls(
    PropertySchema propertySchema,
  ) {
    assert(propertySchema.properties != null);
    final controls = Map.fromEntries(
      propertySchema.properties!.entries
          .map((e) => _getControls(e.key, e.value, propertySchema))
          .expand((element) => element),
    );
    return controls;
  }

  static Map<String, dynamic> getFormValues(
    FormGroup form,
    PropertySchema schema,
  ) {
    final values = schema.properties!.entries
        .map((e) => _getParsedValues(form, e.key, e.value))
        .toList();

    return Map.fromEntries(values.whereType<MapEntry<String, dynamic>>());
  }

  static List<MapEntry<String, FormControl>> _getControls(
    String name,
    PropertySchema schema,
    PropertySchema parentSchema,
  ) {
    final List<MapEntry<String, FormControl>> entries = [];
    final type = schema.type;

    final requiredValidators = [
      if ((parentSchema.required ?? []).contains(name)) Validators.required,
      if (schema.maxLength != null) Validators.maxLength(schema.maxLength!),
      if (schema.minLength != null) Validators.minLength(schema.minLength!),
    ];

    if (type == PropertySchemaType.object) {
      final properties = schema.properties;
      assert(properties != null);
      final result = properties!.entries
          .map((e) => _getControls(e.key, e.value, parentSchema))
          .expand((element) => element)
          .toList();

      entries.addAll(result);
    } else {
      late FormControl control;
      switch (type) {
        case PropertySchemaType.integer:
          control = FormControl<int>(
            value: schema.value,
            validators: requiredValidators,
          );
          break;
        case PropertySchemaType.numeric:
          control = FormControl<num>(
            value: schema.value,
            validators: requiredValidators,
          );
          break;
        case PropertySchemaType.boolean:
          control = FormControl<bool>(
            value: schema.value,
            validators: requiredValidators,
          );
          break;
        default:
          if (schema.format == PropertySchemaFormat.date) {
            control = FormControl<String>(
              value: schema.value,
              validators: requiredValidators,
            );
          } else {
            control = FormControl<String>(
              value: schema.value,
              validators: requiredValidators,
            );
          }
          break;
      }
      entries.add(MapEntry(name, control));
    }

    return entries;
  }

  static MapEntry<String, dynamic>? _getParsedValues(
    FormGroup form,
    String name,
    PropertySchema schema,
  ) {
    if (schema.type == PropertySchemaType.object) {
      final results = schema.properties!.entries.map((e) {
        return _getParsedValues(form, e.key, e.value);
      });
      return MapEntry(
        name,
        Map.fromEntries(results.whereType<MapEntry<String, dynamic>>()),
      );
    } else {
      final value = form.control(name).value;
      if (value == null) return null;
      return MapEntry(name, value);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            JsonFormBuilder(schema: propertySchema, name: '/'),
          ],
        ),
      );
}

class JsonActionBuilder extends StatelessWidget {
  final ActionSchema schema;
  final StackRouter router;

  const JsonActionBuilder({
    super.key,
    required this.schema,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    action() async {
      final entryMap = <ActionItemSchema, ActionItemSchemaCallback>{};

      entryMap.addEntries(
        schema.actionItems.map((e) {
          switch (e.type) {
            case ActionType.api:
              throw UnimplementedError();
            case ActionType.reset:
              return MapEntry(e, reset);
            case ActionType.navigate:
              return MapEntry(e, navigate);
          }
        }).whereType<MapEntry<ActionItemSchema, ActionItemSchemaCallback>>(),
      );

      await Future.wait(entryMap.entries.map((e) async => e.value(
            context,
            e.key,
          )));
    }

    final child = Center(child: Text(schema.buttonName));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (_) {
          switch (schema.buttonType) {
            case ButtonType.outlined:
              return OutlinedButton(onPressed: action, child: child);
            case ButtonType.text:
              return TextButton(onPressed: action, child: child);
            case ButtonType.elevated:
              return ElevatedButton(onPressed: action, child: child);
          }
        },
      ),
    );
  }

  FutureOr<void> reset(BuildContext context, ActionItemSchema schema) {
    final form = ReactiveForm.of(context);
    assert(form is FormGroup);
    final formGroup = form as FormGroup;
    formGroup.reset();
  }

  FutureOr<void> navigate(BuildContext context, ActionItemSchema schema) {
    final destination = schema.routingSchema?.destination;
    assert(destination != null && destination.isNotEmpty);

    router.pushNamed(destination!);
  }
}

class JsonFormBuilder extends StatelessWidget {
  final String name;
  final PropertySchema schema;

  const JsonFormBuilder({
    Key? key,
    required this.name,
    required this.schema,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final type = schema.type;
    Widget? child;

    final display = schema.displayBehavior;
    final form = ReactiveForm.of(context);

    if (display != null && form != null && form is FormGroup) {
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
        if (schema.enums?.isNotEmpty ?? false) {
          child = LabeledField(
            label: schema.label ?? '',
            child: JsonSchemaDropdownBuilder(
              name: name,
              value: schema.value as String?,
              enums: schema.enums!,
              hint: schema.hint,
            ),
          );
          break;
        } else if (schema.format == PropertySchemaFormat.date) {
          child = LabeledField(
            label: schema.label ?? '',
            child: JsonSchemaDatePickerBuilder(
              name: name,
              hint: schema.hint,
              value: schema.value,
              start: schema.firstDate?.dateValue,
              end: schema.lastDate?.dateValue,
            ),
          );
          break;
        }
        child = LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaStringBuilder(
            name: name,
            value: schema.value as String?,
            maxLength: schema.maxLength,
            minLength: schema.minLength,
            hint: schema.hint,
          ),
        );
        break;
      case PropertySchemaType.integer:
        child = LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaIntegerBuilder(
            name: name,
            value: schema.value as int?,
            maximum: schema.maximum?.toInt(),
            minimum: schema.minimum?.toInt(),
            hint: schema.hint,
          ),
        );
        break;
      case PropertySchemaType.numeric:
        child = LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaNumberBuilder(
            name: name,
            value: schema.value as num?,
            maximum: schema.maximum,
            minimum: schema.minimum,
            hint: schema.hint,
          ),
        );
        break;
      case PropertySchemaType.boolean:
        child = LabeledField(
          label: schema.label ?? '',
          child: JsonSchemaBooleanBuilder(
            name: name,
            value: schema.value as bool?,
            hint: schema.hint,
          ),
        );
        break;
      case PropertySchemaType.object:
        child = Column(
          children: schema.properties?.entries.map<Widget>((e) {
                final subSchema = e.value;
                final subName = e.key;

                return JsonFormBuilder(
                  name: subName,
                  schema: subSchema,
                );
              }).toList() ??
              [const Text('No schema')],
        );
    }
    return child;
  }
}

class JsonSchemaStringBuilder extends JsonSchemaBuilder<String> {
  final int? minLength;
  final int? maxLength;
  final List<String>? enums;
  final String? format;

  const JsonSchemaStringBuilder({
    required super.name,
    super.key,
    super.value,
    super.hint,
    this.enums,
    this.format,
    this.minLength,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: name,
      decoration: InputDecoration(labelText: hint),
    );
  }
}

class JsonSchemaDropdownBuilder extends JsonSchemaBuilder<String> {
  final List<String> enums;

  const JsonSchemaDropdownBuilder({
    required super.name,
    required this.enums,
    super.key,
    super.value,
    super.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hint != null)
          Text(
            hint!,
            style: Theme.of(context).textTheme.caption,
          ),
        ReactiveDropdownField(
          formControlName: name,
          items: enums
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class JsonSchemaDatePickerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final DateTime? end;

  const JsonSchemaDatePickerBuilder({
    required super.name,
    super.key,
    super.value,
    super.hint,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context) => ReactiveDatePicker(
        formControlName: name,
        firstDate: start ?? DateTime(1900),
        lastDate: end ?? DateTime.now(),
        builder: (context, picker, child) {
          return ReactiveTextField<String>(
            formControlName: name,
            readOnly: true,
            decoration: InputDecoration(
              label: hint == null ? null : Text(hint!),
            ),
            onTap: (control) {
              picker.showPicker();
            },
          );
        },
      );
}

class JsonSchemaNumberBuilder extends JsonSchemaBuilder<num> {
  final num? minimum;
  final num? maximum;

  const JsonSchemaNumberBuilder({
    required super.name,
    super.key,
    super.value,
    super.hint,
    this.maximum,
    this.minimum,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: name,
      decoration: InputDecoration(labelText: hint),
      keyboardType: TextInputType.number,
    );
  }
}

class JsonSchemaIntegerBuilder extends JsonSchemaBuilder<int> {
  final int? minimum;
  final int? maximum;

  const JsonSchemaIntegerBuilder({
    required super.name,
    super.key,
    super.value,
    super.hint,
    this.minimum,
    this.maximum,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: name,
      decoration: InputDecoration(labelText: hint),
      keyboardType: TextInputType.number,
    );
  }
}

class JsonSchemaBooleanBuilder extends JsonSchemaBuilder<bool> {
  const JsonSchemaBooleanBuilder({
    required super.name,
    super.key,
    super.value,
    super.hint,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveSwitchListTile.adaptative(
      formControlName: name,
      title: hint == null ? null : Text(hint!),
    );
  }
}

abstract class JsonSchemaBuilder<T> extends StatelessWidget {
  final String name;
  final String? hint;
  final T? value;

  const JsonSchemaBuilder({
    Key? key,
    required this.name,
    this.hint,
    this.value,
  }) : super(key: key);
}
