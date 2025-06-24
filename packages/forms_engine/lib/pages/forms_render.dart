import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/router/forms_router.gm.dart';
import 'package:forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:forms_engine/json_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/localized.dart';
import '../models/property_schema/property_schema.dart';
import '../models/schema_object/schema_object.dart';
import '../utils/utils.dart';

@RoutePage()
class FormsRenderPage extends LocalizedStatefulWidget {
  final String pageName;
  final Map<String, dynamic>? defaultValues;
  final String currentSchemaKey;
  final List<Map<String, Widget>>? customComponents;
  final bool isSummary;

  const FormsRenderPage({
    super.key,
    super.appLocalizations,
    @QueryParam() this.currentSchemaKey ='',
    @PathParam() required this.pageName,
    this.customComponents,
    this.defaultValues,
    @QueryParam() this.isSummary = false,
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
          final schemaObject = state.cachedSchemas[widget.currentSchemaKey];
          if (schemaObject == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (widget.isSummary) {
            return _buildSummaryPage(context, schemaObject);
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
                        final currentKeys = schema.properties?.entries
                                .where((entry) {
                                  final isVisible = !isHidden(entry.value);
                                  final includeInForm =
                                      entry.value.includeInForm == true;
                                  return isVisible || includeInForm;
                                })
                                .map((entry) => entry.key)
                                .toList() ??
                            [];

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
                                schemaKey: widget.currentSchemaKey,
                                schema: schemaObject.copyWith(
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

                        if ((index) < schemaObject.pages.length - 1) {
                          context.router.push(FormsRenderRoute(
                            customComponents: widget.customComponents,
                            currentSchemaKey: widget.currentSchemaKey,
                            pageName: schemaObject.pages.entries
                                .elementAt(index + 1)
                                .key,
                            defaultValues: widget.defaultValues,
                          ));
                        } else {
                          if (schemaObject.summary) {
                            context.router.push(FormsRenderRoute(
                              customComponents: widget.customComponents,
                              currentSchemaKey: widget.currentSchemaKey,
                              pageName: '',
                              isSummary: true,
                              defaultValues: widget.defaultValues,
                            ));
                          } else {
                            context
                                .read<FormsBloc>()
                                .add(FormsSubmitEvent(schemaKey: widget.currentSchemaKey));

                            // Pop all form pages (FormsRenderRoute)
                            context.router.popUntil((route) {
                              return route.settings.name !=
                                  FormsRenderRoute.name;
                            });
                          }
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
                      propertySchema: schema,
                      childrens: widget.customComponents,
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

  Widget _buildSummaryPage(BuildContext context, SchemaObject schemaObject) {
    return ScrollableContent(
        enableFixedDigitButton: true,
        header: const Padding(
          padding: EdgeInsets.all(spacer2),
          child: BackNavigationHelpHeaderWidget(showBackNavigation: true),
        ),
        footer: DigitCard(
          margin: const EdgeInsets.only(top: spacer2),
          children: [
            DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: localizations.translate('CORE_COMMON_SUBMIT'),
              onPressed: () {
                context.read<FormsBloc>().add(FormsSubmitEvent(schemaKey: widget.currentSchemaKey));

                // Pop all form pages (FormsRenderRoute)
                context.router.popUntil((route) {
                  return route.settings.name != FormsRenderRoute.name;
                });
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
            ),
          ],
        ),
        children: [
          for (final entry in schemaObject.pages.entries)
            DigitCard(
              margin: const EdgeInsets.all(spacer2),
              children: [
                LabelValueSummary(
                  padding: EdgeInsets.zero,
                  heading:
                      localizations.translate(entry.value.label ?? entry.key),
                  headingStyle: Theme.of(context)
                      .digitTextTheme(context)
                      .headingL
                      .copyWith(
                        color: Theme.of(context).colorTheme.primary.primary2,
                      ),
                  items: _renderSummaryLabelValueItems(entry.value),
                ),
              ],
            ),
          const SizedBox(height: spacer2),
          Center(
            child: Text(
              'version ${schemaObject.version}',
              style: Theme.of(context).digitTextTheme(context).bodyXS.copyWith(
                    color: Theme.of(context).colorTheme.text.disabled,
                  ),
            ),
          ),
        ]);
  }

  List<LabelValueItem> _renderSummaryLabelValueItems(PropertySchema schema) {
    final properties = schema.properties ?? {};
    final dateFormatter = DateFormat('dd MMM yyyy');

    return properties.entries
        .where((entry) => entry.value.includeInSummary != false)
        .map((entry) {
      final label = localizations.translate(entry.value.label ?? entry.key);
      final rawValue = entry.value.value;

      String displayValue;

      if (rawValue is List) {
        displayValue = rawValue
            .map((e) => localizations.translate(e.toString()))
            .join(', ');
      } else if (rawValue is String && isDotSeparatedKey(rawValue)) {
        displayValue = rawValue
            .split('.')
            .map((e) => localizations.translate(e.trim()))
            .join(', ');
      } else if (rawValue is DateTime) {
        displayValue = dateFormatter.format(rawValue);
      } else if (rawValue is String && isDateTime(rawValue)) {
        displayValue = dateFormatter.format(DateTime.parse(rawValue));
      } else if (rawValue is String && isDateLike(rawValue)) {
        try {
          final parsed = parseDate(rawValue);
          displayValue = dateFormatter.format(parsed);
        } catch (_) {
          displayValue = localizations.translate(rawValue);
        }
      } else if (rawValue == null ||
          (rawValue is String && rawValue.trim().isEmpty) ||
          (rawValue is List && rawValue.isEmpty)) {
        // ✅ Null values show "--"
        displayValue = '--';
      } else {
        displayValue = localizations.translate(rawValue.toString());
      }

      return LabelValueItem(
        label: label,
        value: displayValue,
        isInline: true,
        labelFlex: 5,
        maxLines: 5,
        padding: const EdgeInsets.symmetric(vertical: spacer1),
      );
    }).toList();
  }
}
