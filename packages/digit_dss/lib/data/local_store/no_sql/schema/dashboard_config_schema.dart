import 'package:isar/isar.dart';

part 'dashboard_config_schema.g.dart';

@embedded
class DashboardConfigSchema {
  @Name("enableDashboard")
  late bool? enableDashboard;

  @Name("dashboardConfig")
  late DashboardChartListSchema? dashboardConfig;
}

@embedded
class DashboardChartListSchema {
  @Name("METRIC")
  late List<DashboardChartConfigSchema>? metricCharts;

  @Name("TABLE")
  late List<DashboardChartConfigSchema>? tableCharts;
}

@embedded
class DashboardChartConfigSchema {
  @Name("name")
  late String? name;

  @Name("vizType")
  late String? vizType;

  @Name("active")
  late bool? active;
}
