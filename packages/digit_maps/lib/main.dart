import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

const tileUrl = 'https://tile.openstreetmap.org';
const tileTemplate = '$tileUrl/{z}/{x}/{y}.png';

void initializeMaps() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBlocOverrides.runZoned(
    () async {
      // Initialize directories for storage
      final temporaryDirectory =
          kIsWeb ? Directory('A') : await getTemporaryDirectory();

      final storage = await HydratedStorage.build(
        storageDirectory: temporaryDirectory,
      );

      final storageDirectory =
          kIsWeb ? Directory('B') : await getApplicationSupportDirectory();

      var rootDirectory = await storageDirectory.createTemp('cache');

      try {
        // Initialize your backend or database here
        // FMTCObjectBoxBackend().initialise(rootDirectory: rootDirectory.path);
        // await const FMTCStore('storeName').manage.create();
      } catch (e) {
        debugPrint('Error $e');
      }
    },
    storage: await HydratedStorage.build(
      storageDirectory: kIsWeb ? Directory('A') : await getTemporaryDirectory(),
    ),
  );
}
