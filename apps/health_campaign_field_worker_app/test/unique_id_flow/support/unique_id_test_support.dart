// Shared harness for the unique-ID flow characterization tests (T1-T9).
//
// Everything here describes today's code; nothing in production is changed
// to make these tests pass.
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/data_model.init.dart' as data_model_mappers;
import 'package:digit_data_model/models/entities/id_status.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../widget_app.dart';

typedef UniqueIdPoolRepo
    = LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>;

class MockUniqueIdPoolRepo extends Mock implements UniqueIdPoolRepo {}

const String unAssigned = 'UN_ASSIGNED';
const String assigned = 'ASSIGNED';

/// One-time setup: entity mappers, the function registry (only `register`
/// calls, so re-running it is harmless) and mocktail fallback values.
void setUpUniqueIdFlow() {
  TestWidgetsFlutterBinding.ensureInitialized();
  data_model_mappers.initializeMappers();
  initializeFunctionRegistry();
  registerFallbackValue(UniqueIdPoolSearchModel());
  registerFallbackValue(poolRow('fallback'));
}

/// Clears the registry map AND `_instanceIds` (clearAll keeps the notifiers).
void resetRegistry() => FlowCrudStateRegistry().disposeAll();

/// A pool row as the local repository would return it.
UniqueIdPoolModel poolRow(
  String id, {
  String status = unAssigned,
  String userUuid = 'U1',
  int createdTime = 1000,
}) {
  return UniqueIdPoolModel(
    id: id,
    status: status,
    userUuid: userUuid,
    deviceUuid: 'D1',
    tenantId: 'default',
    auditDetails: AuditDetails(createdBy: userUuid, createdTime: createdTime),
  );
}

/// An individual carrying exactly one identifier.
IndividualModel individualWith({
  String identifierType = 'UNIQUE_BENEFICIARY_ID',
  String? identifierId = 'SMC-0001',
  String clientReferenceId = 'ind-1',
}) {
  return IndividualModel(
    clientReferenceId: clientReferenceId,
    identifiers: [
      IdentifierModel(
        clientReferenceId: 'idf-$clientReferenceId',
        individualClientReferenceId: clientReferenceId,
        identifierType: identifierType,
        identifierId: identifierId,
      ),
    ],
  );
}

/// The state the search screen holds after the loader ran and the user typed:
/// widget data (ID, count, search bar), results and form data.
FlowCrudState seededSearchState({
  String searchBar = 'John',
  int count = 40,
  String latestId = 'SMC-0001',
  List<dynamic>? results,
  Map<String, dynamic>? formData,
}) {
  return FlowCrudState(
    stateWrapper: results ?? const [{'household': 'hh-1'}],
    formData: formData ?? const {'nameOfIndividual': 'John'},
    widgetData: {
      'searchBar': searchBar,
      'uniqueIdPoolCount': count,
      'latestBeneficiaryId': latestId,
    },
  );
}

/// The map `WidgetStateContext.evalContext` builds for a footer button.
Map<String, dynamic> evalContextWith({
  Map<String, dynamic> widgetData = const {},
  Map<String, dynamic> formData = const {},
}) {
  return {
    'itemData': null,
    'parentData': null,
    'contextData': null,
    'formData': formData,
    'widgetData': widgetData,
    'item': null,
  };
}

/// FlowBuilderSingleton.setInitialData with the full argument list.
void setSingleton({
  String userUuid = 'U1',
  int? minCount,
}) {
  FlowBuilderSingleton().setInitialData(
    loggedInUserUuid: userUuid,
    maxRadius: 0,
    projectId: 'P1',
    selectedBeneficiaryType: BeneficiaryType.household,
    projectType: null,
    selectedProject: ProjectModel(id: 'P1', name: 'Project'),
    loggedInUser: UserModel(uuid: userUuid),
    beneficiaryIdMinCount: minCount,
  );
}

/// There is no reset on the singleton: call setInitialData again with nulls
/// (and empty placeholders for the non-nullable required arguments).
void resetSingleton() {
  FlowBuilderSingleton().setInitialData(
    loggedInUserUuid: '',
    maxRadius: 0,
    projectId: '',
    selectedBeneficiaryType: BeneficiaryType.household,
    projectType: null,
    selectedProject: ProjectModel(id: '', name: ''),
    loggedInUser: null,
    beneficiaryIdMinCount: null,
  );
}

/// Pumps WidgetApp (+ optional RepositoryProvider) and returns a BuildContext
/// below it, which is what the executors receive.
Future<BuildContext> pumpContext(
  WidgetTester tester, {
  UniqueIdPoolRepo? repo,
}) async {
  late BuildContext captured;
  Widget child = Builder(
    builder: (context) {
      captured = context;
      return const SizedBox.shrink();
    },
  );
  if (repo != null) {
    child = RepositoryProvider<UniqueIdPoolRepo>.value(
      value: repo,
      child: child,
    );
  }
  await tester.pumpWidget(WidgetApp(child: child));
  return captured;
}

String idStatusValue(IdStatus status) => status.toValue();
