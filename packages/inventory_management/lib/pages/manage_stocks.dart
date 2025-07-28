import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/enitty_create/entity_create.dart';
import 'package:inventory_management/data/repositories/transforms_config.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/facility_card.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/record_stock.dart';
import '../widgets/back_navigation_help_header.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/router/forms_router.gm.dart';
import 'package:form_data_transformer/src/transformer_service.dart';

@RoutePage()
class ManageStocksPage extends LocalizedStatefulWidget {
  const ManageStocksPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ManageStocksPage> createState() => ManageStocksPageState();
}

class ManageStocksPageState extends LocalizedState<ManageStocksPage> {
  @override
  initState() {
    final schemas = [
      InventorySingleton().manageStockConfig,
    ]
        .where((s) =>
            s != null &&
            s.trim().isNotEmpty &&
            s.trim().toLowerCase() != 'null')
        .cast<String>()
        .toList();

    if (schemas.isNotEmpty) {
      context.read<FormsBloc>().add(FormsEvent.load(schemas: schemas));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageKey = ManageStocksRoute.name.replaceAll('Route', '');
    final manageStockTemplate = InventorySingleton().templateConfigs?[pageKey];

    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocListener<EntityCreateBloc, EntityCreateState>(
      listener: (context, createState) {
        if (createState is EntityCreateLoadingState) {
        } else if (createState is EntityCreatePersistedState) {
          Navigator.of(context, rootNavigator: true).pop();

          final currentSchema = context
              .read<FormsBloc>()
              .state
              .cachedSchemas[context.read<FormsBloc>().state.activeSchemaKey];

          // Reset to prevent re-handling
          context.read<FormsBloc>().add(
                const FormsEvent.clearForm(
                    schemaKey: 'MANAGESTOCK'), // or create a FormsResetEvent
              );

          final pages = currentSchema?.pages.entries.toList()
            ?..sort(
                (a, b) => (a.value.order ?? 0).compareTo(b.value.order ?? 0));

          final lastPage = pages?.isNotEmpty == true ? pages!.last.value : null;

          final nextAction = lastPage?.navigateTo;
          if (nextAction != null) {
            if (nextAction.type == 'template') {
              final nextPath = routerMap[nextAction.name];
              if (nextPath != null) {
                context.router.push(nextPath);
              }
            } else {
              if (nextAction.name == 'MANAGESTOCK') {
                final pageName = context
                    .read<FormsBloc>()
                    .state
                    .cachedSchemas['MANAGESTOCK']
                    ?.pages
                    .entries
                    .first
                    .key;

                if (pageName == null) {
                  Toast.showToast(
                    context,
                    message: localizations
                        .translate('NO_FORM_FOUND_FOR_REGISTRATION'),
                    type: ToastType.error,
                  );
                } else {
                  context.router.push(FormsRenderRoute(
                      currentSchemaKey: 'MANAGESTOCK',
                      pageName: pageName,
                      defaultValues: {
                        'locality': localizations.translate(
                            InventorySingleton().boundary?.code ?? '')
                      }));
                }
              } else {
                final pageName = context
                    .read<FormsBloc>()
                    .state
                    .cachedSchemas['MANAGESTOCK']
                    ?.pages
                    .entries
                    .first
                    .key;

                if (pageName == null) {
                  Toast.showToast(
                    context,
                    message:
                        localizations.translate('NO_FORM_FOUND_FOR_DELIVERY'),
                    type: ToastType.error,
                  );
                } else {
                  context.router.push(FormsRenderRoute(
                    currentSchemaKey: 'MANAGESTOCK',
                    pageName: pageName,
                    defaultValues: {
                      'locality': localizations
                          .translate(InventorySingleton().boundary?.code ?? '')
                    },
                    customComponents: const [
                      //{'resourceCard': ResourceCard()}
                    ],
                  ));
                }
              }
            }
          } else {
            context.router
                .push(InventoryAcknowledgementRoute()); // fallback page
          }
        } else if (createState is EntityCreateErrorState) {
          Navigator.of(context, rootNavigator: true).pop();
          // Reset to prevent re-handling
          // context.read<FormsBloc>().add(
          //       const FormsEvent.clearForm(
          //           schemaKey:
          //               'REGISTRATIONFLOW'), // or create a FormsResetEvent
          //     );
          // context.router
          //     .push(BeneficiaryErrorRoute(enableViewHousehold: false));
          // if (kDebugMode) {
          //   print(createState.message);
          // }
        }
      },
      child: BlocListener<FormsBloc, FormsState>(
        listener: (context, formState) {
          if (formState is FormsSubmittedState) {
            DigitLoaders.overlayLoader(context: context);

            final formData = formState.formData;
            if (formData.isEmpty) return;

            try {
              final modelsConfig = (jsonConfig['stockManagement']?['models']
                  as Map<String, dynamic>);

              final fallBackModel =
                  (jsonConfig['stockManagement']?['fallbackModel'] as String?);

              final formEntityMapper = FormEntityMapper(config: jsonConfig);

              // final householdMember =
              //     blocWrapper.state.householdMembers.firstOrNull;
              // final household = householdMember?.household?.toMap();
              // final projectBeneficiary =
              //     householdMember?.projectBeneficiaries?.firstOrNull?.toMap();

              final entities = formEntityMapper.mapFormToEntities(
                formValues: formData,
                modelsConfig: modelsConfig,
                context: {
                  "tenantId": InventorySingleton().tenantId,
                  "userUUID": InventorySingleton().loggedInUserUuid,
                },
                fallbackFormDataString: fallBackModel,
              );

              print(entities);

              context.read<EntityCreateBloc>().add(
                    EntityCreateEvent.create(entities: entities),
                  );
            } catch (e) {
              Navigator.of(context, rootNavigator: true).pop();
              // Reset to prevent re-handling
              context.read<FormsBloc>().add(
                    const FormsEvent.clearForm(
                        schemaKey:
                            'MANAGESTOCK'), // or create a FormsResetEvent
                  );
              //TODO ::: to check later
              // context.router
              //     .push(BeneficiaryErrorRoute(enableViewHousehold: false));
              print('Error: $e');
            }
          }
        },
        child: Scaffold(
          body: ScrollableContent(
            header: const BackNavigationHelpHeaderWidget(
              showHelp: false,
            ),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: spacer2,
                        right: spacer2,
                        bottom: spacer4,
                        top: spacer4),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        localizations.translate(
                          localizations.translate(i18.manageStock.label),
                        ),
                        style: textTheme.headingXl,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: spacer2, right: spacer2),
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 0.94 * MediaQuery.of(context).size.width,
                            child: MenuCard(
                              heading: localizations.translate(
                                  i18.manageStock.recordStockReceiptLabel),
                              description: insertNewlines(
                                  localizations.translate(i18.manageStock
                                      .recordStockReceiptDescription)),
                              icon: Icons.file_download_outlined,
                              onTap: () {
                                showStockReceiptDialog(context);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 16,
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              showStockReceiptDialog(context);
                            },
                            child: Icon(
                              Icons.arrow_circle_right,
                              color: Colors.orange[800],
                              size: Base.height,
                            ),
                          )),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: spacer4,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: spacer2, right: spacer2),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 0.94 * MediaQuery.of(context).size.width,
                              child: MenuCard(
                                  heading: localizations.translate(
                                      i18.manageStock.recordStockIssuedLabel),
                                  description: insertNewlines(
                                      localizations.translate(i18.manageStock
                                          .recordStockIssuedDescription)),
                                  icon: Icons.file_upload_outlined,
                                  onTap: () {
                                    showStockIssueDialog(context);
                                  }),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 16,
                            child: Center(
                                child: GestureDetector(
                              onTap: () {
                                showStockIssueDialog(context);
                              },
                              child: Icon(
                                Icons.arrow_circle_right,
                                color: Colors.orange[800],
                                size: Base.height,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: spacer4,
                    ),
                    if (!InventorySingleton().isCDD)
                      Padding(
                        padding: const EdgeInsets.only(
                            left: spacer2, right: spacer2),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 0.94 * MediaQuery.of(context).size.width,
                                child: MenuCard(
                                    heading: localizations.translate(i18
                                        .manageStock.recordStockReturnedLabel),
                                    description: insertNewlines(
                                      localizations.translate(
                                        "i18.stockDetails.recordStockReturnedDescription",
                                      ),
                                    ),
                                    icon: Icons.settings_backup_restore,
                                    onTap: () {
                                      showStockReturnDialog(context);
                                    }),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 16,
                              child: Center(
                                  child: GestureDetector(
                                onTap: () {
                                  showStockReturnDialog(context);
                                },
                                child: Icon(
                                  Icons.arrow_circle_right,
                                  color: Colors.orange[800],
                                  size: Base.height,
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                  ]),
                  const SizedBox(height: spacer4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showStockReceiptDialog(BuildContext context) {
    //TODO:: added config for receipt

    showDialog(
        context: context,
        builder: (dContext) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: by pitabash
                    final state = context.read<FormsBloc>().state;

                    context.read<FormsBloc>().add(
                        const FormsEvent.clearForm(schemaKey: 'MANAGESTOCK'));

                    final pageName = context
                        .read<FormsBloc>()
                        .state
                        .cachedSchemas['MANAGESTOCK']
                        ?.pages
                        .entries
                        .first
                        .key;

                    if (pageName == null) {
                      Toast.showToast(
                        context,
                        message: localizations
                            .translate('NO_FORM_FOUND_FOR_REGISTRATION'),
                        type: ToastType.error,
                      );
                    } else {
                      context.router.push(FormsRenderRoute(
                        currentSchemaKey: 'MANAGESTOCK',
                        pageName: pageName,
                        defaultValues: {
                          'locality': localizations.translate(
                              InventorySingleton().boundary?.code ?? ''),
                          'type': StockRecordEntryType.receipt
                        },
                        customComponents: const [
                          {'facilityId': FacilityInput()}
                        ],
                      ));
                    }
                    Navigator.of(dContext).pop();
// end
                    // todo commenting the code to remove qr scanner mandatorily
                    // if (InventorySingleton().isDistributor) {
                    //   context.router.push(QRScannerRoute());
                    //   Navigator.of(context).pop();
                    // } else {

                    //TODO:: commented to use formengine by pitabash
//                     context.router.push(
//                       RecordStockWrapperRoute(
//                         type: StockRecordEntryType.receipt,
//                       ),
//                     );
// //end
//                     Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange[800]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_note_outlined,
                            size: 24,
                            color: Colors.orange[800],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Create New Transaction",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Add spacing between buttons
                GestureDetector(
                  onTap: () {
                    //TODO:
                    context.router.push(
                      MinNumberRoute(
                        type: StockRecordEntryType.receipt,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange[800]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            size: 24,
                            color: Colors.orange[800],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "View Created Transaction",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showStockIssueDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.push(
                      RecordStockWrapperRoute(
                        type: StockRecordEntryType.dispatch,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange[800]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_note_outlined,
                            size: 24,
                            color: Colors.orange[800],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Create New Transaction",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Add spacing between buttons
                GestureDetector(
                  onTap: () {
                    //TODO:
                    context.router.push(
                      MinNumberRoute(
                        type: StockRecordEntryType.dispatch,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange[800]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            size: 24,
                            color: Colors.orange[800],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "View Created Transaction",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showStockReturnDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.push(
                      RecordStockWrapperRoute(
                        type: StockRecordEntryType.returned,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange[800]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_note_outlined,
                            size: 24,
                            color: Colors.orange[800],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Create New Transaction",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // TODO:
                    context.router.push(
                      MinNumberRoute(
                        type: StockRecordEntryType.returned,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange[800]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            size: 24,
                            color: Colors.orange[800],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "View Created Transaction",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  String insertNewlines(String text) {
    int charLimit = 0.94 * MediaQuery.of(context).size.width ~/ 8;
    // 8 is the average character width

    final words = text.split(' ');
    final buffer = StringBuffer();

    int currentLineLength = 0;

    for (var word in words) {
      // +1 for the space that follows the word
      if (currentLineLength + word.length + 1 > charLimit) {
        buffer.write('\n');
        currentLineLength = 0;
      } else if (buffer.isNotEmpty) {
        buffer.write(' ');
        currentLineLength += 1;
      }

      buffer.write(word);
      currentLineLength += word.length;
    }

    return buffer.toString();
  }
}
