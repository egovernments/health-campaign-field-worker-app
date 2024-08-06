import 'package:isar/isar.dart';

part 'dashboard_response.g.dart';

@Collection()
class DashboardResponse {
  Id id = Isar.autoIncrement;

  @Name("drillDownChartId")
  late String? drillDownChartId;

  @Name("visualizationCode")
  late String? visualizationCode;

  @Name("chartType")
  late String? chartType;

  @Name("projectId")
  late String? projectId;

  @Name("showLabel")
  late bool? showLabel;

  @Name("hideInsights")
  late bool? hideInsights;

  @Name("hideHeaderDenomination")
  late bool? hideHeaderDenomination;

  @Name("data")
  late List<DashboardChartData>? data;

  late DateTime? lastSelectedDate;
}

@embedded
class DashboardChartData {
  @Name("headerName")
  late String? headerName;

  @Name("headerSymbol")
  late String? headerSymbol;

  @Name("headerValue")
  late String? headerValue;
  @Name("plots")
  late List<DashboardPlot>? plots;
  @Name("insight")
  late Insight? insight;
}

@embedded
class DashboardPlot {
  @Name("label")
  late String? label;
  @Name("strValue")
  late String? strValue;
  @Name("name")
  late String? name;
  @Name("value")
  late String? value;
  @Name("symbol")
  late String? symbol;
}

@embedded
class Insight {
  @Name("colorCode")
  late String? colorCode;
  @Name("indicator")
  late String? indicator;
  @Name("name")
  late String? name;
  @Name("value")
  late String? value;
}
