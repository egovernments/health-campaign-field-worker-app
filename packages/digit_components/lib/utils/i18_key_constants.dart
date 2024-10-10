library i18;

const privacyPolicy = PrivacyPolicy();

class PrivacyPolicy {
  const PrivacyPolicy();

  String get acceptText {
    return 'PRIVACY_POLICY_ACCEPT_TEXT';
  }

  String get declineText {
    return 'PRIVACY_POLICY_DECLINE_TEXT';
  }

  String get privacyNoticeText => 'PRIVACY_POLICY_TEXT';
  String get privacyPolicyLinkText => 'PRIVACY_POLICY_LINK_TEXT';
  String get privacyPolicyValidationText => 'PRIVACY_POLICY_VALIDATION_TEXT';

}