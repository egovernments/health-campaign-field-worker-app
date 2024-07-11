import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class BeneficiaryChecklistPage extends LocalizedStatefulWidget {
  final String? referralClientRefId;
  const BeneficiaryChecklistPage({
    super.key,
    this.referralClientRefId,
    super.appLocalizations,
  });

  @override
  State<BeneficiaryChecklistPage> createState() =>
      _BeneficiaryChecklistPageState();
}

class _BeneficiaryChecklistPageState
    extends LocalizedState<BeneficiaryChecklistPage> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);



    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<ServiceDefinitionBloc,
            ServiceDefinitionState>(
          builder: (context, state) {
            state.mapOrNull(
              serviceDefinitionFetch: (value) {
                selectedServiceDefinition = value.serviceDefinitionList.where((element) => element.code.toString().contains('IRS.TRAINING_SUPERVISION.DISTRIBUTOR')).toList().first;
                initialAttributes = selectedServiceDefinition?.attributes;
                if (!isControllersInitialized) {
                  initialAttributes?.forEach((e) {
                    controller.add(TextEditingController());
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
                    BackNavigationHelpHeaderWidget(
                      showHelp: false,
                      handleBack: () {
                        //TODO: direct go back is not working, need to check
                        Navigator.pop(context);
                      },
                    ),
                  ]),
                  enableFixedButton: true,
                  footer: DigitCard(
                    margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                    padding:
                    const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                    child: DigitElevatedButton(
                      onPressed: () async {
                        // TODO: Submit checklist
                        await context.router
                            .push(DeliverInterventionRoute());
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
                                selectedServiceDefinition!.code
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
                                    '${selectedServiceDefinition?.code}.${e.code}',
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
                                            '${selectedServiceDefinition?.code}.${e.code}',
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
                              ]else if (e.dataType == 'Boolean') ...[
                                if (!(e.code ?? '').contains('.'))
                                  DigitCard(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${localizations.translate(
                                                    '${selectedServiceDefinition?.code}.${e.code}',
                                                  )} ${e.required == true ? '*' : ''}',
                                                  style: theme.textTheme.headlineSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        BlocBuilder<ServiceBloc, ServiceState>(
                                          builder: (context, state) {
                                            return SelectionBox<bool>(
                                              //label: e,
                                              allowMultipleSelection: false,
                                              width: 110,
                                              valueMapper: (value) {
                                                return value ? localizations.translate(
                                                  i18.common.coreCommonYes,
                                                ) : localizations.translate(
                                                  i18.common.coreCommonNo,
                                                );
                                              },
                                              initialSelection: controller[index].text=='true' ?  [true] : controller[index].text=='false' ?[false] : [],
                                              options: const [true, false],
                                              onSelectionChanged: (curValue) {
                                                if(curValue.isNotEmpty){
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                    ServiceChecklistEvent(
                                                      value: curValue.toString(),
                                                      submitTriggered:
                                                      submitTriggered,
                                                    ),
                                                  );
                                                  controller[index].value = TextEditingValue(
                                                    text: curValue.first.toString(),
                                                  );
                                                }

                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ]);
                          }),
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
}