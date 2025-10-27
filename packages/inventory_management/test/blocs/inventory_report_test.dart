import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/utils/typedefs.dart';
import 'package:mocktail/mocktail.dart';

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
      registerFallbackValue(StockSearchModel());
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
  });
}
