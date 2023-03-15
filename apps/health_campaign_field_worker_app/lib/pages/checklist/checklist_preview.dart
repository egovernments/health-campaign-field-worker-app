import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../router/app_router.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../blocs/service/service.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

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
        header: Column(children: const [
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
                            context.router.pop();
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
                        children: value1
                            .map((e) => e.serviceDefId != null
                                ? DigitCard(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            DateFormat('dd MMMM yyyy').format(
                                              DateFormat('dd/MM/yyyy').parse(
                                                e.createdAt.toString(),
                                              ),
                                            ),
                                            style:
                                                theme.textTheme.headlineMedium,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Text(localizations
                                                  .translate('${e.tenantId}')),
                                            ),
                                            DigitOutLineButton(
                                              label: localizations.translate(
                                                i18.searchBeneficiary.iconLabel,
                                              ),
                                              onPressed: () {
                                                context.read<ServiceBloc>().add(
                                                      ServiceSelectionEvent(
                                                        service: e,
                                                      ),
                                                    );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : const Offstage())
                            .toList(),
                      )
                    : BlocBuilder<ServiceDefinitionBloc,
                        ServiceDefinitionState>(builder: (context, state) {
                        return state.maybeWhen(
                          serviceDefinitionFetch: (item1, item2) {
                            return DigitCard(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      localizations
                                          .translate(i18.checklist.checklist),
                                      style: theme.textTheme.displayMedium,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: value2.attributes!
                                          .map(
                                            (e) => Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      localizations.translate(
                                                        "${item2?.code}.${e.attributeCode!}",
                                                      ),
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only()
                                                            .copyWith(
                                                      top: kPadding,
                                                      bottom: kPadding,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        localizations
                                                            .translate(e.value),
                                                      ),
                                                    ),
                                                  ),
                                                  // e.additionalDetails == ''
                                                  //     ? Container(
                                                  //         margin:
                                                  //             const EdgeInsets
                                                  //                     .only()
                                                  //                 .copyWith(
                                                  //           top: kPadding,
                                                  //           bottom: kPadding,
                                                  //         ),
                                                  //         child: Column(
                                                  //           children: [
                                                  //             Align(
                                                  //               alignment: Alignment
                                                  //                   .centerLeft,
                                                  //               child: Text(
                                                  //                 localizations
                                                  //                     .translate(
                                                  //                   "${item2?.code}.${e.attributeCode!}.ADDITIONAL_FIELD",
                                                  //                 ),
                                                  //               ),
                                                  //             ),
                                                  //             Align(
                                                  //               alignment: Alignment
                                                  //                   .centerLeft,
                                                  //               child: Text(
                                                  //                 localizations
                                                  //                     .translate(
                                                  //                   e.additionalDetails,
                                                  //                 ),
                                                  //               ),
                                                  //             ),
                                                  //           ],
                                                  //         ),
                                                  //       )
                                                  //     : const Offstage(),
                                                  const DigitDivider(),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
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
