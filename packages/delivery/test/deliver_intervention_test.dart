import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:delivery/models/entities/task.dart';

import 'constants/test_constants.dart';

class MockTaskRepository extends Mock
    implements DataRepository<TaskModel, TaskSearchModel> {}

void main() {
  late MockTaskRepository mockTaskRepository;
  late DeliverInterventionBloc deliverInterventionBloc;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    deliverInterventionBloc = DeliverInterventionBloc(
      const DeliverInterventionState(isEditing: false),
      taskRepository: mockTaskRepository,
    );
  });

  setUpAll(() {
    registerFallbackValue(DeliveryTestConstants.testTaskModel);
    registerFallbackValue(
        DeliveryTestConstants.testTaskSearchModel);
    registerFallbackValue(DeliveryTestConstants.testBoundary);
  });

  // Test case for _handleSubmit event
  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with loading true, DeliverInterventionState with taskModel] when _handleSubmit is called',
    build: () {
      when(() => mockTaskRepository.create(any())).thenAnswer((task) async {
        final taskModel = task.positionalArguments[0] as TaskModel;
        if (taskModel.clientReferenceId ==
            DeliveryTestConstants.testTaskModel.clientReferenceId) {
          return taskModel;
        } else {
          return DeliveryTestConstants.testTaskModel;
        }
      });
      return deliverInterventionBloc;
    },
    act: (bloc) => bloc.add(DeliverInterventionSubmitEvent(
      task: DeliveryTestConstants.testTaskModel,
      boundaryModel: DeliveryTestConstants.testBoundary,
      isEditing: false,
    )),
    expect: () => [
      const DeliverInterventionState(
          loading: true, oldTask: null, futureTask: null),
      DeliverInterventionState(
          loading: true,
          oldTask: DeliveryTestConstants.testTaskModel,
          futureTask: null),
      const DeliverInterventionState(loading: false).copyWith(
          tasks: null,
          futureTask: null,
          futureDeliveries: null,
          oldTask: DeliveryTestConstants.testTaskModel),
    ],
  );

  // Test case for _handleSearch event
  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with loading true, DeliverInterventionState with loading true and oldTask, DeliverInterventionState with loading false and oldTask] when _handleSearch is called',
    build: () {
      when(() => mockTaskRepository.search(any())).thenAnswer((task) async {
        final taskSearchModel = task.positionalArguments[0] as TaskSearchModel;
        if (taskSearchModel.clientReferenceId!.contains(
            DeliveryTestConstants
                .testTaskModel.clientReferenceId)) {
          return [DeliveryTestConstants.testTaskModel];
        } else {
          return [];
        }
      });
      return deliverInterventionBloc;
    },
    act: (bloc) => bloc.add(DeliverInterventionSearchEvent(
      taskSearch: DeliveryTestConstants.testTaskSearchModel,
    )),
    expect: () => [
      const DeliverInterventionState(
          loading: true, oldTask: null, tasks: null, futureTask: null),
      DeliverInterventionState(
        loading: true,
        tasks: [DeliveryTestConstants.testTaskModel],
        oldTask: null,
        futureTask: [],
      ),
      DeliverInterventionState(
        loading: false,
        tasks: [DeliveryTestConstants.testTaskModel],
        oldTask: null,
        futureTask: [],
      ),
    ],
  );

  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with cycle and dose] when setActiveCycleDose is called',
    build: () => deliverInterventionBloc,
    act: (bloc) => bloc.add(DeliverInterventionActiveCycleDoseSelectionEvent(
      lastDose: DeliveryTestConstants.lastDose,
      lastCycle: DeliveryTestConstants.lastCycle,
      projectType: DeliveryTestConstants.projectTypeModel,
      individualModel: DeliveryTestConstants.individualModel,
    )),
    expect: () => [
      DeliverInterventionState(
        cycle: DeliveryTestConstants.lastCycle,
        dose: DeliveryTestConstants.lastDose,
        hasCycleArrived: false,
        pastCycles: null,
      ),
    ],
  );

  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with futureDeliveries] when selectFutureCycleDose is called',
    build: () => deliverInterventionBloc,
    act: (bloc) => bloc.add(DeliverInterventionCycleFutureDoseSelectionEvent(
      dose: DeliveryTestConstants.lastDose,
      cycle: DeliveryTestConstants.projectCycle,
      individualModel: DeliveryTestConstants.individualModel,
    )),
    expect: () => [
      DeliverInterventionState(
        loading: true,
        isEditing: false,
        cycle: DeliveryTestConstants.lastCycle,
        dose: DeliveryTestConstants.lastDose,
        pastCycles: null,
        hasCycleArrived: true,
        isLastDoseOfCycle: false,
        tasks: null,
        futureDeliveries: null,
        futureTask: null,
        oldTask: null,
      ),
      DeliverInterventionState(
        loading: false,
        isEditing: false,
        cycle: DeliveryTestConstants.lastCycle,
        dose: DeliveryTestConstants.lastDose,
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