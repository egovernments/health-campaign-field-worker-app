import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../router/app_router.dart';
import '../../blocs/service/service.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../models/entities/service.dart';
import '../../models/entities/service_attributes.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class ChecklistViewPage extends LocalizedStatefulWidget {
  const ChecklistViewPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<ChecklistViewPage> createState() => _ChecklistViewPageState();
}

class _ChecklistViewPageState extends LocalizedState<ChecklistViewPage> {
  String isStateChanged = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    GlobalKey<FormState> abcKey = GlobalKey<FormState>();

    return Scaffold(
      body: ScrollableContent(
        header: Column(children: const [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
            builder: (context, state) {
              List<TextEditingController> controller = [];
              List<TextEditingController> additionalController = [];
              state.mapOrNull(
                serviceDefinitionFetch: (value) =>
                    value.selectedServiceDefinition?.attributes?.forEach((e) {
                  controller.add(TextEditingController());
                  additionalController.add(TextEditingController());
                }),
              );

              return state.maybeMap(
                orElse: () => Text(state.runtimeType.toString()),
                serviceDefinitionFetch: (value) {
                  var i = 0;

                  return Form(
                    key: abcKey, //assigning key to form
                    child: DigitCard(
                      child: Column(children: [
                        ...value.selectedServiceDefinition!.attributes!.map((
                          e,
                        ) {
                          return Column(children: [
                            if (e.dataType == 'String') ...[
                              DigitTextField(
                                onChange: (value) {
                                  abcKey.currentState?.validate();
                                },
                                isRequired: false,
                                controller: controller[i++],
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
                                },
                                label: localizations.translate(
                                  '${value.selectedServiceDefinition?.code}.${e.code}',
                                ),
                              ),
                            ] else if (e.dataType == 'Number') ...[
                              DigitTextField(
                                onChange: (value) {
                                  abcKey.currentState?.validate();
                                },
                                inputFormatter: [
                                  FilteringTextInputFormatter.allow(RegExp(
                                    "[0-9]",
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
                                },
                                controller: controller[i++],
                                label: localizations.translate(
                                  '${value.selectedServiceDefinition?.code}.${e.code}',
                                ),
                              ),
                            ] else if (e.dataType == 'SingleValueList') ...[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    localizations.translate(
                                      '${value.selectedServiceDefinition?.code}.${e.code}',
                                    ),
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ),
                              ),
                              BlocBuilder<ServiceBloc, ServiceState>(
                                builder: (context, state) {
                                  return Column(
                                    children: e.values!
                                        .map((e) => DigitCheckboxTile(
                                              label: e,
                                              value: controller[i]
                                                  .text
                                                  .split('.')
                                                  .contains(e),
                                              onChanged: (value) {
                                                context.read<ServiceBloc>().add(
                                                      ServiceChecklistEvent(
                                                        value: e.toString(),
                                                      ),
                                                    );
                                                final String ele;
                                                var val = controller[i]
                                                    .text
                                                    .split('.');
                                                if (val.contains(e)) {
                                                  val.remove(e);
                                                  ele = val.join(".");
                                                } else {
                                                  ele =
                                                      "${controller[i].text}.$e";
                                                }
                                                controller[i].value =
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
                            ] else if (e.dataType == 'MultiValueList') ...[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        localizations.translate(
                                          '${value.selectedServiceDefinition?.code}.${e.code}',
                                        ),
                                        style: theme.textTheme.headlineSmall,
                                      ),
                                    ),
                                  ),
                                  ...e.values!.map((ele) {
                                    final element = ele.trim();
                                    final contol = controller[i];

                                    return BlocBuilder<ServiceBloc,
                                        ServiceState>(
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              title: Text(localizations
                                                  .translate(element)),
                                              leading: Radio(
                                                value: element,
                                                groupValue: contol.text.trim(),
                                                onChanged: (item) {
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceChecklistEvent(
                                                          value:
                                                              item.toString(),
                                                        ),
                                                      );
                                                  contol.value =
                                                      TextEditingController
                                                          .fromValue(
                                                    TextEditingValue(
                                                      text: item.toString(),
                                                    ),
                                                  ).value;
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }).toList(),
                                  BlocBuilder<ServiceBloc, ServiceState>(
                                    builder: (context, state) {
                                      return (e.values?.length == 3 &&
                                              controller[i].text ==
                                                  e.values?[1].trim())
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: DigitTextField(
                                                controller:
                                                    additionalController[i],
                                                label: localizations.translate(
                                                  '${value.selectedServiceDefinition?.code}.${e.code}.ADDITIONAL_FIELD',
                                                ),
                                              ),
                                            )
                                          : const SizedBox();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ]);
                        }).toList(),
                        DigitElevatedButton(
                          onPressed: () {
                            final isValid = abcKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }

                            DigitDialog.show(
                              context,
                              options: DigitDialogOptions(
                                titleText: localizations.translate(
                                  i18.checklist.checklistDialogLabel,
                                ),
                                primaryAction: DigitDialogActions(
                                  label: localizations.translate(i18
                                      .checklist.checklistDialogPrimaryAction),
                                  action: (ctx) {
                                    final referenceId = IdGen.i.identifier;
                                    List<ServiceAttributesModel> attributes =
                                        [];
                                    for (i = 0; i < controller.length; i++) {
                                      final attribute = value
                                          .selectedServiceDefinition!
                                          .attributes!;
                                      attributes.add(ServiceAttributesModel(
                                        attributeCode: '${attribute[i].code}',
                                        dataType: attribute[i].dataType,
                                        clientReferenceId: IdGen.i.identifier,
                                        referenceId: referenceId,
                                        value: controller[i].text.toString(),
                                        rowVersion: 1,
                                        tenantId: attribute[i].tenantId,
                                        additionalDetails:
                                            additionalController[i]
                                                .text
                                                .toString(),
                                      ));
                                    }

                                    context.read<ServiceBloc>().add(
                                          ServiceCreateEvent(
                                            serviceModel: ServiceModel(
                                              tenantId: value
                                                  .selectedServiceDefinition!
                                                  .tenantId,
                                              clientId: referenceId,
                                              serviceDefId: value
                                                  .selectedServiceDefinition
                                                  ?.id,
                                              attributes: attributes,
                                              rowVersion: 1,
                                              accountId: IdGen.i.identifier,
                                            ),
                                          ),
                                        );

                                    context.router.push(AcknowledgementRoute());
                                  },
                                ),
                                secondaryAction: DigitDialogActions(
                                  label: localizations.translate(i18.checklist
                                      .checklistDialogSecondaryAction),
                                  action: (context) {
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                  },
                                ),
                              ),
                            );
                          },
                          child: Text(
                            localizations
                                .translate(i18.common.coreCommonSubmit),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
