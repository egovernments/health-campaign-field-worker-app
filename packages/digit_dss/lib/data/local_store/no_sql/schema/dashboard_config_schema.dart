import 'package:isar/isar.dart';

part 'dashboard_config_schema.g.dart';

@Collection()
class DashboardConfigSchemaList{
  Id id = Isar.autoIncrement;

  @Name("dashboardConfigs")
  late List<DashboardConfigSchema>? dashboardConfigs;
}

@embedded
class DashboardConfigSchema {

  @Name("enableDashboard")
  late bool? enableDashboard;

  @Name("projectTypeCode")
  late String? projectTypeCode;

  @Name("projectTypeId")
  late String? projectTypeId;

  @Name("charts")
  late List<DashboardChartConfigSchema>? charts;
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
