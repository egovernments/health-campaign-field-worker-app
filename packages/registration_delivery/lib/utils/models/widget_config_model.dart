import 'package:flutter/material.dart';

import '../../blocs/app_localization.dart';

class WidgetConfigModel {
  final Map<String, dynamic> config;
  final dynamic form;
  final Function? func;
  final RegistrationDeliveryLocalization localizations;


  WidgetConfigModel({
    required this.config,
    required this.form,
    this.func,
    required this.localizations,
  });
}

class FormConfigModel {
  late String name = '';
  late String type = '';
  late List<FormConfigFieldModel>? fields;
}

class FormConfigFieldModel {
  late String name;
  late int order;
  late bool isRequired;
  late bool isEnabled;
  late bool readOnly;
  late List<String>? regex;
  late String? errorMessage;
}

class RegistrationDeliveryConfigModel {
  late String name = '';
  late String type = '';
  late List<ComponentModel> components;
}

class ComponentModel {
  late String title;
  late String description;
  late int order;
  late List<AttributeModel> attributes;
}

class AttributeModel {
  late String name;
  late String type;
  late bool isEnabled;
  late String attribute; // Maps to `attribute` in JSON
  late bool readOnly;
  late bool isRequired;
  late int order;
  late String? label; // Nullable for additional fields
  late String? formDataType; // Nullable for additional fields
  late String? keyboardType; // Nullable for specific fields
  late List<ValidationRuleModel>? validation; // Nullable
  late List<String>? menuItems; // Nullable for dropdown and selection boxes
  late bool? allowMultipleSelection; // Nullable for selection boxes
  late int? initialValue; // Nullable for integer picker
  late int? minimum; // Nullable for integer picker
  late int? maximum; // Nullable for integer picker
}

class ValidationRuleModel {
  late String pattern;
  late String key;
  late String errorMessage;
}


class FieldConfig {
  final bool isEnabled;
  final bool readOnly;
  final bool isRequired;
  final int order;
  final List<String>? regex;
  final String? errorMessage;

  FieldConfig({
    required this.isEnabled,
    required this.readOnly,
    required this.isRequired,
    required this.order,
    this.regex,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'isEnabled': isEnabled,
      'readOnly': readOnly,
      'isRequired': isRequired,
      'order': order,
      if (regex != null) 'regex': regex,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

class RegistrationDeliveryFormConfig {
  String? name;
  String? type;
  List<Components>? components;

  RegistrationDeliveryFormConfig({this.name, this.type, this.components});

  RegistrationDeliveryFormConfig.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(new Components.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.components != null) {
      data['components'] = this.components!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Components {
  String? title;
  String? description;
  int? order;
  List<Attributes>? attributes;

  Components({this.title, this.description, this.order, this.attributes});

  Components.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    order = json['order'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? type;
  String? label;
  String? attribute;
  String? formDataType;
  bool? isEnabled;
  bool? readOnly;
  bool? isRequired;
  String? keyboardType;
  List<Validation>? validation;
  int? order;
  List<String>? menuItems;
  bool? allowMultipleSelection;
  int? initialValue;
  int? minimum;
  int? maximum;

  Attributes(
      {this.name,
        this.type,
        this.label,
        this.attribute,
        this.formDataType,
        this.isEnabled,
        this.readOnly,
        this.isRequired,
        this.keyboardType,
        this.validation,
        this.order,
        this.menuItems,
        this.allowMultipleSelection,
        this.initialValue,
        this.minimum,
        this.maximum});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    label = json['label'];
    attribute = json['attribute'];
    formDataType = json['formDataType'];
    isEnabled = json['isEnabled'];
    readOnly = json['readOnly'];
    isRequired = json['isRequired'];
    keyboardType = json['keyboardType'];
    if (json['validation'] != null) {
      validation = <Validation>[];
      json['validation'].forEach((v) {
        validation!.add(new Validation.fromJson(v));
      });
    }
    order = json['order'];
    menuItems = json['menuItems'].cast<String>();
    allowMultipleSelection = json['allowMultipleSelection'];
    initialValue = json['initialValue'];
    minimum = json['minimum'];
    maximum = json['maximum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['label'] = this.label;
    data['attribute'] = this.attribute;
    data['formDataType'] = this.formDataType;
    data['isEnabled'] = this.isEnabled;
    data['readOnly'] = this.readOnly;
    data['isRequired'] = this.isRequired;
    data['keyboardType'] = this.keyboardType;
    if (this.validation != null) {
      data['validation'] = this.validation!.map((v) => v.toJson()).toList();
    }
    data['order'] = this.order;
    data['menuItems'] = this.menuItems;
    data['allowMultipleSelection'] = this.allowMultipleSelection;
    data['initialValue'] = this.initialValue;
    data['minimum'] = this.minimum;
    data['maximum'] = this.maximum;
    return data;
  }
}

class Validation {
  String? pattern;
  String? key;
  String? errorMessage;

  Validation({this.pattern, this.key, this.errorMessage});

  Validation.fromJson(Map<String, dynamic> json) {
    pattern = json['pattern'];
    key = json['key'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pattern'] = this.pattern;
    data['key'] = this.key;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}


