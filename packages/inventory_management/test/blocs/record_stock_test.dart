// Importing necessary packages and modules
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for InventorySingleton
class MockInventorySingleton extends Mock implements InventorySingleton {
  // Mock method for saving stock details
  @override
  Future<bool?> saveStockDetails(SaveStockDetails details) async {
    return true;
  }
}

// Fake class for SaveStockDetails for testing
class SaveStockDetailsFake extends Fake implements SaveStockDetails {
  @override
  StockModel get stockModel =>
      StockModel(id: 'stock1', clientReferenceId: 'abc123');

  @override
  Map<String, Object> get additionalData => {'key': 'value'};

  @override
  Function(bool isStockSaved) get isStockSaved => (bool value) {};
}

void main() {
  // Setting up the test environment
  setUpAll(() {
    registerFallbackValue(SaveStockDetailsFake());
  });

  // Grouping tests related to RecordStockBloc
  group('RecordStockBloc', () {
    // Declaring variables for mock and bloc
    late MockInventorySingleton mockInventorySingleton;
    late RecordStockBloc recordStockBloc;

    // Setting up the mock and the bloc for each test
    setUp(() {
      mockInventorySingleton = MockInventorySingleton();
      recordStockBloc = RecordStockBloc(
          const RecordStockState.create(
              entryType: StockRecordEntryType.receipt, projectId: '1'),
          inventorySingleton: mockInventorySingleton);
    });

    // Test for saveWarehouseDetails event
    blocTest<RecordStockBloc, RecordStockState>(
      'emits updated state with warehouse details when saveWarehouseDetails event is added',
      build: () => RecordStockBloc(
          const RecordStockState.create(
              entryType: StockRecordEntryType.receipt, projectId: 'project1'),
          inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(RecordStockEvent.saveWarehouseDetails(
          dateOfRecord: DateTime(2024, 1, 1),
          facilityModel: InventoryFacilityModel(id: 'facility1'))),
      // Expecting the bloc to emit a state with the saved warehouse details
      expect: () => <RecordStockState>[
        RecordStockState.create(
          entryType: StockRecordEntryType.receipt,
          projectId: 'project1',
          dateOfRecord: DateTime(2024, 1, 1),
          facilityModel: InventoryFacilityModel(id: 'facility1'),
        ),
      ],
    );

    // Test for saveStockDetails event
    blocTest<RecordStockBloc, RecordStockState>(
      'emits updated state with stock details when saveStockDetails event is added',
      build: () => RecordStockBloc(
          const RecordStockState.create(
              entryType: StockRecordEntryType.receipt, projectId: 'project1'),
          inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(RecordStockEvent.saveStockDetails(
          stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
          additionalData: {'key': 'value'})),
      // Expecting the bloc to emit a state with the saved stock details
      expect: () => <RecordStockState>[
        RecordStockState.create(
          entryType: StockRecordEntryType.receipt,
          projectId: 'project1',
          stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
          additionalData: {'key': 'value'},
        ),
      ],
    );

    // Test for createStockEntry event
    blocTest<RecordStockBloc, RecordStockState>(
      'emits persisted state when createStockEntry event is added and stock details are saved successfully',
      build: () => RecordStockBloc(
          RecordStockState.create(
              entryType: StockRecordEntryType.receipt,
              projectId: 'project1',
              dateOfRecord: DateTime(2024, 1, 1),
              facilityModel: InventoryFacilityModel(
                id: 'facility1',
              ),
              stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
              additionalData: {'key': 'value'}),
          inventorySingleton: mockInventorySingleton),
      act: (bloc) {
        bloc.add(RecordStockEvent.saveStockDetails(
            stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
            additionalData: {'key': 'value'}));
        bloc.add(const RecordStockEvent.createStockEntry());
      },
      // Expecting the bloc to emit a persisted state after the stock entry is created
      expect: () => <RecordStockState>[
        RecordStockState.create(
          entryType: StockRecordEntryType.receipt,
          projectId: 'project1',
          dateOfRecord: DateTime(2024, 1, 1),
          facilityModel: InventoryFacilityModel(
            id: 'facility1',
          ),
          stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
          additionalData: {'key': 'value'},
        ),
        RecordStockPersistedState(
          entryType: StockRecordEntryType.receipt,
          projectId: 'project1',
          dateOfRecord: DateTime(2024, 1, 1),
          facilityModel: InventoryFacilityModel(
            id: 'facility1',
          ),
          stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
          additionalData: {'key': 'value'},
        ),
      ],
    );
  });
}