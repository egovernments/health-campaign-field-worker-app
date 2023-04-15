import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/boundary/boundary.dart';
import '../blocs/household_details/household_details.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/sync/sync.dart';
import '../data/local_store/no_sql/schema/oplog.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
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
  bool visible = false;
  BoundaryModel? selectedBoundaryValue;
  List<BoundaryModel?> selectedBoundaryHierarchy = [];

  String selectedBoundaryCode = '';
  int random = 0;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: (Scaffold(
        appBar: AppBar(
          actions: [
            BlocConsumer<BoundaryBloc, BoundaryState>(
              listener: (ctx, state) {
                final boundaryList = state.boundaryList;
                final selectedBoundary = state.selectedBoundary;
                final boundaryMapperList = state.boundaryMapperList;

                if (boundaryList.isEmpty) return;

                if (selectedBoundary.isEmpty) {
                  setState(() {
                    visible = false;
                    for (var _ in boundaryMapperList) {
                      selectedBoundaryHierarchy.add(null);
                    }
                    selectedBoundaryHierarchy.add(null);
                  });
                }
              },
              builder: (context, boundaryState) {
                var i = -1;
                final boundaryList = boundaryState.boundaryList;
                final selectedBoundary = boundaryState.selectedBoundary;
                final boundaryMapperList = boundaryState.boundaryMapperList;

                return PortalTarget(
                  visible: visible,
                  portalFollower: DigitCard(
                    margin: const EdgeInsets.only(
                      top: kToolbarHeight * 2,
                    ),
                    child: ReactiveFormBuilder(
                      form: buildForm,
                      builder: (context, form, child) {
                        var k = -1;
                        form.addAll(
                          Map.fromEntries(
                            boundaryMapperList.map(
                              (e) {
                                k++;

                                return MapEntry(
                                  e,
                                  FormControl<BoundaryModel>(
                                    value: selectedBoundary.isEmpty
                                        ? null
                                        : selectedBoundary[k],
                                  ),
                                );
                              },
                            ),
                          ),
                        );

                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height / 4,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...boundaryMapperList.map((
                                    e,
                                  ) {
                                    return StatefulBuilder(
                                      builder: (contex, setBuiderState) {
                                        i++;

                                        return DigitDropdown<BoundaryModel>(
                                          label: e,
                                          menuItems: boundaryList
                                              .where(
                                                (ele) {
                                                  final code =
                                                      selectedBoundaryHierarchy[
                                                              i]
                                                          ?.code;

                                                  return code != null || i != 0
                                                      ? ele.label == e &&
                                                          ele.materializedPath!
                                                              .split('.')
                                                              .contains(code)
                                                      : ele.label == e;
                                                },
                                              )
                                              .toList()
                                              .map((ele) => ele)
                                              .toList()
                                              .toSet()
                                              .toList(),
                                          formControlName: e,
                                          valueMapper: (value) =>
                                              value.name ?? '',
                                          onChanged: (value) {
                                            final filteredValue =
                                                boundaryList.where(
                                              (ele) {
                                                return ele.code == value.code;
                                              },
                                            ).firstOrNull;

                                            for (var item
                                                in boundaryMapperList) {
                                              if (e == item) {
                                                selectedBoundaryHierarchy[
                                                    boundaryMapperList
                                                            .indexOf(e) +
                                                        1] = filteredValue;

                                                (form.control(item).value =
                                                    value);
                                                setBuiderState(() {
                                                  random = random + 1;
                                                });
                                              }

                                              final temp = filteredValue?.code;

                                              if (form
                                                      .control(
                                                        item,
                                                      )
                                                      .value !=
                                                  null) {
                                                setState(() {
                                                  selectedBoundaryValue =
                                                      filteredValue;
                                                  selectedBoundaryCode =
                                                      temp.toString();
                                                });
                                              }
                                            }
                                          },
                                        );
                                      },
                                    );
                                  }).toList(),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 16,
                                      bottom: 16,
                                    ),
                                    child: ReactiveFormConsumer(
                                      builder: (context, form, child) {
                                        final boundaryName =
                                            selectedBoundaryHierarchy
                                                .whereNotNull()
                                                .firstOrNull
                                                ?.name;

                                        final isSelected =
                                            boundaryName != null &&
                                                boundaryName.isNotEmpty;

                                        return DigitElevatedButton(
                                          onPressed: isSelected
                                              ? () {
                                                  context
                                                      .read<BoundaryBloc>()
                                                      .add(BoundaryEvent.select(
                                                        selectedBoundary:
                                                            selectedBoundaryHierarchy,
                                                      ));
                                                  setState(() {
                                                    visible = false;
                                                  });
                                                  context.router.replace(
                                                    HomeRoute(),
                                                  );
                                                }
                                              : null,
                                          child: const Text('Submit'),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // 3. Align the "follower" relative to the "child" anywhere you like

                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        visible = false;
                      });
                    },
                    child: Text(selectedBoundaryValue?.name ?? ''),
                  ),
                );
              },
            ),
          ],
        ),
        drawer:
            (context.router.currentUrl != '/${ProjectSelectionRoute().path}' &&
                    !visible)
                ? const Drawer(child: SideBar())
                : null,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) {
                return SearchHouseholdsBloc(
                  userUid: context.loggedInUserUuid,
                  projectId: context.projectId,
                  projectBeneficiary: context.repository<
                      ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(),
                  householdMember: context.repository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>(),
                  household: context
                      .repository<HouseholdModel, HouseholdSearchModel>(),
                  individual: context
                      .repository<IndividualModel, IndividualSearchModel>(),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(),
                )..add(const SearchHouseholdsClearEvent());
              },
            ),
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
                    .syncedUpEqualTo(false)
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
              create: (_) =>
                  HouseholdDetailsBloc(const HouseholdDetailsState()),
            ),
          ],
          child: const AutoRouter(),
        ),
      )),
    );
  }

  FormGroup buildForm() => fb.group({});
}
