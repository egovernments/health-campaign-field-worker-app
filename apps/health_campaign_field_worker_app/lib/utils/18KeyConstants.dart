class i18 {
  static Common common = const Common();
  static Login login = const Login();
  static ForgetPassword forgetPassword = const ForgetPassword();
}

class Common {
  const Common();
  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';
  String get coreCommonAge => 'CORE_COMMON_AGE';
  String get coreCommonGender => 'CORE_COMMOM_GENDER';
}

class Login {
  const Login();
  String get labelText => 'LOGIN_LABEL_TEXT';
  String get userIdPlaceholder => 'USER_ID_PLACEHOLDER';
  String get passwordPlaceholder => 'PASSWORD_PLACEHOLDER';
  String get actionLabel => 'LOGIN_ACTION_LABEL';
}

class ForgetPassword {
  const ForgetPassword();
  String get labelText => 'FORGET_PASSWORD_LABEL_TEXT';
  String get contentText => 'FORGET_PASSWORD_CONTENT_TEXT';
  String get primaryActionLabel => 'PRIMARY_ACTION_LABEL';
  String get actionLabel => 'FORGET_PASSWORD_ACTION_LABEL';
}
