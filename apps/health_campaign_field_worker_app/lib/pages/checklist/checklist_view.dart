import 'dart:ffi';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';
import '../../router/app_router.dart';
import '../../blocs/service/service.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../blocs/service_definition/service_definition_remote.dart';
import '../../data/local_store/sql_store/sql_store.dart';
import '../../data/local_store/sql_store/tables/service.dart';
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

    return Scaffold(
      body: ScrollableContent(
        header: Column(children: const [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          BlocBuilder<ServiceDefinitionBloc, ServiceDefinitionState>(
            builder: (context, state) {
              List<TextEditingController> controller = [];
              state.mapOrNull(
                serviceDefinitionFetch: (value) =>
                    value.selectedServiceDefinition?.attributes?.forEach((e) {
                  controller.add(TextEditingController());
                }),
              );

              return state.maybeMap(
                orElse: () => Text(state.runtimeType.toString()),
                serviceDefinitionFetch: (value) {
                  var i = 0;

                  return DigitCard(
                    child: Column(children: [
                      ...value.selectedServiceDefinition!.attributes!.map((
                        e,
                      ) {
                        return Column(children: [
                          if (e.dataType == 'String') ...[
                            DigitTextField(
                              isRequired: false,
                              controller: controller[i++],
                              inputFormatter: [
                                FilteringTextInputFormatter.allow(RegExp(
                                  "[a-zA-Z0-9]",
                                )),
                              ],
                              autoValidation: AutovalidateMode.always,
                              validator: (value) {
                                return ((value == null || value == '') &&
                                        e.required == true)
                                    ? 'Field Required'
                                    : null;
                              },
                              label: localizations.translate(
                                '${value.selectedServiceDefinition?.code}.${e.code}',
                              ),
                            ),
                          ] else if (e.dataType == 'Number') ...[
                            DigitTextField(
                              inputFormatter: [
                                FilteringTextInputFormatter.allow(RegExp(
                                  "[0-9]",
                                )),
                              ],
                              validator: (value) {
                                if (((value == null || value == '') &&
                                    e.required == true)) {
                                  return 'Field Required';
                                }
                                if (e.regex != null) {
                                  return (RegExp(e.regex!).hasMatch(value!))
                                      ? null
                                      : 'Regex Mismatch';
                                }
                              },
                              controller: controller[i++],
                              label: localizations.translate(
                                '${value.selectedServiceDefinition?.code}.${e.code}',
                              ),
                            ),
                          ] else if (e.dataType == 'SingleValueList') ...[
                            Text(e.code.toString()),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  localizations.translate(
                                    '${value.selectedServiceDefinition?.code}.${e.code}',
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Column(
                              children: e.values!
                                  .map((e) => DigitCheckboxTile(
                                        label: e,
                                        value: true,
                                      ))
                                  .toList(),
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
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                ...e.values!.map((ele) {
                                  final element = ele.trim();
                                  final contol = controller[i];

                                  return BlocBuilder<ServiceBloc, ServiceState>(
                                    builder: (context, state) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(element),
                                            leading: Radio(
                                              value: element,
                                              groupValue: contol.text.trim(),
                                              onChanged: (item) {
                                                context.read<ServiceBloc>().add(
                                                      ServiceChecklistEvent(
                                                        value: item.toString(),
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
                                const DigitTextField(
                                  label: 'Reason',
                                ),
                              ],
                            ),
                          ],
                        ]);
                      }).toList(),
                      DigitElevatedButton(
                        onPressed: () {
                          List<ServiceAttributesModel> attributes = [];
                          for (i = 0; i < controller.length; i++) {
                            final attribute =
                                value.selectedServiceDefinition!.attributes!;
                            attributes.add(ServiceAttributesModel(
                              attributeCode: attribute[i].code,
                              dataType: attribute[i].dataType,
                              clientReferenceId: IdGen.i.identifier,
                              value: controller[i].text.toString(),
                              rowVersion: 1,
                              tenantId: attribute[i].tenantId,
                            ));
                          }

                          context.read<ServiceBloc>().add(
                                ServiceCreateEvent(
                                  serviceModel: ServiceModel(
                                    tenantId: value
                                        .selectedServiceDefinition!.tenantId,
                                    clientId: IdGen.i.identifier,
                                    serviceDefId:
                                        value.selectedServiceDefinition?.id,
                                    attributes: attributes,
                                    rowVersion: 1,
                                    accountId: IdGen.i.identifier,
                                  ),
                                ),
                              );

                          context.router.push(AcknowledgementRoute());
                        },
                        child: const Text(
                          'Submit',
                        ),
                      ),
                    ]),
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
