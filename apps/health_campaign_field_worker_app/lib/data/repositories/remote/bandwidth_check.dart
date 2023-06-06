import 'dart:async';

import 'package:dio/dio.dart';

class BandwidthCheckRepository {
  final Dio _client;
  final String bandwidthPath;

  const BandwidthCheckRepository(this._client, {required this.bandwidthPath});

  Future<double> pingBandwidthCheck({
    required bandWidthCheckModel,
  }) async {
    final headers = <String, String>{};
    try {
      final startTime = DateTime.now();
      final response = await _client.post(
        bandwidthPath,
        data: {
          "data": [
            {
              "id": 1,
              "name": "John Doe",
              "age": 30,
              "email": "johndoe@example.com",
              "address": {
                "street": "123 Main Street",
                "city": "New York",
                "state": "NY",
                "zipcode": "10001",
              },
              "orders": [
                {
                  "id": 101,
                  "product": "Widget A",
                  "quantity": 2,
                  "price": 10.99,
                },
                {
                  "id": 102,
                  "product": "Widget B",
                  "quantity": 1,
                  "price": 19.99,
                },
              ],
            },
            {
              "id": 2,
              "name": "Jane Smith",
              "age": 25,
              "email": "janesmith@example.com",
              "address": {
                "street": "456 Elm Street",
                "city": "Los Angeles",
                "state": "CA",
                "zipcode": "90001",
              },
              "orders": [
                {
                  "id": 201,
                  "product": "Widget C",
                  "quantity": 3,
                  "price": 15.99,
                },
                {
                  "id": 202,
                  "product": "Widget D",
                  "quantity": 2,
                  "price": 12.99,
                },
              ],
            },
            // ... Repeat the above structure to reach approximately 100KB in size
          ],
        },
        options: Options(headers: headers),
      );
      final timeconsumed =
          ((DateTime.now().difference(startTime).inMilliseconds)) / 1000;
      final speed = (((800 / timeconsumed) / 1000));

      return speed;
    } catch (e) {
      return 0;
    }
  }
}
