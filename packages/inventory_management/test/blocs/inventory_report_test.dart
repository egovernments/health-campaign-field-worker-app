import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/utils/typedefs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:inventory_management/blocs/inventory_report.dart';

import '../constants/test_constants.dart';

class MockStockDataRepository extends Mock implements StockDataRepository {}

class MockStockReconciliationDataRepository extends Mock
    implements StockReconciliationDataRepository {}

void main() {
  group('InventoryReportBloc', () {
    late MockStockDataRepository mockStockDataRepository;
    late MockStockReconciliationDataRepository
        mockStockReconciliationDataRepository;
    late InventoryReportBloc inventoryReportBloc;

    setUp(() {
      mockStockDataRepository = MockStockDataRepository();
      mockStockReconciliationDataRepository =
          MockStockReconciliationDataRepository();
      inventoryReportBloc = InventoryReportBloc(
        stockRepository: mockStockDataRepository,
        stockReconciliationRepository: mockStockReconciliationDataRepository,
      );
    });

    setUpAll(() {
      registerFallbackValue(StockSearchModel(
        transactionType: [TransactionType.received.toValue()],
        transactionReason: [TransactionReason.received.toValue()],
        receiverId: InventoryReportConstants.facilityId,
      ));
      registerFallbackValue(StockReconciliationSearchModel());
    });

    blocTest<InventoryReportBloc, InventoryReportState>(
      'emits [InventoryReportLoadingState, InventoryReportStockReconciliationState] when loadStockReconciliationData event is added',
      build: () {
        when(() => mockStockReconciliationDataRepository.search(any()))
            .thenAnswer((_) async => [
                  InventoryReportConstants.stockReconciliationModel,
                ]);
        return inventoryReportBloc;
      },
      act: (bloc) =>
          bloc.add(const InventoryReportEvent.loadStockReconciliationData(
        facilityId: InventoryReportConstants.facilityId,
        productVariantId: InventoryReportConstants.productVariantId,
      )),
      expect: () => [
        const InventoryReportLoadingState(),
        InventoryReportStockReconciliationState(
          data: {
            InventoryReportConstants.dateFormat: [
              InventoryReportConstants.stockReconciliationModel,
            ],
          },
        ),
      ],
    );

    blocTest<InventoryReportBloc, InventoryReportState>(
        'emits [InventoryReportLoadingState, InventoryReportStockState] when loadStockData event is added',
        build: () {
          when(() => mockStockDataRepository.search(any()))
              .thenAnswer((_) async => [
                    InventoryReportConstants.stockModel,
                  ]);
          return inventoryReportBloc;
        },
        act: (bloc) => bloc.add(const InventoryReportLoadStockDataEvent(
              reportType: InventoryReportType.receipt,
              facilityId: InventoryReportConstants.facilityId,
              productVariantId: InventoryReportConstants.productVariantId,
            )),
        expect: () => [
              const InventoryReportLoadingState(),
              InventoryReportStockState(stockData: {
                InventoryReportConstants.dateFormat: [
                  InventoryReportConstants.stockModel,
                ]
              })
            ]);
  });
}
