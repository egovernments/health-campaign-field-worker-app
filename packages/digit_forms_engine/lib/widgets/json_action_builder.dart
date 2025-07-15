import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef ActionItemSchemaCallback<T> = FutureOr<T> Function(
  BuildContext context,
  ActionItemSchema schema,
);

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
