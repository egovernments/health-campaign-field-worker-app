const common = Common();
const institutionType = InstitutionType();

class Common {
  const Common();

  String get coreCommonNext => 'CORE_COMMON_NEXT';

  String get coreCommonRequired => 'CORE_COMMON_REQUIRED';

  String get coreCommonBack => 'CORE_COMMON_BACK';

  String get coreCommonHelp => 'CORE_COMMON_HELP';
}

class InstitutionType {
  const InstitutionType();

  String get institutionLabelText => 'INSTITUTION_LABEL_TEXT';

  String get administrativeAreaLabelText => 'ADMINISTRATIVE_AREA_LABEL_TEXT';

  String get institutionTypeLabelText => 'INSTITUTION_TYPE_LABEL_TEXT';

  String get institutionNameLabelText => 'INSTITUTION_NAME_LABEL_TEXT';
}
