import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/stock_reconciliation/stock_recon.dart';
import '../data/local_store/sql_store/tables/product_variant.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class StockReconciliationPage extends LocalizedStatefulWidget {
  const StockReconciliationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<StockReconciliationPage> createState() => _StockReconPageState();
}

class _StockReconPageState extends LocalizedState<StockReconciliationPage> {
  bool showInfo = false;
  late StockReconModel stockReconModel;
  StockReconBloc bloc = StockReconBloc();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc..add(InitializeStockRecon()),
        child: BlocBuilder<StockReconBloc, StockReconState>(
          builder: (context, state) {
            if (state is StockReconLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is StockReconLoadedState) {
              stockReconModel = state.stockReconModel;
              // productMenuItems = state.productMenuItems;
              // facilityMenuItems = state.facilityMenuItems;

              return ReactiveFormBuilder(
                form: buildForm,
                builder: (context, form, child) {
                  return ScrollableContent(
                    header: Column(children: const [
                      BackNavigationHelpHeaderWidget(),
                    ]),
                    footer: SizedBox(
                      height: 90,
                      child: DigitCard(
                        child: DigitElevatedButton(
                          onPressed: () {
                            if (form.valid) {
                              /// todo - add bloc logic here
                              context.router.push(AcknowledgementRoute());
                            } else {
                              form.markAllAsTouched();
                            }
                          },
                          child: Center(
                            child: Text(localizations
                                .translate(i18.householdDetails.actionLabel)),
                          ),
                        ),
                      ),
                    ),
                    children: [
                      DigitCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              localizations.translate(
                                i18.stockReconciliationDetails
                                    .reconciliationPageLabel,
                              ),
                              style: theme.textTheme.displayMedium,
                            ),
                            DigitDropdown(
                              label: localizations.translate(
                                i18.stockReconciliationDetails.warehouseLabel,
                              ),
                              initialValue: '',
                              menuItems: bloc.productMenuItems,
                              onChanged: (value) {
                                bloc.add(CaptureProductVariant( productVariantId: value));
                              },
                              formControlName: 'product',
                            ),

                            const SizedBox(height: 16),
                            DigitDropdown(
                              label: localizations.translate(
                                i18.stockReconciliationDetails.productLabel,
                              ),
                              initialValue: '',
                              menuItems: bloc.facilityMenuItems,
                              onChanged: (value) {
                                bloc.add(CaptureWarehouseDetails( warehouseId: value));
                              },
                              formControlName: 'warehouse',
                            ),
                            DigitTableCard(
                              element: {
                                localizations.translate(i18
                                    .stockReconciliationDetails
                                    .dateOfReconciliation): stockReconModel.dateOfRecon,
                              },
                            ),
                            const DigitDivider(),
                            DigitTableCard(
                              element: {
                                localizations.translate(
                                  i18.stockReconciliationDetails.stockReceived,
                                ): stockReconModel.stockReceived,
                              },
                            ),
                            const DigitDivider(),
                            DigitTableCard(
                              element: {
                                localizations.translate(
                                  i18.stockReconciliationDetails.stockIssued,
                                ): stockReconModel.stockIssued,
                              },
                            ),
                            const DigitDivider(),
                            DigitTableCard(
                              element: {
                                localizations.translate(
                                  i18.stockReconciliationDetails.stockReturned,
                                ): stockReconModel.stockReturned,
                              },
                            ),
                            const DigitDivider(),
                            DigitTableCard(
                              element: {
                                localizations.translate(
                                  i18.stockReconciliationDetails.stockLost,
                                ): stockReconModel.stockLost,
                              },
                            ),
                            const DigitDivider(),
                            DigitTableCard(
                              element: {
                                localizations.translate(
                                  i18.stockReconciliationDetails.stockDamaged,
                                ): stockReconModel.stockDamaged,
                              },
                            ),
                            const DigitDivider(),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: DigitTableCard(
                                        element: {
                                          localizations.translate(
                                            i18.stockReconciliationDetails
                                                .stockOnHand,
                                          ): stockReconModel.stockOnHand,
                                        },
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showInfo = !showInfo;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.info_outline,
                                        color: theme.colorScheme.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: showInfo,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          theme.colorScheme.tertiaryContainer,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.info,
                                                color: theme.colorScheme
                                                    .onTertiaryContainer,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8,),
                                                child: Text(
                                                  'Info',
                                                  style: theme
                                                      .textTheme.headlineMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            'Stock on hand =(Stock received + stock returned) - (stock issued + stock lost + stock damaged)',
                                            style: theme.textTheme.labelSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const DigitDivider(),
                            DigitTextFormField(
                              formControlName: 'manualStockCount',
                              label: localizations.translate(
                                i18.stockReconciliationDetails.manualCount,
                              ),
                            ),
                            DigitTextFormField(
                              formControlName: 'comments',
                              label: localizations.translate(
                                i18.stockReconciliationDetails.comments,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        'warehouse': FormControl<String>(value: ''),
        'product': FormControl<String>(value: ''),
        'manualStockCount': FormControl<String>(value: ''),
        'comments': FormControl<String>(value: ''),
      });
}
