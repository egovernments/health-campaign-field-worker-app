import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/models/property_schema/property_schema.dart';
import 'package:forms_engine/router/forms_router.gm.dart';
import 'package:forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:forms_engine/json_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/utils/utils.dart';
import '../../widgets/localized.dart';
import '../utils/utils.dart';

@RoutePage()
class FormsRenderPage extends LocalizedStatefulWidget {
  final String pageName;
  final Map<String, dynamic>? defaultValues;

  const FormsRenderPage({
    super.key,
    super.appLocalizations,
    @PathParam() required this.pageName,
    this.defaultValues,
  });

  @override
  State<FormsRenderPage> createState() => _FormsRenderPageState();
}

class _FormsRenderPageState extends LocalizedState<FormsRenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          final schemaObject = state.schema;
          if (schemaObject == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final schema = schemaObject.pages[widget.pageName];

          if (schema == null) {
            return const Center(child: Text('Form not found'));
          }

          final index =
              schemaObject.pages.keys.toList().indexOf(widget.pageName);
          final showcaseKeys = <GlobalKey>[];

          return ReactiveFormBuilder(
            form: () => fb.group(
              JsonForms.getFormControls(
                schema,
                defaultValues: widget.defaultValues ?? {},
                count: widget.defaultValues?['count'] ?? 0,
              ),
            ),
            builder: (context, formGroup, child) => ScrollableContent(
              enableFixedDigitButton: true,
              header: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(spacer2),
                    child: BackNavigationHelpHeaderWidget(
                      showBackNavigation: true,
                    ),
                  ),
                  SizedBox.shrink()
                ],
              ),
              footer: DigitCard(
                margin: const EdgeInsets.only(top: spacer2),
                children: [
                  ReactiveFormConsumer(
                    builder: (context, formGroup, child) => DigitButton(
                      label: (index) < schemaObject.pages.length - 1
                          ? localizations
                              .translate(schema.actionLabel ?? 'Next')
                          : localizations
                              .translate(schema.actionLabel ?? 'Submit'),
                      onPressed: () {
                        // 1. Get visible keys only (skip hidden fields)
                        final currentKeys = <String>[];
                        final properties = schema.properties ?? {};
                        final count =
                            widget.defaultValues?['count'] as int? ?? 0;

                        properties.forEach((key, value) {
                          if (key == 'resourceCard' && !isHidden(value)) {
                            for (int i = 0; i < count; i++) {
                              currentKeys.add('resourceCard_$i');
                              currentKeys.add('quantityDistributed_$i');
                            }
                          } else if (!isHidden(value)) {
                            currentKeys.add(key);
                          }
                        });

// 2. Mark all visible controls as touched and revalidate
                        for (final key in currentKeys) {
                          final control = formGroup.control(key);
                          control.markAsTouched();
                          // control.updateValueAndValidity();
                        }

                        final hasErrors = currentKeys.any((key) {
                          final control = formGroup.control(key);
                          return control.errors.isNotEmpty;
                        });

                        if (hasErrors) return;

// 3. Check validity of just the visible controls
                        final isCurrentPageValid = currentKeys
                            .every((key) => formGroup.control(key).valid);

                        if (!isCurrentPageValid) return;

                        // 4. Proceed with value extraction and state update
                        final values = JsonForms.getFormValues(
                            formGroup,
                            // schema,
                            properties?.containsKey("resourceCard") == false
                                ? schema
                                // old
                                // : cloneAndReplaceResourceCard(
                                //     baseSchema: schema,
                                //     cloneFromKey: "resourceCard",
                                //     newPropertyKeys: List.generate(
                                //         widget.defaultValues?['count'] ?? 0,
                                //         (i) => 'resourceCard_$i').toList()),

                                : cloneAndReplaceResourceCard(
                                    baseSchema: schema,
                                    cloneFromKey: 'resourceCard',
                                    count: widget.defaultValues?['count'] ?? 0,
                                  ));

                        // Use transformed schema only if resourceCard exists
                        final transformedSchema =
                            properties?.containsKey("resourceCard") == false
                                ? schema
                                : cloneAndReplaceResourceCard(
                                    baseSchema: schema,
                                    cloneFromKey: 'resourceCard',
                                    count: widget.defaultValues?['count'] ?? 0,
                                  );

                        final updatedPropertySchema =
                            transformedSchema.copyWith(
                          properties: Map.fromEntries(
                            transformedSchema.properties?.entries.map(
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
                                        entry.key == widget.pageName
                                            ? updatedPropertySchema
                                            : entry.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );

                        final updatedSchemaObject = schemaObject.copyWith(
                          pages: Map.fromEntries(
                            schemaObject.pages.entries.map(
                              (entry) => MapEntry(
                                entry.key,
                                entry.key == widget.pageName
                                    ? updatedPropertySchema
                                    : entry.value,
                              ),
                            ),
                          ),
                        );

                        context.read<FormsBloc>().add(
                              FormsUpdateEvent(updatedSchemaObject),
                            );

                        if ((index) < schemaObject.pages.length - 1) {
                          context.router.push(FormsRenderRoute(
                            pageName: schemaObject.pages.entries
                                .elementAt(index + 1)
                                .key,
                            defaultValues: widget.defaultValues,
                          ));
                        } else {
                          context.read<FormsBloc>().add(
                                FormsSubmitEvent(updatedSchemaObject),
                              );

                          context.router.popUntil((route) {
                            return route.settings.name != FormsRenderRoute.name;
                          });
                        }
                      },
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                    ),
                  ),
                ],
              ),
              children: [
                DigitCard(
                  margin: const EdgeInsets.symmetric(horizontal: spacer2),
                  children: [
                    if (schema.label != null) ...[
                      Text(
                        localizations.translate(schema.label!),
                        style: Theme.of(context)
                            .digitTextTheme(context)
                            .headingXl
                            .copyWith(
                                color: Theme.of(context)
                                    .colorTheme
                                    .primary
                                    .primary2),
                      ),
                      if (schema.description != null) ...[
                        Text(
                          localizations.translate(schema.description!),
                          style: Theme.of(context)
                              .digitTextTheme(context)
                              .bodyS
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorTheme
                                      .text
                                      .secondary),
                        ),
                      ],
                    ],
                    JsonForms(
                      propertySchema:
                          schema.properties?.containsKey("resourceCard") ==
                                  false
                              ? schema
                              // old
                              // : cloneAndReplaceResourceCard(
                              //     baseSchema: schema,
                              //     cloneFromKey: "resourceCard",
                              //     newPropertyKeys: List.generate(
                              //         widget.defaultValues?['count'] ?? 0,
                              //         (i) => 'resourceCard_$i').toList()),

                              : cloneAndReplaceResourceCard(
                                  baseSchema: schema,
                                  cloneFromKey: 'resourceCard',
                                  count: widget.defaultValues?['count'] ?? 0,
                                ),
                      childrens: const [
                        {
                          "resourceCard": Text("Hello"),
                        }
                      ],
                      defaultValues: const {
                        // 'locality': context.boundary.code,
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: spacer2,
                ),
                Center(
                  child: Text(
                    'version ${schemaObject.version}',
                    style: Theme.of(context)
                        .digitTextTheme(context)
                        .bodyXS
                        .copyWith(
                            color: Theme.of(context).colorTheme.text.disabled),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // PropertySchema cloneAndReplaceResourceCard({
  //   required PropertySchema baseSchema,
  //   required List<String> newPropertyKeys,
  //   required String cloneFromKey, // e.g. 'resourceCard'
  // }) {
  //   // Clone the original properties
  //   final Map<String, PropertySchema> newProperties =
  //       Map.from(baseSchema.properties ?? {});

  //   // Get the property to clone
  //   final baseProperty = newProperties[cloneFromKey];
  //   if (baseProperty == null) {
  //     throw Exception('Base property "$cloneFromKey" not found in schema.');
  //   }

  //   // Remove the original property
  //   newProperties.remove(cloneFromKey);

  //   // Add new cloned fields
  //   for (final key in newPropertyKeys) {
  //     newProperties[key] = baseProperty.copyWith();
  //   }

  //   // Return a new schema with updated properties
  //   return baseSchema.copyWith(properties: newProperties);
  // }

// working code
  // PropertySchema cloneAndReplaceResourceCard({
  //   required PropertySchema baseSchema,
  //   required List<String> newPropertyKeys,
  //   required String cloneFromKey,
  // }) {
  //   final originalProps = baseSchema.properties ?? {};

  //   final newOrderedProps = <String, PropertySchema>{};

  //   // To track where 'resourceCard' appeared in the order
  //   int insertIndex = 0;
  //   bool foundResourceCard = false;

  //   final keys = originalProps.keys.toList();

  //   for (var i = 0; i < keys.length; i++) {
  //     final key = keys[i];

  //     if (key == cloneFromKey) {
  //       insertIndex = newOrderedProps.length;
  //       foundResourceCard = true;
  //       continue; // Skip adding 'resourceCard'
  //     }

  //     newOrderedProps[key] = originalProps[key]!;
  //   }

  //   if (!foundResourceCard) {
  //     throw Exception('Base property "$cloneFromKey" not found in schema.');
  //   }

  //   // Define a new default property for cloning
  //   const defaultSelectProperty = PropertySchema(
  //     type: PropertySchemaType.productVariant,
  //     format: PropertySchemaFormat.select,
  //     enums: [],
  //     label: null,
  //     isMultiSelect: false,
  //     validations: [],
  //     readOnly: false,
  //     hidden: false,
  //     displayOnly: false,
  //   );

  //   // Insert new keys at the original resourceCard position
  //   final entriesBefore = newOrderedProps.entries.take(insertIndex);
  //   final entriesAfter = newOrderedProps.entries.skip(insertIndex);

  //   final Map<String, PropertySchema> orderedWithClones = {
  //     for (final e in entriesBefore) e.key: e.value,
  //     for (final key in newPropertyKeys) key: defaultSelectProperty,
  //     for (final e in entriesAfter) e.key: e.value,
  //   };

  //   return baseSchema.copyWith(properties: orderedWithClones);
  // }

  // end

  PropertySchema cloneAndReplaceResourceCard({
    required PropertySchema baseSchema,
    required int count,
    required String cloneFromKey,
  }) {
    final originalProps = baseSchema.properties ?? {};
    final newOrderedProps = <String, PropertySchema>{};

    int insertIndex = 0;
    bool foundResourceCard = false;

    final keys = originalProps.keys.toList();

    for (int i = 0; i < keys.length; i++) {
      final key = keys[i];

      if (key == cloneFromKey) {
        insertIndex = newOrderedProps.length;
        foundResourceCard = true;
        continue;
      }

      newOrderedProps[key] = originalProps[key]!;
    }

    if (!foundResourceCard) {
      throw Exception('Base property "$cloneFromKey" not found in schema.');
    }

    const defaultResourceProperty = PropertySchema(
      type: PropertySchemaType.productVariant,
      format: PropertySchemaFormat.select,
      enums: [],
      label: null,
      isMultiSelect: false,
      validations: [],
      readOnly: false,
      hidden: false,
      displayOnly: false,
    );

    const defaultQuantityProperty = PropertySchema(
      type: PropertySchemaType.integer,
      format: PropertySchemaFormat.numeric,
      label: null,
      validations: [],
      readOnly: false,
      hidden: false,
      displayOnly: false,
    );

    // Build the cloned pairs: resourceCard_i and quantityDistributed_i
    final Map<String, PropertySchema> clonedPairs = {
      for (int i = 0; i < count; i++) ...{
        'resourceCard_$i': defaultResourceProperty,
        'quantityDistributed_$i': defaultQuantityProperty,
      }
    };

    final entriesBefore = newOrderedProps.entries.take(insertIndex);
    final entriesAfter = newOrderedProps.entries.skip(insertIndex);

    final Map<String, PropertySchema> finalProps = {
      for (final e in entriesBefore) e.key: e.value,
      ...clonedPairs,
      for (final e in entriesAfter) e.key: e.value,
    };

    return baseSchema.copyWith(properties: finalProps);
  }
}
