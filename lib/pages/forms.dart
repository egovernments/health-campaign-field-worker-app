import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:health_campaigns_flutter/router/app_router.dart';
import 'package:health_campaigns_flutter/widgets/header/back_navigation_help_header.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormsPage extends StatelessWidget {
  final String pageName;

  const FormsPage({super.key, @PathParam() required this.pageName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          final schemaObject = state.schema;
          if (schemaObject == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final schema = schemaObject.pages[pageName];

          if (schema == null) {
            return const Center(child: Text('Form not found'));
          }

          final index = schemaObject.pages.keys.toList().indexOf(pageName);

          return ReactiveFormBuilder(
            form: () => fb.group(
              JsonForms.getFormControls(schema),
            ),
            builder: (context, formGroup, child) => ScrollableContent(
              header: BackNavigationHelpHeaderWidget(
                onPressed: () => DigitCardWalkthrough.show(context),
              ),
              footer: DigitCard(
                margin: EdgeInsets.zero,
                child: ReactiveFormConsumer(
                  builder: (context, formGroup, child) => DigitElevatedButton(
                    onPressed: !formGroup.valid
                        ? null
                        : () {
                            final values = JsonForms.getFormValues(
                              formGroup,
                              schema,
                            );
                            final updatedPropertySchema = schema.copyWith(
                              properties: Map.fromEntries(
                                schema.properties?.entries.map(
                                      (e) => values.containsKey(e.key)
                                          ? MapEntry(
                                              e.key,
                                              e.value.copyWith(
                                                value: values[e.key],
                                              ),
                                            )
                                          : MapEntry(e.key, e.value),
                                    ) ??
                                    [],
                              ),
                            );

                            context.read<FormsBloc>().add(
                                  FormsUpdateEvent(
                                    schemaObject.copyWith(
                                      pages: Map.fromEntries(
                                        schemaObject.pages.entries.map(
                                          (entry) => MapEntry(
                                            entry.key,
                                            entry.key == pageName
                                                ? updatedPropertySchema
                                                : entry.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                            if ((index) < schemaObject.pages.length - 1) {
                              context.router.push(FormsRoute(
                                pageName: schemaObject.pages.entries
                                    .elementAt(index + 1)
                                    .key,
                              ));
                            } else {
                              context.read<FormsBloc>().add(
                                    const FormsCreateMappingEvent(),
                                  );
                            }
                          },
                    child: Text(
                      (index) < schemaObject.pages.length - 1
                          ? 'Next'
                          : 'Submit',
                    ),
                  ),
                ),
              ),
              children: [
                DigitCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (schema.label != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            schema.label!,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      JsonForms(propertySchema: schema),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
