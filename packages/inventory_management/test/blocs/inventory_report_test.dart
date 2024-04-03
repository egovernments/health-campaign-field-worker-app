import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:mocktail/mocktail.dart';

class MockInventorySingleton extends Mock implements InventorySingleton {
  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports) async {
    return <String, List<StockModel>>{
      'stock1': [StockModel(id: '1', clientReferenceId: 'abc123')]
    };
  }

  @override
  Future<Map<String, List<StockReconciliationModel>>>
      handleStockReconciliationReport(
          StockReconciliationReport stockReconciliationReport) async {
    return <String, List<StockReconciliationModel>>{
      'stock1': [
        StockReconciliationModel(
            id: '1',
            clientReferenceId: 'abc123',
            dateOfReconciliation: DateTime.now().toLocal().day)
      ]
    };
  }
}

class FetchInventoryReportsFake extends Fake implements FetchInventoryReports {}

class StockReconciliationReportFake extends Fake
    implements StockReconciliationReport {}

void main() {
  setUpAll(() {
    registerFallbackValue(FetchInventoryReportsFake());
    registerFallbackValue(StockReconciliationReportFake());
  });

  group('InventoryReportBloc', () {
    late MockInventorySingleton mockInventorySingleton;
    late InventoryReportBloc inventoryReportBloc;

    setUp(() {
      mockInventorySingleton = MockInventorySingleton();
      inventoryReportBloc =
          InventoryReportBloc(inventorySingleton: mockInventorySingleton);
    });

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
        }),
      ],
    );

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
