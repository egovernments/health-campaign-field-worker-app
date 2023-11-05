import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<Isar> openTempIsar(
  List<CollectionSchema<dynamic>> schemas, {
  String? name,
}) async {
  await Isar.initializeIsarCore(download: true);
  final directory = await getApplicationDocumentsDirectory();

  return await Isar.open(schemas, directory: directory.path);
}
