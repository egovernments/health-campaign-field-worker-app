import 'package:isar/isar.dart';

Future<Isar> openTempIsar(
  List<CollectionSchema<dynamic>> schemas, {
  String? name,
}) async {
  await Isar.initializeIsarCore(download: true);

  return await Isar.open(schemas);
}
