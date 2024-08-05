class GlobalSearchParameters {
  final bool isProximityEnabled;
  final double? latitude;
  final double? longitude;
  final double? maxRadius;
  final String? nameSearch;
  final int? offset;
  final int? limit;
  final List<String>? filter;
  final int? totalCount;

  GlobalSearchParameters({
    required this.isProximityEnabled,
    required this.latitude,
    required this.longitude,
    required this.maxRadius,
    required this.nameSearch,
    required this.offset,
    required this.limit,
    required this.filter,
    this.totalCount,
  });
}
