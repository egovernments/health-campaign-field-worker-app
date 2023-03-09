import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    : DigitCard(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: value2.attributes!
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                localizations.translate(
                                                  e.attributeCode!,
                                                ),
                                                style: theme
                                                    .textTheme.headlineSmall,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                localizations
                                                    .translate(e.value),
                                              ),
                                            ),
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
            );
          }),
        ],
      ),
    );
  }
}
