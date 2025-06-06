import 'package:auto_route/auto_route.dart';
import 'package:digit_scanner/digit_scanner.dart';
import 'package:digit_scanner/utils/scanner_utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/transit_post.dart';
import '../router/transit_post_router.gm.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/total_delivery.dart';

@RoutePage()
class TransitPostRecordVaccinationPage extends LocalizedStatefulWidget {
  const TransitPostRecordVaccinationPage({super.key});

  @override
  State<TransitPostRecordVaccinationPage> createState() =>
      TransitPostRecordVaccinationPageState();
}

class TransitPostRecordVaccinationPageState
    extends LocalizedState<TransitPostRecordVaccinationPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final TextEditingController latKey = TextEditingController();
    final TextEditingController lngKey = TextEditingController();
    final TextEditingController accuracyKey = TextEditingController();
    final List<DigitTableRow> tableRow = buildTableData();

    return Scaffold(
      body: BlocBuilder<TransitPostBloc, TransitPostState>(
        builder: (context, transitPostState) {
          return BlocListener<LocationBloc, LocationState>(
              listener: (context, locationState) {
                if (locationState.accuracy != null) {
                  //Hide the dialog after 1 seconds
                  Future.delayed(const Duration(seconds: 1), () {
                    DigitComponentsUtils.hideDialog(context);
                  });
                }

                final lat = locationState.latitude;
                final lng = locationState.longitude;
                final accuracy = locationState.accuracy;

                latKey.text = lat.toString();
                lngKey.text = lng.toString();
                accuracyKey.text = accuracy.toString();
              },
              listenWhen: (previous, current) {
                final lat = latKey.text;
                final lng = lngKey.text;
                final accuracy = accuracyKey.text;

                return lat.isNotEmpty || lng.isNotEmpty || accuracy.isNotEmpty
                    ? false
                    : true;
              },
              child: ScrollableContent(
                header: const BackNavigationHelpHeaderWidget(),
                enableFixedDigitButton: true,
                footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      label: localizations.translate(
                        i18.transitPost.recordDeliveryLabel,
                      ),
                      onPressed: () {
                        final bloc = context.read<DigitScannerBloc>();
                        final state = bloc.state.barCodes;

                        context.read<TransitPostBloc>().add(
                            TransitPostDeliveryEvent(
                                latitude: latKey.text.isNotEmpty
                                    ? double.parse(latKey.text)
                                    : transitPostState.latitude,
                                longitude: lngKey.text.isNotEmpty
                                    ? double.parse(lngKey.text)
                                    : transitPostState.longitude,
                                locationAccuracy: accuracyKey.text.isNotEmpty
                                    ? double.parse(accuracyKey.text)
                                    : transitPostState.locationAccuracy,
                                curCount: (transitPostState.curCount == null)
                                    ? 1
                                    : transitPostState.curCount! + 1,
                                totalCount:
                                    (transitPostState.totalCount == null)
                                        ? 1
                                        : transitPostState.totalCount! + 1,
                                scannedResource: DigitScannerUtils()
                                    .getGs1CodeFormattedString(state)
                                    .toString()));
                        context.router
                            .push(const TransitPostAcknowledgmentRoute());
                      },
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                    ),
                    DigitButton(
                      label: localizations.translate(
                        i18.transitPost.closeDeliveryLabel,
                      ),
                      onPressed: () {
                        context.router
                            .replaceAll([const TransitPostSelectionRoute()]);
                      },
                      type: DigitButtonType.secondary,
                      size: DigitButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                    )
                  ],
                ),
                children: [
                  DeliveryWidget(
                      count: transitPostState.curCount ?? 0,
                      description: localizations.translate(
                        i18.transitPost.todayDeliveriesDescription,
                      )),
                  BlocBuilder<TransitPostBloc, TransitPostState>(
                    builder: (context, transitPostState) => DigitCard(
                        margin: const EdgeInsets.all(spacer2),
                        children: [
                          LabelValueSummary(
                              heading: localizations.translate(
                                i18.transitPost.vaccinationDetailsLabel,
                              ),
                              items: [
                                LabelValueItem(
                                    labelFlex: 5,
                                    label: localizations.translate(
                                      i18.transitPost.dateLabel,
                                    ),
                                    value: DateFormat("d MMMM yyyy")
                                        .format(DateTime.now())),
                                LabelValueItem(
                                    labelFlex: 5,
                                    label: localizations.translate(
                                        i18.transitPost.transitPostTypeLabel),
                                    value: localizations.translate(
                                        transitPostState.transitPostType ??
                                            '')),
                                LabelValueItem(
                                    labelFlex: 5,
                                    label: localizations.translate(
                                      i18.transitPost.transitPostNameLabel,
                                    ),
                                    value: transitPostState.transitPostName)
                              ])
                        ]),
                  ),
                  DigitCard(margin: const EdgeInsets.all(spacer2), children: [
                    Text(
                      localizations.translate(
                        i18.transitPost.resourceDeliveredLabel,
                      ),
                      style: textTheme.headingL.copyWith(
                        color: theme.colorTheme.text.primary,
                      ),
                    ),
                    if (TransitPostSingleton().minAge != null &&
                        TransitPostSingleton().maxAge != null)
                      LabelValueSummary(items: [
                        LabelValueItem(
                          labelFlex: 5,
                          maxLines: 4,
                          label: localizations.translate(
                            i18.transitPost.beneficiaryAgeLabel,
                          ),
                          value:
                              "${localizations.translate(i18.transitPost.beneficiaryAgeDescription)} ${TransitPostSingleton().minAge!.toString()} ${"-"} ${TransitPostSingleton().maxAge!.toString()}",
                        )
                      ]),
                    SizedBox(
                      height: (tableRow.length * 50.0).toDouble().clamp(
                              100, MediaQuery.of(context).size.height * 0.5) +
                          40,
                      child: DigitTable(
                          tableHeight: (tableRow.length * 50.0)
                              .toDouble()
                              .clamp(100,
                                  MediaQuery.of(context).size.height * 0.5),
                          showPagination: false,
                          columns: [
                            DigitTableColumn(
                              header: localizations.translate(
                                i18.transitPost.doseLabel,
                              ),
                              cellValue: 'Dose',
                            ),
                            DigitTableColumn(
                              header: localizations.translate(
                                i18.transitPost.resourceLabel,
                              ),
                              cellValue: 'Resource',
                            ),
                          ],
                          rows: tableRow),
                    )
                  ]),
                  BlocBuilder<DigitScannerBloc, DigitScannerState>(
                      builder: (context, scannerState) => DigitCard(
                              margin: const EdgeInsets.all(spacer2),
                              children: [
                                LabelValueSummary(
                                  heading: localizations.translate(
                                    i18.transitPost.resourceScannedLabel,
                                  ),
                                  items: scannerState.barCodes.isNotEmpty
                                      ? (DigitScannerUtils()
                                              .getGs1CodeFormattedString(
                                                  scannerState.barCodes))
                                          .entries
                                          .map((entry) {
                                          return LabelValueItem(
                                            labelFlex: 5,
                                            label: localizations.translate(
                                              "GS1_${entry.key}",
                                            ),
                                            value: entry.value is DateTime
                                                ? DateFormat('d MMMM yyyy')
                                                    .format(entry.value)
                                                    .toString()
                                                : entry.value,
                                            maxLines: 5,
                                          );
                                        }).toList()
                                      : [
                                          LabelValueItem(
                                            labelFlex: 5,
                                            label: localizations.translate(
                                              i18.transitPost.resourceCodeLabel,
                                            ),
                                            value: scannerState.qrCodes.first,
                                            maxLines: 5,
                                          )
                                        ],
                                )
                              ]))
                ],
              ));
        },
      ),
    );
  }

  List<DigitTableRow> buildTableData() {
    final resources = TransitPostSingleton().resources;

    if (resources == null || resources.isEmpty) return [];

    List<DigitTableRow> finalTableRow = [];
    int count = 1;

    for (var resource in resources) {
      List<DigitTableData> tableData = [];

      tableData.add(
        DigitTableData(
            "${localizations.translate(i18.transitPost.doseLabel)} $count",
            cellKey: "Dose$count"),
      );
      tableData.add(DigitTableData(resource.productVariantId,
          cellKey: resource.name ?? resource.productVariantId));

      finalTableRow.add(DigitTableRow(tableRow: tableData));
      count++;
    }
    return finalTableRow;
  }
}
