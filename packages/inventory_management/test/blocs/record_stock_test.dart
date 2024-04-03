import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:mocktail/mocktail.dart';

class MockInventorySingleton extends Mock implements InventorySingleton {
  @override
  Future<bool?> saveStockDetails(SaveStockDetails details) async {
    return true;
  }
}

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
  setUpAll(() {
    registerFallbackValue(SaveStockDetailsFake());
  });

  group('ProductVariantBloc', () {
    late MockInventorySingleton mockInventorySingleton;
    late RecordStockBloc recordStockBloc;

    setUp(() {
      mockInventorySingleton = MockInventorySingleton();
      recordStockBloc = RecordStockBloc(
          const RecordStockState.create(
              entryType: StockRecordEntryType.receipt, projectId: '1'),
          inventorySingleton: mockInventorySingleton);
    });

    blocTest<RecordStockBloc, RecordStockState>(
      'emits updated state with warehouse details when saveWarehouseDetails event is added',
      build: () => RecordStockBloc(
          const RecordStockState.create(
              entryType: StockRecordEntryType.receipt, projectId: 'project1'),
          inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(RecordStockEvent.saveWarehouseDetails(
          dateOfRecord: DateTime(2024, 1, 1),
          facilityModel: InventoryFacilityModel(id: 'facility1'))),
      expect: () => <RecordStockState>[
        RecordStockState.create(
          entryType: StockRecordEntryType.receipt,
          projectId: 'project1',
          dateOfRecord: DateTime(2024, 1, 1),
          facilityModel: InventoryFacilityModel(id: 'facility1'),
        ),
      ],
    );

    blocTest<RecordStockBloc, RecordStockState>(
      'emits updated state with stock details when saveStockDetails event is added',
      build: () => RecordStockBloc(
          const RecordStockState.create(
              entryType: StockRecordEntryType.receipt, projectId: 'project1'),
          inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(RecordStockEvent.saveStockDetails(
          stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
          additionalData: {'key': 'value'})),
      expect: () => <RecordStockState>[
        RecordStockState.create(
          entryType: StockRecordEntryType.receipt,
          projectId: 'project1',
          stockModel: StockModel(id: 'stock1', clientReferenceId: 'abc123'),
          additionalData: {'key': 'value'},
        ),
      ],
    );

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
