part of 'showcase_constants.dart';

class _RefusedDeliveryShowcaseData {
  static final _RefusedDeliveryShowcaseData _instance =
      _RefusedDeliveryShowcaseData._();

  _RefusedDeliveryShowcaseData._();

  factory _RefusedDeliveryShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        dateOfVisit,
        reasonOfRefusal,
        comments,
      ];

  final dateOfVisit = ShowcaseItemBuilder(
    messageLocalizationKey: i18.deliverInterventionShowcase.dateOfVisitLabel,
  );

  final reasonOfRefusal = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.deliverInterventionShowcase.reasonOfRefusalLabel,
  );
  final comments = ShowcaseItemBuilder(
    messageLocalizationKey: i18.deliverInterventionShowcase.commentLabel,
  );
}
