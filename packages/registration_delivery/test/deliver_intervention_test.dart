import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:registration_delivery/models/entities/deliver_strategy_type.dart';
import 'package:registration_delivery/models/entities/task.dart';

class MockTaskRepository extends Mock
    implements DataRepository<TaskModel, TaskSearchModel> {}

void main() {
  late MockTaskRepository mockTaskRepository;
  late DeliverInterventionBloc deliverInterventionBloc;

  var testTaskModel = TaskModel(clientReferenceId: '123');
  var testTaskSearchModel = TaskSearchModel(clientReferenceId: ['123']);
  var testBoundaryModel = BoundaryModel(code: 'BAN005', name: 'HSR');

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    deliverInterventionBloc = DeliverInterventionBloc(
      const DeliverInterventionState(isEditing: false),
      taskRepository: mockTaskRepository,
    );
  });

  setUpAll(() {
    registerFallbackValue(TaskModel(clientReferenceId: '123'));
    registerFallbackValue(TaskSearchModel(clientReferenceId: ['123']));
    registerFallbackValue(BoundaryModel(code: 'BAN005', name: 'HSR'));
  });

  // Test case for _handleSubmit event
  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with loading true, DeliverInterventionState with taskModel] when _handleSubmit is called',
    build: () {
      when(() => mockTaskRepository.create(any())).thenAnswer((task) async {
        final taskModel = task.positionalArguments[0] as TaskModel;
        if (taskModel.clientReferenceId == '123') {
          return taskModel;
        } else {
          return testTaskModel;
        }
      });
      return deliverInterventionBloc;
    },
    act: (bloc) => bloc.add(DeliverInterventionSubmitEvent(
      task: testTaskModel,
      boundaryModel: testBoundaryModel,
      isEditing: false,
    )),
    expect: () => [
      const DeliverInterventionState(
          loading: true, oldTask: null, futureTask: null),
      DeliverInterventionState(
          loading: true, oldTask: testTaskModel, futureTask: null),
      const DeliverInterventionState(loading: false).copyWith(
          tasks: null,
          futureTask: null,
          futureDeliveries: null,
          oldTask: testTaskModel),
    ],
  );

  // Test case for _handleSearch event
  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with loading true, DeliverInterventionState with loading true and oldTask, DeliverInterventionState with loading false and oldTask] when _handleSearch is called',
    build: () {
      when(() => mockTaskRepository.search(any())).thenAnswer((task) async {
        final taskSearchModel = task.positionalArguments[0] as TaskSearchModel;
        if (taskSearchModel.clientReferenceId!.contains('123')) {
          return [testTaskModel];
        } else {
          return [];
        }
      });
      return deliverInterventionBloc;
    },
    act: (bloc) => bloc.add(DeliverInterventionSearchEvent(
      taskSearch: testTaskSearchModel,
    )),
    expect: () => [
      const DeliverInterventionState(
          loading: true, oldTask: null, tasks: null, futureTask: null),
      DeliverInterventionState(
        loading: true,
        tasks: [testTaskModel],
        oldTask: null,
        futureTask: [],
      ),
      DeliverInterventionState(
        loading: false,
        tasks: [testTaskModel],
        oldTask: null,
        futureTask: [],
      ),
    ],
  );

  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with cycle and dose] when setActiveCycleDose is called',
    build: () => deliverInterventionBloc,
    act: (bloc) => bloc.add(DeliverInterventionActiveCycleDoseSelectionEvent(
      lastDose: 1,
      lastCycle: 1,
      projectType: ProjectTypeModel(id: '1', name: 'Test'),
      individualModel: IndividualModel(clientReferenceId: '123'),
    )),
    expect: () => [
      const DeliverInterventionState(
        cycle: 1,
        dose: 1,
        hasCycleArrived: false,
        pastCycles: null,
      ),
    ],
  );

  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with futureDeliveries] when selectFutureCycleDose is called',
    build: () => deliverInterventionBloc,
    act: (bloc) => bloc.add(DeliverInterventionCycleFutureDoseSelectionEvent(
      dose: 1,
      cycle: ProjectCycle(
          id: 1,
          startDate: DateTime.now().day - 2,
          endDate: DateTime.now().day + 2),
      individualModel: IndividualModel(clientReferenceId: '123'),
    )),
    expect: () => [
      const DeliverInterventionState(
        loading: true,
        isEditing: false,
        cycle: 1,
        dose: 1,
        pastCycles: null,
        hasCycleArrived: true,
        isLastDoseOfCycle: false,
        tasks: null,
        futureDeliveries: null,
        futureTask: null,
        oldTask: null,
      ),
      const DeliverInterventionState(
        loading: false,
        isEditing: false,
        cycle: 1,
        dose: 1,
        pastCycles: null,
        hasCycleArrived: true,
        isLastDoseOfCycle: false,
        tasks: null,
        futureDeliveries: null,
        futureTask: null,
        oldTask: null,
      ),
    ],
  );
}
