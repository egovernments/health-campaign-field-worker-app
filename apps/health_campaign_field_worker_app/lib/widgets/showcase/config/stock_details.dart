part of 'showcase_constants.dart';

class _StockDetailsShowcaseData {
  static final _StockDetailsShowcaseData _instance =
      _StockDetailsShowcaseData._();

  _StockDetailsShowcaseData._();

  factory _StockDetailsShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        receiptReceivedFrom,
        receiptNumberOfBednetsReceived,
        receiptPackingSlipId,
        receiptNumberOfNetsIndicatedOnPackingSlip,
        receiptTypeOfTransport,
        receiptVehicleNumber,
        receiptComments,
        receiptDriverName,
        issuedIssuedTo,
        issuedNumberOfBednetsIssued,
        issuedPackingSlipId,
        issuedNumberOfBednetsIndicatedOnPackingSlip,
        issuedTypeOfTransport,
        issuedVehicleNumber,
        issuedComments,
        issuedDriverName,
        returnedReturnedFrom,
        returnedNumberOfBednetsReturned,
        returnedPackingSlipId,
        returnedNumberOfBednetsIndicatedOnPackingSlip,
        returnedTypeOfTransport,
        returnedVehicleNumber,
        returnedDriverName,
      ];

  final receiptReceivedFrom = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReceiptShowcase.receivedFrom,
  );

  final receiptNumberOfBednetsReceived = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.stockDetailsReceiptShowcase.numberOfBednetsReceived,
  );

  final receiptPackingSlipId = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReceiptShowcase.packingSlipId,
  );

  final receiptNumberOfNetsIndicatedOnPackingSlip = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.stockDetailsReceiptShowcase.numberOfNetsIndicatedOnPackingSlip,
  );

  final receiptTypeOfTransport = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReceiptShowcase.typeOfTransport,
  );

  final receiptVehicleNumber = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReceiptShowcase.vehicleNumber,
  );

  final receiptDriverName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReceiptShowcase.driverName,
  );

  final receiptComments = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReceiptShowcase.comments,
  );

  final issuedIssuedTo = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsIssuedShowcase.issuedTo,
  );

  final issuedNumberOfBednetsIssued = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.stockDetailsIssuedShowcase.numberOfBednetsIssued,
  );

  final issuedPackingSlipId = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsIssuedShowcase.packingSlipId,
  );

  final issuedNumberOfBednetsIndicatedOnPackingSlip = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.stockDetailsIssuedShowcase.numberOfNetsIndicatedOnPackingSlip,
  );

  final issuedTypeOfTransport = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsIssuedShowcase.typeOfTransport,
  );

  final issuedVehicleNumber = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsIssuedShowcase.vehicleNumber,
  );

  final issuedDriverName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsIssuedShowcase.driverName,
  );

  final issuedComments = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsIssuedShowcase.comments,
  );

  final returnedReturnedFrom = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReturnedShowcase.returnedFrom,
  );

  final returnedNumberOfBednetsReturned = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.stockDetailsReturnedShowcase.numberOfBednetsReturned,
  );

  final returnedPackingSlipId = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReturnedShowcase.packingSlipId,
  );

  final returnedNumberOfBednetsIndicatedOnPackingSlip = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.stockDetailsReturnedShowcase.numberOfNetsIndicatedOnPackingSlip,
  );

  final returnedTypeOfTransport = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReturnedShowcase.typeOfTransport,
  );

  final returnedVehicleNumber = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReturnedShowcase.vehicleNumber,
  );

  final returnedDriverName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReturnedShowcase.driverName,
  );

  final returnedComments = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockDetailsReturnedShowcase.comments,
  );
}
