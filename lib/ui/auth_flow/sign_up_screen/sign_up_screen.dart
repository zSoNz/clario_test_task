import 'package:auto_route/auto_route.dart';
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/sign_up_screen_view_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  final SignUpScreenViewModel viewModel;

  const SignUpScreen({super.key, required this.viewModel});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
