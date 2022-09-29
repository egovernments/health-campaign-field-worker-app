import 'package:health_campaigns_flutter/models/address/address_model.dart';

abstract class SerializerModel {

  static T fromJson<T extends SerializerModel>(Map<String, dynamic> json) {
    switch (T) {
      case AddressModel:
        return AddressModel.fromJson(json) as T;
      default:
        throw UnimplementedError();
    }
  }

  Map<String, dynamic> toJson();
}