import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/walkthrough/walkthrough.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../fake_schema.dart';
import '../router/router.dart';

class FormsPage extends StatelessWidget {
  final String pageName;
  const FormsPage({super.key, @PathParam() required this.pageName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FormsBloc(fakeSchema)..add(const FormsLoadEvent()),
          ),
        ],
        child: BlocBuilder<FormsBloc, FormsState>(
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
              builder: (context, formGroup, child) => CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: TextButton(
                          onPressed: () {
                            FormWalkthrough.show(context, schema);
                          },
                          child: const Text('WALKTHROUGH_BTN'))),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (schema.label != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        schema.label!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                  JsonForms(propertySchema: schema),
                                ],
                              ),
                            ],
                          ),
                          ...[
                            const SizedBox(height: 16),
                            ReactiveFormConsumer(
                              builder: (context, formGroup, child) =>
                                  TextButton(
                                onPressed: !formGroup.valid
                                    ? null
                                    : () {
                                        final values = JsonForms.getFormValues(
                                          formGroup,
                                          schema,
                                        );

                                        final updatedPropertySchema =
                                            schema.copyWith(
                                          properties: Map.fromEntries(
                                            schema.properties?.entries.map(
                                                  (e) => values
                                                          .containsKey(e.key)
                                                      ? MapEntry(
                                                          e.key,
                                                          e.value.copyWith(
                                                            value:
                                                                values[e.key],
                                                          ),
                                                        )
                                                      : MapEntry(
                                                          e.key, e.value),
                                                ) ??
                                                [],
                                          ),
                                        );

                                        context.read<FormsBloc>().add(
                                              FormsUpdateEvent(
                                                schemaObject.copyWith(
                                                  pages: Map.fromEntries(
                                                    schemaObject.pages.entries
                                                        .map(
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

                                        if ((index) <
                                            schemaObject.pages.length - 1) {
                                          context.read<WalkthroughBloc>().add(
                                                const RequestWalkthroughResetEvent(),
                                              );
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
                            )
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
