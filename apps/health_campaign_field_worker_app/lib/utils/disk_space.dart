import 'package:flutter/services.dart';

class DiskSpace {
  static const MethodChannel _channel =
      MethodChannel('disk_space_update');

  static Future<double?> get getFreeDiskSpace async {
    try {
      return await _channel.invokeMethod<double>(
        'getFreeDiskSpace',
      );
    } catch (_) {
      return null;
    }
  }
}
