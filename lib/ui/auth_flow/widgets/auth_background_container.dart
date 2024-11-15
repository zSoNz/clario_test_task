import 'package:clario_test_task/consts/colors.dart';
import 'package:clario_test_task/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthBackgroundContainer extends StatelessWidget {
  final Widget child;

  const AuthBackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorConstants.surfacePrimaryGradient,
        ),
        child: SafeArea(
          child: Stack(
            children: [_backgroundImage(), child],
          ),
        ),
      ),
    );
  }

  Padding _backgroundImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      child: Assets.images.bgStars.svg(width: double.infinity),
    );
  }
}
