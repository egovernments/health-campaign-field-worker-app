import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;

Future<Isar> openTempIsar(
  List<CollectionSchema<dynamic>> schemas, {
  String? name,
}) async {
  await Isar.initializeIsarCore(download: true);

  return await Isar.open(schemas);
}
