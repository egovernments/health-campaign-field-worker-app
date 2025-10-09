import 'package:auto_route/auto_route.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/json_forms.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:digit_forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
  final bool isEdit;
  final bool isView;

  const FormsRenderPage({
    super.key,
    super.appLocalizations,
    @QueryParam() this.currentSchemaKey = '',
    @PathParam() required this.pageName,
    @QueryParam() this.isEdit = false,
    @QueryParam() this.isView = false,
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
            return _buildSummaryPage(context, schemaObject, widget.isView);
          }

          final schema = schemaObject.pages[widget.pageName];

          if (schema == null) {
            return const Center(child: Text('Form not found'));
          }

          final index =
              schemaObject.pages.keys.toList().indexOf(widget.pageName);
          final showcaseKeys = <GlobalKey>[];

          return Provider<Map<String, dynamic>>.value(
            value: widget.defaultValues ?? {},
            child: ReactiveFormBuilder(
              form: () => fb.group(
                JsonForms.getFormControls(
                  schema,
                  defaultValues: widget.defaultValues ?? {},
                ),
              ),
              builder: (context, formGroup, child) {
                return ScrollableContent(
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
                            final pageFormValues = JsonForms.getFormValues(
                              formGroup,
                              schema,
                            );

                            final updatedPropertySchema = schema.copyWith(
                              properties: Map.fromEntries(
                                schema.properties?.entries.map(
                                      (e) => pageFormValues.containsKey(e.key)
                                          ? MapEntry(
                                              e.key,
                                              e.value.copyWith(
                                                value: pageFormValues[e.key],
                                              ),
                                            )
                                          : MapEntry(e.key, e.value),
                                    ) ??
                                    [],
                              ),
                            );

                            // Persist the freshly updated current page into the cached schema
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

                            // ------- CONDITIONAL NAVIGATION DECISION -------
                            final currentPage =
                                schemaObject.pages.entries.elementAt(index);
                            final conditionalNavigateList =
                                currentPage.value.conditionalNavigateTo;

                            if (conditionalNavigateList != null &&
                                conditionalNavigateList.isNotEmpty) {
                              // Build a merged pages map so evaluator sees freshest values
                              final mergedPages =
                                  Map<String, PropertySchema>.from(
                                      schemaObject.pages);
                              mergedPages[widget.pageName] =
                                  updatedPropertySchema;

                              final ctx = buildVisibilityEvaluationContext(
                                currentPageKey: widget.pageName,
                                currentForm: formGroup,
                                pages: mergedPages,
                              );

                              for (final conditionItem
                                  in conditionalNavigateList) {
                                final condition = conditionItem.condition;
                                final navigateTo = conditionItem.navigateTo;

                                final isConditionTrue =
                                    evaluateVisibilityExpression(
                                        condition, ctx);

                                if (isConditionTrue) {
                                  final targetPageName = navigateTo.name;
                                  final targetPageType =
                                      navigateTo.type.toLowerCase();

                                  // Rule for conditional:
                                  // - If type == 'form' -> navigate to that form page (continue flow)
                                  // - Else (template/summary/submit/unknown) -> treat current as last:
                                  //      -> if schemaObject.summary == true, go to Summary widget
                                  //      -> else submit and close the flow
                                  if (targetPageType == 'form' &&
                                      targetPageName.isNotEmpty) {
                                    context.router.push(FormsRenderRoute(
                                      isEdit: widget.isEdit,
                                      customComponents: widget.customComponents,
                                      currentSchemaKey: widget.currentSchemaKey,
                                      pageName: targetPageName,
                                      defaultValues: widget.defaultValues,
                                      isView: widget.isView,
                                    ));
                                    return; // Skip default logic
                                  } else {
                                    final sortedEntries = schemaObject
                                        .pages.entries
                                        .toList()
                                      ..sort((a, b) => (a.value.order ?? 0)
                                          .compareTo(b.value.order ?? 0));
                                    final realLastKey = sortedEntries.isNotEmpty
                                        ? sortedEntries.last.key
                                        : widget.pageName;

                                    final schemaWithStampedLast =
                                        schemaObject.copyWith(
                                      pages: Map.fromEntries(
                                        schemaObject.pages.entries.map(
                                          (e) => MapEntry(
                                            e.key,
                                            e.key == realLastKey
                                                ? e.value.copyWith(
                                                    navigateTo:
                                                        navigateTo) // <-- stamp it
                                                : e.value,
                                          ),
                                        ),
                                      ),
                                    );

                                    context.read<FormsBloc>().add(
                                          FormsUpdateEvent(
                                            schemaKey: widget.currentSchemaKey,
                                            schema: schemaWithStampedLast,
                                          ),
                                        );

                                    if (schemaObject.summary) {
                                      // Go to Summary widget
                                      context.router.push(FormsRenderRoute(
                                        customComponents:
                                            widget.customComponents,
                                        currentSchemaKey:
                                            widget.currentSchemaKey,
                                        pageName: '',
                                        isEdit: widget.isEdit,
                                        isSummary: true,
                                        defaultValues: widget.defaultValues,
                                        isView: widget.isView,
                                      ));
                                    } else {
                                      // Submit & close flow
                                      if (widget.isView == false) {
                                        context.read<FormsBloc>().add(
                                              FormsSubmitEvent(
                                                isEdit: widget.isEdit,
                                                schemaKey:
                                                    widget.currentSchemaKey,
                                                isView: widget.isView,
                                              ),
                                            );
                                      }
                                      context.router.popUntil((route) {
                                        return route.settings.name !=
                                            FormsRenderRoute.name;
                                      });
                                    }
                                    return;
                                  }
                                }
                              }
                            }
                            // ------- END CONDITIONAL NAVIGATION DECISION -------

                            // ------- DEFAULT FLOW (UNCHANGED) -------
                            final pagesMap = schemaObject.pages;
                            final currentPageKey =
                                pagesMap.entries.elementAt(index).key;
                            final currentOrder =
                                pagesMap[currentPageKey]?.order ?? 0;

                            // Find the next page with an integer order > currentOrder.floor()
                            final nextPageEntry = pagesMap.entries.where((e) {
                              final order = e.value.order;
                              return order != null &&
                                  order > currentOrder &&
                                  order % 1 ==
                                      0; // Only integers (e.g. 6.0, not 5.1)
                            }).toList()
                              ..sort((a, b) =>
                                  a.value.order!.compareTo(b.value.order!));

                            if (nextPageEntry.isNotEmpty) {
                              context.router.push(FormsRenderRoute(
                                isEdit: widget.isEdit,
                                customComponents: widget.customComponents,
                                currentSchemaKey: widget.currentSchemaKey,
                                pageName: nextPageEntry.first.key,
                                defaultValues: widget.defaultValues,
                                isView: widget.isView,
                              ));
                            } else {
                              // "Real" last page by order
                              if (schemaObject.summary) {
                                // Go to Summary widget when summary is enabled
                                context.router.push(FormsRenderRoute(
                                  customComponents: widget.customComponents,
                                  currentSchemaKey: widget.currentSchemaKey,
                                  pageName: '',
                                  isEdit: widget.isEdit,
                                  isSummary: true,
                                  defaultValues: widget.defaultValues,
                                  isView: widget.isView,
                                ));
                              } else {
                                if (schemaObject.showAlertPopUp != null) {
                                  showCustomPopup(
                                    context: context,
                                    builder: (BuildContext ctx) => Popup(
                                        title: localizations.translate(
                                            schemaObject.showAlertPopUp!.title),
                                        description: localizations.translate(
                                            schemaObject.showAlertPopUp!
                                                    .description ??
                                                ""),
                                        actions: [
                                          DigitButton(
                                              label: localizations.translate(
                                                  schemaObject.showAlertPopUp!
                                                      .primaryActionLabel),
                                              onPressed: () {
                                                // Submit & close
                                                if (widget.isView == false) {
                                                  context
                                                      .read<FormsBloc>()
                                                      .add(FormsSubmitEvent(
                                                        isEdit: widget.isEdit,
                                                        schemaKey: widget
                                                            .currentSchemaKey,
                                                        isView: widget.isView,
                                                      ));
                                                }
                                                // Pop all form pages (FormsRenderRoute)
                                                Navigator.of(
                                                  ctx,
                                                  rootNavigator: true,
                                                ).pop();
                                                context.router
                                                    .popUntil((route) {
                                                  return route.settings.name !=
                                                      FormsRenderRoute.name;
                                                });
                                              },
                                              type: DigitButtonType.primary,
                                              size: DigitButtonSize.large),
                                          DigitButton(
                                              label: localizations.translate(
                                                  schemaObject.showAlertPopUp!
                                                      .secondaryActionLabel),
                                              onPressed: () {
                                                Navigator.of(
                                                  ctx,
                                                  rootNavigator: true,
                                                ).pop();
                                              },
                                              type: DigitButtonType.secondary,
                                              size: DigitButtonSize.large)
                                        ]),
                                  );
                                } else {
                                  // Submit & close
                                  if (widget.isView == false) {
                                    context
                                        .read<FormsBloc>()
                                        .add(FormsSubmitEvent(
                                          isEdit: widget.isEdit,
                                          schemaKey: widget.currentSchemaKey,
                                          isView: widget.isView,
                                        ));
                                  }
                                  context.router.popUntil((route) {
                                    return route.settings.name !=
                                        FormsRenderRoute.name;
                                  });
                                }
                              }
                            }
                            // ------- END DEFAULT FLOW -------
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
                      margin: const EdgeInsets.symmetric(
                        horizontal: spacer2,
                      ),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 0,
                            ),
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
                              if (schema.description != null &&
                                  translateIfPresent(
                                          schema.description, localizations) !=
                                      null &&
                                  translateIfPresent(
                                          schema.description, localizations)!
                                      .isNotEmpty) ...[
                                const SizedBox(
                                  height: spacer1,
                                ),
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
                          ],
                        ),
                        JsonForms(
                          propertySchema: schema,
                          pageName: widget.pageName,
                          currentSchemaKey: widget.currentSchemaKey,
                          childrens: widget.customComponents,
                          defaultValues: const {
                            // 'locality': context.boundary.code,
                          },
                          isView: widget.isView,
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
                                color:
                                    Theme.of(context).colorTheme.text.disabled),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryPage(
      BuildContext context, SchemaObject schemaObject, bool isView) {
    final shownPages = schemaObject.pages.entries.where((entry) {
      final pageSchema = entry.value;

      final values = pageSchema.properties?.values.map((field) => field.value);

      return values?.any((v) => v != null && v.toString().trim().isNotEmpty) ??
          false;
    }).toList();

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
              if (schemaObject.showAlertPopUp != null) {
                showCustomPopup(
                  context: context,
                  builder: (BuildContext ctx) => Popup(
                      title: localizations
                          .translate(schemaObject.showAlertPopUp!.title),
                      description: localizations.translate(
                          schemaObject.showAlertPopUp!.description ?? ""),
                      actions: [
                        DigitButton(
                            label: localizations.translate(schemaObject
                                .showAlertPopUp!.primaryActionLabel),
                            onPressed: () {
                              // Submit & close
                              if (widget.isView == false) {
                                context.read<FormsBloc>().add(FormsSubmitEvent(
                                      isEdit: widget.isEdit,
                                      schemaKey: widget.currentSchemaKey,
                                      isView: widget.isView,
                                    ));
                              }
                              // Pop all form pages (FormsRenderRoute)
                              Navigator.of(
                                ctx,
                                rootNavigator: true,
                              ).pop();
                              context.router.popUntil((route) {
                                return route.settings.name !=
                                    FormsRenderRoute.name;
                              });
                            },
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large),
                        DigitButton(
                            label: localizations.translate(schemaObject
                                .showAlertPopUp!.secondaryActionLabel),
                            onPressed: () {
                              Navigator.of(
                                ctx,
                                rootNavigator: true,
                              ).pop();
                            },
                            type: DigitButtonType.secondary,
                            size: DigitButtonSize.large)
                      ]),
                );
              } else {
                // Submit & close
                if (widget.isView == false) {
                  context.read<FormsBloc>().add(FormsSubmitEvent(
                        isEdit: widget.isEdit,
                        schemaKey: widget.currentSchemaKey,
                        isView: widget.isView,
                      ));
                }
                context.router.popUntil((route) {
                  return route.settings.name != FormsRenderRoute.name;
                });
              }
            },
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
      children: [
        for (final entry in shownPages)
          DigitCard(
            margin: const EdgeInsets.all(spacer2),
            children: [
              LabelValueSummary(
                padding: EdgeInsets.zero,
                heading:
                    localizations.translate(entry.value.label ?? entry.key),
                headingStyle:
                    Theme.of(context).digitTextTheme(context).headingL.copyWith(
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
      ],
    );
  }

  List<LabelValueItem> _renderSummaryLabelValueItems(PropertySchema schema) {
    final properties = schema.properties ?? {};
    final dateFormatter = DateFormat('dd MMM yyyy');

    return properties.entries
        .where((entry) =>
            entry.value.includeInSummary != false && entry.value.hidden != true)
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
