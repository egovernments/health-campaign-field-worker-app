import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_portal/flutter_portal.dart';
import '../blocs/boundary/boundary.dart';
import '../blocs/household_details/household_details.dart';
import '../blocs/sync/sync.dart';
import '../data/local_store/no_sql/schema/oplog.dart';
import '../models/data_model.dart';
import '../utils/utils.dart';
import '../widgets/sidebar/side_bar.dart';

class AuthenticatedPageWrapper extends StatefulWidget {
  const AuthenticatedPageWrapper({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AuthenticatedPageWrapperState();
  }
}

class AuthenticatedPageWrapperState extends State<AuthenticatedPageWrapper> {
  @override
  Widget build(BuildContext context) {
    OverlayEntry? overlayEntry;

    void removeHighlightOverlay() {
      overlayEntry?.remove();
      overlayEntry = null;
    }

    void createHighlightOverlay({
      required AlignmentDirectional alignment,
      required Color borderColor,
      required List<BoundaryModel> boundaryList,
      required List<String> boundaryMapperList,
    }) {
      // Remove the existing OverlayEntry.

      overlayEntry = OverlayEntry(
        // Create a new OverlayEntry.
        builder: (BuildContext context) {
          String selectedValue = '';

          String r = "TAU L1 V2";
          print(r.contains('TAU L2'));

          print(boundaryList.length);

          // Align is used to position the highlRight overlay
          // relative to the NavigationBar destination.
          return ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) {
              form.addAll(
                Map.fromEntries(
                  boundaryMapperList.map(
                    (e) => MapEntry(
                      e,
                      FormControl<String>(),
                    ),
                  ),
                ),
              );

              return Positioned(
                top: 100.0,
                left: 100.0,
                child: Material(
                  child: SafeArea(
                    child: Align(
                      alignment: alignment,
                      heightFactor: 1.0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 3.5,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...boundaryMapperList
                                    .map((e) => DigitDropdown<String>(
                                          label: e,
                                          menuItems: boundaryList
                                              .where((ele) =>
                                                  form.control(e).value != null
                                                      ? ele.label == e &&
                                                          ele.name
                                                              .toString()
                                                              .contains(form
                                                                  .control(e)
                                                                  .value
                                                                  .toString())
                                                      : ele.label == e)
                                              .toList()
                                              .map((ele) => ele.name.toString())
                                              .toList()
                                              .toSet()
                                              .toList(),
                                          formControlName: e,
                                          valueMapper: (value) => value,
                                          onChanged: (value) {
                                            (boundaryMapperList.forEach((item) {
                                              if (e == item) {
                                                (form.control(item).value =
                                                    value);
                                                print(
                                                  form.control(item).value,
                                                );
                                              }
                                              // setDropDownState(() =>
                                              //     selectedValue = value);
                                            }));
                                          },
                                        ))
                                    .toList(),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: ReactiveFormConsumer(
                                    builder: (context, form, child) =>
                                        DigitElevatedButton(
                                      onPressed: () {
                                        String selectedBoundary = '';
                                        (boundaryMapperList.forEach((item) {
                                          if (form.control(item).value !=
                                              null) {
                                            selectedBoundary =
                                                form.control(item).value;
                                          }
                                        }));

                                        if (selectedBoundary != '') {
                                          context
                                              .read<BoundaryBloc>()
                                              .add(BoundaryEvent.select(
                                                selectedBoundary:
                                                    selectedBoundary,
                                              ));
                                        }
                                      },
                                      child: const Text('Submit'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
      NavigatorState navigator = Navigator.of(context, rootNavigator: true);
      // Add the OverlayEntry to the Overlay.
      navigator.overlay?.insert(overlayEntry!);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<BoundaryBloc, BoundaryState>(
            listener: (ctx, state) {
              state.maybeWhen(
                orElse: () {},
                loading: () {
                  Loaders.showLoadingDialog(context);
                },
                fetched: (boundaryList, boundaryMapperList, selectedBoundary) {
                  if (boundaryList.isEmpty) return;
                },
              );
            },
            builder: (context, boundaryState) {
              return TextButton(
                onPressed: () {
                  // removeHighlightOverlay();

                  boundaryState.maybeWhen(
                    fetched:
                        (value, boundaryMapperList, selectedBoundary) async {
                      print(selectedBoundary);
                      await Future.delayed(const Duration(seconds: 3));
                      createHighlightOverlay(
                        alignment: AlignmentDirectional.topCenter,
                        borderColor: Colors.red,
                        boundaryList: value,
                        boundaryMapperList: boundaryMapperList,
                      );
                      if (selectedBoundary != null) {
                        // NavigatorState navigator =
                        //     Navigator.of(context, rootNavigator: true);
                        // // Add the OverlayEntry to the Overlay.
                        // navigator.overlay != null;
                        // removeHighlightOverlay();
                      }
                    },
                    orElse: () {},
                  );
                },
                child: const Text('Selected Amistrative Area'),
              );
            },
          ),
        ],
      ),
      drawer: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight * 1.36),
        child: const Drawer(child: SideBar()),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final userId = context.loggedInUserUuid;

              final isar = context.read<Isar>();
              final bloc = SyncBloc(
                isar: isar,
                networkManager: context.read(),
              )..add(SyncRefreshEvent(userId));

              isar.opLogs
                  .filter()
                  .createdByEqualTo(userId)
                  .isSyncedEqualTo(false)
                  .watch()
                  .listen(
                (event) {
                  bloc.add(
                    SyncRefreshEvent(
                      userId,
                      event.where((element) {
                        switch (element.entityType) {
                          case DataModelType.household:
                          case DataModelType.individual:
                          case DataModelType.task:
                          case DataModelType.householdMember:
                          case DataModelType.projectBeneficiary:
                          case DataModelType.stock:
                          case DataModelType.stockReconciliation:
                          case DataModelType.service:
                            return true;
                          default:
                            return false;
                        }
                      }).length,
                    ),
                  );
                },
              );

              return bloc;
            },
          ),
          BlocProvider(
            create: (_) => LocationBloc(location: Location())
              ..add(const LoadLocationEvent()),
          ),
          BlocProvider(
            create: (_) => HouseholdDetailsBloc(const HouseholdDetailsState()),
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }

  FormGroup buildForm() => fb.group({});
}
