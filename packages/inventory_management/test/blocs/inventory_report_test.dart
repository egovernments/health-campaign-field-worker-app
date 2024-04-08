// Importing necessary packages and modules
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for InventorySingleton
class MockInventorySingleton extends Mock implements InventorySingleton {
  // Mock method for fetching inventory reports
  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports(
      {required InventoryReportType reportType,
        required String facilityId,
        required String productVariantId}) async {
    return <String, List<StockModel>>{
      'stock1': [StockModel(id: '1', clientReferenceId: 'abc123')]
    };
  }

  // Mock method for handling stock reconciliation report
  @override
  Future<StockReconciliationReport?> handleStockReconciliationReport(
      {required String productVariantId, required String facilityId}) async {
    return StockReconciliationReport(
        stockReconModel: <String, List<StockReconciliationModel>>{
          'stock1': [
            StockReconciliationModel(
                id: '1',
                clientReferenceId: 'abc123',
                dateOfReconciliation: DateTime.now().toLocal().day)
          ]
        },
        additionalData: {
          const MapEntry("returned", "10")
        });
  }
}

// Fake class for StockReconciliationReport for testing
class StockReconciliationReportFake extends Fake
    implements StockReconciliationReport {}

void main() {
  // Setting up the test environment
  setUpAll(() {
    registerFallbackValue(StockReconciliationReportFake());
  });

  group('InventoryReportBloc', () {
    late MockInventorySingleton mockInventorySingleton;
    late InventoryReportBloc inventoryReportBloc;

    setUp(() {
      // Setting up the mock and the bloc for each test
      mockInventorySingleton = MockInventorySingleton();
      inventoryReportBloc =
          InventoryReportBloc(inventorySingleton: mockInventorySingleton);
    });

    // Test for loadStockData event
    blocTest<InventoryReportBloc, InventoryReportState>(
      'emits [InventoryReportLoadingState, InventoryReportStockState] when loadStockData event is added',
      build: () =>
          InventoryReportBloc(inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(const InventoryReportEvent.loadStockData(
          reportType: InventoryReportType.receipt,
          facilityId: 'facility1',
          productVariantId:
          'product1')), // wait for 1 second before checking the states
      expect: () => <InventoryReportState>[
        const InventoryReportLoadingState(),
        InventoryReportStockState(stockData: {
          'stock1': [StockModel(id: '1', clientReferenceId: 'abc123')]
        }),
      ],
    );

    // Test for loadStockReconciliationData event
    blocTest<InventoryReportBloc, InventoryReportState>(
      'emits [InventoryReportLoadingState, InventoryReportStockReconciliationState] when loadStockReconciliationData event is added',
      build: () =>
          InventoryReportBloc(inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(
          const InventoryReportEvent.loadStockReconciliationData(
              facilityId: 'facility1', productVariantId: 'product1')),
      expect: () => <InventoryReportState>[
        const InventoryReportLoadingState(),
        InventoryReportStockReconciliationState(data: {
          'stock1': [
            StockReconciliationModel(
                id: '1',
                clientReferenceId: 'abc123',
                dateOfReconciliation: DateTime.now().toLocal().day)
          ]
        }, additionalData: {
          const MapEntry("returned", "10")
        }),
      ],
    );

    // Test for loading event
    blocTest<InventoryReportBloc, InventoryReportState>(
      'emits [InventoryReportLoadingState] when loading event is added',
      build: () => inventoryReportBloc,
      act: (bloc) => bloc.add(const InventoryReportEvent.loading()),
      expect: () => <InventoryReportState>[
        const InventoryReportLoadingState(),
      ],
    );
  });
}