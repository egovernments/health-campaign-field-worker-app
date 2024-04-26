// Importing necessary packages and modules
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:mocktail/mocktail.dart';

class MockStockReconciliationReport extends Mock
    implements StockReconciliationReport {
  @override
  Map<String, List<StockReconciliationModel>> stockReconModel = {
    'stock1': [
      StockReconciliationModel(
        id: '1',
        clientReferenceId: 'abc123',
        dateOfReconciliation: DateTime.now().toLocal().day,
      ),
    ],
  };

  @override
  Iterable<MapEntry<String, String>> additionalData = {
    const MapEntry("returned", "10"),
  };
}

class MockInventoryReport extends Mock {
  @override
  Map<String, List<StockModel>> stocksReport = {
    'stock1': [StockModel(id: '1', clientReferenceId: 'abc123')],
  };
}

// Mock class for InventorySingleton
class MockInventorySingleton extends Mock implements InventorySingleton {
  // Mock method for fetching inventory reports
  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports(
      {required InventoryReportType reportType,
      required String facilityId,
      required String productVariantId}) async {
    return MockInventoryReport().stocksReport;
  }

  // Mock method for handling stock reconciliation report
  @override
  Future<StockReconciliationReport?> handleStockReconciliationReport(
      {required String productVariantId, required String facilityId}) async {
    return MockStockReconciliationReport();
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
    late InventoryReportBloc mockInventoryReportBloc;
    late InventoryReportType mockReportType;
    late String mockFacilityId;
    late String mockProductVariantId;

    setUp(() {
      // Setting up the mock and the bloc for each test
      mockInventorySingleton = MockInventorySingleton();
      mockInventoryReportBloc =
          InventoryReportBloc(inventorySingleton: mockInventorySingleton);
      mockReportType = InventoryReportType.receipt;
      mockFacilityId = 'facility1';
      mockProductVariantId = 'product1';
    });

    // Test for loadStockData event
    blocTest<InventoryReportBloc, InventoryReportState>(
      'emits [InventoryReportLoadingState, InventoryReportStockState] when loadStockData event is added',
      build: () =>
          InventoryReportBloc(inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(InventoryReportEvent.loadStockData(
          reportType: mockReportType,
          facilityId: mockFacilityId,
          productVariantId: mockProductVariantId)),
      expect: () => <InventoryReportState>[
        const InventoryReportLoadingState(),
        InventoryReportStockState(
            stockData: MockInventoryReport().stocksReport),
      ],
    );

    // Test for loadStockReconciliationData event
    blocTest<InventoryReportBloc, InventoryReportState>(
      'emits [InventoryReportLoadingState, InventoryReportStockReconciliationState] when loadStockReconciliationData event is added',
      build: () =>
          InventoryReportBloc(inventorySingleton: mockInventorySingleton),
      act: (bloc) => bloc.add(InventoryReportEvent.loadStockReconciliationData(
          facilityId: mockFacilityId, productVariantId: mockProductVariantId)),
      expect: () => <InventoryReportState>[
        const InventoryReportLoadingState(),
        InventoryReportStockReconciliationState(
            data: MockStockReconciliationReport().stockReconModel,
            additionalData: MockStockReconciliationReport().additionalData),
      ],
    );

    // Test for loading event
    blocTest<InventoryReportBloc, InventoryReportState>(
      'emits [InventoryReportLoadingState] when loading event is added',
      build: () => mockInventoryReportBloc,
      act: (bloc) => bloc.add(const InventoryReportEvent.loading()),
      expect: () => <InventoryReportState>[
        const InventoryReportLoadingState(),
      ],
    );
  });
}
