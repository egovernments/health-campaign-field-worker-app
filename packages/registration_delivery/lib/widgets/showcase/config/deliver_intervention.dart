part of 'showcase_constants.dart';

class _DeliverInterventionShowcaseData {
  static final _DeliverInterventionShowcaseData _instance =
      _DeliverInterventionShowcaseData._();

  _DeliverInterventionShowcaseData._();

  factory _DeliverInterventionShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        memberCount,
        numberOfBednetsToDeliver,
        numberOfBednetsDistributed,
        deliveryComment,
      ];

  final memberCount = ShowcaseItemBuilder(
    messageLocalizationKey: i18.deliverInterventionShowcase.memberCount,
  );

  final numberOfBednetsToDeliver = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.deliverInterventionShowcase.numberOfBednetsToDeliver,
  );

  final numberOfBednetsDistributed = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.deliverInterventionShowcase.numberOfBednetsDistributed,
  );

  final deliveryComment = ShowcaseItemBuilder(
    messageLocalizationKey: i18.deliverInterventionShowcase.deliveryComment,
  );
}
