import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:registration_delivery/models/entities/task.dart';

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
    registerFallbackValue(RegistrationDeliveryTestConstants.testTaskModel);
    registerFallbackValue(
        RegistrationDeliveryTestConstants.testTaskSearchModel);
    registerFallbackValue(RegistrationDeliveryTestConstants.testBoundary);
  });

  // Test case for _handleSubmit event
  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with loading true, DeliverInterventionState with taskModel] when _handleSubmit is called',
    build: () {
      when(() => mockTaskRepository.create(any())).thenAnswer((task) async {
        final taskModel = task.positionalArguments[0] as TaskModel;
        if (taskModel.clientReferenceId ==
            RegistrationDeliveryTestConstants.testTaskModel.clientReferenceId) {
          return taskModel;
        } else {
          return RegistrationDeliveryTestConstants.testTaskModel;
        }
      });
      return deliverInterventionBloc;
    },
    act: (bloc) => bloc.add(DeliverInterventionSubmitEvent(
      task: RegistrationDeliveryTestConstants.testTaskModel,
      boundaryModel: RegistrationDeliveryTestConstants.testBoundary,
      isEditing: false,
    )),
    expect: () => [
      const DeliverInterventionState(
          loading: true, oldTask: null, futureTask: null),
      DeliverInterventionState(
          loading: true,
          oldTask: RegistrationDeliveryTestConstants.testTaskModel,
          futureTask: null),
      const DeliverInterventionState(loading: false).copyWith(
          tasks: null,
          futureTask: null,
          futureDeliveries: null,
          oldTask: RegistrationDeliveryTestConstants.testTaskModel),
    ],
  );

  // Test case for _handleSearch event
  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with loading true, DeliverInterventionState with loading true and oldTask, DeliverInterventionState with loading false and oldTask] when _handleSearch is called',
    build: () {
      when(() => mockTaskRepository.search(any())).thenAnswer((task) async {
        final taskSearchModel = task.positionalArguments[0] as TaskSearchModel;
        if (taskSearchModel.clientReferenceId!.contains(
            RegistrationDeliveryTestConstants
                .testTaskModel.clientReferenceId)) {
          return [RegistrationDeliveryTestConstants.testTaskModel];
        } else {
          return [];
        }
      });
      return deliverInterventionBloc;
    },
    act: (bloc) => bloc.add(DeliverInterventionSearchEvent(
      taskSearch: RegistrationDeliveryTestConstants.testTaskSearchModel,
    )),
    expect: () => [
      const DeliverInterventionState(
          loading: true, oldTask: null, tasks: null, futureTask: null),
      DeliverInterventionState(
        loading: true,
        tasks: [RegistrationDeliveryTestConstants.testTaskModel],
        oldTask: null,
        futureTask: [],
      ),
      DeliverInterventionState(
        loading: false,
        tasks: [RegistrationDeliveryTestConstants.testTaskModel],
        oldTask: null,
        futureTask: [],
      ),
    ],
  );

  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with cycle and dose] when setActiveCycleDose is called',
    build: () => deliverInterventionBloc,
    act: (bloc) => bloc.add(DeliverInterventionActiveCycleDoseSelectionEvent(
      lastDose: RegistrationDeliveryTestConstants.lastDose,
      lastCycle: RegistrationDeliveryTestConstants.lastCycle,
      projectType: RegistrationDeliveryTestConstants.projectTypeModel,
      individualModel: RegistrationDeliveryTestConstants.individualModel,
    )),
    expect: () => [
      DeliverInterventionState(
        cycle: RegistrationDeliveryTestConstants.lastCycle,
        dose: RegistrationDeliveryTestConstants.lastDose,
        hasCycleArrived: false,
        pastCycles: null,
      ),
    ],
  );

  blocTest<DeliverInterventionBloc, DeliverInterventionState>(
    'emits [DeliverInterventionState with futureDeliveries] when selectFutureCycleDose is called',
    build: () => deliverInterventionBloc,
    act: (bloc) => bloc.add(DeliverInterventionCycleFutureDoseSelectionEvent(
      dose: RegistrationDeliveryTestConstants.lastDose,
      cycle: RegistrationDeliveryTestConstants.projectCycle,
      individualModel: RegistrationDeliveryTestConstants.individualModel,
    )),
    expect: () => [
      DeliverInterventionState(
        loading: true,
        isEditing: false,
        cycle: RegistrationDeliveryTestConstants.lastCycle,
        dose: RegistrationDeliveryTestConstants.lastDose,
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
        cycle: RegistrationDeliveryTestConstants.lastCycle,
        dose: RegistrationDeliveryTestConstants.lastDose,
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
