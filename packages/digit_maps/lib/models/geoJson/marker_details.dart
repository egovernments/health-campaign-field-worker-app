import 'package:flutter/material.dart';

class MarkerDetails {
  final String id;
  final List<double> coordinates;
  final Icon? icon;

  MarkerDetails({this.icon, required this.id, required this.coordinates});
}
