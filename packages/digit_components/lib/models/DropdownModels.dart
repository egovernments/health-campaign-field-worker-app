import 'package:flutter/material.dart';

class DropdownStyle {
  final BorderRadius borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset? offset;

  ///button width must be set for this to take effect
  final double? width;

  const DropdownStyle({
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius = BorderRadius.zero,
  });
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;
  final double elevation;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final Color primaryColor;

  const DropdownButtonStyle({
    this.mainAxisAlignment,
    this.backgroundColor = Colors.white,
    this.primaryColor = Colors.black87,
    this.constraints,
    this.height = 40,
    this.width,
    this.elevation = 1,
    this.padding,
    this.shape,
  });
}


/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.

class DropdownItem {
  final String name;
  final String code;
  final String? type;
  final String? description;
  final NetworkImage? profileImage;

  const DropdownItem({
    required this.name,
    required this.code,
    this.type,
    this.description,
    this.profileImage,
  });
}
