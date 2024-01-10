import 'dart:math';

import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../blocs/service/service.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class ChecklistViewPage extends LocalizedStatefulWidget {
  final String? referralClientRefId;
  const ChecklistViewPage({
    Key? key,
    this.referralClientRefId,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<ChecklistViewPage> createState() => _ChecklistViewPageState();
}

class _ChecklistViewPageState extends LocalizedState<ChecklistViewPage> {
  String isStateChanged = '';
  var submitTriggered = false;
  List<TextEditingController> controller = [];
  List<TextEditingController> additionalController = [];
  List<AttributesModel>? initialAttributes;
  ServiceDefinitionModel? selectedServiceDefinition;
  bool isControllersInitialized = false;
  List<int> visibleChecklistIndexes = [];
  GlobalKey<FormState> checklistFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ServiceBloc>().add(
          ServiceChecklistEvent(
            value: Random().nextInt(100).toString(),
            submitTriggered: true,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool isHealthFacilityWorker = context.loggedInUserRoles
        .where((role) => role.code == RolesType.healthFacilityWorker.toValue())
        .toList()
        .isNotEmpty;

    return WillPopScope(
      onWillPop: isHealthFacilityWorker && widget.referralClientRefId != null
          ? () async => false
          : () async => _onBackPressed(context),
      child: Scaffold(
        body: BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
          builder: (context, state) {
            state.mapOrNull(
              serviceDefinitionFetch: (value) {
                selectedServiceDefinition = value.selectedServiceDefinition;
                initialAttributes = value.selectedServiceDefinition?.attributes;
                if (!isControllersInitialized) {
                  initialAttributes?.forEach((e) {
                    controller.add(TextEditingController());
                    if (!(isHealthFacilityWorker &&
                        widget.referralClientRefId != null)) {
                      additionalController.add(TextEditingController());
                    }
                  });

                  // Set the flag to true after initializing controllers
                  isControllersInitialized = true;
                }
              },
            );

            return state.maybeMap(
              orElse: () => Text(state.runtimeType.toString()),
              serviceDefinitionFetch: (value) {
                return ScrollableContent(
                  header: Column(children: [
                    if (!(isHealthFacilityWorker &&
                        widget.referralClientRefId != null))
                      const BackNavigationHelpHeaderWidget(),
                  ]),
                  enableFixedButton: true,
                  footer: DigitCard(
                    margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                    padding:
                        const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                    child: DigitElevatedButton(
                      onPressed: () async {
                        final router = context.router;
                        submitTriggered = true;

                        context.read<ServiceBloc>().add(
                              const ServiceChecklistEvent(
                                value: '',
                                submitTriggered: true,
                              ),
                            );
                        final isValid =
                            checklistFormKey.currentState?.validate();
                        if (!isValid!) {
                          return;
                        }
                        final itemsAttributes = initialAttributes;

                        for (int i = 0; i < controller.length; i++) {
                          if (itemsAttributes?[i].required == true &&
                              ((itemsAttributes?[i].dataType ==
                                          'SingleValueList' &&
                                      visibleChecklistIndexes
                                          .any((e) => e == i) &&
                                      (controller[i].text == '')) ||
                                  (itemsAttributes?[i].dataType !=
                                          'SingleValueList' &&
                                      (controller[i].text == '' &&
                                          !(isHealthFacilityWorker &&
                                              widget.referralClientRefId !=
                                                  null))))) {
                            return;
                          }
                        }

                        final shouldSubmit = await DigitDialog.show(
                          context,
                          options: DigitDialogOptions(
                            titleText: localizations.translate(
                              i18.checklist.checklistDialogLabel,
                            ),
                            content: Text(localizations.translate(
                              i18.checklist.checklistDialogDescription,
                            )),
                            primaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.checklist.checklistDialogPrimaryAction,
                              ),
                              action: (ctx) {
                                final referenceId = IdGen.i.identifier;
                                List<ServiceAttributesModel> attributes = [];
                                for (int i = 0; i < controller.length; i++) {
                                  final attribute = initialAttributes;
                                  attributes.add(ServiceAttributesModel(
                                    auditDetails: AuditDetails(
                                      createdBy: context.loggedInUserUuid,
                                      createdTime:
                                          context.millisecondsSinceEpoch(),
                                    ),
                                    attributeCode: '${attribute?[i].code}',
                                    dataType: attribute?[i].dataType,
                                    clientReferenceId: IdGen.i.identifier,
                                    referenceId: isHealthFacilityWorker &&
                                            widget.referralClientRefId != null
                                        ? widget.referralClientRefId
                                        : referenceId,
                                    value: attribute?[i].dataType !=
                                            'SingleValueList'
                                        ? controller[i]
                                                .text
                                                .toString()
                                                .trim()
                                                .isNotEmpty
                                            ? controller[i].text.toString()
                                            : ''
                                        : visibleChecklistIndexes.contains(i)
                                            ? controller[i].text.toString()
                                            : i18.checklist.notSelectedKey,
                                    rowVersion: 1,
                                    tenantId: attribute?[i].tenantId,
                                    additionalDetails: isHealthFacilityWorker &&
                                            widget.referralClientRefId != null
                                        ? null
                                        : ((attribute?[i].values?.length == 2 ||
                                                    attribute?[i]
                                                            .values
                                                            ?.length ==
                                                        3) &&
                                                controller[i].text ==
                                                    attribute?[i]
                                                        .values?[1]
                                                        .trim())
                                            ? additionalController[i]
                                                    .text
                                                    .toString()
                                                    .isEmpty
                                                ? null
                                                : additionalController[i]
                                                    .text
                                                    .toString()
                                            : null,
                                  ));
                                }

                                context.read<ServiceBloc>().add(
                                      ServiceCreateEvent(
                                        serviceModel: ServiceModel(
                                          createdAt: DigitDateUtils
                                              .getDateFromTimestamp(
                                            DateTime.now()
                                                .toLocal()
                                                .millisecondsSinceEpoch,
                                            dateFormat: "dd/MM/yyyy hh:mm a",
                                          ),
                                          tenantId: value
                                              .selectedServiceDefinition!
                                              .tenantId,
                                          clientId: isHealthFacilityWorker &&
                                                  widget.referralClientRefId !=
                                                      null
                                              ? widget.referralClientRefId
                                                  .toString()
                                              : referenceId,
                                          serviceDefId: value
                                              .selectedServiceDefinition?.id,
                                          attributes: attributes,
                                          rowVersion: 1,
                                          accountId: context.projectId,
                                          auditDetails: AuditDetails(
                                            createdBy: context.loggedInUserUuid,
                                            createdTime: DateTime.now()
                                                .millisecondsSinceEpoch,
                                          ),
                                          clientAuditDetails:
                                              ClientAuditDetails(
                                            createdBy: context.loggedInUserUuid,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                            lastModifiedBy:
                                                context.loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
                                          ),
                                          additionalDetails:
                                              context.boundary.code,
                                        ),
                                      ),
                                    );

                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(true);
                              },
                            ),
                            secondaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.checklist.checklistDialogSecondaryAction,
                              ),
                              action: (context) {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(false);
                              },
                            ),
                          ),
                        );
                        if (shouldSubmit ?? false) {
                          if (isHealthFacilityWorker &&
                              widget.referralClientRefId != null) {
                            router.navigate(SearchReferralsRoute());
                          } else {
                            router.navigate(ChecklistRoute());
                          }
                          router.push(AcknowledgementRoute());
                        }
                      },
                      child: Text(
                        localizations.translate(i18.common.coreCommonSubmit),
                      ),
                    ),
                  ),
                  children: [
                    Form(
                      key: checklistFormKey, //assigning key to form
                      child: DigitCard(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              '${localizations.translate(
                                value.selectedServiceDefinition!.code
                                    .toString(),
                              )} ${localizations.translate(i18.checklist.checklist)}',
                              style: theme.textTheme.displayMedium,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          ...initialAttributes!.map((
                            e,
                          ) {
                            int index = (initialAttributes ?? []).indexOf(e);

                            return Column(children: [
                              if (e.dataType == 'String' &&
                                  !(e.code ?? '').contains('.')) ...[
                                DigitTextField(
                                  onChange: (value) {
                                    checklistFormKey.currentState?.validate();
                                  },
                                  isRequired: false,
                                  controller: controller[index],
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                      "[a-zA-Z0-9]",
                                    )),
                                  ],
                                  validator: (value) {
                                    if (((value == null || value == '') &&
                                        e.required == true)) {
                                      return localizations
                                          .translate("${e.code}_REQUIRED");
                                    }
                                    if (e.regex != null) {
                                      return (RegExp(e.regex!).hasMatch(value!))
                                          ? null
                                          : localizations
                                              .translate("${e.code}_REGEX");
                                    }

                                    return null;
                                  },
                                  label: localizations.translate(
                                    '${value.selectedServiceDefinition?.code}.${e.code}',
                                  ),
                                ),
                              ] else if (e.dataType == 'Number' &&
                                  !(e.code ?? '').contains('.')) ...[
                                DigitTextField(
                                  onChange: (value) {
                                    checklistFormKey.currentState?.validate();
                                  },
                                  textStyle: theme.textTheme.headlineMedium,
                                  textInputType: TextInputType.number,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                      "[0-9]",
                                    )),
                                  ],
                                  validator: (value) {
                                    if (((value == null || value == '') &&
                                        e.required == true)) {
                                      return localizations.translate(
                                        i18.common.corecommonRequired,
                                      );
                                    }
                                    if (e.regex != null) {
                                      return (RegExp(e.regex!).hasMatch(value!))
                                          ? null
                                          : localizations
                                              .translate("${e.code}_REGEX");
                                    }

                                    return null;
                                  },
                                  controller: controller[index],
                                  label: '${localizations.translate(
                                        '${value.selectedServiceDefinition?.code}.${e.code}',
                                      ).trim()} ${e.required == true ? '*' : ''}',
                                ),
                              ] else if (e.dataType == 'MultiValueList' &&
                                  !(e.code ?? '').contains('.')) ...[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${localizations.translate(
                                            '${value.selectedServiceDefinition?.code}.${e.code}',
                                          )} ${e.required == true ? '*' : ''}',
                                          style: theme.textTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                BlocBuilder<ServiceBloc, ServiceState>(
                                  builder: (context, state) {
                                    return Column(
                                      children: e.values!
                                          .map((e) => DigitCheckboxTile(
                                                label: e,
                                                value: controller[index]
                                                    .text
                                                    .split('.')
                                                    .contains(e),
                                                onChanged: (value) {
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceChecklistEvent(
                                                          value: e.toString(),
                                                          submitTriggered:
                                                              submitTriggered,
                                                        ),
                                                      );
                                                  final String ele;
                                                  var val = controller[index]
                                                      .text
                                                      .split('.');
                                                  if (val.contains(e)) {
                                                    val.remove(e);
                                                    ele = val.join(".");
                                                  } else {
                                                    ele =
                                                        "${controller[index].text}.$e";
                                                  }
                                                  controller[index].value =
                                                      TextEditingController
                                                          .fromValue(
                                                    TextEditingValue(
                                                      text: ele,
                                                    ),
                                                  ).value;
                                                },
                                              ))
                                          .toList(),
                                    );
                                  },
                                ),
                              ] else if (e.dataType == 'SingleValueList') ...[
                                if (!(e.code ?? '').contains('.'))
                                  DigitCard(
                                    child: _buildChecklist(
                                      e,
                                      index,
                                      value.selectedServiceDefinition,
                                      context,
                                    ),
                                  ),
                              ],
                            ]);
                          }).toList(),
                          const SizedBox(
                            height: 15,
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildChecklist(
    AttributesModel item,
    int index,
    ServiceDefinitionModel? selectedServiceDefinition,
    BuildContext context,
  ) {
    bool isHealthFacilityWorker = context.loggedInUserRoles
        .where((role) => role.code == RolesType.healthFacilityWorker.toValue())
        .toList()
        .isNotEmpty;
    final theme = Theme.of(context);
    /* Check the data type of the attribute*/
    if (item.dataType == 'SingleValueList') {
      final childItems = getNextQuestions(
        item.code.toString(),
        initialAttributes ?? [],
      );
      List<int> excludedIndexes = [];

      // Ensure the current index is added to visible indexes and not excluded
      if (!visibleChecklistIndexes.contains(index) &&
          !excludedIndexes.contains(index)) {
        visibleChecklistIndexes.add(index);
      }

      // Determine excluded indexes
      for (int i = 0; i < (initialAttributes ?? []).length; i++) {
        if (!visibleChecklistIndexes.contains(i)) {
          excludedIndexes.add(i);
        }
      }

      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding here
              child: Text(
                '${localizations.translate(
                  '${selectedServiceDefinition?.code}.${item.code}',
                )} ${item.required == true ? '*' : ''}',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
          Column(
            children: [
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  return RadioGroup<String>.builder(
                    groupValue: controller[index].text.trim(),
                    onChanged: (value) {
                      context.read<ServiceBloc>().add(
                            ServiceChecklistEvent(
                              value: Random().nextInt(100).toString(),
                              submitTriggered: submitTriggered,
                            ),
                          );
                      setState(() {
                        // Clear child controllers and update visibility
                        for (final matchingChildItem in childItems) {
                          final childIndex =
                              initialAttributes?.indexOf(matchingChildItem);
                          if (childIndex != null) {
                            // controller[childIndex].clear();
                            visibleChecklistIndexes
                                .removeWhere((v) => v == childIndex);
                          }
                        }

                        // Update the current controller's value
                        controller[index].value =
                            TextEditingController.fromValue(
                          TextEditingValue(
                            text: value!,
                          ),
                        ).value;

                        if (excludedIndexes.isNotEmpty) {
                          for (int i = 0; i < excludedIndexes.length; i++) {
                            // Clear excluded child controllers
                            if (item.dataType != 'SingleValueList') {
                              // controller[excludedIndexes[i]].value =
                              //     TextEditingController.fromValue(
                              //   const TextEditingValue(
                              //     text: '',
                              //   ),
                              // ).value;
                            }
                          }
                        }

                        // Remove corresponding controllers based on the removed attributes
                      });
                    },
                    items: item.values != null
                        ? item.values!
                            .where((e) => e != i18.checklist.notSelectedKey)
                            .toList()
                        : [],
                    itemBuilder: (item) => RadioButtonBuilder(
                      localizations.translate(
                        'CORE_COMMON_${item.trim().toUpperCase()}',
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  return (controller[index].text == item.values?[1].trim() &&
                          !(isHealthFacilityWorker &&
                              widget.referralClientRefId != null))
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            right: 4.0,
                            bottom: 16,
                          ),
                          child: DigitTextField(
                            maxLength: 1000,
                            isRequired: true,
                            controller: additionalController[index],
                            label: '${localizations.translate(
                              '${selectedServiceDefinition?.code}.${item.code}.ADDITIONAL_FIELD',
                            )}*',
                            validator: (value1) {
                              if (value1 == null || value1 == '') {
                                return localizations.translate(
                                  i18.common.coreCommonReasonRequired,
                                );
                              }

                              return null;
                            },
                          ),
                        )
                      : const SizedBox();
                },
              ),
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  final hasError = (item.required == true &&
                      controller[index].text.isEmpty &&
                      submitTriggered);

                  return Offstage(
                    offstage: !hasError,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        localizations.translate(
                          i18.common.corecommonRequired,
                        ),
                        style: TextStyle(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          if (childItems.isNotEmpty &&
              controller[index].text.trim().isNotEmpty) ...[
            _buildNestedChecklists(
              item.code.toString(),
              index,
              controller[index].text.trim(),
              context,
            ),
          ],
        ],
      );
    } else if (item.dataType == 'String') {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DigitTextField(
          onChange: (value) {
            checklistFormKey.currentState?.validate();
          },
          isRequired: item.required ?? true,
          controller: controller[index],
          inputFormatter: [
            FilteringTextInputFormatter.allow(RegExp(
              "[a-zA-Z0-9 ]",
            )),
          ],
          validator: (value) {
            if (((value == null || value == '') && item.required == true)) {
              return localizations.translate("${item.code}_REQUIRED");
            }
            if (item.regex != null) {
              return (RegExp(item.regex!).hasMatch(value!))
                  ? null
                  : localizations.translate("${item.code}_REGEX");
            }

            return null;
          },
          label: localizations.translate(
            '${selectedServiceDefinition?.code}.${item.code}',
          ),
        ),
      );
    } else if (item.dataType == 'Number') {
      return DigitTextField(
        onChange: (value) {
          checklistFormKey.currentState?.validate();
        },
        textStyle: theme.textTheme.headlineMedium,
        textInputType: TextInputType.number,
        inputFormatter: [
          FilteringTextInputFormatter.allow(RegExp(
            "[0-9]",
          )),
        ],
        validator: (value) {
          if (((value == null || value == '') && item.required == true)) {
            return localizations.translate(
              i18.common.corecommonRequired,
            );
          }
          if (item.regex != null) {
            return (RegExp(item.regex!).hasMatch(value!))
                ? null
                : localizations.translate("${item.code}_REGEX");
          }

          return null;
        },
        controller: controller[index],
        label: '${localizations.translate(
              '${selectedServiceDefinition?.code}.${item.code}',
            ).trim()} ${item.required == true ? '*' : ''}',
      );
    } else if (item.dataType == 'MultiValueList') {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    '${localizations.translate(
                      '${selectedServiceDefinition?.code}.${item.code}',
                    )} ${item.required == true ? '*' : ''}',
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ServiceBloc, ServiceState>(
            builder: (context, state) {
              return Column(
                children: item.values!
                    .map((e) => DigitCheckboxTile(
                          label: e,
                          value: controller[index].text.split('.').contains(e),
                          onChanged: (value) {
                            context.read<ServiceBloc>().add(
                                  ServiceChecklistEvent(
                                    value: e.toString(),
                                    submitTriggered: submitTriggered,
                                  ),
                                );
                            final String ele;
                            var val = controller[index].text.split('.');
                            if (val.contains(e)) {
                              val.remove(e);
                              ele = val.join(".");
                            } else {
                              ele = "${controller[index].text}.$e";
                            }
                            controller[index].value =
                                TextEditingController.fromValue(
                              TextEditingValue(
                                text: ele,
                              ),
                            ).value;
                          },
                        ))
                    .toList(),
              );
            },
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  // Function to build nested checklists for child attributes
  Widget _buildNestedChecklists(
    String parentCode,
    int parentIndex,
    String parentControllerValue,
    BuildContext context,
  ) {
    // Retrieve child items for the given parent code
    final childItems = getNextQuestions(
      parentCode,
      initialAttributes ?? [],
    );

    return Column(
      children: [
        // Build cards for each matching child attribute
        for (final matchingChildItem in childItems.where((childItem) =>
            childItem.code!.startsWith('$parentCode.$parentControllerValue.')))
          Card(
            margin: const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
            color: countDots(matchingChildItem.code ?? '') % 4 == 2
                ? const Color.fromRGBO(238, 238, 238, 1)
                : const DigitColors().white,
            child: _buildChecklist(
              matchingChildItem,
              initialAttributes?.indexOf(matchingChildItem) ??
                  parentIndex, // Pass parentIndex here as we're building at the same level
              selectedServiceDefinition,
              context,
            ),
          ),
      ],
    );
  }

  // Function to get the next questions (child attributes) based on a parent code
  List<AttributesModel> getNextQuestions(
    String parentCode,
    List<AttributesModel> checklistItems,
  ) {
    final childCodePrefix = '$parentCode.';
    final nextCheckLists = checklistItems.where((item) {
      return item.code!.startsWith(childCodePrefix) &&
          item.code?.split('.').length == parentCode.split('.').length + 2;
    }).toList();

    return nextCheckLists;
  }

  int countDots(String inputString) {
    int dotCount = 0;
    for (int i = 0; i < inputString.length; i++) {
      if (inputString[i] == '.') {
        dotCount++;
      }
    }

    return dotCount;
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    bool? shouldNavigateBack = await showDialog<bool>(
      context: context,
      builder: (context) => DigitDialog(
        options: DigitDialogOptions(
          titleText: localizations.translate(
            i18.checklist.checklistBackDialogLabel,
          ),
          content: Text(localizations.translate(
            i18.checklist.checklistBackDialogDescription,
          )),
          primaryAction: DigitDialogActions(
            label: localizations
                .translate(i18.checklist.checklistBackDialogPrimaryAction),
            action: (ctx) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(true);
            },
          ),
          secondaryAction: DigitDialogActions(
            label: localizations
                .translate(i18.checklist.checklistBackDialogSecondaryAction),
            action: (context) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(false);
            },
          ),
        ),
      ),
    );

    return shouldNavigateBack ?? false;
  }
}
