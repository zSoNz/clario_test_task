import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SignUpValidationRuleType {
  length,
  uppercase,
  number;

  String name(AppLocalizations l10n) {
    switch (this) {
      case SignUpValidationRuleType.length:
        return l10n.password_length_rule;
      case SignUpValidationRuleType.uppercase:
        return l10n.password_case_rule;
      case SignUpValidationRuleType.number:
        return l10n.password_number_rule;
    }
  }
}

enum SignUpValidationValidationResult {
  none,
  success,
  fail,
}

class SignUpValidationRule {
  final SignUpValidationRuleType type;
  final String validationRegex;

  var isValid = SignUpValidationValidationResult.none;

  SignUpValidationRule(this.type, this.validationRegex);
}
