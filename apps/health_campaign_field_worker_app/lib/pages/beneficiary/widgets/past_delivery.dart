import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../models/entities/product_variant.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/project/project.dart';

Widget buildTableContent(
  DeliverInterventionState deliverInterventionState,
  BuildContext context,
  List<TableHeader> headerListResource,
  List<ProductVariantModel>? variant,
) {
  final currentCycle = deliverInterventionState.cycle;
  final currentDose =
      deliverInterventionState.dose >= 0 ? deliverInterventionState.dose : 0;
  final localizations = AppLocalizations.of(context);

  return SizedBox(
    height: 400,
    width: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DigitTableCard(
          element: {
            localizations.translate(
              i18.beneficiaryDetails.beneficiaryAge,
            ): "2",
          },
        ),
        const Divider(),
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, projectState) {
            final item = projectState
                .projectType!.cycles![currentCycle].deliveries![currentDose];

            return DigitTable(
              headerList: headerListResource,
              tableData: [
                TableDataRow([
                  TableData(
                    'Dose ${projectState.projectType!.cycles![currentCycle].deliveries!.indexOf(item) + 1}',
                    cellKey: 'dose',
                  ),
                  // TODO [need to handle the null check]
                  TableData(
                    item.productVariants
                            ?.map((e) {
                              // print(e.productVariantId);
                              // print(variant?.last.id);
                              final value = variant
                                  ?.where((element) =>
                                      element.id == e.productVariantId)
                                  .toList()
                                  .firstOrNull
                                  ?.id;

                              return '${e.quantity} of ${value != null ? localizations.translate(value) : ''}';
                            })
                            .toList()
                            .join() ??
                        '',
                    cellKey: 'resources',
                  ),
                ]),
              ],
              leftColumnWidth: 130,
              rightColumnWidth: headerListResource.length * 17 * 5,
              height: MediaQuery.of(context).size.height / 5,
            );
          },
        ),
      ],
    ),
  );
}
