import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<Isar> openTempIsar(
  List<CollectionSchema<dynamic>> schemas, {
  String? name,
}) async {
  await Isar.initializeIsarCore(download: true);
  var dbFolder = await getApplicationDocumentsDirectory();

  return await Isar.open(schemas, directory: dbFolder.path);
}
