import 'package:isar/isar.dart';

part 'dashboard_config_schema.g.dart';

@Collection()
class DashboardConfigSchema {
  Id id = Isar.autoIncrement;

  @Name("enableDashboard")
  late bool? enableDashboard;

  @Name("charts")
  late List<DashboardChartConfigSchema>? charts;

  @Name("projectTypeCode")
  late String? projectTypeCode;
}

@embedded
class DashboardChartConfigSchema {
  @Name("name")
  late String? name;

  @Name("vizType")
  late String? vizType;

  @Name("active")
  late bool? active;

  @Name("chartType")
  late String? chartType;
}
