// Importing necessary packages and modules
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/utils/typedefs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_data_model/data_model.dart';

import '../constants/test_constants.dart';

// Mock class for StockRepository
class MockStockDataRepository extends Mock implements StockDataRepository {}

class MockStockReconciliationDataRepository extends Mock
    implements StockReconciliationDataRepository {}

class MockFacilityModel extends Mock implements FacilityModel {
  @override
  String get id => InventoryReportConstants.facilityId;
}

void main() {
  late MockFacilityModel mockFacilityModel;

  // Setting up the test environment
  setUpAll(() {
    // Initializing the entryType and projectId
    mockFacilityModel = MockFacilityModel();
  });

  // Grouping tests related to RecordStockBloc
  group('RecordStockBloc', () {
    // Setting up the mock and the bloc for each test
    setUp(() {});

    // Test for saveWarehouseDetails event
    blocTest<RecordStockBloc, RecordStockState>(
      'emits updated state with warehouse details when saveWarehouseDetails event is added',
      build: () => RecordStockBloc(
        stockRepository: MockStockDataRepository(),
        const RecordStockState.create(
            entryType: InventoryReportConstants.entryType,
            projectId: InventoryReportConstants.projectId),
      ),
      act: (bloc) => bloc.add(RecordStockEvent.saveWarehouseDetails(
          dateOfRecord: InventoryReportConstants.dateOfRecord,
          facilityModel: mockFacilityModel)),
      // Expecting the bloc to emit a state with the saved warehouse details
      expect: () => <RecordStockState>[
        RecordStockState.create(
          entryType: InventoryReportConstants.entryType,
          projectId: InventoryReportConstants.projectId,
          dateOfRecord: InventoryReportConstants.dateOfRecord,
          facilityModel: mockFacilityModel,
        ),
      ],
    );

    // Test for saveStockDetails event
    blocTest<RecordStockBloc, RecordStockState>(
      'emits updated state with stock details when saveStockDetails event is added',
      build: () => RecordStockBloc(
        stockRepository: MockStockDataRepository(),
        const RecordStockState.create(
            entryType: InventoryReportConstants.entryType,
            projectId: InventoryReportConstants.projectId),
      ),
      act: (bloc) => bloc.add(RecordStockEvent.saveStockDetails(
        stockModel: InventoryReportConstants.stockModel,
      )),
      // Expecting the bloc to emit a state with the saved stock details
      expect: () => <RecordStockState>[
        RecordStockState.create(
          entryType: InventoryReportConstants.entryType,
          projectId: InventoryReportConstants.projectId,
          stockModel: InventoryReportConstants.stockModel,
        ),
      ],
    );

    // Test for createStockEntry event
    blocTest<RecordStockBloc, RecordStockState>(
      'emits persisted state when createStockEntry event is added and stock details are saved successfully',
      build: () => RecordStockBloc(
        stockRepository: MockStockDataRepository(),
        RecordStockState.create(
          entryType: InventoryReportConstants.entryType,
          projectId: InventoryReportConstants.projectId,
          dateOfRecord: InventoryReportConstants.dateOfRecord,
          facilityModel: mockFacilityModel,
          stockModel: InventoryReportConstants.stockModel,
        ),
      ),
      act: (bloc) {
        bloc.add(const RecordStockEvent.createStockEntry());
      },
      // Expecting the bloc to emit a persisted state after the stock entry is created
      expect: () => <RecordStockState>[
        RecordStockState.create(
          loading: true,
          entryType: InventoryReportConstants.entryType,
          projectId: InventoryReportConstants.projectId,
          dateOfRecord: InventoryReportConstants.dateOfRecord,
          facilityModel: mockFacilityModel,
          stockModel: InventoryReportConstants.stockModel,
        ),
        RecordStockPersistedState(
          entryType: InventoryReportConstants.entryType,
          projectId: InventoryReportConstants.projectId,
          dateOfRecord: InventoryReportConstants.dateOfRecord,
          facilityModel: mockFacilityModel,
          stockModel: InventoryReportConstants.stockModel,
        ),
      ],
    );
  });
}
