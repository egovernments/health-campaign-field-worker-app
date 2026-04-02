import 'package:dio/dio.dart';

class ValidateRepository {
  final Dio _client;

  ValidateRepository(this._client);

  Future<bool> isLoggedInOnOtherDevice({
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {
    final response = await _client.post(endpoint, data: payload);
    if (response.statusCode == 200) {
      final data = response.data;
      print("ValidateRepository API response: $data");
      print("isDuplicateLogin value: ${data['isDuplicateLogin']}");
      
      return true;
    }
    throw Exception('Failed to check device login');
  }
}

// creata a Repository class for Switching Device with API call to switch device and pass reason for switching device
class DeviceSwitchRepository {
  final Dio _client;

  DeviceSwitchRepository(this._client);

  Future<bool> switchDevice({
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {
    final response = await _client.post(endpoint, data: payload);
    print("response status code: ${response.statusCode}");
    
    if (response.statusCode == 200) {
      final data = response.data;
      print("DeviceSwitchRepository API response: $data");
      
      return true;
    }
    throw Exception('Failed to switch device');
  }
}
