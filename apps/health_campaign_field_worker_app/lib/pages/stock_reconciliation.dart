import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
  State<StockReconciliationPage> createState() => _WarehouseDetailsPageState();
}

class _WarehouseDetailsPageState
    extends LocalizedState<StockReconciliationPage> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
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
                        i18.stockReconciliationDetails.reconciliationPageLabel,
                      ),
                      style: theme.textTheme.displayMedium,
                    ),
                    Column(children: [
                      DigitTextFormField(
                        formControlName: 'warehouse',
                        label: localizations.translate(
                          i18.stockReconciliationDetails.warehouseLabel,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 16),
                    DigitDropdown(
                      label: localizations.translate(
                        i18.stockReconciliationDetails.productLabel,
                      ),
                      initialValue: '',
                      menuItems: [MenuItemModel('', '')],
                      onChanged: (value) {
                        // TODO: Complete implementation
                      },
                      formControlName: 'product',
                    ),
                    DigitTableCard(
                      element: {
                        localizations.translate(i18.stockReconciliationDetails
                            .dateOfReconciliation): "6 July 2022",
                      },
                    ),
                    const DigitDivider(),
                    DigitTableCard(
                      element: {
                        localizations.translate(
                          i18.stockReconciliationDetails.stockReceived,
                        ): "234",
                      },
                    ),
                    const DigitDivider(),
                    DigitTableCard(
                      element: {
                        localizations.translate(
                          i18.stockReconciliationDetails.stockIssued,
                        ): "200",
                      },
                    ),
                    const DigitDivider(),
                    DigitTableCard(
                      element: {
                        localizations.translate(
                          i18.stockReconciliationDetails.stockReturned,
                        ): "16",
                      },
                    ),
                    const DigitDivider(),
                    DigitTableCard(
                      element: {
                        localizations.translate(
                          i18.stockReconciliationDetails.stockLost,
                        ): "50",
                      },
                    ),
                    const DigitDivider(),
                    DigitTableCard(
                      element: {
                        localizations.translate(
                          i18.stockReconciliationDetails.stockDamaged,
                        ): "50",
                      },
                    ),
                    const DigitDivider(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DigitTableCard(
                              element: {
                                localizations.translate(
                                  i18.stockReconciliationDetails.stockOnHand,
                                ): "50",
                              },
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
                              color: theme.colorScheme.tertiaryContainer,
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
                                        color: theme
                                            .colorScheme.onTertiaryContainer,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Info',
                                          style: theme.textTheme.headlineMedium,
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
