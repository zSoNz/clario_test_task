import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get sign_up => 'Sign up';

  @override
  String get enter_email => 'Enter your email';

  @override
  String get create_password => 'Create your password';

  @override
  String get password_length_rule => '8 characters or more (no spaces)';

  @override
  String get password_case_rule => 'Uppercase and lowercase letters';

  @override
  String get password_number_rule => 'At least one digit ';

  @override
  String get success => 'Success';
}
