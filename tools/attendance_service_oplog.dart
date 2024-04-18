import 'dart:io';

String createCaseCondition(String key, String value) {
  return 'case "$key":\n    $value';
}

void insertCaseCondition(List<String> lines, String caseCondition) {
  final defaultIndex = lines.indexWhere((line) => line.contains('default:'));
  if (defaultIndex != -1 &&
      !lines.any((line) => line.contains(caseCondition.split('\n')[0]))) {
    lines.insert(defaultIndex, caseCondition);
  }
}

void main() {
  var appDir = Directory.current.path;
  print(appDir);
  var opLogPath =
      '$appDir/apps/health_campaign_field_worker_app/lib/data/local_store/no_sql/schema/oplog.dart';
  print(opLogPath);

  Process.run('chmod', ['+r', opLogPath]);

  final filePath = opLogPath;

  final caseConditions = {
    'attendance':
        'final entity = HCMAttendanceLogModelMapper.fromJson(entityString);\n    return entity;',
  };

  final file = File(filePath);
  final lines = file.readAsLinesSync();

  for (var entry in caseConditions.entries) {
    final caseCondition = createCaseCondition(entry.key, entry.value);
    insertCaseCondition(lines, caseCondition);
  }

  file.writeAsStringSync(lines.join('\n'));

// Run dart format on the oplog.dart file
  Process.run('dart', ['format', opLogPath]).then((ProcessResult results) {
    print(results.stdout);
  });
}
