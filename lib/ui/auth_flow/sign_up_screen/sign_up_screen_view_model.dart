import 'package:clario_test_task/helpers/routers/auto_app_router.dart';
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/models/sign_up_validation_rule.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreenViewModel {
  final formKey = GlobalKey<FormState>();

  late final rulesSubscription = BehaviorSubject<List<SignUpValidationRule>>()
    ..add(_rules);

  late final isPasswordCorrectSubscription = BehaviorSubject<bool>()
    ..addStream(
      rulesSubscription.map(
        (rules) => rules.every(
            (rule) => rule.isValid == SignUpValidationValidationResult.success),
      ),
    );

  late final isEmailCorrectSubscription = BehaviorSubject<bool>()..add(false);

  String email = '';
  String password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordIsVisible = false;

  final _rules = [
    SignUpValidationRule(SignUpValidationRuleType.length, r'^.{8,}$'),
    SignUpValidationRule(SignUpValidationRuleType.uppercase, r'(?=.*[A-Z])'),
    SignUpValidationRule(SignUpValidationRuleType.number, r'(?=.*\d)'),
  ];

  SignUpScreenViewModel() {
    emailController.addListener(() {
      _validateEmail();
    });
    passwordController.addListener(() {
      _validatePassword();
    });
  }

  bool isFieldNonEmpty(String? value) {
    return value != null && value.isNotEmpty;
  }

  void save() {
    final isValide = formKey.currentState?.validate();
    final isPasswordValid = isPasswordCorrectSubscription.value;
    final context = NavigationService.navigatorKey.currentContext;
    if (context == null) return;

    final l10n = AppLocalizations.of(context);
    final styles = Theme.of(context).textTheme;

    final isSuccess = isValide == true && isPasswordValid;
    final text = isSuccess ? l10n?.success : l10n?.fix_all_errors;
    final color = isSuccess ? Colors.green : Colors.red;

    final snack = SnackBar(
      content: Text(
        text ?? '',
        style: styles.bodyLarge?.copyWith(color: color),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void _validateEmail() {
    final email = emailController.text;
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final isValid = emailRegex.hasMatch(email);

    isEmailCorrectSubscription.add(isValid);
  }

  void _validatePassword() {
    final password = passwordController.text;

    for (final rule in _rules) {
      final isValid =
          RegExp(rule.validationRegex).hasMatch(passwordController.text);

      rule.isValid = isValid
          ? SignUpValidationValidationResult.success
          : SignUpValidationValidationResult.fail;
    }

    if (password.isEmpty) {
      for (final rule in _rules) {
        rule.isValid = SignUpValidationValidationResult.none;
      }
    }

    rulesSubscription.add(_rules);
  }
}
