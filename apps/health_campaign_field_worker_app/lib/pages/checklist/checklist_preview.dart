import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:registration_delivery/blocs/service/service.dart';
import 'package:registration_delivery/blocs/service_definition/service_definition.dart';

import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class ChecklistPreviewPage extends LocalizedStatefulWidget {
  const ChecklistPreviewPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<ChecklistPreviewPage> createState() => _ChecklistPreviewPageState();
}

class _ChecklistPreviewPageState extends LocalizedState<ChecklistPreviewPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        footer: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Offstage(),
              serviceSearch: (value1, value2, value3) {
                return value2 != null
                    ? DigitCard(
                        child: DigitElevatedButton(
                          onPressed: () {
                            context.read<ServiceBloc>().add(
                                  ServiceResetEvent(serviceList: value1),
                                );
                          },
                          child: Text(
                            localizations.translate(i18.common.corecommonclose),
                          ),
                        ),
                      )
                    : const Offstage();
              },
            );
          },
        ),
        children: [
          BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Offstage(),
              serviceSearch: (value1, value2, value3) {
                return value2 == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...value1
                              .map((e) => e.serviceDefId != null
                                  ? DigitCard(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              DateFormat(Constants
                                                      .checklistPreviewDateFormat)
                                                  .format(
                                                DateFormat(Constants
                                                        .defaultDateFormat)
                                                    .parse(
                                                  e.createdAt.toString(),
                                                ),
                                              ),
                                              style: theme
                                                  .textTheme.headlineMedium,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  localizations.translate(
                                                    '${e.tenantId}',
                                                  ),
                                                ),
                                              ),
                                              DigitOutLineButton(
                                                label: localizations.translate(
                                                  i18.searchBeneficiary
                                                      .iconLabel,
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<ServiceBloc>()
                                                      .add(
                                                        ServiceSelectionEvent(
                                                          service: e,
                                                        ),
                                                      );
                                                },
                                                buttonStyle:
                                                    OutlinedButton.styleFrom(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : const Offstage())
                              .toList(),
                        ],
                      )
                    : BlocBuilder<ServiceDefinitionBloc,
                        ServiceDefinitionState>(builder: (context, state) {
                        return state.maybeWhen(
                          serviceDefinitionFetch: (
                            item1,
                            item2,
                          ) {
                            return DigitCard(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            localizations.translate(
                                              item2?.code ?? '',
                                            ),
                                            style:
                                                theme.textTheme.displayMedium,
                                          ),
                                        ),
                                        ...(value2.attributes ?? [])
                                            .where((a) =>
                                                a.value !=
                                                    i18.checklist
                                                        .notSelectedKey &&
                                                a.value != '')
                                            .map(
                                              (e) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        localizations.translate(
                                                          "${item2?.code ?? ''}.${e.attributeCode!}",
                                                        ),
                                                        style: theme.textTheme
                                                            .headlineSmall,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .only()
                                                          .copyWith(
                                                        top: kPadding,
                                                        bottom: kPadding,
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          e.dataType ==
                                                                  'SingleValueList'
                                                              ? localizations
                                                                  .translate(
                                                                  'CORE_COMMON_${e.value.toString().toUpperCase()}',
                                                                )
                                                              : e.value ?? "",
                                                        ),
                                                      ),
                                                    ),
                                                    e.additionalDetails != '' &&
                                                            e.additionalDetails !=
                                                                null
                                                        ? Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only()
                                                                    .copyWith(
                                                              top: kPadding,
                                                              bottom: kPadding,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    localizations
                                                                        .translate(
                                                                      "${item2?.code ?? ''}.${e.attributeCode!}.ADDITIONAL_FIELD",
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    localizations
                                                                        .translate(
                                                                      e.additionalDetails,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : const Offstage(),
                                                    const DigitDivider(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                      ].toList(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          orElse: () => const Offstage(),
                        );
                      });
              },
            );
          }),
        ],
      ),
    );
  }
}
