import 'package:clario_test_task/ui/auth_flow/sign_up_screen/models/sign_up_validation_rule.dart';
import 'package:flutter/material.dart';

class SignUpScreenViewModel {
  bool passwordIsVisible = false;

  final formKey = GlobalKey<FormState>();

  final rules = [
    SignUpValidationRule(SignUpValidationRuleType.length, r'^.{8,}$'),
    SignUpValidationRule(SignUpValidationRuleType.uppercase, r'(?=.*[A-Z])'),
    SignUpValidationRule(SignUpValidationRuleType.number, r'(?=.*\d)'),
  ];
}
