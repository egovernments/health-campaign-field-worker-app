import 'package:flutter/material.dart';

class WidgetConfigModel {
  final Map<String, dynamic> config;
  final dynamic form;
  final Function? func;

  WidgetConfigModel({
    required this.config,
    required this.form,
    this.func,
  });
}


class WidgetConfig {
  final String type;

  WidgetConfig({
    required this.type,
  });
}
