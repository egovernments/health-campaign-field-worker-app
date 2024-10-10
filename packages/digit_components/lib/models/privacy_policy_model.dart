class PrivacyPolicy {
  final String? header; // Changed to nullable
  final String? module; // Changed to nullable
  final bool? active;
  final List<Content>? contents;

  PrivacyPolicy({
    this.header,
    this.module,
    this.active,
    this.contents,
  });

  // Factory constructor to create PrivacyPolicy from JSON
  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicy(
      header: json['header'] as String?,
      module: json['module'] as String?,
      active: json['active'] as bool?,
      contents: (json['contents'] as List<dynamic>?)
          ?.map((item) => Content.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Content {
  final String? header; // Changed to nullable
  final List<Description>? descriptions;

  Content({
    this.header,
    this.descriptions,
  });

  // Factory constructor to create Content from JSON
  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      header: json['header'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((item) => Description.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Description {
  final String? text; // Changed to nullable
  final String? type; // Changed to nullable
  final bool? isBold;
  final List<SubDescription>? subDescriptions;

  Description({
    this.text,
    this.type,
    this.isBold,
    this.subDescriptions,
  });

  // Factory constructor to create Description from JSON
  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      subDescriptions: (json['subDescriptions'] as List<dynamic>?)
          ?.map((item) => SubDescription.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubDescription {
  final String? text; // Changed to nullable
  final String? type; // Changed to nullable
  final bool? isBold;
  final bool? isSpaceRequired;

  SubDescription({
    this.text,
    this.type,
    this.isBold,
    this.isSpaceRequired,
  });

  // Factory constructor to create SubDescription from JSON
  factory SubDescription.fromJson(Map<String, dynamic> json) {
    return SubDescription(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      isSpaceRequired: json['isSpaceRequired'] as bool?,
    );
  }
}
